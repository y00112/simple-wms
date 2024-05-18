import request from '@/utils/request'

// 查询入库单列表
export function listInOrder(query) {
  return request({
    url: '/wms/inOrder/list',
    method: 'get',
    params: query
  })
}

// 查询入库单详细
export function getInOrder(id) {
  return request({
    url: '/wms/inOrder/' + id,
    method: 'get'
  })
}

// 新增入库单
export function addInOrder(data) {
  return request({
    url: '/wms/inOrder',
    method: 'post',
    data: data
  })
}

// 修改入库单
export function updateInOrder(data) {
  return request({
    url: '/wms/inOrder',
    method: 'put',
    data: data
  })
}

// 删除入库单
export function delInOrder(id) {
  return request({
    url: '/wms/inOrder/' + id,
    method: 'delete'
  })
}
