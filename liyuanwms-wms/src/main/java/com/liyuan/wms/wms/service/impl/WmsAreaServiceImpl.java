package com.liyuan.wms.wms.service.impl;

import java.util.List;
import com.liyuan.wms.common.utils.DateUtils;
import com.liyuan.wms.wms.domain.WmsArea;
import com.liyuan.wms.wms.mapper.WmsAreaMapper;
import com.liyuan.wms.wms.service.IWmsAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 库区Service业务层处理
 * 
 * @author zhaoyss
 * @date 2024-04-07
 */
@Service
public class WmsAreaServiceImpl implements IWmsAreaService
{
    @Autowired
    private WmsAreaMapper wmsAreaMapper;

    /**
     * 查询库区
     * 
     * @param id 库区主键
     * @return 库区
     */
    @Override
    public WmsArea selectWmsAreaById(Long id)
    {
        return wmsAreaMapper.selectWmsAreaById(id);
    }

    /**
     * 查询库区列表
     * 
     * @param wmsArea 库区
     * @return 库区
     */
    @Override
    public List<WmsArea> selectWmsAreaList(WmsArea wmsArea)
    {
        return wmsAreaMapper.selectWmsAreaList(wmsArea);
    }

    /**
     * 新增库区
     * 
     * @param wmsArea 库区
     * @return 结果
     */
    @Override
    public int insertWmsArea(WmsArea wmsArea)
    {
        wmsArea.setCreateTime(DateUtils.getNowDate());
        return wmsAreaMapper.insertWmsArea(wmsArea);
    }

    /**
     * 修改库区
     * 
     * @param wmsArea 库区
     * @return 结果
     */
    @Override
    public int updateWmsArea(WmsArea wmsArea)
    {
        wmsArea.setUpdateTime(DateUtils.getNowDate());
        return wmsAreaMapper.updateWmsArea(wmsArea);
    }

    /**
     * 批量删除库区
     * 
     * @param ids 需要删除的库区主键
     * @return 结果
     */
    @Override
    public int deleteWmsAreaByIds(Long[] ids)
    {
        return wmsAreaMapper.deleteWmsAreaByIds(ids);
    }

    /**
     * 删除库区信息
     * 
     * @param id 库区主键
     * @return 结果
     */
    @Override
    public int deleteWmsAreaById(Long id)
    {
        return wmsAreaMapper.deleteWmsAreaById(id);
    }
}
