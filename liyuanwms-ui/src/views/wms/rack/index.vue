<template>
    <div class="app-container">
      <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
        <el-form-item label="编号" prop="rackNo">
          <el-input
            v-model="queryParams.rackNo"
            placeholder="请输入编号"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item label="名称" prop="rackName">
          <el-input
            v-model="queryParams.rackName"
            placeholder="请输入名称"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item label="所属库区" prop="areaId">
          <el-input
            v-model="queryParams.areaId"
            placeholder="请输入所属库区"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item label="所属仓库" prop="warehouseId">
          <el-input
            v-model="queryParams.warehouseId"
            placeholder="请输入所属仓库"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
          <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
        </el-form-item>
      </el-form>
  
      <el-row :gutter="10" class="mb8">
        <el-col :span="1.5">
          <el-button
            type="primary"
            plain
            icon="el-icon-plus"
            size="mini"
            @click="handleAdd"
            v-hasPermi="['system:rack:add']"
          >新增</el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="success"
            plain
            icon="el-icon-edit"
            size="mini"
            :disabled="single"
            @click="handleUpdate"
            v-hasPermi="['system:rack:edit']"
          >修改</el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="danger"
            plain
            icon="el-icon-delete"
            size="mini"
            :disabled="multiple"
            @click="handleDelete"
            v-hasPermi="['system:rack:remove']"
          >删除</el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="warning"
            plain
            icon="el-icon-download"
            size="mini"
            @click="handleExport"
            v-hasPermi="['system:rack:export']"
          >导出</el-button>
        </el-col>
        <right-toolbar :showSearch.sync="showSearch" @queryTable="getList" :columns ="columns"></right-toolbar>
      </el-row>
  
      <el-table border v-loading="loading" :data="rackList" @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" align="center"/>
        <el-table-column label="编号" align="center" prop="rackNo" v-if="columns[0].visible"/>
        <el-table-column label="名称" align="center" prop="rackName" v-if="columns[1].visible"/>
        <el-table-column label="所属库区" align="center" prop="areaId" v-if="columns[2].visible"/>
        <el-table-column label="所属仓库" align="center" prop="warehouseId" v-if="columns[3].visible"/>
        <el-table-column label="备注" align="center" prop="remark" v-if="columns[4].visible"/>
        <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
          <template slot-scope="scope">
            <el-button
              size="mini"
              type="text"
              icon="el-icon-edit"
              @click="handleUpdate(scope.row)"
              v-hasPermi="['system:rack:edit']"
            >修改</el-button>
            <el-button
              size="mini"
              type="text"
              icon="el-icon-delete"
              @click="handleDelete(scope.row)"
              v-hasPermi="['system:rack:remove']"
            >删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      
      <pagination
        v-show="total>0"
        :total="total"
        :page.sync="queryParams.pageNum"
        :limit.sync="queryParams.pageSize"
        @pagination="getList"
      />
  
      <!-- 添加或修改货架对话框 -->
      <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
        <el-form ref="form" :model="form" :rules="rules" label-width="80px">
          <el-form-item label="编号" prop="rackNo">
            <el-input v-model="form.rackNo" placeholder="请输入编号" />
          </el-form-item>
          <el-form-item label="名称" prop="rackName">
            <el-input v-model="form.rackName" placeholder="请输入名称" />
          </el-form-item>
          <el-form-item label="所属库区" prop="areaId">
            <el-input v-model="form.areaId" placeholder="请输入所属库区" disabled/>
          </el-form-item>
          <!-- <el-form-item label="所属仓库" prop="warehouseId">
            <el-input v-model="form.warehouseId" placeholder="请输入所属仓库" />
          </el-form-item> -->
          <el-form-item label="备注" prop="remark">
            <el-input v-model="form.remark" placeholder="请输入备注" />
          </el-form-item>
          <!-- <el-form-item label="删除标识" prop="delFlag">
            <el-input v-model="form.delFlag" placeholder="请输入删除标识" />
          </el-form-item> -->
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </el-dialog>
    </div>
  </template>
  
  <script>
  import { listRack, getRack, delRack, addRack, updateRack } from "@/api/wms/rack";
  
  export default {
    name: "Rack",
    data() {
      return {
        // 当前选择的库区Id
        selectedAreaId: null,
        // 遮罩层
        loading: true,
        // 选中数组
        ids: [],
        // 非单个禁用
        single: true,
        // 非多个禁用
        multiple: true,
        // 显示搜索条件
        showSearch: false,
        // 总条数
        total: 0,
        // 货架表格数据
        rackList: [],
        // 弹出层标题
        title: "",
        // 是否显示弹出层
        open: false,
        // 查询参数
        queryParams: {
          pageNum: 1,
          pageSize: 10,
          rackNo: null,
          rackName: null,
          areaId: null,
          warehouseId: null,
        },
        // 表单参数
        form: {},
        // 表单校验
        rules: {
          rackNo: [
            { required: true, message: "编号不能为空", trigger: "blur" }
          ],
          areaId: [
            { required: true, message: "所属库区不能为空", trigger: "blur" }
          ],
        },
        columns: [
          {key: 0, label: '编号', visible: true},
          {key: 1, label: '名称', visible: true},
          {key: 2, label: '所属库区', visible: false},
          {key: 3, label: '所属仓库', visible: false},
          {key: 4, label: '备注', visible: true}
        ]
      };
    },
    created() {
      const areaId = this.$route.params && this.$route.params.areaId;
      this.selectedAreaId = areaId
      this.getList();
    },
    methods: {
      /** 查询货架列表 */
      getList() {
        this.loading = true;
        const query = {
          ...this.queryParams,
          areaId: this.selectedAreaId
        }
        listRack(query).then(response => {
          this.rackList = response.rows;
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
          id: null,
          rackNo: null,
          rackName: null,
          areaId: null,
          warehouseId: null,
          remark: null,
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
        this.ids = selection.map(item => item.id)
        this.single = selection.length!==1
        this.multiple = !selection.length
      },
      /** 新增按钮操作 */
      handleAdd() {
        this.reset();
        this.form.areaId = this.selectedAreaId;
        this.open = true;
        this.title = "添加货架";
      },
      /** 修改按钮操作 */
      handleUpdate(row) {
        this.reset();
        const id = row.id || this.ids
        getRack(id).then(response => {
          this.form = response.data;
          this.open = true;
          this.title = "修改货架";
        });
      },
      /** 提交按钮 */
      submitForm() {
        this.$refs["form"].validate(valid => {
          if (valid) {
            if (this.form.id != null) {
              updateRack(this.form).then(response => {
                this.$modal.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              });
            } else {
              addRack(this.form).then(response => {
                this.$modal.msgSuccess("新增成功");
                this.open = false;
                this.getList();
              });
            }
          }
        });
      },
      /** 删除按钮操作 */
      handleDelete(row) {
        const ids = row.id || this.ids;
        this.$modal.confirm('是否确认删除货架编号为"' + ids + '"的数据项？').then(function() {
          return delRack(ids);
        }).then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        }).catch(() => {});
      },
      /** 导出按钮操作 */
      handleExport() {
        this.download('system/rack/export', {
          ...this.queryParams
        }, `rack_${new Date().getTime()}.xlsx`)
      }
    }
  };
  </script>
  