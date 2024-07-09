package com.liyuan.wms.wms.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.liyuan.wms.common.annotation.Excel;
import com.liyuan.wms.common.core.domain.BaseEntity;

/**
 * 出库单详情对象 wms_shipment_order_detail
 * 
 * @author zhaoyss
 * @date 2024-06-24
 */
public class WmsShipmentOrderDetail extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 出库单编号 */
    @Excel(name = "出库单编号")
    private String shipmentOrderNo;

    /** 资产 */
    @Excel(name = "资产")
    private Long itemId;

    /** 出库数量 */
    @Excel(name = "出库数量")
    private Long shipmentQuantity;

    /** 出库状态 */
    @Excel(name = "出库状态")
    private Integer shipmentOrderStatus;

    /** 删除标记 */
    private Integer delFlag;

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
    public void setItemId(Long itemId) 
    {
        this.itemId = itemId;
    }

    public Long getItemId() 
    {
        return itemId;
    }
    public void setShipmentQuantity(Long shipmentQuantity) 
    {
        this.shipmentQuantity = shipmentQuantity;
    }

    public Long getShipmentQuantity() 
    {
        return shipmentQuantity;
    }

    public void setShipmentOrderStatus(Integer shipmentOrderStatus) 
    {
        this.shipmentOrderStatus = shipmentOrderStatus;
    }

    public Integer getShipmentOrderStatus() 
    {
        return shipmentOrderStatus;
    }
    public void setDelFlag(Integer delFlag) 
    {
        this.delFlag = delFlag;
    }

    public Integer getDelFlag() 
    {
        return delFlag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("shipmentOrderNo", getShipmentOrderNo())
            .append("itemId", getItemId())
            .append("shipmentQuantity", getShipmentQuantity())
            .append("shipmentOrderStatus", getShipmentOrderStatus())
            .append("remark", getRemark())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("delFlag", getDelFlag())
            .toString();
    }
}
