package com.liyuan.wms.wms.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.liyuan.wms.common.annotation.Excel;
import com.liyuan.wms.common.core.domain.BaseEntity;

/**
 * 入库单详情对象 wms_receipt_order_detail
 * 
 * @author zhaoyss
 * @date 2024-04-28
 */
public class WmsReceiptOrderDetail extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 入库单号 */
    @Excel(name = "入库单号")
    private Long receiptOrderId;

    /** 资产 */
    @Excel(name = "资产")
    private Long itemId;

    /** 入库数量 */
    @Excel(name = "入库数量")
    private BigDecimal inQuantity;

    /** 所属货架 */
    @Excel(name = "所属货架")
    private Long rackId;

    /** 金额 */
    @Excel(name = "金额")
    private BigDecimal money;

    /** 删除标识 */
    private Integer delFlag;

    /** 所属仓库 */
    @Excel(name = "所属仓库")
    private Long warehouseId;

    /** 所属库区 */
    @Excel(name = "所属库区")
    private Long areaId;

    /** 入库状态 */
    @Excel(name = "入库状态")
    private Integer receiptOrderStatus;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setReceiptOrderId(Long receiptOrderId) 
    {
        this.receiptOrderId = receiptOrderId;
    }

    public Long getReceiptOrderId() 
    {
        return receiptOrderId;
    }
    public void setItemId(Long itemId) 
    {
        this.itemId = itemId;
    }

    public Long getItemId() 
    {
        return itemId;
    }
    public void setInQuantity(BigDecimal inQuantity) 
    {
        this.inQuantity = inQuantity;
    }

    public BigDecimal getInQuantity() 
    {
        return inQuantity;
    }
    public void setRackId(Long rackId) 
    {
        this.rackId = rackId;
    }

    public Long getRackId() 
    {
        return rackId;
    }
    public void setMoney(BigDecimal money) 
    {
        this.money = money;
    }

    public BigDecimal getMoney() 
    {
        return money;
    }
    public void setDelFlag(Integer delFlag) 
    {
        this.delFlag = delFlag;
    }

    public Integer getDelFlag() 
    {
        return delFlag;
    }
    public void setWarehouseId(Long warehouseId) 
    {
        this.warehouseId = warehouseId;
    }

    public Long getWarehouseId() 
    {
        return warehouseId;
    }
    public void setAreaId(Long areaId) 
    {
        this.areaId = areaId;
    }

    public Long getAreaId() 
    {
        return areaId;
    }
    public void setReceiptOrderStatus(Integer receiptOrderStatus) 
    {
        this.receiptOrderStatus = receiptOrderStatus;
    }

    public Integer getReceiptOrderStatus() 
    {
        return receiptOrderStatus;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("receiptOrderId", getReceiptOrderId())
            .append("itemId", getItemId())
            .append("inQuantity", getInQuantity())
            .append("rackId", getRackId())
            .append("money", getMoney())
            .append("delFlag", getDelFlag())
            .append("remark", getRemark())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("warehouseId", getWarehouseId())
            .append("areaId", getAreaId())
            .append("receiptOrderStatus", getReceiptOrderStatus())
            .toString();
    }
}
