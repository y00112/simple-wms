<template>
  <div class="container">
    <el-card class="box-card-title">
      <el-row>
        <el-col :span="4">
          <el-input v-model="queryWarehouseParam"
                    placeholder="请输入仓库名称">
            <el-button slot="append"
                       icon="el-icon-search"
                       v-hasPermi="['wms:warehouse:list']"
                       @click="queryWarehouse"></el-button>
          </el-input>
        </el-col>
        <el-col :span="8">
          <el-button type="success"
                     plain
                     style="margin-left: 10px;"
                     icon="el-icon-plus"
                     @click="handleAddWarehouse"
                     v-hasPermi="['wms:warehouse:add']">新增仓库</el-button>
        </el-col>
      </el-row>
    </el-card>
    <el-empty description="暂无仓库"
              v-if="wmsWarehouseList.length == 0"></el-empty>
    <el-card v-else
             class="box-card-body">
      <el-tabs :tab-position="tabPosition"
               type="border-card"
               v-model="selectedWarehouseNo"
               @tab-click="handleTabClick">
        <el-tab-pane v-for="(warehouse, index) in wmsWarehouseList"
                     :key="index"
                     :label="warehouse.warehouseName"
                     :name="warehouse.warehouseNo">
          <!-- 基本信息 -->
          <el-card class="box-card">
            <el-descriptions title="基本信息"
                             direction="vertical"
                             :column="4"
                             border>
              <template slot="extra">
                <el-button type="primary"
                           size="small"
                           @click="handleUpdateWarehouse(warehouse.id)"
                           v-hasPermi="['wms:warehouse:edit']">修改</el-button>
              </template>
              <template slot="extra">
                <el-button type="danger"
                           size="small">删除</el-button>
              </template>
              <el-descriptions-item label="仓库名称">{{ warehouse.warehouseName }}</el-descriptions-item>
              <el-descriptions-item label="仓库编号">{{ warehouse.warehouseNo }}</el-descriptions-item>
              <el-descriptions-item label="备注"
                                    :span="2">{{ warehouse.remark }}</el-descriptions-item>
            </el-descriptions>
          </el-card>
          <!-- 库区信息 -->
          <el-card class="box-card"
                   style="margin-top: 5px;">
            <div slot="header"
                 class="clearfix">
              <span><strong>库区信息</strong></span>
            </div>
            <div class="text item">
              <el-row>
                <el-col :span="4">
                  <el-input v-model="queryAreaParam"
                            size="small"
                            placeholder="请输入库区名称">
                    <el-button slot="append"
                               icon="el-icon-search"
                               @click="queryArea"></el-button>
                  </el-input>
                </el-col>
                <el-col :span="8">
                  <el-button type="success"
                             size="small"
                             plain
                             style="margin-left: 10px;"
                             icon="el-icon-plus"
                             @click="handleAddArea(warehouse.id)"
                             v-hasPermi="['wms:area:add']">新增库区</el-button>
                </el-col>
              </el-row>
              <template>
                <el-table :data="wmsAreaList"
                          height="310"
                          border
                          style="width: 100%; margin-top: 10px;">
                  <el-table-column prop="areaNo"
                                   label="编号"
                                   align="center">
                  </el-table-column>
                  <el-table-column prop="areaName"
                                   label="名称"
                                   align="center">
                  </el-table-column>
                  <el-table-column prop="id"
                                   label="货架编号"
                                   align="center">
                    <template slot-scope="scope">
                      <router-link :to="'/wms/rack/index/' + scope.row.id"
                                   class="link-type">
                        <span>{{ scope.row.id }}</span>
                      </router-link>
                    </template>
                  </el-table-column>
                  <el-table-column prop="remark"
                                   label="备注"
                                   align="center">
                  </el-table-column>
                  <el-table-column label="操作"
                                   align="center"
                                   class-name="small-padding fixed-width">
                    <template slot-scope="scope">
                      <el-button size="small"
                                 type="primary"
                                 icon="el-icon-edit"
                                 @click="handleUpdateArea(scope.row)"
                                 v-hasPermi="['wms:area:edit']">修改</el-button>
                      <el-button size="small"
                                 type="danger"
                                 icon="el-icon-delete"
                                 @click="handleDeleteArea(scope.row)"
                                 v-hasPermi="['wms:area:remove']">删除</el-button>
                    </template>
                  </el-table-column>
                </el-table>
              </template>
            </div>
          </el-card>
        </el-tab-pane>
      </el-tabs>
    </el-card>
    <!-- 添加或修改仓库对话框 -->
    <el-dialog :title="title"
               :visible.sync="openWarehouse"
               width="40%">
      <el-form ref="warehouseForm"
               :model="warehouseForm"
               :rules="rulesWarehouse"
               label-width="80px">
        <el-form-item label="编号"
                      prop="warehouseNo">
          <el-input v-model="warehouseForm.warehouseNo"
                    placeholder="请输入编号" />
        </el-form-item>
        <el-form-item label="名称"
                      prop="warehouseName">
          <el-input v-model="warehouseForm.warehouseName"
                    placeholder="请输入名称" />
        </el-form-item>
        <el-form-item label="备注"
                      prop="remark">
          <el-input v-model="warehouseForm.remark"
                    placeholder="请输入备注" />
        </el-form-item>
      </el-form>
      <span slot="footer"
            class="dialog-footer">
        <el-button @click="openWarehouse = false">取 消</el-button>
        <el-button type="primary"
                   @click="submitWarehouseForm">确 定</el-button>
      </span>
    </el-dialog>

    <!-- 添加或修改库区对话框 -->
    <el-dialog :title="title"
               :visible.sync="openArea"
               width="40%"
               append-to-body>
      <el-form ref="areaForm"
               :model="areaForm"
               :rules="rulesArea"
               label-width="100px">
        <el-form-item label="编号"
                      prop="areaNo">
          <el-input v-model="areaForm.areaNo"
                    placeholder="请输入编号" />
        </el-form-item>
        <el-form-item label="名称"
                      prop="areaName">
          <el-input v-model="areaForm.areaName"
                    placeholder="请输入名称" />
        </el-form-item>
        <el-form-item label="所属仓库ID"
                      prop="warehouseId">
          <el-input v-model="areaForm.warehouseId"
                    placeholder="请输入所属仓库ID"
                    disabled />
        </el-form-item>
        <el-form-item label="备注"
                      prop="remark">
          <el-input v-model="areaForm.remark"
                    placeholder="请输入备注" />
        </el-form-item>
      </el-form>
      <div slot="footer"
           class="dialog-footer">
        <el-button type="primary"
                   @click="submitAreaForm">确 定</el-button>
        <el-button @click="openArea = false">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<script>
