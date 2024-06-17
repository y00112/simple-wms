<template>
  <div class="app-container">
    <el-form :model="queryParams"
             ref="queryForm"
             size="small"
             :inline="true"
             v-show="showSearch"
             label-width="100px">
      <el-form-item label="入库状态"
                    prop="receiptorderStatus">
        <el-select v-model="queryParams.receiptorderStatus"
                   placeholder="请选择入库状态"
                   clearable>
          <el-option v-for="dict,index in dict.type.receipt_order_status"
                     :label="dict.label"
                     :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item label="入库类型"
                    prop="receiptOrderType">
        <el-select v-model="queryParams.receiptOrderType"
                   placeholder="请选择入库状态"
                   clearable>
          <el-option v-for="dict,index in dict.type.receipt_order_type"
                     :label="dict.label"
                     :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item label="入库单号"
                    prop="receiptOrderNo">
        <el-input v-model="queryParams.receiptOrderNo"
                  placeholder="请输入入库单号"
                  clearable
                  @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="波次号"
                    prop="waveNo">
        <el-input v-model="queryParams.waveNo"
                  placeholder="请输入波次号"
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
                   v-hasPermi="['wms:inOrder:add']">创建入库单</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch"
                     @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading"
              :data="inOrderList">
      <el-table-column label="序号"
                       width="100"
                       align="center">
        <template slot-scope="scope">
          {{ total - ((queryParams.pageNum-1)*queryParams.pageSize) - scope.$index}}
        </template>
      </el-table-column>
      <el-table-column label="入库单号"
                       align="center"
                       prop="receiptOrderNo" />
      <el-table-column label="入库人"
                       align="center"
                       prop="depositor" />
      <el-table-column label="入库类型"
                       align="center"
                       prop="receiptOrderType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.receipt_order_type"
                    :value="scope.row.receiptOrderType" />
        </template>
      </el-table-column>
      <el-table-column label="入库状态"
                       align="center"
                       prop="receiptOrderStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.receipt_order_status"
                    :value="scope.row.receiptOrderStatus" />
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
                     v-hasPermi="['wms:inOrder:edit']">入库</el-button>
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
  </div>
</template>

<script>
import { listInOrder, delInOrder } from "@/api/wms/inorder";

export default {
  name: "InOrder",
  dicts: ['receipt_order_type', 'receipt_order_status'],
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
      // 入库单表格数据
      inOrderList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        receiptOrderNo: null,
        receiptOrderType: null,
        receiptOrderStatus: null,
        depositor: null
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
    /** 查询入库单列表 */
    getList () {
      this.loading = true;
      listInOrder(this.queryParams).then(response => {
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
      this.$router.push('/inAndOut/edit');
    },
    /** 修改按钮操作 */
    handleUpdate (row) {
      const pagePath = '/inAndOut/edit'
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
      this.$modal.confirm('是否确认删除入库单编号为"' + ids + '"的数据项？').then(function () {
        return delInOrder(ids);
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
