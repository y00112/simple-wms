package com.liyuan.wms.wms.service.impl;

import java.util.List;
import com.liyuan.wms.common.utils.DateUtils;
import com.liyuan.wms.wms.domain.WmsRack;
import com.liyuan.wms.wms.mapper.WmsRackMapper;
import com.liyuan.wms.wms.service.IWmsRackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
/**
 * 货架Service业务层处理
 * 
 * @author zhaoyss
 * @date 2024-04-07
 */
@Service
public class WmsRackServiceImpl implements IWmsRackService
{
    @Autowired
    private WmsRackMapper wmsRackMapper;

    /**
     * 查询货架
     * 
     * @param id 货架主键
     * @return 货架
     */
    @Override
    public WmsRack selectWmsRackById(Long id)
    {
        return wmsRackMapper.selectWmsRackById(id);
    }

    /**
     * 查询货架列表
     * 
     * @param wmsRack 货架
     * @return 货架
     */
    @Override
    public List<WmsRack> selectWmsRackList(WmsRack wmsRack)
    {
        return wmsRackMapper.selectWmsRackList(wmsRack);
    }

    /**
     * 新增货架
     * 
     * @param wmsRack 货架
     * @return 结果
     */
    @Override
    public int insertWmsRack(WmsRack wmsRack)
    {
        wmsRack.setCreateTime(DateUtils.getNowDate());
        return wmsRackMapper.insertWmsRack(wmsRack);
    }

    /**
     * 修改货架
     * 
     * @param wmsRack 货架
     * @return 结果
     */
    @Override
    public int updateWmsRack(WmsRack wmsRack)
    {
        wmsRack.setUpdateTime(DateUtils.getNowDate());
        return wmsRackMapper.updateWmsRack(wmsRack);
    }

    /**
     * 批量删除货架
     * 
     * @param ids 需要删除的货架主键
     * @return 结果
     */
    @Override
    public int deleteWmsRackByIds(Long[] ids)
    {
        return wmsRackMapper.deleteWmsRackByIds(ids);
    }

    /**
     * 删除货架信息
     * 
     * @param id 货架主键
     * @return 结果
     */
    @Override
    public int deleteWmsRackById(Long id)
    {
        return wmsRackMapper.deleteWmsRackById(id);
    }
}
