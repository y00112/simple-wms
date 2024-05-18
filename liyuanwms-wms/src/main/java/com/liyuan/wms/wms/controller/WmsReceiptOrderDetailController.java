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
import com.liyuan.wms.wms.domain.WmsReceiptOrderDetail;
import com.liyuan.wms.wms.service.IWmsReceiptOrderDetailService;
import com.liyuan.wms.common.utils.poi.ExcelUtil;
import com.liyuan.wms.common.core.page.TableDataInfo;

/**
 * 入库单详情Controller
 * 
 * @author zhaoyss
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/wms/inDetail")
public class WmsReceiptOrderDetailController extends BaseController
{
    @Autowired
    private IWmsReceiptOrderDetailService wmsReceiptOrderDetailService;

    /**
     * 查询入库单详情列表
     */
    @PreAuthorize("@ss.hasPermi('wms:inDetail:list')")
    @GetMapping("/list")
    public TableDataInfo list(WmsReceiptOrderDetail wmsReceiptOrderDetail)
    {
        startPage();
        List<WmsReceiptOrderDetail> list = wmsReceiptOrderDetailService.selectWmsReceiptOrderDetailList(wmsReceiptOrderDetail);
        return getDataTable(list);
    }

    /**
     * 导出入库单详情列表
     */
    @PreAuthorize("@ss.hasPermi('wms:inDetail:export')")
    @Log(title = "入库单详情", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WmsReceiptOrderDetail wmsReceiptOrderDetail)
    {
        List<WmsReceiptOrderDetail> list = wmsReceiptOrderDetailService.selectWmsReceiptOrderDetailList(wmsReceiptOrderDetail);
        ExcelUtil<WmsReceiptOrderDetail> util = new ExcelUtil<WmsReceiptOrderDetail>(WmsReceiptOrderDetail.class);
        util.exportExcel(response, list, "入库单详情数据");
    }

    /**
     * 获取入库单详情详细信息
     */
    @PreAuthorize("@ss.hasPermi('wms:inDetail:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(wmsReceiptOrderDetailService.selectWmsReceiptOrderDetailById(id));
    }

    /**
     * 新增入库单详情
     */
    @PreAuthorize("@ss.hasPermi('wms:inDetail:add')")
    @Log(title = "入库单详情", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WmsReceiptOrderDetail wmsReceiptOrderDetail)
    {
        return toAjax(wmsReceiptOrderDetailService.insertWmsReceiptOrderDetail(wmsReceiptOrderDetail));
    }

    /**
     * 修改入库单详情
     */
    @PreAuthorize("@ss.hasPermi('wms:inDetail:edit')")
    @Log(title = "入库单详情", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WmsReceiptOrderDetail wmsReceiptOrderDetail)
    {
        return toAjax(wmsReceiptOrderDetailService.updateWmsReceiptOrderDetail(wmsReceiptOrderDetail));
    }

    /**
     * 删除入库单详情
     */
    @PreAuthorize("@ss.hasPermi('wms:inDetail:remove')")
    @Log(title = "入库单详情", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(wmsReceiptOrderDetailService.deleteWmsReceiptOrderDetailByIds(ids));
    }
}
