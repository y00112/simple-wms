package com.liyuan.wms.wms.service;

import com.liyuan.wms.wms.domain.WmsShipmentOrder;
import com.liyuan.wms.wms.vo.WmsShipmentOrderVO;

import java.util.List;

/**
 * 出库单Service接口
 * 
 * @author zhaoyss
 * @date 2024-06-24
 */
public interface IWmsShipmentOrderService 
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
     * 批量删除出库单
     * 
     * @param ids 需要删除的出库单主键集合
     * @return 结果
     */
    public int deleteWmsShipmentOrderByIds(Long[] ids);

    /**
     * 删除出库单信息
     * 
     * @param id 出库单主键
     * @return 结果
     */
    public int deleteWmsShipmentOrderById(Long id);

    WmsShipmentOrder selectWmsShipmentOrderByShipmentOrderNo(String shipmentOrderNo);
}
