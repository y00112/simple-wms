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
    public void setReceiptOrderNo(String receiptOrderNo) 
    {
        this.receiptOrderNo = receiptOrderNo;
    }

    public String getReceiptOrderNo() 
    {
        return receiptOrderNo;
    }
    public void setReceiptOrderType(Long receiptOrderType) 
    {
        this.receiptOrderType = receiptOrderType;
    }

    public Long getReceiptOrderType() 
    {
        return receiptOrderType;
    }
    public void setReceiptOrderStatus(Integer receiptOrderStatus) 
    {
        this.receiptOrderStatus = receiptOrderStatus;
    }

    public Integer getReceiptOrderStatus() 
    {
        return receiptOrderStatus;
    }
    public void setDelFlag(Integer delFlag) 
    {
        this.delFlag = delFlag;
    }

    public Integer getDelFlag() 
    {
        return delFlag;
    }
    public void setWaveNo(String waveNo) 
    {
        this.waveNo = waveNo;
    }

    public String getWaveNo() 
    {
        return waveNo;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("receiptOrderNo", getReceiptOrderNo())
            .append("receiptOrderType", getReceiptOrderType())
            .append("receiptOrderStatus", getReceiptOrderStatus())
            .append("remark", getRemark())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("waveNo", getWaveNo())
            .toString();
    }
}
