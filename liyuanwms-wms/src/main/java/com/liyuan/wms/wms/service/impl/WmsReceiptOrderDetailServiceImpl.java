package com.liyuan.wms.wms.service.impl;

import java.util.List;
import com.liyuan.wms.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.liyuan.wms.wms.mapper.WmsReceiptOrderDetailMapper;
import com.liyuan.wms.wms.domain.WmsReceiptOrderDetail;
import com.liyuan.wms.wms.service.IWmsReceiptOrderDetailService;

/**
 * 入库单详情Service业务层处理
 * 
 * @author zhaoyss
 * @date 2024-04-28
 */
@Service
public class WmsReceiptOrderDetailServiceImpl implements IWmsReceiptOrderDetailService 
{
    @Autowired
    private WmsReceiptOrderDetailMapper wmsReceiptOrderDetailMapper;

    /**
     * 查询入库单详情
     * 
     * @param id 入库单详情主键
     * @return 入库单详情
     */
    @Override
    public WmsReceiptOrderDetail selectWmsReceiptOrderDetailById(Long id)
    {
        return wmsReceiptOrderDetailMapper.selectWmsReceiptOrderDetailById(id);
    }

    /**
     * 查询入库单详情列表
     * 
     * @param wmsReceiptOrderDetail 入库单详情
     * @return 入库单详情
     */
    @Override
    public List<WmsReceiptOrderDetail> selectWmsReceiptOrderDetailList(WmsReceiptOrderDetail wmsReceiptOrderDetail)
    {
        return wmsReceiptOrderDetailMapper.selectWmsReceiptOrderDetailList(wmsReceiptOrderDetail);
    }

    /**
     * 新增入库单详情
     * 
     * @param wmsReceiptOrderDetail 入库单详情
     * @return 结果
     */
    @Override
    public int insertWmsReceiptOrderDetail(WmsReceiptOrderDetail wmsReceiptOrderDetail)
    {
        wmsReceiptOrderDetail.setCreateTime(DateUtils.getNowDate());
        return wmsReceiptOrderDetailMapper.insertWmsReceiptOrderDetail(wmsReceiptOrderDetail);
    }

    /**
     * 修改入库单详情
     * 
     * @param wmsReceiptOrderDetail 入库单详情
     * @return 结果
     */
    @Override
    public int updateWmsReceiptOrderDetail(WmsReceiptOrderDetail wmsReceiptOrderDetail)
    {
        wmsReceiptOrderDetail.setUpdateTime(DateUtils.getNowDate());
        return wmsReceiptOrderDetailMapper.updateWmsReceiptOrderDetail(wmsReceiptOrderDetail);
    }

    /**
     * 批量删除入库单详情
     * 
     * @param ids 需要删除的入库单详情主键
     * @return 结果
     */
    @Override
    public int deleteWmsReceiptOrderDetailByIds(Long[] ids)
    {
        return wmsReceiptOrderDetailMapper.deleteWmsReceiptOrderDetailByIds(ids);
    }

    /**
     * 删除入库单详情信息
     * 
     * @param id 入库单详情主键
     * @return 结果
     */
    @Override
    public int deleteWmsReceiptOrderDetailById(Long id)
    {
        return wmsReceiptOrderDetailMapper.deleteWmsReceiptOrderDetailById(id);
    }
}
