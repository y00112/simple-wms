package com.liyuan.wms.wms.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.liyuan.wms.common.annotation.Excel;
import com.liyuan.wms.common.core.domain.BaseEntity;

/**
 * 货架对象 wms_rack
 * 
 * @author zhaoyss
 * @date 2024-04-07
 */
public class WmsRack extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 编号 */
    @Excel(name = "编号")
    private String rackNo;

    /** 名称 */
    @Excel(name = "名称")
    private String rackName;

    /** 所属库区 */
    @Excel(name = "所属库区")
    private Long areaId;

    /** 所属仓库 */
    @Excel(name = "所属仓库")
    private Long warehouseId;

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
    public void setRackNo(String rackNo) 
    {
        this.rackNo = rackNo;
    }

    public String getRackNo() 
    {
        return rackNo;
    }
    public void setRackName(String rackName) 
    {
        this.rackName = rackName;
    }

    public String getRackName() 
    {
        return rackName;
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
            .append("rackNo", getRackNo())
            .append("rackName", getRackName())
            .append("areaId", getAreaId())
            .append("warehouseId", getWarehouseId())
            .append("remark", getRemark())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
