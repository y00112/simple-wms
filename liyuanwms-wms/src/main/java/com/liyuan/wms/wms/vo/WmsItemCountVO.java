package com.liyuan.wms.wms.vo;

public class WmsItemCountVO {

    /**
     * 类型id
     */
    private Long itemTypeId;

    /**
     * 类型名称
     */
    private String itemTypeName;

    /**
     * 总计
     */
    private Long count;

    public WmsItemCountVO() {
    }

    public WmsItemCountVO(Long itemTypeId, String itemTypeName, Long count) {
        this.itemTypeId = itemTypeId;
        this.itemTypeName = itemTypeName;
        this.count = count;
    }

    public Long getItemTypeId() {
        return itemTypeId;
    }

    public void setItemTypeId(Long itemTypeId) {
        this.itemTypeId = itemTypeId;
    }

    public String getItemTypeName() {
        return itemTypeName;
    }

    public void setItemTypeName(String itemTypeName) {
        this.itemTypeName = itemTypeName;
    }

    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }
}
