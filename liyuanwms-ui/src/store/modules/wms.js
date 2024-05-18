import { listWarehouse } from "@/api/wms/warehouse";
import { listArea } from "@/api/wms/area";
import { listRack } from "@/api/wms/rack";
const state = {
  supplierList: [],
  customerList: [],
  carrierList: [],
  carrierMap: new Map(),
  customerMap: new Map(),
  supplierMap: new Map(),
  warehouseList: [],
  warehouseMap: new Map(),
  areaList:[],
  areaMap:new Map(),
  rackList:[],
  rackMap:new Map()
}
const mutations = {
  SET_WAREHOUSE(state, list){
    state.warehouseList = list;
    state.warehouseMap = new Map();
    list.forEach((warehouse) => {
      state.warehouseMap.set(warehouse.id, warehouse.warehouseName)
    })
  },
  SET_AREA(state, list){
    state.areaList = list;
    state.areaMap = new Map();
    list.forEach((area) => {
      state.areaMap.set(area.id, area.areaName)
    })
  },
  SET_RACK(state, list){
    state.rackList = list;
    state.rackMap = new Map();
    list.forEach((rack) => {
      state.rackMap.set(rack.id, rack.rackName)
    })
  },
}
const actions = {
  getWarehouseList({ commit }) {
    return listWarehouse({}, { page: 0, size: 1000 })
      .then(res => {
        const { content } =res
        commit('SET_WAREHOUSE', content);
      })
  },
  getAreaList({ commit }) {
    return listArea({}, { page: 0, size: 1000 })
      .then(res => {
        const { content } =res
        commit('SET_AREA', content);
      })
  },
  getRackList({ commit }) {
    return listRack({}, { page: 0, size: 1000 })
      .then(res => {
        const { content } =res
        commit('SET_RACK', content);
      })
  },
}
export default {
  namespaced: true,
  state,
  mutations,
  actions
}
