package com.liyuan.wms.wms.mapper;

import java.util.List;
import com.liyuan.wms.common.core.domain.entity.WmsItemType;

/**
 * 资产类型Mapper接口
 * 
 * @author zhaoyss
 * @date 2024-04-08
 */
public interface WmsItemTypeMapper 
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
     * 删除资产类型
     * 
     * @param itemTypeId 资产类型主键
     * @return 结果
     */
    public int deleteWmsItemTypeByItemTypeId(Long itemTypeId);

    /**
     * 批量删除资产类型
     * 
     * @param itemTypeIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWmsItemTypeByItemTypeIds(Long[] itemTypeIds);
}
