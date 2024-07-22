package com.liyuan.wms.wms.service.impl;

import java.util.List;
import com.liyuan.wms.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.liyuan.wms.wms.mapper.WmsReceiptOrderMapper;
import com.liyuan.wms.wms.domain.WmsReceiptOrder;
import com.liyuan.wms.wms.service.IWmsReceiptOrderService;

/**
 * 入库单Service业务层处理
 * 
 * @author zhaoyss
 * @date 2024-04-28
 */
@Service
public class WmsReceiptOrderServiceImpl implements IWmsReceiptOrderService 
{
    @Autowired
    private WmsReceiptOrderMapper wmsReceiptOrderMapper;

    /**
     * 查询入库单
     * 
     * @param id 入库单主键
     * @return 入库单
     */
    @Override
    public WmsReceiptOrder selectWmsReceiptOrderById(Long id)
    {
        return wmsReceiptOrderMapper.selectWmsReceiptOrderById(id);
    }

    /**
     * 查询入库单列表
     * 
     * @param wmsReceiptOrder 入库单
     * @return 入库单
     */
    @Override
    public List<WmsReceiptOrder> selectWmsReceiptOrderList(WmsReceiptOrder wmsReceiptOrder)
    {
        return wmsReceiptOrderMapper.selectWmsReceiptOrderList(wmsReceiptOrder);
    }

    /**
     * 新增入库单
     * 
     * @param wmsReceiptOrder 入库单
     * @return 结果
     */
    @Override
    public int insertWmsReceiptOrder(WmsReceiptOrder wmsReceiptOrder)
    {
        wmsReceiptOrder.setCreateTime(DateUtils.getNowDate());
        return wmsReceiptOrderMapper.insertWmsReceiptOrder(wmsReceiptOrder);
    }

    /**
     * 修改入库单
     * 
     * @param wmsReceiptOrder 入库单
     * @return 结果
     */
    @Override
    public int updateWmsReceiptOrder(WmsReceiptOrder wmsReceiptOrder)
    {
        wmsReceiptOrder.setUpdateTime(DateUtils.getNowDate());
        return wmsReceiptOrderMapper.updateWmsReceiptOrder(wmsReceiptOrder);
    }

    /**
     * 批量删除入库单
     * 
     * @param ids 需要删除的入库单主键
     * @return 结果
     */
    @Override
    public int deleteWmsReceiptOrderByIds(Long[] ids)
    {
        return wmsReceiptOrderMapper.deleteWmsReceiptOrderByIds(ids);
    }

    /**
     * 删除入库单信息
     * 
     * @param id 入库单主键
     * @return 结果
     */
    @Override
    public int deleteWmsReceiptOrderById(Long id)
    {
        return wmsReceiptOrderMapper.deleteWmsReceiptOrderById(id);
    }

    @Override
    public WmsReceiptOrder selectWmsReceiptOrderByReceiptOrderNo(String receiptOrderNo) {
        return wmsReceiptOrderMapper.selectWmsReceiptOrderByReceiptOrderNo(receiptOrderNo);
    }
}
