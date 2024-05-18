package com.liyuan.wms.wms.mapper;

import java.util.List;
import com.liyuan.wms.wms.domain.WmsReceiptOrderDetail;

/**
 * 入库单详情Mapper接口
 * 
 * @author zhaoyss
 * @date 2024-04-28
 */
public interface WmsReceiptOrderDetailMapper 
{
    /**
     * 查询入库单详情
     * 
     * @param id 入库单详情主键
     * @return 入库单详情
     */
    public WmsReceiptOrderDetail selectWmsReceiptOrderDetailById(Long id);

    /**
     * 查询入库单详情列表
     * 
     * @param wmsReceiptOrderDetail 入库单详情
     * @return 入库单详情集合
     */
    public List<WmsReceiptOrderDetail> selectWmsReceiptOrderDetailList(WmsReceiptOrderDetail wmsReceiptOrderDetail);

    /**
     * 新增入库单详情
     * 
     * @param wmsReceiptOrderDetail 入库单详情
     * @return 结果
     */
    public int insertWmsReceiptOrderDetail(WmsReceiptOrderDetail wmsReceiptOrderDetail);

    /**
     * 修改入库单详情
     * 
     * @param wmsReceiptOrderDetail 入库单详情
     * @return 结果
     */
    public int updateWmsReceiptOrderDetail(WmsReceiptOrderDetail wmsReceiptOrderDetail);

    /**
     * 删除入库单详情
     * 
     * @param id 入库单详情主键
     * @return 结果
     */
    public int deleteWmsReceiptOrderDetailById(Long id);

    /**
     * 批量删除入库单详情
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWmsReceiptOrderDetailByIds(Long[] ids);
}
