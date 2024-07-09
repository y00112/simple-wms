package com.liyuan.wms.wms.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.liyuan.wms.wms.domain.WmsShipmentOrder;
import com.liyuan.wms.wms.service.IWmsShipmentOrderService;
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
import com.liyuan.wms.common.utils.poi.ExcelUtil;
import com.liyuan.wms.common.core.page.TableDataInfo;

/**
 * 出库单Controller
 * 
 * @author zhaoyss
 * @date 2024-06-24
 */
@RestController
@RequestMapping("/wms/outOrder")
public class WmsShipmentOrderController extends BaseController
{
    @Autowired
    private IWmsShipmentOrderService wmsShipmentOrderService;

    /**
     * 查询出库单列表
     */
    @PreAuthorize("@ss.hasPermi('system:order:list')")
    @GetMapping("/list")
    public TableDataInfo list( WmsShipmentOrder wmsShipmentOrder)
    {
        startPage();
        List<WmsShipmentOrder> list = wmsShipmentOrderService.selectWmsShipmentOrderList(wmsShipmentOrder);
        return getDataTable(list);
    }

    /**
     * 导出出库单列表
     */
    @PreAuthorize("@ss.hasPermi('system:order:export')")
    @Log(title = "出库单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WmsShipmentOrder wmsShipmentOrder)
    {
        List<WmsShipmentOrder> list = wmsShipmentOrderService.selectWmsShipmentOrderList(wmsShipmentOrder);
        ExcelUtil<WmsShipmentOrder> util = new ExcelUtil<WmsShipmentOrder>(WmsShipmentOrder.class);
        util.exportExcel(response, list, "出库单数据");
    }

    /**
     * 获取出库单详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:order:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(wmsShipmentOrderService.selectWmsShipmentOrderById(id));
    }

    /**
     * 新增出库单
     */
    @PreAuthorize("@ss.hasPermi('system:order:add')")
    @Log(title = "出库单", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WmsShipmentOrder wmsShipmentOrder)
    {
        return toAjax(wmsShipmentOrderService.insertWmsShipmentOrder(wmsShipmentOrder));
    }

    /**
     * 修改出库单
     */
    @PreAuthorize("@ss.hasPermi('system:order:edit')")
    @Log(title = "出库单", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WmsShipmentOrder wmsShipmentOrder)
    {
        return toAjax(wmsShipmentOrderService.updateWmsShipmentOrder(wmsShipmentOrder));
    }

    /**
     * 删除出库单
     */
    @PreAuthorize("@ss.hasPermi('system:order:remove')")
    @Log(title = "出库单", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(wmsShipmentOrderService.deleteWmsShipmentOrderByIds(ids));
    }
}
