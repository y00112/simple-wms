package com.liyuan.wms.wms.controller.vo;

import com.liyuan.wms.wms.domain.WmsReceiptOrderDetail;

import java.util.List;

public class WmsReceiptOrderDetailRespVO extends WmsReceiptOrderDetail {

    /** 资产名称 */
    private String itemName;

    /** 资产编号 */
    private String itemNo;

    /**
     * 所属货架名称
     */
    private List<Long> place;

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

    @Override
    public String toString() {
        return "WmsReceiptOrderDetailRespVO{" +
                "itemName='" + itemName + '\'' +
                ", itemNo='" + itemNo + '\'' +
                ", place=" + place +
                '}';
    }
}
