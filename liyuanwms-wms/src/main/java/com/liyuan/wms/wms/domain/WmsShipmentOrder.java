package com.liyuan.wms.wms.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.liyuan.wms.common.annotation.Excel;
import com.liyuan.wms.common.core.domain.BaseEntity;

/**
 * 出库单对象 wms_shipment_order
 * 
 * @author zhaoyss
 * @date 2024-06-24
 */
public class WmsShipmentOrder extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 出库单号，系统自动生成 */
    @Excel(name = "出库单号，系统自动生成")
    private String shipmentOrderNo;

    /** 出库类型 */
    @Excel(name = "出库类型")
    private Long shipmentOrderType;

    /** 领取人 */
    @Excel(name = "领取人")
    private String recipient;

    /** 出库单状态 */
    @Excel(name = "出库单状态")
    private Integer shipmentOrderStatus;

    /** 波次号 */
    @Excel(name = "波次号")
    private String waveNo;

    /** 删除标记 */
    @Excel(name = "删除标记")
    private Integer delFalg;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setShipmentOrderNo(String shipmentOrderNo) 
    {
        this.shipmentOrderNo = shipmentOrderNo;
    }

    public String getShipmentOrderNo() 
    {
        return shipmentOrderNo;
    }
    public void setShipmentOrderType(Long shipmentOrderType) 
    {
        this.shipmentOrderType = shipmentOrderType;
    }

    public Long getShipmentOrderType() 
    {
        return shipmentOrderType;
    }
    public void setRecipient(String recipient) 
    {
        this.recipient = recipient;
    }

    public String getRecipient() 
    {
        return recipient;
    }
    public void setShipmentOrderStatus(Integer shipmentOrderStatus) 
    {
        this.shipmentOrderStatus = shipmentOrderStatus;
    }

    public Integer getShipmentOrderStatus() 
    {
        return shipmentOrderStatus;
    }
    public void setWaveNo(String waveNo) 
    {
        this.waveNo = waveNo;
    }

    public String getWaveNo() 
    {
        return waveNo;
    }
    public void setDelFalg(Integer delFalg) 
    {
        this.delFalg = delFalg;
    }

    public Integer getDelFalg() 
    {
        return delFalg;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("shipmentOrderNo", getShipmentOrderNo())
            .append("shipmentOrderType", getShipmentOrderType())
            .append("recipient", getRecipient())
            .append("shipmentOrderStatus", getShipmentOrderStatus())
            .append("waveNo", getWaveNo())
            .append("remark", getRemark())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("delFalg", getDelFalg())
            .toString();
    }
}