import { listWarehouse, getWarehouse, delWarehouse, addWarehouse, updateWarehouse } from "@/api/wms/warehouse";
import { listArea, getArea, delArea, addArea, updateArea } from "@/api/wms/area";

export default {
  name: "WarehouseAreRack",
  data () {
    return {
      // 查询库区参数
      queryAreaParam: null,
      // 查询仓库参数
      queryWarehouseParam: null,
      // 对话框title
      title: null,
      // tab页位置
      tabPosition: "left",
      selectedWarehouseNo: null,
      selectedWarehouseId: null,
      // 遮罩层
      loading: true,
      // 仓库表格数据
      wmsWarehouseList: [],
      // 库区表格数据
      wmsAreaList: [],
      // 是否弹出层
      openWarehouse: false,
      openArea: false,
      // 查询参数
      queryWarehouseParams: {
        warehouseNo: null,
        warehouseName: null,
      },
      queryAreaParams: {
        pageNum: 1,
        pageSize: 999,
        areaNo: null,
        areaName: null,
        warehouseId: null,
      },
      // 表单参数
      form: {},
      warehouseForm: {},
      areaForm: {},
      // 表单校验
      rulesWarehouse: {
        warehouseNo: [
          { required: true, message: "编号不能为空", trigger: "blur" }
        ],
        warehouseName: [
          { required: true, message: "名称不能为空", trigger: "blur" }
        ],
      },
      rulesArea: {
        areaNo: [
          { required: true, message: "编号不能为空", trigger: "blur" }
        ],
        areaName: [
          { required: true, message: "名称不能为空", trigger: "blur" }
        ],
        warehouseId: [
          { required: true, message: "所属仓库ID不能为空", trigger: "blur" }
        ]
      }
    };
  },
  methods: {
    // 左侧仓库标签页选择操作
    handleTabClick (tab, event) {
      this.queryAreaParam = null
      this.queryWarehouseParam = null
      this.selectedWarehouseNo = this.wmsWarehouseList[tab.index].warehouseNo
      this.selectedWarehouseId = this.wmsWarehouseList[tab.index].id
      this.loadArea()
    },
    // 查询库区通过参数查询
    queryArea () {
      this.loading = true
      if (this.queryAreaParam == null) {
        this.loadArea()
        this.loading = false
        return
      }
      this.queryAreaParams.areaName = this.queryAreaParam
      this.loadArea()
    },
    // 查询仓库通过查询参数
    queryWarehouse () {
      this.loading = true
      if (this.queryWarehouseParam == null) {
        this.queryWarehouseParams.warehouseName = null
        this.getWarehouseList()
        this.loading = false
        return
      }
      this.selectedWarehouseNo = null
      this.queryWarehouseParams.warehouseName = this.queryWarehouseParam
      const query = {
        ...this.queryWarehouseParams,
        pageNum: undefined,
        pageSize: undefined
      }
      listWarehouse(query).then(response => {
        this.wmsWarehouseList = response.rows;
        this.total = response.total;
        this.loading = false;
        this.loadArea()
      });
    },
    // 查询仓库列表
    getWarehouseList () {
      this.loading = true;
      this.selectedWarehouseNo = null
      const query = {
        ...this.queryWarehouseParams,
        pageNum: undefined,
        pageSize: undefined
      }
      listWarehouse(query).then(response => {
        this.wmsWarehouseList = response.rows;
        this.total = response.total;
        this.loading = false;
        this.loadArea()
      });
    },
    // 加载选中仓库的库区信息
    loadArea () {
      this.loading = true;
      if (this.selectedWarehouseNo == null) {
        if (this.wmsWarehouseList.length == 0) {
          this.wmsAreaList = []
          return;
        }
        this.queryAreaParams.warehouseId = this.wmsWarehouseList[0].id
        this.selectedWarehouseNo = this.wmsWarehouseList[0].warehouseNo
      } else {
        this.queryAreaParams.warehouseId = this.selectedWarehouseId
      }
      listArea(this.queryAreaParams).then(response => {
        this.wmsAreaList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 新增仓库按钮操作
    handleAddWarehouse () {
      this.resetWarehouseForm()
      this.openWarehouse = true
      this.title = '添加仓库'
    },
    // 新增库区按钮操作
    handleAddArea (warehouseId) {
      this.resetArea()
      this.openArea = true
      this.title = '添加库区'
      this.areaForm.warehouseId = warehouseId
    },
    /** 修改仓库按钮操作 */
    handleUpdateWarehouse (id) {
      this.resetWarehouseForm();
      getWarehouse(id).then(response => {
        this.warehouseForm = response.data;
        this.openWarehouse = true;
        this.title = "修改仓库";
      });
    },

    /** 修改库区按钮操作 */
    handleUpdateArea (row) {
      this.resetArea();
      const id = row.id || this.ids
      getArea(id).then(response => {
        this.areaForm = response.data;
        this.openArea = true;
        this.title = "修改库区";
      });
    },
    /** 删除库区按钮操作 */
    handleDeleteArea (row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除库区编号为"' + row.areaNo + '"的数据项？').then(function () {
        return delArea(ids);
      }).then(() => {
        this.loadArea();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => { });
    },
    // before-close
    handleClose (done) {
      this.$confirm('确认关闭？')
        .then(_ => {
          done();
        })
        .catch(_ => { });
    },
    // 提交按钮（添加仓库）
    submitWarehouseForm () {
      this.$refs["warehouseForm"].validate(valid => {
        if (valid) {
          if (this.warehouseForm.id != null) {
            updateWarehouse(this.warehouseForm).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.openWarehouse = false;
              this.getWarehouseList();
            });
          } else {
            addWarehouse(this.warehouseForm).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.openWarehouse = false;
              this.getWarehouseList();
            });
          }
        }
      });
    },
    // 提交按钮 (添加库区)
    submitAreaForm () {
      this.$refs["areaForm"].validate(valid => {
        if (valid) {
          if (this.areaForm.id != null) {
            updateArea(this.areaForm).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.openArea = false;
              this.loadArea()
            });
          } else {
            addArea(this.areaForm).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.openArea = false;
              this.loadArea()
            });
          }
        }
      });
    },
    // 表单重置
    resetWarehouseForm () {
      this.warehouseForm = {
        id: null,
        warehouseNo: null,
        warehouseName: null,
        delFlag: null,
        remark: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null
      };
      this.resetForm("warehouseForm");
    },
    resetArea () {
      this.areaForm = {
        id: null,
        areaNo: null,
        areaName: null,
        warehouseId: null,
        remark: null,
        delFlag: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null
      };
      this.resetForm("areaForm");
    }
  },
  created () {
    this.getWarehouseList();
  }
};
</script>
<style>
.box-card-title {
  width: 99%;
  height: 30%;
  margin: 10px;
}

.box-card-body {
  width: 99%;
  height: 70%;
  margin: 10px;
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: '';
}

.clearfix:after {
  clear: both;
}

.item {
  margin-bottom: 18px;
}
</style>