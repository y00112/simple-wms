package com.liyuan.wms.wms.vo;

import com.liyuan.wms.common.annotation.Excel;

public class WmsShipmentOrderVO {

    private Long id;

    /**
     * 部门id
     */
    private Long deptId;

    /**
     * 部门名称
     */
    private String deptName;


    /**
     * 出库单号，系统自动生成
     */
    private String shipmentOrderNo;

    /**
     * 出库类型
     */
    private Long shipmentOrderType;

    /**
     * 领取人
     */
    private String recipient;

    /**
     * 出库单状态
     */
    private Integer shipmentOrderStatus;

    /**
     * 波次号
     */
    private String waveNo;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getShipmentOrderNo() {
        return shipmentOrderNo;
    }

    public void setShipmentOrderNo(String shipmentOrderNo) {
        this.shipmentOrderNo = shipmentOrderNo;
    }

    public Long getShipmentOrderType() {
        return shipmentOrderType;
    }

    public void setShipmentOrderType(Long shipmentOrderType) {
        this.shipmentOrderType = shipmentOrderType;
    }

    public String getRecipient() {
        return recipient;
    }

    public void setRecipient(String recipient) {
        this.recipient = recipient;
    }

    public Integer getShipmentOrderStatus() {
        return shipmentOrderStatus;
    }

    public void setShipmentOrderStatus(Integer shipmentOrderStatus) {
        this.shipmentOrderStatus = shipmentOrderStatus;
    }

    public String getWaveNo() {
        return waveNo;
    }

    public void setWaveNo(String waveNo) {
        this.waveNo = waveNo;
    }
}
