import request from '@/utils/request'

// 查询入库单详情列表
export function listInDetail(query) {
  return request({
    url: '/wms/inDetail/list',
    method: 'get',
    params: query
  })
}

// 查询入库单详情详细
export function getInDetail(id) {
  return request({
    url: '/wms/inDetail/' + id,
    method: 'get'
  })
}

// 新增入库单详情
export function addInDetail(data) {
  return request({
    url: '/wms/inDetail',
    method: 'post',
    data: data
  })
}

// 修改入库单详情
export function updateInDetail(data) {
  return request({
    url: '/wms/inDetail',
    method: 'put',
    data: data
  })
}

// 删除入库单详情
export function delInDetail(id) {
  return request({
    url: '/wms/inDetail/' + id,
    method: 'delete'
  })
}
