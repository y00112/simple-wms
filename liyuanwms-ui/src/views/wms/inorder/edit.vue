<template>
  <div class="app-container">
    <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="入库单号" prop="receiptOrderNo">
          <el-input v-model="form.receiptOrderNo" placeholder="请输入入库单号" />
        </el-form-item>
        <el-form-item label="入库类型" prop="receiptOrderType">
          <el-radio-group v-model="form.receiptOrderType" size="small">
              <el-radio-button 
              v-for="dict in dict.type.receipt_order_type"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"
              ></el-radio-button>
            </el-radio-group>
        </el-form-item>
        <el-form-item label="波次号" prop="waveNo">
          <el-input v-model="form.waveNo" placeholder="请输入波次号" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入备注" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
  </div>
</template>
<script>
export default {
    name: "WmsReceiptOrderEdit"
}
</script>