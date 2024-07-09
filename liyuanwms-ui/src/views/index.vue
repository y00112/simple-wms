<template>
  <div class="app-container">
    <el-row :gutter="10">
      <el-col :lg="12"
              :md="12"
              :sm="12"
              :xs="24">
        <el-card>
          <div style="height: 300px;">
            <el-tabs v-model="activeName"
                     type="card">
              <el-tab-pane label="今日入库记录"
                           name="first">
                <template v-if="activeName === 'first'">
                  <order-table :list="nowListInOrder"
                               :type="0" />
                </template>

              </el-tab-pane>
              <el-tab-pane label="昨日入库记录"
                           name="second">
                <template v-if="activeName === 'second'">
                  <order-table :list="lastListInOrder"
                               :type="0" />
                </template>
              </el-tab-pane>
            </el-tabs>
          </div>
        </el-card>
      </el-col>
      <el-col :lg="12"
              :md="12"
              :sm="12"
              :xs="24">
        <el-card>
          <div style="height: 300px;">
            <el-tabs v-model="activeNames"
                     type="card">
              <el-tab-pane label="今日出库记录"
                           name="first">
                <template v-if="activeNames === 'first'">
                  <order-table :list="nowListOutOrder"
                               :type="1" />
                </template>
              </el-tab-pane>
              <el-tab-pane label="昨日出库记录"
                           name="second">
                <template v-if="activeNames === 'second'">
                  <order-table :list="lastListOutOrder"
                               :type="1" />
                </template>
              </el-tab-pane>
            </el-tabs>
          </div>
        </el-card>
      </el-col>
    </el-row>
    <div style="height: 20px;"></div>
    <el-card>
      <div>
        <bar-chart></bar-chart>
        <div style="text-align: center;">
          资产分类数量
        </div>
      </div>
    </el-card>
  </div>
</template>

<script>
import BarChart from "./dashboard/BarChart";
import { listInOrder } from "@/api/wms/inorder";
import { listOutOrder } from "@/api/wms/outinorder";
import { getNowDateTime, getLastDateTime } from '@/utils/getDate.js'
import OrderTable from '@/views/wms/components/OrderTable/index.vue'
export default {
  name: "Index",
  components: {
    BarChart,
    OrderTable
  },
  data () {
    return {
      activeName: 'first',
      activeNames: 'first',
      nowListInOrder: [],
      lastListInOrder: [],
      nowListOutOrder: [],
      lastListOutOrder: [],
      query: {
        beginCreateTime: getNowDateTime() + ' 00:00:00',
        endCreateTime: getNowDateTime() + ' 23:59:59',
      },
      lastquery: {
        beginCreateTime: getLastDateTime() + ' 00:00:00',
        endCreateTime: getLastDateTime() + ' 23:59:59',
      },

    };
  },
  created () {
    this.getlistInOrder()
    this.getlistOutOrder()
  },
  methods: {
    async getlistInOrder () {
      const res = await listInOrder({ params: this.query })
      this.nowListInOrder = res.rows
      const lastres = await listInOrder({ params: this.lastquery })
      this.lastListInOrder = lastres.rows
    },
    async getlistOutOrder () {
      const res = await listOutOrder({ params: this.query })
      this.nowListOutOrder = res.rows
      const lastres = await listOutOrder({ params: this.lastquery })
      this.lastListOutOrder = lastres.rows
    }
  }
};
</script>

<style scoped lang="scss">
</style>

