package com.liyuan.wms.wms.controller.vo;

import com.liyuan.wms.common.annotation.Excel;
import com.liyuan.wms.wms.domain.WmsReceiptOrderDetail;

import java.util.List;

public class WmsReceiptOrderDetailRespVO extends WmsReceiptOrderDetail {

    /** 资产名称 */
    private String itemName;

    /** 资产编号 */
    private String itemNo;

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


    /**
     * 所属货架名称
     */
    private List<Long> place;

    /**
     * 现有库存
     */
    private Long quantity;


    public WmsReceiptOrderDetailRespVO() {
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

    public WmsReceiptOrderDetailRespVO(String itemName, String itemNo, Long warehouseId, Long areaId, Long rackId, List<Long> place, Long quantity) {
        this.itemName = itemName;
        this.itemNo = itemNo;
        this.warehouseId = warehouseId;
        this.areaId = areaId;
        this.rackId = rackId;
        this.place = place;
        this.quantity = quantity;
    }
}
