<template>
  <div class="app-container">
    <div class="shipment-order-content">
      <el-form ref="form"
               :model="form"
               :rules="rules"
               label-width="100px">
        <el-form-item label="出库单号"
                      prop="shipmentOrderNo">
          <div v-if="form.id">{{form.shipmentOrderNo}}</div>
          <el-input v-model="form.shipmentOrderNo"
                    placeholder="请输入出库单号"
                    style="width: 200px;"
                    disabled
                    v-else />
        </el-form-item>
        <el-form-item label="出库类型"
                      prop="shipmentOrderType">
          <div v-if="form.id">
            <div v-for="dict in dict.type.shipment_order_type"
                 :key="dict.value"
                 v-if="dict.value == form.shipmentOrderType">{{dict.label}}</div>
          </div>
          <el-radio-group v-model="form.shipmentOrderType"
                          v-else>
            <el-radio-button v-for="dict in dict.type.shipment_order_type"
                             :key="dict.value"
                             :label="dict.value">{{dict.label}}</el-radio-button>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="领取人"
                      prop="recipient">
          <div v-if="form.id">{{form.recipient}}</div>
          <el-input v-model="form.recipient"
                    placeholder="请输入领取人"
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
                  :data="formData.outOrderList"
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
          <el-table-column label="库存数量"
                           align="center"
                           prop="quantity" />
          <el-table-column label="仓库/库区"
                           align="center"
                           prop="place">
            <template slot-scope="scope">
              <GetSpace v-model="scope.row.place" />
            </template>
          </el-table-column>
          <el-table-column label="出库数量"
                           align="center"
                           prop="shipmentQuantity">
            <template slot-scope="scope">
              <el-form-item :prop="'outOrderList.' + scope.$index + '.shipmentQuantity'"
                            :rules="formRules.shipmentQuantity"
                            v-if="!form.id">
                <el-input-number v-model="scope.row.shipmentQuantity"
                                 :min="1"
                                 size="small"></el-input-number>
              </el-form-item>
              <div v-if="form.id">{{scope.row.shipmentQuantity}}</div>
            </template>
          </el-table-column>
          <el-table-column label="出库状态"
                           align="center"
                           prop="shipmentOrderStatus"
                           v-if="form.id">
            <template slot-scope="scope">
              <dict-tag :options="dict.type.shipment_order_status"
                        :value="scope.row.shipmentOrderStatus" />
            </template>
          </el-table-column>
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
                         v-if="form.id && scope.row.shipmentOrderStatus == 1"
                         @click="handleStatusChange(scope.row)">出库</el-button>
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
                   @click="handleStatusChangeAll">批量出库</el-button>
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
        <el-table-column label="库存数量"
                         align="center"
                         prop="quantity" />
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
  </div>
</template>
<script>
import { listItem } from "@/api/wms/item";
import { randomId } from '@/utils/RandomUtils'
import { getOutOrder, addOutOrder, updateOutOrder } from "@/api/wms/outinorder";
import { listOutDetail, addsOutDetail, updateOutDetail, changeStatus } from "@/api/wms/outdetail";
import WmsWarehouseCascader from '../components/WmsWarehouseCascader/index.vue'
import GetSpace from '../components/GetSpace/index.vue'
export default {
  name: "WmsshipmentOrderEdit",
  dicts: ['shipment_order_type', 'shipment_order_status'],
  components: {
    WmsWarehouseCascader,
    GetSpace
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
        shipmentOrderNo: [
          { required: true, message: "出库单号不能为空", trigger: "blur" }
        ],
        shipmentOrderType: [
          { required: true, message: "出库类型不能为空", trigger: "blur" }
        ],
        recipient: [
          { required: true, message: "领取人不能为空", trigger: "blur" }
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
        outOrderList: []
      },
      formRules: {
        shipmentOrderNo: [
          { required: true, message: "出库单号不能为空", trigger: "blur" }
        ],
        shipmentQuantity: [
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
        const res = await getOutOrder(id)
        this.form = res.data
        this.getOutOrderList()
      }
    },
    async getOutOrderList () {
      const query = {
        shipmentOrderNo: this.form.shipmentOrderNo,
      }
      const list = await listOutDetail(query)
      this.formData.outOrderList = list.rows
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
    selectionMaterials (val) {
      this.selectMaterialsList = val.map(item => ({
        shipmentOrderNo: this.form.shipmentOrderNo,
        itemId: item.id,
        itemName: item.itemName,
        itemNo: item.itemNo,
        quantity: item.quantity,
        place: item.place,
        shipmentOrderStatus: 1,
      }))
    },
    submitList () {
      this.formData.outOrderList = this.selectMaterialsList;
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
        shipmentOrderNo: 'R-' + randomId(),
        shipmentOrderType: 1,
        shipmentOrderStatus: 1,
        remark: null,
        delFlag: null,
        recipient: null,
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
      const { outOrderList } = this.formData
      if (!outOrderList || outOrderList.length === 0) {
        this.$modal.msgError('请先添加物料')
        return
      }
      await this.$refs["formRef"].validate()

      if (this.form.id) {
        await updateOutOrder(this.form)
        await updateOutDetail({ list: this.formData.outOrderList })
        this.$modal.msgSuccess("修改成功");
        this.$router.push('/inAndOut/outorder');
        return
      }
      await addOutOrder(this.form)
      await addsOutDetail({ list: this.formData.outOrderList })
      this.$modal.msgSuccess("添加成功");
      this.cancel()
    },
    cancel () {
      this.$router.push('/inAndOut/outorder');
    },
    // 删除物料
    handleDelete (row) {
      let index = this.formData.outOrderList.indexOf(row);
      if (index !== -1) {
        this.formData.outOrderList.splice(index, 1)
      }
    },
    // 单个出库 状态修改
    async handleStatusChange (row) {
      try {
        await changeStatus({ list: [row] })
        this.$modal.msgSuccess("出库成功");
        this.getOutOrderList()
      } catch { }
    },
    isRow (row) {
      return !(row.shipmentOrderStatus == 2)
    },
    // 批量出库
    async handleStatusChangeAll () {
      // 未选中
      if (!this.ids.length) {
        this.$modal.msgError('请先选择出库的物料')
        return
      }
      try {
        await changeStatus({ list: this.changeStatusList })
        this.$modal.msgSuccess("出库成功");
        this.getOutOrderList()
      } catch { }

    },
  }
}


</script>

<style scoped>
.shipment-order-content {
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