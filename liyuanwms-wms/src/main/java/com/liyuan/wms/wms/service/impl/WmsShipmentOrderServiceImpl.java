package com.liyuan.wms.wms.service.impl;

import java.util.List;
import com.liyuan.wms.common.utils.DateUtils;
import com.liyuan.wms.wms.domain.WmsShipmentOrder;
import com.liyuan.wms.wms.mapper.WmsShipmentOrderMapper;
import com.liyuan.wms.wms.service.IWmsShipmentOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 出库单Service业务层处理
 * 
 * @author zhaoyss
 * @date 2024-06-24
 */
@Service
public class WmsShipmentOrderServiceImpl implements IWmsShipmentOrderService
{
    @Autowired
    private WmsShipmentOrderMapper wmsShipmentOrderMapper;

    /**
     * 查询出库单
     * 
     * @param id 出库单主键
     * @return 出库单
     */
    @Override
    public WmsShipmentOrder selectWmsShipmentOrderById(Long id)
    {
        return wmsShipmentOrderMapper.selectWmsShipmentOrderById(id);
    }

    /**
     * 查询出库单列表
     * 
     * @param wmsShipmentOrder 出库单
     * @return 出库单
     */
    @Override
    public List<WmsShipmentOrder> selectWmsShipmentOrderList(WmsShipmentOrder wmsShipmentOrder)
    {
        return wmsShipmentOrderMapper.selectWmsShipmentOrderList(wmsShipmentOrder);
    }

    /**
     * 新增出库单
     * 
     * @param wmsShipmentOrder 出库单
     * @return 结果
     */
    @Override
    public int insertWmsShipmentOrder(WmsShipmentOrder wmsShipmentOrder)
    {
        wmsShipmentOrder.setCreateTime(DateUtils.getNowDate());
        return wmsShipmentOrderMapper.insertWmsShipmentOrder(wmsShipmentOrder);
    }

    /**
     * 修改出库单
     * 
     * @param wmsShipmentOrder 出库单
     * @return 结果
     */
    @Override
    public int updateWmsShipmentOrder(WmsShipmentOrder wmsShipmentOrder)
    {
        wmsShipmentOrder.setUpdateTime(DateUtils.getNowDate());
        return wmsShipmentOrderMapper.updateWmsShipmentOrder(wmsShipmentOrder);
    }

    /**
     * 批量删除出库单
     * 
     * @param ids 需要删除的出库单主键
     * @return 结果
     */
    @Override
    public int deleteWmsShipmentOrderByIds(Long[] ids)
    {
        return wmsShipmentOrderMapper.deleteWmsShipmentOrderByIds(ids);
    }

    /**
     * 删除出库单信息
     * 
     * @param id 出库单主键
     * @return 结果
     */
    @Override
    public int deleteWmsShipmentOrderById(Long id)
    {
        return wmsShipmentOrderMapper.deleteWmsShipmentOrderById(id);
    }
}
