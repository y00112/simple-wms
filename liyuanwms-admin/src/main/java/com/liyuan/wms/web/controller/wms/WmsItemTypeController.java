package com.liyuan.wms.web.controller.wms;

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
import com.liyuan.wms.common.core.domain.entity.WmsItemType;
import com.liyuan.wms.wms.service.IWmsItemTypeService;
import com.liyuan.wms.common.utils.poi.ExcelUtil;
import com.liyuan.wms.common.core.page.TableDataInfo;

/**
 * 资产类型Controller
 * 
 * @author zhaoyss
 * @date 2024-04-08
 */
@RestController
@RequestMapping("/wms/itemType")
public class WmsItemTypeController extends BaseController
{
    @Autowired
    private IWmsItemTypeService wmsItemTypeService;

    /**
     * 查询资产类型列表
     */
    @PreAuthorize("@ss.hasPermi('wms:itemType:list')")
    @GetMapping("/list")
    public TableDataInfo list(WmsItemType wmsItemType)
    {
        startPage();
        List<WmsItemType> list = wmsItemTypeService.selectWmsItemTypeList(wmsItemType);
        return getDataTable(list);
    }

    /**
     * 导出资产类型列表
     */
    @PreAuthorize("@ss.hasPermi('wms:itemType:export')")
    @Log(title = "资产类型", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WmsItemType wmsItemType)
    {
        List<WmsItemType> list = wmsItemTypeService.selectWmsItemTypeList(wmsItemType);
        ExcelUtil<WmsItemType> util = new ExcelUtil<WmsItemType>(WmsItemType.class);
        util.exportExcel(response, list, "资产类型数据");
    }

    /**
     * 获取资产类型详细信息
     */
    @PreAuthorize("@ss.hasPermi('wms:itemType:query')")
    @GetMapping(value = "/{itemTypeId}")
    public AjaxResult getInfo(@PathVariable("itemTypeId") Long itemTypeId)
    {
        return success(wmsItemTypeService.selectWmsItemTypeByItemTypeId(itemTypeId));
    }

    /**
     * 新增资产类型
     */
    @PreAuthorize("@ss.hasPermi('wms:itemType:add')")
    @Log(title = "资产类型", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WmsItemType wmsItemType)
    {
        return toAjax(wmsItemTypeService.insertWmsItemType(wmsItemType));
    }

    /**
     * 修改资产类型
     */
    @PreAuthorize("@ss.hasPermi('wms:itemType:edit')")
    @Log(title = "资产类型", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WmsItemType wmsItemType)
    {
        return toAjax(wmsItemTypeService.updateWmsItemType(wmsItemType));
    }

    /**
     * 删除资产类型
     */
    @PreAuthorize("@ss.hasPermi('wms:itemType:remove')")
    @Log(title = "资产类型", businessType = BusinessType.DELETE)
	@DeleteMapping("/{itemTypeIds}")
    public AjaxResult remove(@PathVariable Long[] itemTypeIds)
    {
        return toAjax(wmsItemTypeService.deleteWmsItemTypeByItemTypeIds(itemTypeIds));
    }

    /**
     * 获取类别树列表
     */
    @PreAuthorize("@ss.hasPermi('wms:itemType:list')")
    @GetMapping("/itemTypeTree")
    public AjaxResult itemTypeTree(WmsItemType wmsItemType)
    {
        return success(wmsItemTypeService.selectItemTypeTreeList(wmsItemType));
    }
}
