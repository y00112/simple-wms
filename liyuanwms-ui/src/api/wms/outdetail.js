import request from '@/utils/request'

// 查询出库单详情列表
export function listOutDetail(query) {
  return request({
    url: '/wms/outDetail/list',
    method: 'get',
    params: query
  })
}

// 查询出库单详情详细
export function getOutDetail(id) {
  return request({
    url: '/wms/outDetail/' + id,
    method: 'get'
  })
}

// 新增出库单详情
export function addOutDetail(data) {
  return request({
    url: '/wms/outDetail',
    method: 'post',
    data: data
  })
}
export function addsOutDetail(data) {
  return request({
    url: '/wms/outDetail/adds',
    method: 'post',
    data: data
  })
}
// 修改出库状态
export function changeStatus(data) {
  return request({
    url: '/wms/outDetail/edits',
    method: 'post',
    data: data
  })
}

// 修改出库单详情
export function updateOutDetail(data) {
  return request({
    url: '/wms/outDetail',
    method: 'put',
    data: data
  })
}

// 删除出库单详情
export function delOutDetail(id) {
  return request({
    url: '/wms/outDetail/' + id,
    method: 'delete'
  })
}
