<template>
  <div class="app-container">
    <div class="receipt-order-content">
      <el-form ref="form"
               :model="form"
               :rules="rules"
               label-width="100px">
        <el-form-item label="入库单号"
                      prop="receiptOrderNo">
          <div v-if="form.id">{{form.receiptOrderNo}}</div>
          <el-input v-model="form.receiptOrderNo"
                    placeholder="请输入入库单号"
                    style="width: 200px;"
                    disabled
                    v-else />
        </el-form-item>
        <el-form-item label="入库类型"
                      prop="receiptOrderType">
          <div v-if="form.id">
            <div v-for="dict in dict.type.receipt_order_type"
                 :key="dict.value"
                 v-if="dict.value == form.receiptOrderType">{{dict.label}}</div>
          </div>
          <el-radio-group v-model="form.receiptOrderType"
                          v-else>
            <el-radio-button v-for="dict in dict.type.receipt_order_type"
                             :key="dict.value"
                             :label="dict.value">{{dict.label}}</el-radio-button>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="入库人"
                      prop="depositor">
          <div v-if="form.id">{{form.depositor}}</div>
          <el-input v-model="form.depositor"
                    placeholder="请输入入库人"
                    style="width: 200px;"
                    v-else />
        </el-form-item>
        <el-form-item label="备注"
                      prop="remark">
          <div v-if="form.id">{{form.remark ? form.remark : '无'}}</div>
          <el-input v-model="form.remark"
                    placeholder="请输入备注"
                    type="textarea"
                    :rows="3"
                    maxlength="100"
                    show-word-limit
                    v-else />
        </el-form-item>
      </el-form>
      <el-divider></el-divider>
      <el-row type="flex"
              class="row-bg"
              justify="space-between">
        <el-col :span="2.5">
          <span style="margin-right: 10px;font-weight: 600;">
            物料明细
          </span>
          <el-button type="success"
                     plain
                     icon="el-icon-setting"
                     size="small"
                     @click="onBatchSetInventory"
                     v-if="!form.id">批量设置仓库/库区</el-button>

        </el-col>
        <el-col :span="2.5">
          <el-button type="primary"
                     plain
                     size="small"
                     @click="addMaterials"
                     v-if="!form.id">添加物料</el-button>
        </el-col>
      </el-row>
      <el-form :model="formData"
               ref="formRef"
               :rules="formRules"
               label-width="108px"
               :inline="true">
        <el-table v-loading="loading"
                  :data="formData.inOrderList"
                  @selection-change="handleSelectionChange"
                  style="margin-top: 20px;">
          <el-table-column type="selection"
                           width="55"
                           align="center"
                           :selectable="isRow" />
          <el-table-column label="物料名"
                           align="center"
                           prop="itemName" />
          <el-table-column label="物料编号"
                           align="center"
                           prop="itemNo" />
          <el-table-column label="入库数量"
                           align="center"
                           prop="inQuantity">
            <template slot-scope="scope">
              <el-form-item :prop="'inOrderList.' + scope.$index + '.inQuantity'"
                            :rules="formRules.inQuantity"
                            v-if="!form.id">
                <el-input-number v-model="scope.row.inQuantity"
                                 :min="1"
                                 size="small"></el-input-number>
              </el-form-item>
              <div v-if="form.id">{{scope.row.inQuantity}}</div>
            </template>
          </el-table-column>
          <el-table-column label="仓库/库区"
                           align="center"
                           prop="place">
            <template slot-scope="scope">
              <el-form-item :prop="'inOrderList.' + scope.$index + '.place'"
                            :rules="formRules.place"
                            v-if="!form.id">
                <WmsWarehouseCascader v-model="scope.row.place"
                                      size="small"
                                      :disabled="!!form.id"></WmsWarehouseCascader>
              </el-form-item>
              <WmsWarehouseCascader v-model="scope.row.place"
                                    size="small"
                                    disabled
                                    v-if="form.id"></WmsWarehouseCascader>
            </template>
          </el-table-column>
          <el-table-column label="入库状态"
                           align="center"
                           prop="receiptOrderStatus"
                           v-if="form.id">
            <template slot-scope="scope">
              <dict-tag :options="dict.type.receipt_order_status"
                        :value="scope.row.receiptOrderStatus" />
            </template>
          </el-table-column>
          <!-- <el-table-column label="金额"
                           align="center"
                           prop="money">
            <template slot-scope="scope">
              <el-form-item :prop="'inOrderList.' + scope.$index + '.money'"
                            :rules="formRules.money"
                            v-if="!form.id">
                <el-input-number v-model="scope.row.money"
                                 :min="0.01"
                                 :precision="2"
                                 size="small"></el-input-number>
              </el-form-item>
              <div v-if="form.id">{{scope.row.money}}</div>
            </template>
          </el-table-column> -->
          <el-table-column label="操作"
                           align="center"
                           class-name="small-padding fixed-width">
            <template slot-scope="scope">
              <el-button size="mini"
                         type="text"
                         icon="el-icon-delete"
                         @click="handleDelete(scope.row)"
                         v-if="!form.id">删除</el-button>
              <el-button size="mini"
                         type="text"
                         icon="el-icon-setting"
                         v-if="form.id && scope.row.receiptOrderStatus == 1"
                         @click="handleStatusChange(scope.row)">入库</el-button>
            </template>
          </el-table-column>
        </el-table>
      </el-form>
      <div class="flex-center"
           v-if="!form.id">
        <el-button type="primary"
                   plain
                   size="small"
                   @click="addMaterials">添加物料</el-button>
      </div>

      <div class="flex-center">
        <el-button @click="cancel"
                   size="small">取 消</el-button>
        <el-button type="primary"
                   @click="submitForm"
                   size="small"
                   v-if="!form.id">保 存</el-button>
        <el-button type="success"
                   plain
                   icon="el-icon-setting"
                   size="small"
                   v-if="form.id"
                   @click="handleStatusChangeAll">批量入库</el-button>
      </div>
    </div>
    <el-dialog title="添加物料"
               :visible.sync="materialsOpen"
               width="700px"
               append-to-body>
      <el-table :data="materialsList"
                v-loading="materialsloading"
                @selection-change="selectionMaterials"
                border>
        <el-table-column type="selection"
                         width="55"
                         align="center" />
        <el-table-column label="物料名称"
                         align="center"
                         prop="itemName" />
        <el-table-column label="物料编号"
                         align="center"
                         prop="itemNo" />
      </el-table>
      <pagination v-show="materialsTotal>0"
                  :total="materialsTotal"
                  :page.sync="materialsParams.pageNum"
                  :limit.sync="materialsParams.pageSize"
                  @pagination="addMaterials" />
      <div slot="footer"
           class="dialog-footer">
        <el-button @click="materialsOpen = false"
                   size="small">取 消</el-button>
        <el-button type="primary"
                   @click="submitList"
                   size="small">确 定</el-button>

      </div>
    </el-dialog>

    <BatchWarehouseDialog :visible.sync="batchDialogVisible"
                          :form-data.sync="batchForm"
                          @confirmed="onBatchDialogFinished"
                          v-if="batchDialogVisible"></BatchWarehouseDialog>
  </div>
