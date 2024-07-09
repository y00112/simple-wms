<template>
  <div class="app-container">
    <el-form :model="queryParams"
             ref="queryForm"
             size="small"
             :inline="true"
             v-show="showSearch"
             label-width="75px">
      <el-form-item label="编号"
                    prop="itemNo">
        <el-input v-model="queryParams.itemNo"
                  placeholder="请输入编号"
                  clearable
                  @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="名称"
                    prop="itemName">
        <el-input v-model="queryParams.itemName"
                  placeholder="请输入名称"
                  clearable
                  @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="仓库/库区"
                    prop="areaId">
        <el-input v-model="queryParams.areaId"
                  placeholder="请输入所属库区"
                  clearable
                  @keyup.enter.native="handleQuery" />
      </el-form-item>
      <!-- <el-form-item label="所属仓库" prop="warehouseId">
        <el-input
          v-model="queryParams.warehouseId"
          placeholder="请输入所属仓库"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item> -->
      <!-- <el-form-item label="现有库存" prop="quantity">
        <el-input
          v-model="queryParams.quantity"
          placeholder="请输入现有库存"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item> -->

      <el-form-item label="批次"
                    prop="batch">
        <el-input v-model="queryParams.batch"
                  placeholder="请输入批次"
                  clearable
                  @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary"
                   icon="el-icon-search"
                   size="mini"
                   @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh"
                   size="mini"
                   @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10"
            class="mb8">
      <el-col :span="1.5">
        <el-button type="primary"
                   plain
                   icon="el-icon-plus"
                   size="mini"
                   @click="handleAdd"
                   v-hasPermi="['wms:item:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success"
                   plain
                   icon="el-icon-edit"
                   size="mini"
                   :disabled="single"
                   @click="handleUpdate"
                   v-hasPermi="['wms:item:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger"
                   plain
                   icon="el-icon-delete"
                   size="mini"
                   :disabled="multiple"
                   @click="handleDelete"
                   v-hasPermi="['wms:item:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning"
                   plain
                   icon="el-icon-download"
                   size="mini"
                   @click="handleExport"
                   v-hasPermi="['wms:item:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch"
                     @queryTable="getList"
                     :columns="columns"></right-toolbar>
    </el-row>

    <el-table border
              v-loading="loading"
              :data="itemList"
              @selection-change="handleSelectionChange">
      <el-table-column type="selection"
                       width="55"
                       align="center" />
      <el-table-column label="编号"
                       align="center"
                       prop="itemNo"
                       v-if="columns[0].visible" />
      <el-table-column label="名称"
                       align="center"
                       prop="itemName"
                       v-if="columns[1].visible" />
      <el-table-column label="规格"
                       align="center"
                       prop="specification"
                       v-if="columns[2].visible" />
      <el-table-column label="分类"
                       align="center"
                       prop="itemTypeName"
                       v-if="columns[3].visible" />
      <el-table-column label="库存数量"
                       align="center"
                       prop="quantity">
        <template slot-scope="scope">
          <el-tag :type="scope.row.quantity > 50 ?'success':'danger'">{{scope.row.quantity}}</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="单位类别"
                       align="center"
                       prop="unit"
                       v-if="columns[4].visible" />
      <el-table-column label="单价"
                       align="center"
                       prop="unitPrice"
                       v-if="columns[5].visible" />
      <el-table-column label="所属货架"
                       align="center"
                       prop="rackName"
                       v-if="columns[6].visible" />
      <el-table-column label="所属库区"
                       align="center"
                       prop="areaName"
                       v-if="columns[7].visible" />
      <el-table-column label="所属仓库"
                       align="center"
                       prop="warehouseName"
                       v-if="columns[8].visible" />
      <el-table-column label="现有库存"
                       align="center"
                       prop="quantity"
                       v-if="columns[9].visible" />
      <el-table-column label="生产日期"
                       align="center"
                       prop="productionDate"
                       width="180"
                       v-if="columns[10].visible">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.productionDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="有效期"
                       align="center"
                       prop="expiryDate"
                       width="180"
                       v-if="columns[11].visible">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.expiryDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="批次"
                       align="center"
                       prop="batch"
                       v-if="columns[12].visible" />
      <el-table-column label="备注"
                       align="center"
                       prop="remark"
                       v-if="columns[13].visible" />
      <el-table-column label="操作"
                       align="center"
                       class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini"
                     type="text"
                     icon="el-icon-edit"
                     @click="handleUpdate(scope.row)"
                     v-hasPermi="['wms:item:edit']">修改</el-button>
          <el-button size="mini"
                     type="text"
                     icon="el-icon-delete"
                     @click="handleDelete(scope.row)"
                     v-hasPermi="['wms:item:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0"
                :total="total"
                :page.sync="queryParams.pageNum"
                :limit.sync="queryParams.pageSize"
                @pagination="getList" />

    <!-- 添加或修改资产对话框 -->
    <el-dialog :title="title"
               :visible.sync="open"
               width="800px"
               append-to-body>
      <el-form ref="form"
               :model="form"
               :rules="rules"
               label-width="90px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="编号"
                          prop="itemNo">
              <el-input v-model="form.itemNo"
                        placeholder="请输入编号" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="名称"
                          prop="itemName">
              <el-input v-model="form.itemName"
                        placeholder="请输入名称" />
            </el-form-item>
          </el-col>
        </el-row>

        <el-row>
          <el-col :span="12">
            <el-form-item label="分类"
                          prop="itemType">
              <treeselect v-model="form.itemType"
                          :options="itemTypeOptions"
                          :show-count="true"
                          :normalizer="normalizer"
                          placeholder="请选择资产类型" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="单位类别"
                          prop="unit">
              <el-input v-model="form.unit"
                        placeholder="请输入单位类别" />
            </el-form-item>
          </el-col>
        </el-row>

        <el-row>
          <el-col :span="12">
            <el-form-item label="单价"
                          prop="unitPrice">
              <el-input v-model="form.unitPrice"
                        placeholder="请输入单价" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="仓库/库区"
                          prop="place">
              <el-cascader v-model="place"
                           :options="itemWarehouseOptions"
                           placeholder="请选择仓库库区"
                           @change="handleWarehouseTreeChange">
              </el-cascader>
            </el-form-item>
            <!-- <el-form-item label="所属货架" prop="rackId">
              <el-input v-model="form.rackId" placeholder="请输入所属货架" />
            </el-form-item>
            <el-form-item label="所属库区" prop="areaId">
              <el-input v-model="form.areaId" placeholder="请输入所属库区" />
            </el-form-item>
            <el-form-item label="所属仓库" prop="warehouseId">
              <el-input v-model="form.warehouseId" placeholder="请输入所属仓库" />
            </el-form-item> -->
          </el-col>
        </el-row>

        <el-row>
          <el-col :span="12">
            <el-form-item label="生产日期"
                          prop="productionDate">
              <el-date-picker clearable
                              v-model="form.productionDate"
                              type="date"
                              value-format="yyyy-MM-dd"
                              placeholder="请查询资产的生产日期">
              </el-date-picker>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="有效期"
                          prop="expiryDate">
              <el-date-picker clearable
                              v-model="form.expiryDate"
                              type="date"
                              value-format="yyyy-MM-dd"
                              placeholder="请查询资产的有效期">
              </el-date-picker>
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="批次"
                      prop="batch">
          <el-input v-model="form.batch"
                    placeholder="请输入批次" />
        </el-form-item>
        <el-form-item label="说明"
                      prop="remark">
          <el-input type="textarea"
                    :rows="2"
                    v-model="form.remark"
                    placeholder="说明..." />
        </el-form-item>
      </el-form>
      <div slot="footer"
           class="dialog-footer">
        <el-button type="primary"
                   @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listRack } from "@/api/wms/rack"
