package com.liyuan.wms.wms.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
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
import com.liyuan.wms.wms.domain.WmsReceiptOrder;
import com.liyuan.wms.wms.service.IWmsReceiptOrderService;
import com.liyuan.wms.common.utils.poi.ExcelUtil;
import com.liyuan.wms.common.core.page.TableDataInfo;

/**
 * 入库单Controller
 * 
 * @author zhaoyss
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/wms/inOrder")
public class WmsReceiptOrderController extends BaseController
{
    @Autowired
    private IWmsReceiptOrderService wmsReceiptOrderService;

    /**
     * 查询入库单列表
     */
    @PreAuthorize("@ss.hasPermi('wms:inOrder:list')")
    @GetMapping("/list")
    public TableDataInfo list(WmsReceiptOrder wmsReceiptOrder)
    {
        startPage();
        List<WmsReceiptOrder> list = wmsReceiptOrderService.selectWmsReceiptOrderList(wmsReceiptOrder);
        return getDataTable(list);
    }

    /**
     * 导出入库单列表
     */
    @PreAuthorize("@ss.hasPermi('wms:inOrder:export')")
    @Log(title = "入库单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WmsReceiptOrder wmsReceiptOrder)
    {
        List<WmsReceiptOrder> list = wmsReceiptOrderService.selectWmsReceiptOrderList(wmsReceiptOrder);
        ExcelUtil<WmsReceiptOrder> util = new ExcelUtil<WmsReceiptOrder>(WmsReceiptOrder.class);
        util.exportExcel(response, list, "入库单数据");
    }

    /**
     * 获取入库单详细信息
     */
    @PreAuthorize("@ss.hasPermi('wms:inOrder:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(wmsReceiptOrderService.selectWmsReceiptOrderById(id));
    }

    /**
     * 新增入库单
     */
    @PreAuthorize("@ss.hasPermi('wms:inOrder:add')")
    @Log(title = "入库单", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WmsReceiptOrder wmsReceiptOrder)
    {
        return toAjax(wmsReceiptOrderService.insertWmsReceiptOrder(wmsReceiptOrder));
    }

    /**
     * 修改入库单
     */
    @PreAuthorize("@ss.hasPermi('wms:inOrder:edit')")
    @Log(title = "入库单", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WmsReceiptOrder wmsReceiptOrder)
    {
        return toAjax(wmsReceiptOrderService.updateWmsReceiptOrder(wmsReceiptOrder));
    }

    /**
     * 删除入库单
     */
    @PreAuthorize("@ss.hasPermi('wms:inOrder:remove')")
    @Log(title = "入库单", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(wmsReceiptOrderService.deleteWmsReceiptOrderByIds(ids));
    }
}
