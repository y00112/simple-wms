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
    private String receiptOrderNo;

    /** 资产 */
    @Excel(name = "资产")
    private Long itemId;

    /** 入库数量 */
    @Excel(name = "入库数量")
    private Long inQuantity;

    /** 金额 */
    @Excel(name = "金额")
    private BigDecimal money;

    /** 删除标识 */
    private Integer delFlag;

    /** 入库状态 */
    @Excel(name = "入库状态")
    private Integer receiptOrderStatus;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getReceiptOrderNo() {
        return receiptOrderNo;
    }

    public void setReceiptOrderNo(String receiptOrderNo) {
        this.receiptOrderNo = receiptOrderNo;
    }

    public Long getItemId() {
        return itemId;
    }

    public void setItemId(Long itemId) {
        this.itemId = itemId;
    }

    public Long getInQuantity() {
        return inQuantity;
    }

    public void setInQuantity(Long inQuantity) {
        this.inQuantity = inQuantity;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public Integer getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }

    public Integer getReceiptOrderStatus() {
        return receiptOrderStatus;
    }

    public void setReceiptOrderStatus(Integer receiptOrderStatus) {
        this.receiptOrderStatus = receiptOrderStatus;
    }

    @Override
    public String toString() {
        return "WmsReceiptOrderDetail{" +
                "id=" + id +
                ", receiptOrderNo='" + receiptOrderNo + '\'' +
                ", itemId=" + itemId +
                ", inQuantity=" + inQuantity +
                ", money=" + money +
                ", delFlag=" + delFlag +
                ", receiptOrderStatus=" + receiptOrderStatus +
                '}';
    }
}
