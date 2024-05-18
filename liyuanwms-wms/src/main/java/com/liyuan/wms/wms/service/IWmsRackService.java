package com.liyuan.wms.wms.service;

import com.liyuan.wms.wms.domain.WmsRack;

import java.util.List;

/**
 * 货架Service接口
 * 
 * @author zhaoyss
 * @date 2024-04-07
 */
public interface IWmsRackService 
{
    /**
     * 查询货架
     * 
     * @param id 货架主键
     * @return 货架
     */
    public WmsRack selectWmsRackById(Long id);

    /**
     * 查询货架列表
     * 
     * @param wmsRack 货架
     * @return 货架集合
     */
    public List<WmsRack> selectWmsRackList(WmsRack wmsRack);

    /**
     * 新增货架
     * 
     * @param wmsRack 货架
     * @return 结果
     */
    public int insertWmsRack(WmsRack wmsRack);

    /**
     * 修改货架
     * 
     * @param wmsRack 货架
     * @return 结果
     */
    public int updateWmsRack(WmsRack wmsRack);

    /**
     * 批量删除货架
     * 
     * @param ids 需要删除的货架主键集合
     * @return 结果
     */
    public int deleteWmsRackByIds(Long[] ids);

    /**
     * 删除货架信息
     * 
     * @param id 货架主键
     * @return 结果
     */
    public int deleteWmsRackById(Long id);
}
