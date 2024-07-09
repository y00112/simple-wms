package com.liyuan.wms.wms.service.impl;

import java.sql.Array;
import java.util.*;

import com.liyuan.wms.common.core.domain.entity.WmsItemType;
import com.liyuan.wms.common.utils.DateUtils;
import com.liyuan.wms.common.utils.spring.SpringUtils;
import com.liyuan.wms.wms.controller.vo.WmsItemCountVO;
import com.liyuan.wms.wms.controller.vo.WmsItemVO;
import com.liyuan.wms.wms.domain.WmsWarehouse;
import com.liyuan.wms.wms.service.IWmsItemTypeService;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.jdbc.Null;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.liyuan.wms.wms.mapper.WmsItemMapper;
import com.liyuan.wms.wms.domain.WmsItem;
import com.liyuan.wms.wms.service.IWmsItemService;

/**
 * 资产Service业务层处理
 *
 * @author zhaoyss
 * @date 2024-04-09
 */
@SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
@Service
public class WmsItemServiceImpl implements IWmsItemService {
    @Autowired
    private WmsItemMapper wmsItemMapper;

    @Autowired
    private WmsWarehouseServiceImpl wmsWarehouseService;

    @Autowired
    private WmsAreaServiceImpl wmsAreaService;

    @Autowired
    private WmsRackServiceImpl wmsRackService;

    @Autowired
    private IWmsItemTypeService wmsItemTypeService;


    /**
     * 查询资产
     *
     * @param id 资产主键
     * @return 资产
     */
    @Override
    public WmsItemVO selectWmsItemById(Long id) {
        WmsItem wmsItem = wmsItemMapper.selectWmsItemById(id);
        WmsItemVO wmsItemVO = new WmsItemVO();
        BeanUtils.copyProperties(wmsItem, wmsItemVO);
        handlePlace(wmsItemVO);
        return wmsItemVO;
    }

    private void handlePlace(WmsItemVO wmsItemVO) {
        List<Long> place = new ArrayList<>();
        if (wmsItemVO.getWarehouseId() == null || wmsItemVO.getWarehouseId() == 0) {
            wmsItemVO.setWarehouseName(null);
        } else {
            place.add(0, wmsItemVO.getWarehouseId());
            wmsItemVO.setPlace(place);
            wmsItemVO.setWarehouseName(getWarehouseName(wmsItemVO.getWarehouseId()));
        }

        if (wmsItemVO.getAreaId() == null || wmsItemVO.getAreaId() == 0) {
            wmsItemVO.setWarehouseName(null);
        } else {
            wmsItemVO.getPlace().add(wmsItemVO.getAreaId());
            wmsItemVO.setAreaName(getAreaName(wmsItemVO.getAreaId()));
        }

        if (wmsItemVO.getRackId() == null || wmsItemVO.getRackId() == 0) {
            wmsItemVO.setRackName(null);
        } else {
            wmsItemVO.getPlace().add(wmsItemVO.getRackId());
            wmsItemVO.setRackName(getRackName(wmsItemVO.getRackId()));
        }
    }

    /**
     * 查询资产列表
     *
     * @param wmsItem 资产
     * @return 资产
     */
    @Override
    public List<WmsItemVO> selectWmsItemList(WmsItem wmsItem) {
        ArrayList<WmsItemVO> wmsItemVOS = new ArrayList<>();
        List<WmsItem> wmsItemList = wmsItemMapper.selectWmsItemList(wmsItem);
        for (WmsItem item : wmsItemList) {
            WmsItemVO wmsItemVO = new WmsItemVO();
            BeanUtils.copyProperties(item, wmsItemVO);
            handlePlace(wmsItemVO);
            handleItemTypeName(wmsItemVO);
            wmsItemVOS.add(wmsItemVO);
        }
        return wmsItemVOS;
    }

    private void handleItemTypeName(WmsItemVO wmsItemVO) {
        String typeName = wmsItemTypeService.selectWmsItemTypeByItemTypeId(Long.valueOf(wmsItemVO.getItemType())).getTypeName();
        wmsItemVO.setItemTypeName(typeName);
    }

