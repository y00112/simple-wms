<template>
  <el-cascader placeholder="请选择仓库信息"
               :options="itemWarehouseOptions"
               v-model="selections"
               :props="{ checkStrictly: checkStrictly }"
               clearable
               :size="size"
               :disabled="disabled"
               filterable></el-cascader>
</template>

<script>
import { listRack } from "@/api/wms/rack"
import { listArea } from '@/api/wms/area'
import { listWarehouse } from '@/api/wms/warehouse'
export default {
  props: {
    value: {
      type: [String, Number, Array],
      default: null
    },
    size: {
      type: String,
      default: 'small'
    },
    checkStrictly: {
      type: Boolean,
      default: false
    },
    disabled: {
      type: Boolean,
      default: false
    }
  },
  data () {
    return {
      itemWarehouseOptions: []
    }
  },
  computed: {
    selections: {
      get () {
        return this.value
      },
      set (v) {
        this.$emit('input', v)
      }
    }
  },
  created () {
    this.getWarehouseTree()

  },
  methods: {
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
  }
}
</script>
<style>
.el-scrollbar__wrap {
  overflow: hidden;
  margin-bottom: 0px !important;
  margin-right: 0px !important;
}
</style>