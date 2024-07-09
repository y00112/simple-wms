<template>
  <div class="chart"
       :style="{height:height,width:width}" />
</template>

<script>
import * as echarts from 'echarts'
import resize from './mixins/resize'
import { getCount } from '@/api/wms/item.js'
require('echarts/theme/macarons') // echarts theme
// 引入柱状图组件
require("echarts/lib/chart/bar");
require("echarts/lib/component/tooltip");
require("echarts/lib/component/title");

export default {
  mixins: [resize],
  props: {
    width: {
      type: String,
      default: '100%'
    },
    height: {
      type: String,
      default: '350px'
    },
  },
  data () {
    return {
      chart: null,
      xvalue: [],
      yvalue: [],
    }
  },
  mounted () {
    //绘制柱状图
    this.$nextTick(() => {
      this.initChart()
    })
  },
  beforeDestroy () {
    if (!this.chart) {
      return
    }
    this.chart.dispose()
    this.chart = null
  },
  methods: {
    initChart () {
      this.chart = echarts.init(this.$el, 'macarons')
      this.chart.setOption({
        tooltip: {
          trigger: 'axis',
          axisPointer: { // 坐标轴指示器，坐标轴触发有效
            type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
          }
        },
        //自带title样式和配置
        // title: {
        //   text: "每月完成票务数目份数",
        //   textStyle: {
        //     //---主标题内容样式
        //     color: "black",
        //   },
        //    left: "center", //居中
        //   padding: [30, 0],
        // },
        // grid: {
        //   //下面是偏移
        //   // left: "3%",
        //   // right: "4%",
        //   // bottom: "3%",
        //   containLabel: true,
        // },
        toolbox: {
          show: true,
        },
        xAxis: [{
          type: 'category',
          splitLine: { show: false }, //去除网格线
          splitArea: { show: false }, //保留网格区域
          axisTick: { show: false }, //隐藏刻度线
        }],
        yAxis: [{
          type: 'value',
          axisTick: {
            show: false
          }
        }],
        series: [
          {
            barWidth: 40,
            name: "总份数",
            type: "bar",
            label: {
              // 柱状图上方文本标签，默认展示数值信息
              show: true,
              position: "top",
            },
          },
        ]
      })
      this.getCount()
    },
    async getCount () {
      this.xvalue = []
      this.yvalue = []
      const res = await getCount()
      res.data.forEach(item => {
        this.xvalue.push(item.itemTypeName)
        this.yvalue.push(item.count)
      });

      this.chart.setOption({
        xAxis: [{
          data: this.xvalue,
        }],
        series: [{
          data: this.yvalue
        }]
      })
    }
  }
}
</script>
