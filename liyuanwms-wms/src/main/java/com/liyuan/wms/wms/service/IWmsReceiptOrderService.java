package com.liyuan.wms.wms.service;

import java.util.List;
import com.liyuan.wms.wms.domain.WmsReceiptOrder;

/**
 * 入库单Service接口
 * 
 * @author zhaoyss
 * @date 2024-04-28
 */
public interface IWmsReceiptOrderService 
{
    /**
     * 查询入库单
     * 
     * @param id 入库单主键
     * @return 入库单
     */
    public WmsReceiptOrder selectWmsReceiptOrderById(Long id);

    /**
     * 查询入库单列表
     * 
     * @param wmsReceiptOrder 入库单
     * @return 入库单集合
     */
    public List<WmsReceiptOrder> selectWmsReceiptOrderList(WmsReceiptOrder wmsReceiptOrder);

    /**
     * 新增入库单
     * 
     * @param wmsReceiptOrder 入库单
     * @return 结果
     */
    public int insertWmsReceiptOrder(WmsReceiptOrder wmsReceiptOrder);

    /**
     * 修改入库单
     * 
     * @param wmsReceiptOrder 入库单
     * @return 结果
     */
    public int updateWmsReceiptOrder(WmsReceiptOrder wmsReceiptOrder);

    /**
     * 批量删除入库单
     * 
     * @param ids 需要删除的入库单主键集合
     * @return 结果
     */
    public int deleteWmsReceiptOrderByIds(Long[] ids);

    /**
     * 删除入库单信息
     * 
     * @param id 入库单主键
     * @return 结果
     */
    public int deleteWmsReceiptOrderById(Long id);
}
