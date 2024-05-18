<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="类型名称" prop="typeName">
        <el-input v-model="queryParams.typeName" placeholder="请输入类型名称" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd"
          v-hasPermi="['wms:itemType:add']">新增</el-button>
      </el-col>
      <!-- <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['wms:itemType:edit']"
        >修改</el-button>
      </el-col> -->
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['wms:itemType:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="el-icon-download" size="mini" @click="handleExport"
          v-hasPermi="['wms:itemType:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList" :columns="columns"></right-toolbar>
    </el-row>

    <el-table 
    border
    height="500"
    v-if="refreshTable"
    v-loading="loading" 
    :data="itemTypeList" 
    :default-expand-all="isExpandAll"
    row-key="itemTypeId"
    :tree-props="{children: 'children',hasChildren:'hasChildren'}"
    @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="资产类型id" align="center" prop="itemTypeId" v-if="columns[0].visible" />
      <el-table-column label="父资产类型id" align="center" prop="parentId" v-if="columns[1].visible" />
      <el-table-column label="祖级列表" align="center" prop="ancestors" v-if="columns[2].visible" />
      <el-table-column label="类型名称" align="center" prop="typeName" v-if="columns[3].visible" />
      <el-table-column label="显示顺序" align="center" prop="orderNum" v-if="columns[4].visible" />
      <el-table-column label="类型状态" align="center" prop="status" v-if="columns[5].visible" >
        <template slot-scope="scope">
          <el-tag size="medium" v-if="scope.row.status == true">正常</el-tag>
          <el-tag size="medium" type="danger" v-else>停用</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="small" type="primary" icon="el-icon-edit" @click="handleUpdate(scope.row)"
            v-hasPermi="['wms:itemType:edit']">修改</el-button>
          <el-button size="small" type="danger" icon="el-icon-delete" @click="handleDelete(scope.row)"
            v-hasPermi="['wms:itemType:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize"
      @pagination="getList" /> -->

    <!-- 添加或修改资产类型对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <!-- 父级别类别 -->
        <el-form-item v-if="form.parentId !== 0" label="所属类别" prop="parentId">
            <treeselect v-model="form.parentId" :options="itemTypeOptions" :show-count="true" :normalizer="normalizer" placeholder="请选择所属类别" />
         </el-form-item>
        <el-form-item label="类型名称" prop="typeName">
          <el-input v-model="form.typeName" placeholder="请输入类型名称" />
        </el-form-item>
        <el-form-item label="显示顺序" prop="orderNum">
          <el-input-number v-model="form.orderNum" controls-position="right"  :min="1" :max="10"></el-input-number>
        </el-form-item>
        <el-form-item label="状态" prop="status">
            <el-radio-group v-model="form.status" size="small">
              <el-radio-button label="true">正常</el-radio-button>
              <el-radio-button label="false">停用</el-radio-button>
            </el-radio-group>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listItemType, getItemType, delItemType, addItemType, updateItemType,itemTypeTreeSelect } from "@/api/wms/itemtype";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";

export default {
  name: "itemType",
  components: {Treeselect},
  data() {
    return {
      // 是否展开，默认全部折叠
      isExpandAll: false,
      // 重新渲染表格状态
      refreshTable: true,
      // 所属类别树
      itemTypeOptions: undefined,
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 资产类型表格数据
      itemTypeList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 999,
        parentId: null,
        ancestors: null,
        typeName: null,
        orderNum: null,
        status: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        typeName: [
          { required: true, message: "类型名称不能为空", trigger: "blur" }
        ],
        orderNum: [
          { required: true, message: "显示顺序不能为空", trigger: "blur" }
        ],    
        status: [
          { required: true, message: "状态不能为空", trigger: "blur" }
        ],
      },
      columns: [
        { key: 0, label:"资产类型id", visible: false },
        { key: 1, label:"父资产类型id", visible: false },
        { key: 2, label:"组级列表", visible: false },
        { key: 3, label: "类型名称", visible: true },
        { key: 4, label:"显示顺序", visible: true },
        { key: 5, label:"类型状态", visible: true },
      ]
    };
  },
  created() {
    this.getList();
    this.getItemTypeTree()
  },
  methods: {
    /** 转换资产类型数据结构 */
    normalizer(node) {
      if (node.children && !node.children.length) {
        delete node.children;
      }
      return {
        id: node.id,
        label: node.label,
        children: node.children
      };
    },
    // 查找类别树
    getItemTypeTree() {
      itemTypeTreeSelect().then(response => {
        this.itemTypeOptions = response.data;
        console.log(this.itemTypeOptions)
      });
    },
    /** 查询资产类型列表 */
    getList() {
      this.loading = true;
      listItemType(this.queryParams).then(response => {
        this.itemTypeList = this.handleTree(response.rows,"itemTypeId");
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        itemTypeId: null,
        parentId: null,
        ancestors: null,
        typeName: null,
        orderNum: null,
        status: true,
        delFlag: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.itemTypeId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加资产类型";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const itemTypeId = row.itemTypeId || this.ids
      getItemType(itemTypeId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改资产类型";
        
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.itemTypeId != null) {
            updateItemType(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
              this.getItemTypeTree()
            });
          } else {
            addItemType(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
              this.getItemTypeTree()
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const itemTypeIds = row.itemTypeId || this.ids;
      this.$modal.confirm('是否确认删除资产类型编号为"' + itemTypeIds + '"的数据项？').then(function () {
        return delItemType(itemTypeIds);
      }).then(() => {
        this.getList();
        this.getItemTypeTree()
        this.$modal.msgSuccess("删除成功");
      }).catch(() => { });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('wms/itemType/export', {
        ...this.queryParams
      }, `itemType_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
