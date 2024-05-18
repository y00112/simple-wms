import request from '@/utils/request'

// 查询资产列表
export function listItem(query) {
  return request({
    url: '/wms/item/list',
    method: 'get',
    params: query
  })
}

// 查询资产详细
export function getItem(id) {
  return request({
    url: '/wms/item/' + id,
    method: 'get'
  })
}

// 新增资产
export function addItem(data) {
  return request({
    url: '/wms/item',
    method: 'post',
    data: data
  })
}

// 修改资产
export function updateItem(data) {
  return request({
    url: '/wms/item',
    method: 'put',
    data: data
  })
}

// 删除资产
export function delItem(id) {
  return request({
    url: '/wms/item/' + id,
    method: 'delete'
  })
}
