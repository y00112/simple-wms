package com.liyuan.wms.wms.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

import com.liyuan.wms.common.core.domain.TreeSelect;
import com.liyuan.wms.common.utils.DateUtils;
import com.liyuan.wms.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.liyuan.wms.wms.mapper.WmsItemTypeMapper;
import com.liyuan.wms.common.core.domain.entity.WmsItemType;
import com.liyuan.wms.wms.service.IWmsItemTypeService;

/**
 * 资产类型Service业务层处理
 *
 * @author zhaoyss
 * @date 2024-04-08
 */
@Service
public class WmsItemTypeServiceImpl implements IWmsItemTypeService {

    @Autowired
    private WmsItemTypeMapper wmsItemTypeMapper;

    /**
     * 查询资产类型
     *
     * @param itemTypeId 资产类型主键
     * @return 资产类型
     */
    @Override
    public WmsItemType selectWmsItemTypeByItemTypeId(Long itemTypeId) {
        return wmsItemTypeMapper.selectWmsItemTypeByItemTypeId(itemTypeId);
    }

    /**
     * 查询资产类型列表
     *
     * @param wmsItemType 资产类型
     * @return 资产类型
     */
    @Override
    public List<WmsItemType> selectWmsItemTypeList(WmsItemType wmsItemType) {
        return wmsItemTypeMapper.selectWmsItemTypeList(wmsItemType);
    }

    /**
     * 新增资产类型
     *
     * @param wmsItemType 资产类型
     * @return 结果
     */
    @Override
    public int insertWmsItemType(WmsItemType wmsItemType) {
        wmsItemType.setCreateTime(DateUtils.getNowDate());
        return wmsItemTypeMapper.insertWmsItemType(wmsItemType);
    }

    /**
     * 修改资产类型
     *
     * @param wmsItemType 资产类型
     * @return 结果
     */
    @Override
    public int updateWmsItemType(WmsItemType wmsItemType) {
        wmsItemType.setUpdateTime(DateUtils.getNowDate());
        return wmsItemTypeMapper.updateWmsItemType(wmsItemType);
    }

    /**
     * 批量删除资产类型
     *
     * @param itemTypeIds 需要删除的资产类型主键
     * @return 结果
     */
    @Override
    public int deleteWmsItemTypeByItemTypeIds(Long[] itemTypeIds) {
        return wmsItemTypeMapper.deleteWmsItemTypeByItemTypeIds(itemTypeIds);
    }

    /**
     * 删除资产类型信息
     *
     * @param itemTypeId 资产类型主键
     * @return 结果
     */
    @Override
    public int deleteWmsItemTypeByItemTypeId(Long itemTypeId) {
        return wmsItemTypeMapper.deleteWmsItemTypeByItemTypeId(itemTypeId);
    }

    @Override
    public List<TreeSelect> selectItemTypeTreeList(WmsItemType wmsItemType) {
        List<WmsItemType> wmsItemTypes = wmsItemTypeMapper.selectWmsItemTypeList(wmsItemType);
        return buildItemTypeTreeSelect(wmsItemTypes);
    }

    @Override
    public List<WmsItemType> buildItemTypeTree(List<WmsItemType> wmsItemTypes) {

        List<WmsItemType> returnList = new ArrayList<>();
        List<Long> tempList = wmsItemTypes.stream().map(WmsItemType::getItemTypeId).collect(Collectors.toList());
        for (WmsItemType wmsItemType : wmsItemTypes) {
            // 如果是顶级节点，遍历该父节点的所以子节点
            if (!tempList.contains(wmsItemType.getParentId())) {
                recursionFn(wmsItemTypes, wmsItemType);
                returnList.add(wmsItemType);
            }
        }
        if (returnList.isEmpty()) {
            returnList = wmsItemTypes;
        }
        return returnList;
    }

    /**
     * 递归列表
     */
    private void recursionFn(List<WmsItemType> list, WmsItemType t) {
        // 得到子节点列表
        List<WmsItemType> childList = getChildList(list, t);
        t.setChildren(childList);

        for (WmsItemType tChild : childList) {
            if (hasChild(list, tChild)) {
                recursionFn(list, tChild);
            }
        }
    }

    /**
     * 判断是否有子节点
     */
    private boolean hasChild(List<WmsItemType> list, WmsItemType t) {
        return getChildList(list, t).size() > 0;
    }

    /**
     * 得到子节点列表
     */
    private List<WmsItemType> getChildList(List<WmsItemType> list, WmsItemType t) {
        List<WmsItemType> tlist = new ArrayList<>();
        Iterator<WmsItemType> it = list.iterator();

        while (it.hasNext()) {
            WmsItemType n = it.next();
            if (StringUtils.isNotNull(n.getParentId()) && n.getParentId().longValue() == t.getItemTypeId().longValue()) {
                tlist.add(n);
            }
        }

        return tlist;
    }

    @Override
    public List<TreeSelect> buildItemTypeTreeSelect(List<WmsItemType> wmsItemTypes) {
        List<WmsItemType> wmsItemTypeTreeList = buildItemTypeTree(wmsItemTypes);
        return wmsItemTypeTreeList.stream().map(TreeSelect::new).collect(Collectors.toList());
    }
}