import { listItem, getItem, delItem, addItem, updateItem } from "@/api/wms/item";
import { itemTypeTreeSelect } from "@/api/wms/itemtype";
import { listWarehouse } from '@/api/wms/warehouse'
import { listArea } from '@/api/wms/area'
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
export default {
  name: "Item",
  components: {
    Treeselect,
  },
  data () {
    return {
      place: [],
      // 仓库库区树
      itemWarehouseOptions: [],
      // 所属类别树
      itemTypeOptions: [],
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
      // 资产表格数据
      itemList: [],
      // 物料表格数据
      wmsItemList: [],
      // 货架表格数据
      rackListByArea: [],
      // 库区表格数据
      areaListByWarehouse: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        itemNo: null,
        itemName: null,
        specification: null,
        itemType: null,
        unit: null,
        unitPrice: null,
        rackId: null,
        areaId: null,
        warehouseId: null,
        quantity: null,
        productionDate: null,
        expiryDate: null,
        batch: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        itemNo: [
          { required: true, message: "编号不能为空", trigger: "blur" }
        ],
        itemName: [
          { required: true, message: "名称不能为空", trigger: "blur" }
        ],
      },
      columns: [
        { key: 0, label: "编号", visible: true },
        { key: 1, label: "名称", visible: true },
        { key: 2, label: "规格", visible: false },
        { key: 3, label: "分类", visible: true },
        { key: 4, label: "单位类别", visible: true },
        { key: 5, label: "单件", visible: false },
        { key: 6, label: "所属货架", visible: false },
        { key: 7, label: "所属库区", visible: true },
        { key: 8, label: "所属仓库", visible: false },
        { key: 9, label: "现有库存", visible: false },
        { key: 10, label: "生产日期", visible: false },
        { key: 11, label: "有效期", visible: true },
        { key: 12, label: "批次", visible: false },
        { key: 13, label: "备注", visible: true },
      ]
    };
  },
  created () {
    this.getList();
    this.getWarehouseTree();
  },
  methods: {
    handleWarehouseTreeChange (place) {
      console.log("handleWarehouseTreeChange()" + place)
    },
    /** 转换资产类型数据结构 */
    normalizer (node) {
      if (node.children && !node.children.length) {
        delete node.children;
      }
      return {
        id: node.id,
        label: node.label,
        children: node.children
      };
    },
    getWarehouseTree () {
      // 查询仓库
      listWarehouse().then(response => {
        response.rows.forEach(warehouse => {
          let wareHouseObj = {
            value: warehouse.id,
            label: warehouse.warehouseName,
            children: []
          }
          // 根据 warehouseId 查询库区
          const queryAreaParams = {
            pageNum: 1,
            pageSize: 999,
            areaNo: null,
            areaName: null,
            warehouseId: warehouse.id,
          }
          listArea(queryAreaParams).then(response => {
            if (response.rows.length !== 0) {
              let warehouseChildren = []
              response.rows.forEach(area => {
                // 根据 areaId 查询货架
                const queryRackParams = {
                  pageNum: 1,
                  pageSize: 10,
                  rackNo: null,
                  rackName: null,
                  areaId: area.id,
                  warehouseId: null,
                }
                let areaObj = {
                  value: area.id,
                  label: area.areaName,
                  children: null
                }
                let areaChildren = []
                listRack(queryRackParams).then(response => {
                  if (response.rows.length !== 0) {
                    areaChildren = []
                    response.rows.forEach(rack => {
                      const rackObj = {
                        value: rack.id,
                        label: rack.rackName,
                        children: null
                      }
                      areaChildren.push(rackObj)
                    })
                    areaObj.children = areaChildren
                  }
                })
                warehouseChildren.push(areaObj)
              })
              wareHouseObj.children = warehouseChildren
            } else {
              wareHouseObj.children = null
            }
          })
          this.itemWarehouseOptions.push(wareHouseObj)
        });
      })
    },
    // 查找类别树
    getItemTypeTree () {
      itemTypeTreeSelect().then(response => {
        this.itemTypeOptions = response.data;
      });
    },
    /** 查询资产列表 */
    getList () {
      this.loading = true;
      listItem(this.queryParams).then(response => {
        const content = response.rows;
        this.itemList = content;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel () {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset () {
      this.form = {
        id: null,
        itemNo: null,
        itemName: null,
        specification: null,
        itemType: null,
        unit: null,
        unitPrice: null,
        rackId: null,
        areaId: null,
        warehouseId: null,
        quantity: null,
        productionDate: null,
        expiryDate: null,
        batch: null,
        delFlag: null,
        remark: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery () {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery () {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange (selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd () {
      this.reset();
      this.open = true;
      this.title = "添加资产";
      this.place = []
      this.getItemTypeTree()
    },
    /** 修改按钮操作 */
    handleUpdate (row) {
      this.reset();
      this.getItemTypeTree()
      const id = row.id || this.ids
      getItem(id).then(response => {
        this.form = response.data;
        this.place = response.data.place
        this.open = true;
        this.title = "修改资产";
      });
    },
    /** 提交按钮 */
    submitForm () {
      this.$refs["form"].validate((valid) => {
        this.handlePlace()
        if (valid) {
          if (this.form.id != null) {
            updateItem(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addItem(this.form).then((response) => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /**仓库/库区/货架分别赋值 */
    handlePlace () {
      if (this.place[0]) {
        this.form.warehouseId = this.place[0]
      } else {
        this.form.warehouseId = 0;
      }
      if (this.place[1]) {
        this.form.areaId = this.place[1]
      } else {
        this.form.areaId = 0
      }
      if (this.place[2]) {
        this.form.rackId = this.place[2]
      } else {
        this.form.rackId = 0
      }
    },
    /** 删除按钮操作 */
    handleDelete (row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除资产编号为"' + ids + '"的数据项？').then(function () {
        return delItem(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => { });
    },
    /** 导出按钮操作 */
    handleExport () {
      this.download('wms/item/export', {
        ...this.queryParams
      }, `item_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
