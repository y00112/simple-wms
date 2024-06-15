package com.liyuan.wms.wms.controller.vo;

import com.liyuan.wms.wms.domain.WmsReceiptOrderDetail;

import java.util.List;

public class WmsReceiptOrderDetailsAddsVO {
    private List<WmsReceiptOrderDetail> list;

    public List<WmsReceiptOrderDetail> getList() {
        return list;
    }

    public void setList(List<WmsReceiptOrderDetail> list) {
        this.list = list;
    }

    @Override
    public String toString() {
        return "WmsReceiptOrderDetailsAddsVO{" +
                "list=" + list +
                '}';
    }
}
