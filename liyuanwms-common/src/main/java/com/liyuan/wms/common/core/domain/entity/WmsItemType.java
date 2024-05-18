package com.liyuan.wms.common.core.domain.entity;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.liyuan.wms.common.annotation.Excel;
import com.liyuan.wms.common.core.domain.BaseEntity;

import java.util.ArrayList;
import java.util.List;

/**
 * 资产类型对象 wms_item_type
 * 
 * @author zhaoyss
 * @date 2024-04-08
 */
public class WmsItemType extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 资产类型id */
    private Long itemTypeId;

    /** 父资产类型id */
    @Excel(name = "父资产类型id")
    private Long parentId;

    /** 祖级列表 */
    @Excel(name = "祖级列表")
    private String ancestors;

    /** 资产类型名称 */
    @Excel(name = "资产类型名称")
    private String typeName;

    /** 显示顺序 */
    @Excel(name = "显示顺序")
    private Long orderNum;

    /** 资产类型状态（0正常 1停用） */
    @Excel(name = "资产类型状态")
    private Boolean status;

    /** 删除标志（0代表存在 2代表删除） */
    private Boolean delFlag;

    /** 子资产 */
    private List<WmsItemType> children = new ArrayList<>();

    public void setItemTypeId(Long itemTypeId) 
    {
        this.itemTypeId = itemTypeId;
    }

    public Long getItemTypeId() 
    {
        return itemTypeId;
    }
    public void setParentId(Long parentId) 
    {
        this.parentId = parentId;
    }

    public Long getParentId() 
    {
        return parentId;
    }
    public void setAncestors(String ancestors) 
    {
        this.ancestors = ancestors;
    }

    public String getAncestors() 
    {
        return ancestors;
    }
    public void setTypeName(String typeName) 
    {
        this.typeName = typeName;
    }

    public String getTypeName() 
    {
        return typeName;
    }
    public void setOrderNum(Long orderNum) 
    {
        this.orderNum = orderNum;
    }

    public Long getOrderNum() 
    {
        return orderNum;
    }
    public void setStatus(Boolean status) 
    {
        this.status = status;
    }

    public Boolean getStatus() 
    {
        return status;
    }
    public void setDelFlag(Boolean delFlag) 
    {
        this.delFlag = delFlag;
    }

    public Boolean getDelFlag() 
    {
        return delFlag;
    }

    public List<WmsItemType> getChildren() {
        return children;
    }

    public void setChildren(List<WmsItemType> children) {
        this.children = children;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("itemTypeId", getItemTypeId())
            .append("parentId", getParentId())
            .append("ancestors", getAncestors())
            .append("typeName", getTypeName())
            .append("orderNum", getOrderNum())
            .append("status", getStatus())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