    /**
     * 获取仓库名称
     *
     * @param warehouseId
     * @return
     */
    private String getWarehouseName(Long warehouseId) {
        return wmsWarehouseService.selectWmsWarehouseById(warehouseId).getWarehouseName();
    }

    /**
     * 获取库区名称
     *
     * @param areaId
     * @return
     */
    private String getAreaName(Long areaId) {
        return wmsAreaService.selectWmsAreaById(areaId).getAreaName();
    }

    /**
     * 获取货架名称
     *
     * @param rackId
     * @return
     */
    private String getRackName(Long rackId) {
        return wmsRackService.selectWmsRackById(rackId).getRackName();
    }

    /**
     * 新增资产
     *
     * @param wmsItem 资产
     * @return 结果
     */
    @Override
    public int insertWmsItem(WmsItem wmsItem) {
        wmsItem.setCreateTime(DateUtils.getNowDate());
        return wmsItemMapper.insertWmsItem(wmsItem);
    }

    /**
     * 修改资产
     *
     * @param wmsItem 资产
     * @return 结果
     */
    @Override
    public int updateWmsItem(WmsItem wmsItem) {
        wmsItem.setUpdateTime(DateUtils.getNowDate());
        return wmsItemMapper.updateWmsItem(wmsItem);
    }

    /**
     * 批量删除资产
     *
     * @param ids 需要删除的资产主键
     * @return 结果
     */
    @Override
    public int deleteWmsItemByIds(Long[] ids) {
        return wmsItemMapper.deleteWmsItemByIds(ids);
    }

    /**
     * 删除资产信息
     *
     * @param id 资产主键
     * @return 结果
     */
    @Override
    public int deleteWmsItemById(Long id) {
        return wmsItemMapper.deleteWmsItemById(id);
    }

    /**
     * 资产类型统计
     *
     * @return
     */
    @Override
    public List<WmsItemCountVO> count() {
        List<WmsItemType> itemTypeList = wmsItemTypeService.selectWmsItemTypeList(new WmsItemType());
        List<WmsItemCountVO> result = new ArrayList<>();
        Map<Long,WmsItemCountVO> map = new HashMap<>();
        for (WmsItemType itemType : itemTypeList) {
            Long typeId = itemType.getItemTypeId();
            if (itemType.getParentId() == 0) {
                WmsItemCountVO wmsItemCountVO = new WmsItemCountVO();
                wmsItemCountVO.setItemTypeId(typeId);
                wmsItemCountVO.setItemTypeName(itemType.getTypeName());
                wmsItemCountVO.setCount(countByItemType(typeId));
                map.put(typeId,wmsItemCountVO);
            } else {
                WmsItemCountVO wmsItemCountVO = map.get(itemType.getParentId());
                if (wmsItemCountVO != null){
                    wmsItemCountVO.setCount(wmsItemCountVO.getCount() + countByItemType(typeId));
                    map.put(itemType.getParentId(),wmsItemCountVO);
                }else {
                    wmsItemCountVO = new WmsItemCountVO();
                    wmsItemCountVO.setItemTypeName(itemType.getTypeName());
                    wmsItemCountVO.setItemTypeId(itemType.getParentId());
                    wmsItemCountVO.setCount(countByItemType(typeId));
                    map.put(itemType.getParentId(),wmsItemCountVO);
                }
            }
        }
        result.addAll(map.values());
        return result;
    }

    /**
     * 根据资产类型统计资产数量
     *
     * @param typeId
     * @return
     */
    private Long countByItemType(Long typeId) {
        Long count = 0L;
        WmsItem wmsItem = new WmsItem();
        wmsItem.setItemType(typeId);
        List<WmsItemVO> wmsItemList = selectWmsItemList(wmsItem);
        if (wmsItemList.size() > 0) {
            count = wmsItemList.stream().mapToLong(WmsItem::getQuantity).sum();
        }
        return count;
    }
}
