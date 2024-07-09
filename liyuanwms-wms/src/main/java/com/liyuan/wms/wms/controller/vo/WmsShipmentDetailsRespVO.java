package com.liyuan.wms.wms.controller.vo;

import com.liyuan.wms.wms.domain.WmsShipmentOrderDetail;

import java.util.List;

public class WmsShipmentDetailsRespVO extends WmsShipmentOrderDetail {

    /** 资产名称 */
    private String itemName;

    /** 资产编号 */
    private String itemNo;

    /**
     * 所属货架名称
     */
    private List<Long> place;

    /**
     * 现有库存
     */
    private Long quantity;

    /**
     * 仓库
     */
    private Long warehouseId;

    /**
     * 库区
     */
    private Long areaId;

    /**
     * 货架
     */
    private Long rackId;

    public WmsShipmentDetailsRespVO() {
    }

    public WmsShipmentDetailsRespVO(String itemName, String itemNo, List<Long> place, Long quantity, Long warehouseId, Long areaId, Long rackId) {
        this.itemName = itemName;
        this.itemNo = itemNo;
        this.place = place;
        this.quantity = quantity;
        this.warehouseId = warehouseId;
        this.areaId = areaId;
        this.rackId = rackId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getItemNo() {
        return itemNo;
    }

    public void setItemNo(String itemNo) {
        this.itemNo = itemNo;
    }

    public List<Long> getPlace() {
        return place;
    }

    public void setPlace(List<Long> place) {
        this.place = place;
    }

    public Long getQuantity() {
        return quantity;
    }

    public void setQuantity(Long quantity) {
        this.quantity = quantity;
    }

    public Long getWarehouseId() {
        return warehouseId;
    }

    public void setWarehouseId(Long warehouseId) {
        this.warehouseId = warehouseId;
    }

    public Long getAreaId() {
        return areaId;
    }

    public void setAreaId(Long areaId) {
        this.areaId = areaId;
    }

    public Long getRackId() {
        return rackId;
    }

    public void setRackId(Long rackId) {
        this.rackId = rackId;
    }
}
