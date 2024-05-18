package com.liyuan.wms.wms.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.liyuan.wms.wms.domain.WmsRack;
import com.liyuan.wms.wms.service.IWmsRackService;
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
 * 货架Controller
 * 
 * @author zhaoyss
 * @date 2024-04-07
 */
@RestController
@RequestMapping("/system/rack")
public class WmsRackController extends BaseController
{
    @Autowired
    private IWmsRackService wmsRackService;

    /**
     * 查询货架列表
     */
    @PreAuthorize("@ss.hasPermi('wms:rack:list')")
    @GetMapping("/list")
    public TableDataInfo list(WmsRack wmsRack)
    {
        startPage();
        List<WmsRack> list = wmsRackService.selectWmsRackList(wmsRack);
        return getDataTable(list);
    }

    /**
     * 导出货架列表
     */
    @PreAuthorize("@ss.hasPermi('wms:rack:export')")
    @Log(title = "货架", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WmsRack wmsRack)
    {
        List<WmsRack> list = wmsRackService.selectWmsRackList(wmsRack);
        ExcelUtil<WmsRack> util = new ExcelUtil<WmsRack>(WmsRack.class);
        util.exportExcel(response, list, "货架数据");
    }

    /**
     * 获取货架详细信息
     */
    @PreAuthorize("@ss.hasPermi('wms:rack:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(wmsRackService.selectWmsRackById(id));
    }

    /**
     * 新增货架
     */
    @PreAuthorize("@ss.hasPermi('wms:rack:add')")
    @Log(title = "货架", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WmsRack wmsRack)
    {
        return toAjax(wmsRackService.insertWmsRack(wmsRack));
    }

    /**
     * 修改货架
     */
    @PreAuthorize("@ss.hasPermi('wms:rack:edit')")
    @Log(title = "货架", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WmsRack wmsRack)
    {
        return toAjax(wmsRackService.updateWmsRack(wmsRack));
    }

    /**
     * 删除货架
     */
    @PreAuthorize("@ss.hasPermi('wms:rack:remove')")
    @Log(title = "货架", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(wmsRackService.deleteWmsRackByIds(ids));
    }
}
