<template>
  <div style="border:1px solid #dfe4ed">
    <el-table :data="list"
              max-height="250">
      <div v-if="type === 0">
        <el-table-column width="50"
                         align="center"
                         type="index"
                         fixed />
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
      </div>
      <div v-if="type === 1">
        <el-table-column width="50"
                         align="center"
                         type="index"
                         fixed />
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
      </div>
    </el-table>
  </div>
</template>

<script>
export default {
  name: "OrderTable",
  dicts: ['receipt_order_type', 'receipt_order_status', 'shipment_order_type', 'shipment_order_status'],
  props: {
    list: {
      type: Array,
      default: () => []
    },
    type: {
      type: Number,
      default: 0
    }
  },
  data () {
    return {

    }
  },

  created () {

  },
  methods: {

  }
}
</script>
