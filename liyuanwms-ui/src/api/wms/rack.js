import request from '@/utils/request'

// 查询货架列表
export function listRack(query) {
  return request({
    url: '/system/rack/list',
    method: 'get',
    params: query
  })
}

// 查询货架详细
export function getRack(id) {
  return request({
    url: '/system/rack/' + id,
    method: 'get'
  })
}

// 新增货架
export function addRack(data) {
  return request({
    url: '/system/rack',
    method: 'post',
    data: data
  })
}

// 修改货架
export function updateRack(data) {
  return request({
    url: '/system/rack',
    method: 'put',
    data: data
  })
}

// 删除货架
export function delRack(id) {
  return request({
    url: '/system/rack/' + id,
    method: 'delete'
  })
}
