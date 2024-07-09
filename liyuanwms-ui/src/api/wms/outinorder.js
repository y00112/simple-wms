import request from '@/utils/request'

// 查询出库单列表
export function listOutOrder(query) {
  return request({
    url: '/wms/outOrder/list',
    method: 'get',
    params: query
  })
}

// 查询出库单详细
export function getOutOrder(id) {
  return request({
    url: '/wms/outOrder/' + id,
    method: 'get'
  })
}

// 新增出库单
export function addOutOrder(data) {
  return request({
    url: '/wms/outOrder',
    method: 'post',
    data: data
  })
}

// 修改出库单
export function updateOutOrder(data) {
  return request({
    url: '/wms/outOrder',
    method: 'put',
    data: data
  })
}

// 删除出库单
export function delOutOrder(id) {
  return request({
    url: '/wms/outOrder/' + id,
    method: 'delete'
  })
}
