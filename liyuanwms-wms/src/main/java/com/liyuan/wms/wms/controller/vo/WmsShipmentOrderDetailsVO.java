package com.liyuan.wms.wms.controller.vo;

import com.liyuan.wms.wms.domain.WmsShipmentOrderDetail;

import java.util.List;

public class WmsShipmentOrderDetailsVO {

    private List<WmsShipmentOrderDetail> list;


    public WmsShipmentOrderDetailsVO() {
    }

    public WmsShipmentOrderDetailsVO(List<WmsShipmentOrderDetail> list) {
        this.list = list;
    }

    public List<WmsShipmentOrderDetail> getList() {
        return list;
    }

    public void setList(List<WmsShipmentOrderDetail> list) {
        this.list = list;
    }
}
