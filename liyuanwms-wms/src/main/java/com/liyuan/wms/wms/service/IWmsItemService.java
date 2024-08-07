package com.liyuan.wms.wms.service;

import java.util.List;

import com.liyuan.wms.wms.domain.WmsItem;
import com.liyuan.wms.wms.vo.WmsItemCountVO;
import com.liyuan.wms.wms.vo.WmsItemVO;

/**
 * 资产Service接口
 * 
 * @author zhaoyss
 * @date 2024-04-09
 */
public interface IWmsItemService 
{
    /**
     * 查询资产
     * 
     * @param id 资产主键
     * @return 资产
     */
    public WmsItemVO selectWmsItemById(Long id);

    /**
     * 查询资产列表
     * 
     * @param wmsItem 资产
     * @return 资产集合
     */
    public List<WmsItemVO> selectWmsItemList(WmsItem wmsItem);

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
     * 批量删除资产
     * 
     * @param ids 需要删除的资产主键集合
     * @return 结果
     */
    public int deleteWmsItemByIds(Long[] ids);

    /**
     * 删除资产信息
     * 
     * @param id 资产主键
     * @return 结果
     */
    public int deleteWmsItemById(Long id);

    /**
     * 资产类型统计
     *
     * @return
     */
    List<WmsItemCountVO> count();
}
