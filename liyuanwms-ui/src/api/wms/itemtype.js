import request from '@/utils/request'

// 查询资产类型列表
export function listItemType(query) {
  return request({
    url: '/wms/itemType/list',
    method: 'get',
    params: query
  })
}

// 查询资产类型详细
export function getItemType(itemTypeId) {
  return request({
    url: '/wms/itemType/' + itemTypeId,
    method: 'get'
  })
}

// 新增资产类型
export function addItemType(data) {
  return request({
    url: '/wms/itemType',
    method: 'post',
    data: data
  })
}

// 修改资产类型
export function updateItemType(data) {
  return request({
    url: '/wms/itemType',
    method: 'put',
    data: data
  })
}

// 删除资产类型
export function delItemType(itemTypeId) {
  return request({
    url: '/wms/itemType/' + itemTypeId,
    method: 'delete'
  })
}

// 获取类型树
export function itemTypeTreeSelect() {
  return request({
    url: '/wms/itemType/itemTypeTree',
    method: 'get'
  })
}
