<template>
  <div>
    <span v-if="warehouseName">{{warehouseName}}</span>
    <span v-if="areaName"> / {{areaName}}</span>
    <span v-if="rackName"> / {{rackName}}</span>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  props: {
    value: {
      type: [String, Number, Array],
      default: null
    }
  },
  data () {
    return {
      rackName: '',
      areaName: '',
      warehouseName: '',
    }
  },
  computed: {
    ...mapGetters(['rackList', 'areaList', 'warehouseList']),
  },
  created () {
    this.getSpace()
  },
  methods: {
    getSpace () {
      const warehouseId = this.value[0]
      const areaId = this.value[1]
      const rackId = this.value[2]
      if (rackId) {
        this.rackName = this.rackList.find(rack => {
          return rack.id === rackId
        }).rackName
      }
      if (areaId) {
        this.areaName = this.areaList.find(area => {
          return area.id === areaId
        }).areaName
      }
      if (warehouseId) {
        this.warehouseName = this.warehouseList.find(warehouse => {
          return warehouse.id === warehouseId
        }).warehouseName
      }
    }
  }
}
</script>
