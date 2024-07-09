package com.liyuan.wms.wms.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.liyuan.wms.common.utils.DateUtils;
import com.liyuan.wms.wms.controller.vo.WmsItemVO;
import com.liyuan.wms.wms.controller.vo.WmsReceiptOrderDetailRespVO;
import com.liyuan.wms.wms.controller.vo.WmsReceiptOrderDetailsVO;
import com.liyuan.wms.wms.service.IWmsItemService;
import org.springframework.beans.BeanUtils;
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
public class WmsReceiptOrderDetailServiceImpl implements IWmsReceiptOrderDetailService {
    @Autowired
    private WmsReceiptOrderDetailMapper wmsReceiptOrderDetailMapper;

    @Autowired
    private IWmsItemService wmsItemService;

    /**
     * 查询入库单详情
     *
     * @param id 入库单详情主键
     * @return 入库单详情
     */
    @Override
    public WmsReceiptOrderDetail selectWmsReceiptOrderDetailById(Long id) {
        return wmsReceiptOrderDetailMapper.selectWmsReceiptOrderDetailById(id);
    }

    /**
     * 查询入库单详情列表
     *
     * @param wmsReceiptOrderDetail 入库单详情
     * @return 入库单详情
     */
    @Override
    public List<WmsReceiptOrderDetailRespVO> selectWmsReceiptOrderDetailList(WmsReceiptOrderDetail wmsReceiptOrderDetail) {
        List<WmsReceiptOrderDetail> list = wmsReceiptOrderDetailMapper.selectWmsReceiptOrderDetailList(wmsReceiptOrderDetail);
        List<WmsReceiptOrderDetailRespVO> result = new ArrayList<>();
        for (WmsReceiptOrderDetail receiptOrderDetail : list) {
            WmsReceiptOrderDetailRespVO vo = new WmsReceiptOrderDetailRespVO();
            BeanUtils.copyProperties(receiptOrderDetail, vo);
            WmsItemVO item = wmsItemService.selectWmsItemById(receiptOrderDetail.getItemId());
            vo.setWarehouseId(item.getWarehouseId());
            vo.setAreaId(item.getAreaId());
            vo.setRackId(item.getRackId());
            vo.setQuantity(item.getQuantity());
            List<Long> place = handlePlace(vo);
            vo.setItemName(item.getItemName());
            vo.setItemNo(item.getItemNo());
            vo.setPlace(place);
            result.add(vo);
        }
        return result;
    }

    private List<Long> handlePlace(WmsReceiptOrderDetailRespVO vo) {
        List<Long> place = new ArrayList<>();
        if (vo.getWarehouseId() != null && vo.getWarehouseId() != 0) {
            place.add(vo.getWarehouseId());
        }
        if (vo.getAreaId() != null && vo.getAreaId() != 0) {
            place.add(vo.getAreaId());
        }
        if (vo.getRackId() != null && vo.getRackId() != 0) {
            place.add(vo.getRackId());
        }
        return place;
    }

    /**
     * 新增入库单详情
     *
     * @param wmsReceiptOrderDetail 入库单详情
     * @return 结果
     */
    @Override
    public int insertWmsReceiptOrderDetail(WmsReceiptOrderDetail wmsReceiptOrderDetail) {
        // 修改资产库存
        WmsItemVO wmsItemVO = wmsItemService.selectWmsItemById(wmsReceiptOrderDetail.getItemId());
        wmsItemVO.setQuantity(wmsItemVO.getQuantity() + wmsReceiptOrderDetail.getInQuantity());
        wmsItemService.updateWmsItem(wmsItemVO);

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
    public int updateWmsReceiptOrderDetail(WmsReceiptOrderDetail wmsReceiptOrderDetail) {
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
    public int deleteWmsReceiptOrderDetailByIds(Long[] ids) {
        return wmsReceiptOrderDetailMapper.deleteWmsReceiptOrderDetailByIds(ids);
    }

    /**
     * 删除入库单详情信息
     *
     * @param id 入库单详情主键
     * @return 结果
     */
    @Override
    public int deleteWmsReceiptOrderDetailById(Long id) {
        return wmsReceiptOrderDetailMapper.deleteWmsReceiptOrderDetailById(id);
    }

    @Override
    public int adds(WmsReceiptOrderDetailsVO vo) {
        vo.getList().forEach(item -> {
            item.setCreateTime(DateUtils.getNowDate());
            wmsReceiptOrderDetailMapper.insertWmsReceiptOrderDetail(item);
        });
        return 1;
    }

    @Override
    public int edits(WmsReceiptOrderDetailsVO vo) {
        vo.getList().forEach(item -> {
            // 修改资产库存
            WmsItemVO wmsItemVO = wmsItemService.selectWmsItemById(item.getItemId());
            wmsItemVO.setQuantity(wmsItemVO.getQuantity() + item.getInQuantity());
            wmsItemService.updateWmsItem(wmsItemVO);

            item.setReceiptOrderStatus(2);
            item.setUpdateTime(DateUtils.getNowDate());
            wmsReceiptOrderDetailMapper.updateWmsReceiptOrderDetail(item);
        });
        return 1;
    }
}
