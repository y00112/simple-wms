package com.liyuan.wms.wms.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.liyuan.wms.wms.controller.vo.WmsItemVO;
import com.liyuan.wms.wms.service.IWmsItemTypeService;
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
import com.liyuan.wms.wms.domain.WmsItem;
import com.liyuan.wms.wms.service.IWmsItemService;
import com.liyuan.wms.common.utils.poi.ExcelUtil;
import com.liyuan.wms.common.core.page.TableDataInfo;

/**
 * 资产Controller
 * 
 * @author zhaoyss
 * @date 2024-04-09
 */
@RestController
@RequestMapping("/wms/item")
public class WmsItemController extends BaseController
{
    @Autowired
    private IWmsItemService wmsItemService;

    /**
     * 查询资产列表
     */
    @PreAuthorize("@ss.hasPermi('wms:item:list')")
    @GetMapping("/list")
    public TableDataInfo list(WmsItem wmsItem)
    {
        startPage();
        List<WmsItemVO> list = wmsItemService.selectWmsItemList(wmsItem);
        return getDataTable(list);
    }

    /**
     * 导出资产列表
     */
    @PreAuthorize("@ss.hasPermi('wms:item:export')")
    @Log(title = "资产", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WmsItem wmsItem)
    {
        List<WmsItemVO> list = wmsItemService.selectWmsItemList(wmsItem);
        ExcelUtil<WmsItemVO> util = new ExcelUtil<WmsItemVO>(WmsItemVO.class);
        util.exportExcel(response, list, "资产数据");
    }

    /**
     * 获取资产详细信息
     */
    @PreAuthorize("@ss.hasPermi('wms:item:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(wmsItemService.selectWmsItemById(id));
    }

    /**
     * 新增资产
     */
    @PreAuthorize("@ss.hasPermi('wms:item:add')")
    @Log(title = "资产", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WmsItem wmsItem)
    {
        return toAjax(wmsItemService.insertWmsItem(wmsItem));
    }

    /**
     * 修改资产
     */
    @PreAuthorize("@ss.hasPermi('wms:item:edit')")
    @Log(title = "资产", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WmsItem wmsItem)
    {
        return toAjax(wmsItemService.updateWmsItem(wmsItem));
    }

    /**
     * 删除资产
     */
    @PreAuthorize("@ss.hasPermi('wms:item:remove')")
    @Log(title = "资产", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(wmsItemService.deleteWmsItemByIds(ids));
    }
}
