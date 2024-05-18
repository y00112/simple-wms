package com.liyuan.wms.wms.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.liyuan.wms.wms.domain.WmsArea;
import com.liyuan.wms.wms.service.IWmsAreaService;
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
 * 库区Controller
 * 
 * @author zhaoyss
 * @date 2024-04-07
 */
@RestController
@RequestMapping("/system/area")
public class WmsAreaController extends BaseController
{
    @Autowired
    private IWmsAreaService wmsAreaService;

    /**
     * 查询库区列表
     */
    @PreAuthorize("@ss.hasPermi('wms:area:list')")
    @GetMapping("/list")
    public TableDataInfo list(WmsArea wmsArea)
    {
        startPage();
        List<WmsArea> list = wmsAreaService.selectWmsAreaList(wmsArea);
        return getDataTable(list);
    }

    /**
     * 导出库区列表
     */
    @PreAuthorize("@ss.hasPermi('wms:area:export')")
    @Log(title = "库区", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WmsArea wmsArea)
    {
        List<WmsArea> list = wmsAreaService.selectWmsAreaList(wmsArea);
        ExcelUtil<WmsArea> util = new ExcelUtil<WmsArea>(WmsArea.class);
        util.exportExcel(response, list, "库区数据");
    }

    /**
     * 获取库区详细信息
     */
    @PreAuthorize("@ss.hasPermi('wms:area:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(wmsAreaService.selectWmsAreaById(id));
    }

    /**
     * 新增库区
     */
    @PreAuthorize("@ss.hasPermi('wms:area:add')")
    @Log(title = "库区", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WmsArea wmsArea)
    {
        return toAjax(wmsAreaService.insertWmsArea(wmsArea));
    }

    /**
     * 修改库区
     */
    @PreAuthorize("@ss.hasPermi('wms:area:edit')")
    @Log(title = "库区", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WmsArea wmsArea)
    {
        return toAjax(wmsAreaService.updateWmsArea(wmsArea));
    }

    /**
     * 删除库区
     */
    @PreAuthorize("@ss.hasPermi('wms:area:remove')")
    @Log(title = "库区", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(wmsAreaService.deleteWmsAreaByIds(ids));
    }
}
