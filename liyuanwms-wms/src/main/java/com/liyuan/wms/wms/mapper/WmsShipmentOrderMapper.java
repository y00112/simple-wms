package com.liyuan.wms.wms.mapper;

import com.liyuan.wms.wms.domain.WmsShipmentOrder;

import java.util.List;

/**
 * 出库单Mapper接口
 * 
 * @author zhaoyss
 * @date 2024-06-24
 */
public interface WmsShipmentOrderMapper 
{
    /**
     * 查询出库单
     * 
     * @param id 出库单主键
     * @return 出库单
     */
    public WmsShipmentOrder selectWmsShipmentOrderById(Long id);

    /**
     * 查询出库单列表
     * 
     * @param wmsShipmentOrder 出库单
     * @return 出库单集合
     */
    public List<WmsShipmentOrder> selectWmsShipmentOrderList(WmsShipmentOrder wmsShipmentOrder);

    /**
     * 新增出库单
     * 
     * @param wmsShipmentOrder 出库单
     * @return 结果
     */
    public int insertWmsShipmentOrder(WmsShipmentOrder wmsShipmentOrder);

    /**
     * 修改出库单
     * 
     * @param wmsShipmentOrder 出库单
     * @return 结果
     */
    public int updateWmsShipmentOrder(WmsShipmentOrder wmsShipmentOrder);

    /**
     * 删除出库单
     * 
     * @param id 出库单主键
     * @return 结果
     */
    public int deleteWmsShipmentOrderById(Long id);

    /**
     * 批量删除出库单
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWmsShipmentOrderByIds(Long[] ids);

    WmsShipmentOrder selectWmsShipmentOrderByShipmentOrderNo(String shipmentOrderNo);
}
