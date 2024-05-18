package com.liyuan.wms.wms.mapper;

import java.util.List;

import com.liyuan.wms.wms.controller.vo.WmsItemVO;
import com.liyuan.wms.wms.domain.WmsItem;

/**
 * 资产Mapper接口
 * 
 * @author zhaoyss
 * @date 2024-04-09
 */
public interface WmsItemMapper 
{
    /**
     * 查询资产
     * 
     * @param id 资产主键
     * @return 资产
     */
    public WmsItem selectWmsItemById(Long id);

    /**
     * 查询资产列表
     * 
     * @param wmsItem 资产
     * @return 资产集合
     */
    public List<WmsItem> selectWmsItemList(WmsItem wmsItem);

    /**
     * 新增资产
     * 
     * @param wmsItem 资产
     * @return 结果
     */
    public int insertWmsItem(WmsItem wmsItem);

    /**
     * 修改资产
     * 
     * @param wmsItem 资产
     * @return 结果
     */
    public int updateWmsItem(WmsItem wmsItem);

    /**
     * 删除资产
     * 
     * @param id 资产主键
     * @return 结果
     */
    public int deleteWmsItemById(Long id);

    /**
     * 批量删除资产
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWmsItemByIds(Long[] ids);
}
