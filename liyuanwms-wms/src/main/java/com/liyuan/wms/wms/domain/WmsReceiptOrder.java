package com.liyuan.wms.wms.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.liyuan.wms.common.annotation.Excel;
import com.liyuan.wms.common.core.domain.BaseEntity;

/**
 * 入库单对象 wms_receipt_order
 * 
 * @author zhaoyss
 * @date 2024-04-28
 */
public class WmsReceiptOrder extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 入库单号 */
    @Excel(name = "入库单号")
    private String receiptOrderNo;

    /** 入库类型 */
    @Excel(name = "入库类型")
    private Long receiptOrderType;

    /** 入库状态 */
    @Excel(name = "入库状态")
    private Integer receiptOrderStatus;

    @Excel(name = "入库人")
    private String depositor;

    /** 删除标识 */
    private Integer delFlag;

    /** 波次号 */
    @Excel(name = "波次号")
    private String waveNo;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public String getReceiptOrderNo() {
        return receiptOrderNo;
    }

    public void setReceiptOrderNo(String receiptOrderNo) {
        this.receiptOrderNo = receiptOrderNo;
    }

    public Long getReceiptOrderType() {
        return receiptOrderType;
    }

    public void setReceiptOrderType(Long receiptOrderType) {
        this.receiptOrderType = receiptOrderType;
    }

    public Integer getReceiptOrderStatus() {
        return receiptOrderStatus;
    }

    public void setReceiptOrderStatus(Integer receiptOrderStatus) {
        this.receiptOrderStatus = receiptOrderStatus;
    }

    public String getDepositor() {
        return depositor;
    }

    public void setDepositor(String depositor) {
        this.depositor = depositor;
    }

    public Integer getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }

    public String getWaveNo() {
        return waveNo;
    }

    public void setWaveNo(String waveNo) {
        this.waveNo = waveNo;
    }

    @Override
    public String toString() {
        return "WmsReceiptOrder{" +
                "id=" + id +
                ", receiptOrderNo='" + receiptOrderNo + '\'' +
                ", receiptOrderType=" + receiptOrderType +
                ", receiptOrderStatus=" + receiptOrderStatus +
                ", depositor=" + depositor +
                ", delFlag=" + delFlag +
                ", waveNo='" + waveNo + '\'' +
                '}';
    }
}
