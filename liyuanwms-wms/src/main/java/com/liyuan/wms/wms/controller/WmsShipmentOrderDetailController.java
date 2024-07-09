package com.liyuan.wms.wms.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.liyuan.wms.wms.controller.vo.WmsShipmentDetailsRespVO;
import com.liyuan.wms.wms.controller.vo.WmsShipmentOrderDetailsVO;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.liyuan.wms.common.annotation.Log;
import com.liyuan.wms.common.core.controller.BaseController;
import com.liyuan.wms.common.core.domain.AjaxResult;
import com.liyuan.wms.common.enums.BusinessType;
import com.liyuan.wms.wms.domain.WmsShipmentOrderDetail;
import com.liyuan.wms.wms.service.IWmsShipmentOrderDetailService;
import com.liyuan.wms.common.utils.poi.ExcelUtil;
import com.liyuan.wms.common.core.page.TableDataInfo;

/**
 * 出库单详情Controller
 * 
 * @author zhaoyss
 * @date 2024-06-24
 */
@RestController
@RequestMapping("/wms/outDetail")
public class WmsShipmentOrderDetailController extends BaseController
{
    @Autowired
    private IWmsShipmentOrderDetailService wmsShipmentOrderDetailService;

    /**
     * 查询出库单详情
     */
    @PreAuthorize("@ss.hasPermi('wms:shipmentDetail:list')")
    @GetMapping("/list")
    public TableDataInfo list(WmsShipmentOrderDetail wmsShipmentOrderDetail)
    {
        startPage();
        List<WmsShipmentDetailsRespVO> list = wmsShipmentOrderDetailService.selectWmsShipmentOrderDetailList2(wmsShipmentOrderDetail);
        return getDataTable(list);
    }

    /**
     * 批量创建出库单
     */
    @PreAuthorize("@ss.hasPermi('wms:shipmentDetail:add')")
    @PostMapping("/adds")
    public AjaxResult adds(@RequestBody WmsShipmentOrderDetailsVO vo){
        return toAjax(wmsShipmentOrderDetailService.adds(vo));
    }

    /**
     * 批量修改出库单详情
     */
    @PreAuthorize("@ss.hasPermi('wms:shipmentDetail:edit')")
    @PostMapping("/edits")
    public AjaxResult edits(@RequestBody WmsShipmentOrderDetailsVO vo){
        return toAjax(wmsShipmentOrderDetailService.edits(vo));
    }

    // /**
    //  * 查询出库单详情列表
    //  */
    // @PreAuthorize("@ss.hasPermi('wms:shipmentDetail:list')")
    // @GetMapping("/list")
    // public TableDataInfo list(WmsShipmentOrderDetail wmsShipmentOrderDetail)
    // {
    //     startPage();
    //     List<WmsShipmentOrderDetail> list = wmsShipmentOrderDetailService.selectWmsShipmentOrderDetailList(wmsShipmentOrderDetail);
    //     return getDataTable(list);
    // }

    /**
     * 导出出库单详情列表
     */
    @PreAuthorize("@ss.hasPermi('wms:shipmentDetail:export')")
    @Log(title = "出库单详情", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WmsShipmentOrderDetail wmsShipmentOrderDetail)
    {
        List<WmsShipmentOrderDetail> list = wmsShipmentOrderDetailService.selectWmsShipmentOrderDetailList(wmsShipmentOrderDetail);
        ExcelUtil<WmsShipmentOrderDetail> util = new ExcelUtil<WmsShipmentOrderDetail>(WmsShipmentOrderDetail.class);
        util.exportExcel(response, list, "出库单详情数据");
    }

    /**
     * 获取出库单详情详细信息
     */
    @PreAuthorize("@ss.hasPermi('wms:shipmentDetail:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(wmsShipmentOrderDetailService.selectWmsShipmentOrderDetailById(id));
    }

    /**
     * 新增出库单详情
     */
    @PreAuthorize("@ss.hasPermi('wms:shipmentDetail:add')")
    @Log(title = "出库单详情", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WmsShipmentOrderDetail wmsShipmentOrderDetail)
    {
        return toAjax(wmsShipmentOrderDetailService.insertWmsShipmentOrderDetail(wmsShipmentOrderDetail));
    }

    /**
     * 修改出库单详情
     */
    @PreAuthorize("@ss.hasPermi('wms:shipmentDetail:edit')")
    @Log(title = "出库单详情", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WmsShipmentOrderDetail wmsShipmentOrderDetail)
    {
        return toAjax(wmsShipmentOrderDetailService.updateWmsShipmentOrderDetail(wmsShipmentOrderDetail));
    }

    /**
     * 删除出库单详情
     */
    @PreAuthorize("@ss.hasPermi('wms:shipmentDetail:remove')")
    @Log(title = "出库单详情", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(wmsShipmentOrderDetailService.deleteWmsShipmentOrderDetailByIds(ids));
    }
}
