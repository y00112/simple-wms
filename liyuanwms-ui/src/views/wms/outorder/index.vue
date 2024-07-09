<template>
  <div class="app-container">
    <el-form :model="queryParams"
             ref="queryForm"
             size="small"
             :inline="true"
             v-show="showSearch"
             label-width="100px">
      <el-form-item label="出库状态"
                    prop="shipmentOrderStatus">
        <el-select v-model="queryParams.shipmentOrderStatus"
                   placeholder="请选择出库状态"
                   clearable>
          <el-option v-for="dict,index in dict.type.shipment_order_status"
                     :key="index"
                     :label="dict.label"
                     :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item label="出库类型"
                    prop="shipmentOrderType">
        <el-select v-model="queryParams.shipmentOrderType"
                   placeholder="请选择出库状态"
                   clearable>
          <el-option v-for="dict,index in dict.type.shipment_order_type"
                     :key="index"
                     :label="dict.label"
                     :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item label="出库单号"
                    prop="shipmentOrderNo">
        <el-input v-model="queryParams.shipmentOrderNo"
                  placeholder="请输入出库单号"
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
                   v-hasPermi="['wms:inOrder:add']">创建出库单</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch"
                     @queryTable="getList"></right-toolbar>
    </el-row>
    <el-card>
      <div class="title">
        出库清单
      </div>
      <el-table v-loading="loading"
                :data="inOrderList">
        <el-table-column label="序号"
                         width="100"
                         align="center">
          <template slot-scope="scope">
            {{ total - ((queryParams.pageNum-1)*queryParams.pageSize) - scope.$index}}
          </template>
        </el-table-column>
        <el-table-column label="出库单号"
                         align="center"
                         prop="shipmentOrderNo" />
        <el-table-column label="领取人"
                         align="center"
                         prop="recipient" />
        <el-table-column label="出库类型"
                         align="center"
                         prop="shipmentOrderType">
          <template slot-scope="scope">
            <dict-tag :options="dict.type.shipment_order_type"
                      :value="scope.row.shipmentOrderType" />
          </template>
        </el-table-column>
        <el-table-column label="出库状态"
                         align="center"
                         prop="shipmentOrderStatus">
          <template slot-scope="scope">
            <dict-tag :options="dict.type.shipment_order_status"
                      :value="scope.row.shipmentOrderStatus" />
          </template>
        </el-table-column>
        <el-table-column label="备注"
                         align="center"
                         prop="remark" />

        <el-table-column label="操作"
                         align="center"
                         class-name="small-padding fixed-width">
          <template slot-scope="scope">
            <el-button size="mini"
                       type="text"
                       icon="el-icon-setting"
                       @click="handleUpdate(scope.row)"
                       v-hasPermi="['wms:inOrder:edit']">出库</el-button>
            <!-- <el-button size="mini"
                     type="text"
                     icon="el-icon-delete"
                     @click="handleDelete(scope.row)"
                     v-hasPermi="['wms:inOrder:remove']">删除</el-button> -->
          </template>
        </el-table-column>
      </el-table>

      <pagination v-show="total>0"
                  :total="total"
                  :page.sync="queryParams.pageNum"
                  :limit.sync="queryParams.pageSize"
                  @pagination="getList" />
    </el-card>
  </div>
</template>

<script>
import { listOutOrder, delOutOrder } from "@/api/wms/outinorder";

export default {
  name: "InOrder",
  dicts: ['shipment_order_type', 'shipment_order_status'],
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
      // 出库单表格数据
      inOrderList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        shipmentOrderNo: null,
        shipmentOrderType: null,
        shipmentOrderStatus: null,
        recipient: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        delFlag: [
          { required: true, message: "删除标识不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created () {
    this.getList();
  },
  methods: {
    /** 查询出库单列表 */
    getList () {
      this.loading = true;
      listOutOrder(this.queryParams).then(response => {
        this.inOrderList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel () {
      this.open = false;
      this.reset();
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
    /** 新增按钮操作 */
    handleAdd () {
      this.$router.push('/inAndOut/outedit');
    },
    /** 修改按钮操作 */
    handleUpdate (row) {
      const pagePath = '/inAndOut/outedit'
      const params = {
        id: row.id
      }
      this.$router.push({
        path: pagePath,
        query: params
      })
    },

    /** 删除按钮操作 */
    handleDelete (row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除出库单编号为"' + ids + '"的数据项？').then(function () {
        return delOutOrder(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => { });
    },
    /** 导出按钮操作 */
    handleExport () {
      this.download('wms/inOrder/export', {
        ...this.queryParams
      }, `inOrder_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
<style scoped>
.title {
  border-left: 4px solid;
  border-color: var(--current-color);
  font-size: 20px;
  font-weight: 600;
  line-height: 20px;
  padding-left: 10px;
  margin-bottom: 20px;
  text-align: left;
}
</style>