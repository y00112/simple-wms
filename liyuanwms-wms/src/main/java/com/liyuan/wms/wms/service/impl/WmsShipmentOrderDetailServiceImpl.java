package com.liyuan.wms.wms.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.liyuan.wms.common.utils.DateUtils;
import com.liyuan.wms.wms.domain.WmsShipmentOrder;
import com.liyuan.wms.wms.service.IWmsItemService;
import com.liyuan.wms.wms.vo.WmsItemVO;
import com.liyuan.wms.wms.vo.WmsShipmentDetailsRespVO;
import com.liyuan.wms.wms.vo.WmsShipmentOrderDetailsVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.liyuan.wms.wms.mapper.WmsShipmentOrderDetailMapper;
import com.liyuan.wms.wms.domain.WmsShipmentOrderDetail;
import com.liyuan.wms.wms.service.IWmsShipmentOrderDetailService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 出库单详情Service业务层处理
 *
 * @author zhaoyss
 * @date 2024-06-24
 */
@Service
public class WmsShipmentOrderDetailServiceImpl implements IWmsShipmentOrderDetailService {
    @Autowired
    private WmsShipmentOrderDetailMapper wmsShipmentOrderDetailMapper;

    @Autowired
    private WmsShipmentOrderServiceImpl wmsShipmentOrderService;

    @Autowired
    private IWmsItemService wmsItemService;

    /**
     * 查询出库单详情
     *
     * @param id 出库单详情主键
     * @return 出库单详情
     */
    @Override
    public WmsShipmentOrderDetail selectWmsShipmentOrderDetailById(Long id) {
        return wmsShipmentOrderDetailMapper.selectWmsShipmentOrderDetailById(id);
    }

    /**
     * 查询出库单详情列表
     *
     * @param wmsShipmentOrderDetail 出库单详情
     * @return 出库单详情
     */
    @Override
    public List<WmsShipmentOrderDetail> selectWmsShipmentOrderDetailList(WmsShipmentOrderDetail wmsShipmentOrderDetail) {
        return wmsShipmentOrderDetailMapper.selectWmsShipmentOrderDetailList(wmsShipmentOrderDetail);
    }

    /**
     * 新增出库单详情
     *
     * @param wmsShipmentOrderDetail 出库单详情
     * @return 结果
     */
    @Override
    public int insertWmsShipmentOrderDetail(WmsShipmentOrderDetail wmsShipmentOrderDetail) {
        wmsShipmentOrderDetail.setCreateTime(DateUtils.getNowDate());
        return wmsShipmentOrderDetailMapper.insertWmsShipmentOrderDetail(wmsShipmentOrderDetail);
    }

    /**
     * 修改出库单详情
     *
     * @param wmsShipmentOrderDetail 出库单详情
     * @return 结果
     */
    @Override
    public int updateWmsShipmentOrderDetail(WmsShipmentOrderDetail wmsShipmentOrderDetail) {
        wmsShipmentOrderDetail.setUpdateTime(DateUtils.getNowDate());
        return wmsShipmentOrderDetailMapper.updateWmsShipmentOrderDetail(wmsShipmentOrderDetail);
    }

    /**
     * 批量删除出库单详情
     *
     * @param ids 需要删除的出库单详情主键
     * @return 结果
     */
    @Override
    public int deleteWmsShipmentOrderDetailByIds(Long[] ids) {
        return wmsShipmentOrderDetailMapper.deleteWmsShipmentOrderDetailByIds(ids);
    }

    /**
     * 删除出库单详情信息
     *
     * @param id 出库单详情主键
     * @return 结果
     */
    @Override
    public int deleteWmsShipmentOrderDetailById(Long id) {
        return wmsShipmentOrderDetailMapper.deleteWmsShipmentOrderDetailById(id);
    }

    /**
     * 批量创建出库单详情
     *
     * @param vo
     * @return
     */
    @Override
    public int adds(WmsShipmentOrderDetailsVO vo) {
        vo.getList().forEach(item -> {
            item.setCreateTime(DateUtils.getNowDate());
            wmsShipmentOrderDetailMapper.insertWmsShipmentOrderDetail(item);
        });
        return 1;
    }

    /**
     * 批量修改出库单详情
     *
     * @param vo
     * @return
     */
    @Override
    @Transactional
    public int edits(WmsShipmentOrderDetailsVO vo) {
        vo.getList().forEach(item -> {
            // 修改资产库存
            WmsItemVO wmsItemVO = wmsItemService.selectWmsItemById(item.getItemId());
            wmsItemVO.setQuantity(wmsItemVO.getQuantity() - item.getShipmentQuantity());
            wmsItemService.updateWmsItem(wmsItemVO);

            item.setShipmentOrderStatus(2);
            item.setUpdateTime(DateUtils.getNowDate());
            wmsShipmentOrderDetailMapper.updateWmsShipmentOrderDetail(item);
        });
        // 根据出库单号查询出库状态
        String shipmentOrderNo = vo.getList().get(0).getShipmentOrderNo();
        int count = wmsShipmentOrderDetailMapper.selectCount(shipmentOrderNo);
        if (count == 0){
            WmsShipmentOrder wmsShipmentOrder = wmsShipmentOrderService.selectWmsShipmentOrderByShipmentOrderNo(shipmentOrderNo);
            wmsShipmentOrder.setShipmentOrderStatus(2);
            wmsShipmentOrderService.updateWmsShipmentOrder(wmsShipmentOrder);
        }
        return 1;
    }

    @Override
    public List<WmsShipmentDetailsRespVO> selectWmsShipmentOrderDetailList2(WmsShipmentOrderDetail wmsShipmentOrderDetail) {
        List<WmsShipmentOrderDetail> list
                = wmsShipmentOrderDetailMapper.selectWmsShipmentOrderDetailList(wmsShipmentOrderDetail);
        List<WmsShipmentDetailsRespVO> result = new ArrayList<>();
        for (WmsShipmentOrderDetail shipmentOrderDetail : list) {
            WmsShipmentDetailsRespVO vo = new WmsShipmentDetailsRespVO();
            BeanUtils.copyProperties(shipmentOrderDetail, vo);
            WmsItemVO wmsItem = wmsItemService.selectWmsItemById(shipmentOrderDetail.getItemId());
            vo.setWarehouseId(wmsItem.getWarehouseId());
            vo.setRackId(wmsItem.getRackId());
            vo.setAreaId(wmsItem.getAreaId());
            List<Long> place = handlePlace(vo);
            vo.setItemName(wmsItem.getItemName());
            vo.setItemNo(wmsItem.getItemNo());
            vo.setPlace(place);
            vo.setQuantity(wmsItem.getQuantity());
            vo.setUnit(wmsItem.getUnit());
            result.add(vo);
        }
        return result;
    }


    private List<Long> handlePlace(WmsShipmentDetailsRespVO vo) {
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
}
