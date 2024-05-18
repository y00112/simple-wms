package com.liyuan.wms.wms.service;

import java.util.List;

import com.liyuan.wms.common.core.domain.TreeSelect;
import com.liyuan.wms.common.core.domain.entity.WmsItemType;

/**
 * 资产类型Service接口
 * 
 * @author zhaoyss
 * @date 2024-04-08
 */
public interface IWmsItemTypeService 
{
    /**
     * 查询资产类型
     * 
     * @param itemTypeId 资产类型主键
     * @return 资产类型
     */
    public WmsItemType selectWmsItemTypeByItemTypeId(Long itemTypeId);

    /**
     * 查询资产类型列表
     * 
     * @param wmsItemType 资产类型
     * @return 资产类型集合
     */
    public List<WmsItemType> selectWmsItemTypeList(WmsItemType wmsItemType);

    /**
     * 新增资产类型
     * 
     * @param wmsItemType 资产类型
     * @return 结果
     */
    public int insertWmsItemType(WmsItemType wmsItemType);

    /**
     * 修改资产类型
     * 
     * @param wmsItemType 资产类型
     * @return 结果
     */
    public int updateWmsItemType(WmsItemType wmsItemType);

    /**
     * 批量删除资产类型
     * 
     * @param itemTypeIds 需要删除的资产类型主键集合
     * @return 结果
     */
    public int deleteWmsItemTypeByItemTypeIds(Long[] itemTypeIds);

    /**
     * 删除资产类型信息
     * 
     * @param itemTypeId 资产类型主键
     * @return 结果
     */
    public int deleteWmsItemTypeByItemTypeId(Long itemTypeId);

    /**
     * 查询系统类别树结构信息
     *
     * @param wmsItemType 系统类别信息
     * @return 系统类别树细信息集合
     */
    List<TreeSelect> selectItemTypeTreeList(WmsItemType wmsItemType);

    /**
     * 构建前端所需要树结构
     *
     * @param wmsItemTypes 类别树类别
     * @return 树结构列表
     */
    List<WmsItemType> buildItemTypeTree(List<WmsItemType> wmsItemTypes);

    /**
     * 构建前端所需要的下拉树结构
     *
     * @param wmsItemTypes 类别列表
     * @return 下拉树结构列表
     */
    List<TreeSelect> buildItemTypeTreeSelect(List<WmsItemType> wmsItemTypes);
}
