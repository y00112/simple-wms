package com.liyuan.wms.wms.mapper;

import java.util.List;
import com.liyuan.wms.wms.domain.WmsShipmentOrderDetail;

/**
 * 出库单详情Mapper接口
 * 
 * @author zhaoyss
 * @date 2024-06-24
 */
public interface WmsShipmentOrderDetailMapper 
{
    /**
     * 查询出库单详情
     * 
     * @param id 出库单详情主键
     * @return 出库单详情
     */
    public WmsShipmentOrderDetail selectWmsShipmentOrderDetailById(Long id);

    /**
     * 查询出库单详情列表
     * 
     * @param wmsShipmentOrderDetail 出库单详情
     * @return 出库单详情集合
     */
    public List<WmsShipmentOrderDetail> selectWmsShipmentOrderDetailList(WmsShipmentOrderDetail wmsShipmentOrderDetail);

    /**
     * 新增出库单详情
     * 
     * @param wmsShipmentOrderDetail 出库单详情
     * @return 结果
     */
    public int insertWmsShipmentOrderDetail(WmsShipmentOrderDetail wmsShipmentOrderDetail);

    /**
     * 修改出库单详情
     * 
     * @param wmsShipmentOrderDetail 出库单详情
     * @return 结果
     */
    public int updateWmsShipmentOrderDetail(WmsShipmentOrderDetail wmsShipmentOrderDetail);

    /**
     * 删除出库单详情
     * 
     * @param id 出库单详情主键
     * @return 结果
     */
    public int deleteWmsShipmentOrderDetailById(Long id);

    /**
     * 批量删除出库单详情
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWmsShipmentOrderDetailByIds(Long[] ids);
}
