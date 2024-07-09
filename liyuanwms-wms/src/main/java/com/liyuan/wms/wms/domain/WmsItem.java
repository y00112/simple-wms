package com.liyuan.wms.wms.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.liyuan.wms.common.annotation.Excel;
import com.liyuan.wms.common.core.domain.BaseEntity;

/**
 * 资产对象 wms_item
 * 
 * @author zhaoyss
 * @date 2024-04-09
 */
public class WmsItem extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 编号 */
    @Excel(name = "编号")
    private String itemNo;

    /** 名称 */
    @Excel(name = "名称")
    private String itemName;

    /** 规格 */
    @Excel(name = "规格")
    private String specification;

    /** 分类 */
    @Excel(name = "分类")
    private Long itemType;

    /** 单位类别 */
    @Excel(name = "单位类别")
    private String unit;

    /** 单价 */
    @Excel(name = "单价")
    private BigDecimal unitPrice;

    /** 所属货架 */
    @Excel(name = "所属货架")
    private Long rackId;

    /** 所属库区 */
    @Excel(name = "所属库区")
    private Long areaId;

    /** 所属仓库 */
    @Excel(name = "所属仓库")
    private Long warehouseId;

    /** 现有库存 */
    @Excel(name = "现有库存")
    private Long quantity;

    /** 生产日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "生产日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date productionDate;

    /** 有效期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "有效期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date expiryDate;

    /** 批次 */
    @Excel(name = "批次")
    private String batch;

    /** 删除标识 */
    private Integer delFlag;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setItemNo(String itemNo) 
    {
        this.itemNo = itemNo;
    }

    public String getItemNo() 
    {
        return itemNo;
    }
    public void setItemName(String itemName) 
    {
        this.itemName = itemName;
    }

    public String getItemName() 
    {
        return itemName;
    }
    public void setSpecification(String specification) 
    {
        this.specification = specification;
    }

    public String getSpecification() 
    {
        return specification;
    }
    public void setItemType(Long itemType)
    {
        this.itemType = itemType;
    }

    public Long getItemType()
    {
        return itemType;
    }
    public void setUnit(String unit) 
    {
        this.unit = unit;
    }

    public String getUnit() 
    {
        return unit;
    }
    public void setUnitPrice(BigDecimal unitPrice) 
    {
        this.unitPrice = unitPrice;
    }

    public BigDecimal getUnitPrice() 
    {
        return unitPrice;
    }
    public void setRackId(Long rackId) 
    {
        this.rackId = rackId;
    }

    public Long getRackId() 
    {
        return rackId;
    }
    public void setAreaId(Long areaId) 
    {
        this.areaId = areaId;
    }

    public Long getAreaId() 
    {
        return areaId;
    }
    public void setWarehouseId(Long warehouseId) 
    {
        this.warehouseId = warehouseId;
    }

    public Long getWarehouseId() 
    {
        return warehouseId;
    }
    public void setQuantity(Long quantity) 
    {
        this.quantity = quantity;
    }

    public Long getQuantity() 
    {
        return quantity;
    }
    public void setProductionDate(Date productionDate) 
    {
        this.productionDate = productionDate;
    }

    public Date getProductionDate() 
    {
        return productionDate;
    }
    public void setExpiryDate(Date expiryDate) 
    {
        this.expiryDate = expiryDate;
    }

    public Date getExpiryDate() 
    {
        return expiryDate;
    }
    public void setBatch(String batch) 
    {
        this.batch = batch;
    }

    public String getBatch() 
    {
        return batch;
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
            .append("itemNo", getItemNo())
            .append("itemName", getItemName())
            .append("specification", getSpecification())
            .append("itemType", getItemType())
            .append("unit", getUnit())
            .append("unitPrice", getUnitPrice())
            .append("rackId", getRackId())
            .append("areaId", getAreaId())
            .append("warehouseId", getWarehouseId())
            .append("quantity", getQuantity())
            .append("productionDate", getProductionDate())
            .append("expiryDate", getExpiryDate())
            .append("batch", getBatch())
            .append("delFlag", getDelFlag())
            .append("remark", getRemark())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
