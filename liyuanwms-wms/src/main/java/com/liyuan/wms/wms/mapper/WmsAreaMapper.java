package com.liyuan.wms.wms.mapper;

import com.liyuan.wms.wms.domain.WmsArea;

import java.util.List;

/**
 * 库区Mapper接口
 * 
 * @author zhaoyss
 * @date 2024-04-07
 */
public interface WmsAreaMapper 
{
    /**
     * 查询库区
     * 
     * @param id 库区主键
     * @return 库区
     */
    public WmsArea selectWmsAreaById(Long id);

    /**
     * 查询库区列表
     * 
     * @param wmsArea 库区
     * @return 库区集合
     */
    public List<WmsArea> selectWmsAreaList(WmsArea wmsArea);

    /**
     * 新增库区
     * 
     * @param wmsArea 库区
     * @return 结果
     */
    public int insertWmsArea(WmsArea wmsArea);

    /**
     * 修改库区
     * 
     * @param wmsArea 库区
     * @return 结果
     */
    public int updateWmsArea(WmsArea wmsArea);

    /**
     * 删除库区
     * 
     * @param id 库区主键
     * @return 结果
     */
    public int deleteWmsAreaById(Long id);

    /**
     * 批量删除库区
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWmsAreaByIds(Long[] ids);
}
