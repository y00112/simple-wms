package com.liyuan.wms.wms.controller.vo;

import com.liyuan.wms.wms.domain.WmsItem;

import java.util.ArrayList;
import java.util.List;

public class WmsItemVO extends WmsItem {


    /**
     * 所属仓库名称
     */
    private String warehouseName;

    /**
     * 所属库区名称
     */
    private String areaName;

    /**
     * 所属货架名称
     */
    private String rackName;


    /**
     * 所属货架名称
     */
    private List<Long> place;

    /**
     * 资产类型名称
     */
    private String itemTypeName;

    public WmsItemVO() {
    }

    public WmsItemVO(String warehouseName, String areaName, String rackName, List<Long> place, String itemTypeName) {
        this.warehouseName = warehouseName;
        this.areaName = areaName;
        this.rackName = rackName;
        this.place = place;
        this.itemTypeName = itemTypeName;
    }

    public String getItemTypeName() {
        return itemTypeName;
    }

    public void setItemTypeName(String itemTypeName) {
        this.itemTypeName = itemTypeName;
    }

    public String getRackName() {
        return rackName;
    }

    public void setRackName(String rackName) {
        this.rackName = rackName;
    }

    public String getWarehouseName() {
        return warehouseName;
    }

    public void setWarehouseName(String warehouseName) {
        this.warehouseName = warehouseName;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public List<Long> getPlace() {
        return place;
    }

    public void setPlace(List<Long> place) {
        this.place = place;
    }

}