</template>
<script>
import { listItem } from "@/api/wms/item";
import { randomId } from '@/utils/RandomUtils'
import { getInOrder, addInOrder, updateInOrder } from "@/api/wms/inorder";
import { listInDetail, addsInDetail, updateInDetail, changeStatus } from "@/api/wms/indetail";
import BatchWarehouseDialog from "@/views/wms/components/BatchWarehouseDialog/index.vue";
import WmsWarehouseCascader from '../components/WmsWarehouseCascader/index.vue'
export default {
  name: "WmsReceiptOrderEdit",
  dicts: ['receipt_order_type', 'receipt_order_status'],
  components: {
    BatchWarehouseDialog,
    WmsWarehouseCascader
  },
  data () {
    return {
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
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        receiptOrderNo: [
          { required: true, message: "入库单号不能为空", trigger: "blur" }
        ],
        receiptOrderType: [
          { required: true, message: "入库类型不能为空", trigger: "blur" }
        ],
        depositor: [
          { required: true, message: "入库人不能为空", trigger: "blur" }
        ],
      },
      materialsOpen: false,
      materialsloading: false,
      materialsList: [],
      materialsTotal: 0,
      materialsParams: {
        pageNum: 1,
        pageSize: 10,
      },
      formData: {
        inOrderList: []
      },
      formRules: {
        receiptOrderNo: [
          { required: true, message: "入库单号不能为空", trigger: "blur" }
        ],
        inQuantity: [
          { required: true, message: "数量不能为空", trigger: "blur" }
        ],
        place: [
          { required: true, message: "仓库不能为空", trigger: "change" }
        ],
        money: [
          { required: true, message: "金额不能为空", trigger: "blur" }
        ],
      },
      selectMaterialsList: [],

      batchDialogVisible: false,
      batchForm: {
        place: []
      },
      changeStatusList: []
    };
  },
  created () {
    this.initForm()
  },
  methods: {
    /** 初始化表单 */
    async initForm () {
      this.reset()
      this.loading = false
      let id = this.form.id || (this.$route.query && this.$route.query.id);
      if (id) {
        const res = await getInOrder(id)
        this.form = res.data
        this.getinOrderList()
      }
    },
    async getinOrderList () {
      const query = {
        receiptOrderNo: this.form.receiptOrderNo,
      }
      const list = await listInDetail(query)
      this.formData.inOrderList = list.rows
    },
    /** 查询物料列表 */
    addMaterials () {
      this.materialsOpen = true
      this.materialsloading = true
      const query = {
        ...this.materialsParams
      }
      listItem(query).then(response => {
        this.materialsList = response.rows;
        this.materialsTotal = response.total;
        this.materialsloading = false;
      });
    },
    /** 批量设置仓库/库区 */
    onBatchSetInventory () {
      const { inOrderList } = this.formData
      if (!inOrderList || inOrderList.length === 0) {
        this.$modal.msgError('请先添加物料')
        return
      }
      // 未选中
      if (!this.ids.length) {
        this.$modal.msgError('请先选择物料')
        return
      }
      this.batchDialogVisible = true
    },
    onBatchDialogFinished () {
      this.batchDialogVisible = false
      const [warehouseId, areaId, rackId] = this.batchForm.place || []
      this.formData.inOrderList.forEach(it => {
        // 仅更新已选中
        if (this.ids.includes(it.id)) {
          // it.place = [warehouseId, areaId, rackId].filter(Boolean)
          this.$set(it, 'place', [warehouseId, areaId, rackId].filter(Boolean))
          this.$set(it, 'warehouseId', warehouseId)
          this.$set(it, 'areaId', areaId)
          this.$set(it, 'rackId', rackId)
        }
      })
    },
    selectionMaterials (val) {
      this.selectMaterialsList = val.map(item => ({
        receiptOrderNo: this.form.receiptOrderNo,
        itemId: item.id,
        itemName: item.itemName,
        itemNo: item.itemNo,
        receiptorderStatus: 1
      }))
    },
    submitList () {
      this.formData.inOrderList = this.selectMaterialsList;
      this.materialsOpen = false;
    },
    // 多选框选中数据
    handleSelectionChange (selection) {
      this.changeStatusList = selection
      this.ids = selection.map(item => item.id)
      this.multiple = !selection.length
    },
    // 表单重置
    reset () {
      this.form = {
        id: null,
        receiptOrderNo: 'R-' + randomId(),
        receiptOrderType: 1,
        receiptOrderStatus: 1,
        remark: null,
        delFlag: null,
        depositor: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        waveNo: null,
      };
      this.resetForm("form");
    },
    /** 提交按钮 */
    async submitForm () {
      await this.$refs["form"].validate()
      const { inOrderList } = this.formData
      if (!inOrderList || inOrderList.length === 0) {
        this.$modal.msgError('请先添加物料')
        return
      }
      await this.$refs["formRef"].validate()
      this.formData.inOrderList.forEach(item => {
        console.log(item);
        item.receiptOrderStatus = 1;
        if (item.place[0]) {
          item.warehouseId = item.place[0]
        } if (item.place[1]) {
          item.areaId = item.place[1]
        } if (item.place[2]) {
          item.rackId = item.place[2]
        } else {
          item.warehouseId = null
          item.areaId = null
          item.rackId = null
        }
      })
      if (this.form.id) {
        await updateInOrder(this.form)
        await updateInDetail({ list: this.formData.inOrderList })
        this.$modal.msgSuccess("修改成功");
        this.$router.push('/inAndOut/inorder');
        return
      }
      await addInOrder(this.form)
      await addsInDetail({ list: this.formData.inOrderList })
      this.$modal.msgSuccess("添加成功");
      this.$router.push('/inAndOut/inorder');
    },
    cancel () {
      this.$router.push('/inAndOut/inorder');
    },
    // 删除物料
    handleDelete (row) {
      let index = this.formData.inOrderList.indexOf(row);
      if (index !== -1) {
        this.formData.inOrderList.splice(index, 1)
      }
    },
    // 单个入库 状态修改
    async handleStatusChange (row) {
      try {
        await changeStatus({ list: [row] })
        this.$modal.msgSuccess("入库成功");
        this.getinOrderList()
      } catch { }
    },
    isRow (row) {
      return !(row.receiptOrderStatus == 2)
    },
    // 批量入库
    async handleStatusChangeAll () {
      // 未选中
      if (!this.ids.length) {
        this.$modal.msgError('请先选择入库的物料')
        return
      }
      try {
        await changeStatus({ list: this.changeStatusList })
        this.$modal.msgSuccess("入库成功");
        this.getinOrderList()
      } catch { }

    },
  }
}


</script>

<style scoped>
.receipt-order-content {
  width: 70%;
  min-width: 900px;
  margin: 0 auto;
}
.flex-center {
  display: flex;
  justify-content: center;
  margin-top: 20px;
}
</style>