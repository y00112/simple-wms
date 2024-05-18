package com.liyuan.wms.wms.service.impl;

import java.util.List;
import com.liyuan.wms.common.utils.DateUtils;
import com.liyuan.wms.wms.domain.WmsWarehouse;
import com.liyuan.wms.wms.mapper.WmsWarehouseMapper;
import com.liyuan.wms.wms.service.IWmsWarehouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 仓库Service业务层处理
 * 
 * @author zhaoyss
 * @date 2024-04-07
 */
@Service
public class WmsWarehouseServiceImpl implements IWmsWarehouseService
{
    @Autowired
    private WmsWarehouseMapper wmsWarehouseMapper;

    /**
     * 查询仓库
     * 
     * @param id 仓库主键
     * @return 仓库
     */
    @Override
    public WmsWarehouse selectWmsWarehouseById(Long id)
    {
        return wmsWarehouseMapper.selectWmsWarehouseById(id);
    }

    /**
     * 查询仓库列表
     * 
     * @param wmsWarehouse 仓库
     * @return 仓库
     */
    @Override
    public List<WmsWarehouse> selectWmsWarehouseList(WmsWarehouse wmsWarehouse)
    {
        return wmsWarehouseMapper.selectWmsWarehouseList(wmsWarehouse);
    }

    /**
     * 新增仓库
     * 
     * @param wmsWarehouse 仓库
     * @return 结果
     */
    @Override
    public int insertWmsWarehouse(WmsWarehouse wmsWarehouse)
    {
        wmsWarehouse.setCreateTime(DateUtils.getNowDate());
        return wmsWarehouseMapper.insertWmsWarehouse(wmsWarehouse);
    }

    /**
     * 修改仓库
     * 
     * @param wmsWarehouse 仓库
     * @return 结果
     */
    @Override
    public int updateWmsWarehouse(WmsWarehouse wmsWarehouse)
    {
        wmsWarehouse.setUpdateTime(DateUtils.getNowDate());
        return wmsWarehouseMapper.updateWmsWarehouse(wmsWarehouse);
    }

    /**
     * 批量删除仓库
     * 
     * @param ids 需要删除的仓库主键
     * @return 结果
     */
    @Override
    public int deleteWmsWarehouseByIds(Long[] ids)
    {
        return wmsWarehouseMapper.deleteWmsWarehouseByIds(ids);
    }

    /**
     * 删除仓库信息
     * 
     * @param id 仓库主键
     * @return 结果
     */
    @Override
    public int deleteWmsWarehouseById(Long id)
    {
        return wmsWarehouseMapper.deleteWmsWarehouseById(id);
    }
}
