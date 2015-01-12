/*
 * @(#)Ztestitem.java 
 *
 * Copyright (C) 2002-2008 The Dihua Software Foundation. All rights reserved.
 *
 * 程序生成时间：[Fri Jul 23 15:56:29 CST 2010] 生成
 */
package net.mast.demo.ztest.data;

//导入 java 类
import java.io.Serializable;

/**
 * 功能:本类测试行项目数据DataBean类
 *
 * @author  sp
 * @date    [Fri Jul 23 15:56:29 CST 2010]
 *
 * $Id$
 */
@SuppressWarnings({ "serial", "unused" })
public class Ztestitem implements Serializable {

	/** 
	* 域 主键
	*/
	private String codenum;

	/** 
	* 域 是否被锁定
	*/
	private String islockstatussys;

	/** 
	* 域 当前用户
	*/
	private String currentusersys;

	/** 
	* 域 当前角色
	*/
	private String currentrolesys;

	/** 
	* 域 用户组
	*/
	private String currentusergorupsys;

	/** 
	* 域 当前部门
	*/
	private String currentdepartmentsys;

	/** 
	* 域 是否启用回收站
	*/
	private String isstartrecycle;

	/** 
	* 域 共享角色
	*/
	private String sharerolesys;

	/** 
	* 域 共享用户
	*/
	private String shareusersys;

	/** 
	* 域 共享部门
	*/
	private String sharedepartmentsys;

	/** 
	* 域 共享用户组
	*/
	private String shareusergroup;

	/** 
	* 域 销售组织
	*/
	private String sales_org;

	/** 
	* 域 分销渠道
	*/
	private String distr_chan;

	/** 
	* 域 产品组
	*/
	private String division;

	/** 
	* 域 销售部门（销售办公室）
	*/
	private String sales_office;

	/** 
	* 域 销售组
	*/
	private String sales_group;

	/** 
	* 域 销售地区
	*/
	private String sales_area;

	/** 
	* 域 逻辑删除标识
	*/
	private String is_deletesys;

	/** 
	* 域 逻辑删除恢复时间
	*/
	private String update_datesys;

	/** 
	* 域 行项目
	*/
	private String po_item;

	/** 
	* 域 值
	*/
	private String value;

	/** 
	* 域 表头编号
	*/
	private String hcodenum;

	/**
	* Ztestitem构造函数
	*/
	public Ztestitem() {
		super();
	}

	/**
	* 是否删除标志
	*/
	private String isDelete = "0";

	/**
	* 属性 T$ZTESTITEM$CODENUM 的get方法
	* @return String
	*/
	public String getCODENUM() {
		return codenum;
	}

	/**
	* 属性 T$ZTESTITEM$CODENUM 的set方法
	* @return void
	*/
	public void setCODENUM(String codenum) {
		this.codenum = codenum;
	}

	/**
	* 属性 T$ZTESTITEM$ISLOCKSTATUSSYS 的get方法
	* @return String
	*/
	public String getISLOCKSTATUSSYS() {
		return islockstatussys;
	}

	/**
	* 属性 T$ZTESTITEM$ISLOCKSTATUSSYS 的set方法
	* @return void
	*/
	public void setISLOCKSTATUSSYS(String islockstatussys) {
		this.islockstatussys = islockstatussys;
	}

	/**
	* 属性 T$ZTESTITEM$CURRENTUSERSYS 的get方法
	* @return String
	*/
	public String getCURRENTUSERSYS() {
		return currentusersys;
	}

	/**
	* 属性 T$ZTESTITEM$CURRENTUSERSYS 的set方法
	* @return void
	*/
	public void setCURRENTUSERSYS(String currentusersys) {
		this.currentusersys = currentusersys;
	}

	/**
	* 属性 T$ZTESTITEM$CURRENTROLESYS 的get方法
	* @return String
	*/
	public String getCURRENTROLESYS() {
		return currentrolesys;
	}

	/**
	* 属性 T$ZTESTITEM$CURRENTROLESYS 的set方法
	* @return void
	*/
	public void setCURRENTROLESYS(String currentrolesys) {
		this.currentrolesys = currentrolesys;
	}

	/**
	* 属性 T$ZTESTITEM$CURRENTUSERGORUPSYS 的get方法
	* @return String
	*/
	public String getCURRENTUSERGORUPSYS() {
		return currentusergorupsys;
	}

	/**
	* 属性 T$ZTESTITEM$CURRENTUSERGORUPSYS 的set方法
	* @return void
	*/
	public void setCURRENTUSERGORUPSYS(String currentusergorupsys) {
		this.currentusergorupsys = currentusergorupsys;
	}

	/**
	* 属性 T$ZTESTITEM$CURRENTDEPARTMENTSYS 的get方法
	* @return String
	*/
	public String getCURRENTDEPARTMENTSYS() {
		return currentdepartmentsys;
	}

	/**
	* 属性 T$ZTESTITEM$CURRENTDEPARTMENTSYS 的set方法
	* @return void
	*/
	public void setCURRENTDEPARTMENTSYS(String currentdepartmentsys) {
		this.currentdepartmentsys = currentdepartmentsys;
	}

	/**
	* 属性 T$ZTESTITEM$ISSTARTRECYCLE 的get方法
	* @return String
	*/
	public String getISSTARTRECYCLE() {
		return isstartrecycle;
	}

	/**
	* 属性 T$ZTESTITEM$ISSTARTRECYCLE 的set方法
	* @return void
	*/
	public void setISSTARTRECYCLE(String isstartrecycle) {
		this.isstartrecycle = isstartrecycle;
	}

	/**
	* 属性 T$ZTESTITEM$SHAREROLESYS 的get方法
	* @return String
	*/
	public String getSHAREROLESYS() {
		return sharerolesys;
	}

	/**
	* 属性 T$ZTESTITEM$SHAREROLESYS 的set方法
	* @return void
	*/
	public void setSHAREROLESYS(String sharerolesys) {
		this.sharerolesys = sharerolesys;
	}

	/**
	* 属性 T$ZTESTITEM$SHAREUSERSYS 的get方法
	* @return String
	*/
	public String getSHAREUSERSYS() {
		return shareusersys;
	}

	/**
	* 属性 T$ZTESTITEM$SHAREUSERSYS 的set方法
	* @return void
	*/
	public void setSHAREUSERSYS(String shareusersys) {
		this.shareusersys = shareusersys;
	}

	/**
	* 属性 T$ZTESTITEM$SHAREDEPARTMENTSYS 的get方法
	* @return String
	*/
	public String getSHAREDEPARTMENTSYS() {
		return sharedepartmentsys;
	}

	/**
	* 属性 T$ZTESTITEM$SHAREDEPARTMENTSYS 的set方法
	* @return void
	*/
	public void setSHAREDEPARTMENTSYS(String sharedepartmentsys) {
		this.sharedepartmentsys = sharedepartmentsys;
	}

	/**
	* 属性 T$ZTESTITEM$SHAREUSERGROUP 的get方法
	* @return String
	*/
	public String getSHAREUSERGROUP() {
		return shareusergroup;
	}

	/**
	* 属性 T$ZTESTITEM$SHAREUSERGROUP 的set方法
	* @return void
	*/
	public void setSHAREUSERGROUP(String shareusergroup) {
		this.shareusergroup = shareusergroup;
	}

	/**
	* 属性 T$ZTESTITEM$SALES_ORG 的get方法
	* @return String
	*/
	public String getSALES_ORG() {
		return sales_org;
	}

	/**
	* 属性 T$ZTESTITEM$SALES_ORG 的set方法
	* @return void
	*/
	public void setSALES_ORG(String sales_org) {
		this.sales_org = sales_org;
	}

	/**
	* 属性 T$ZTESTITEM$DISTR_CHAN 的get方法
	* @return String
	*/
	public String getDISTR_CHAN() {
		return distr_chan;
	}

	/**
	* 属性 T$ZTESTITEM$DISTR_CHAN 的set方法
	* @return void
	*/
	public void setDISTR_CHAN(String distr_chan) {
		this.distr_chan = distr_chan;
	}

	/**
	* 属性 T$ZTESTITEM$DIVISION 的get方法
	* @return String
	*/
	public String getDIVISION() {
		return division;
	}

	/**
	* 属性 T$ZTESTITEM$DIVISION 的set方法
	* @return void
	*/
	public void setDIVISION(String division) {
		this.division = division;
	}

	/**
	* 属性 T$ZTESTITEM$SALES_OFFICE 的get方法
	* @return String
	*/
	public String getSALES_OFFICE() {
		return sales_office;
	}

	/**
	* 属性 T$ZTESTITEM$SALES_OFFICE 的set方法
	* @return void
	*/
	public void setSALES_OFFICE(String sales_office) {
		this.sales_office = sales_office;
	}

	/**
	* 属性 T$ZTESTITEM$SALES_GROUP 的get方法
	* @return String
	*/
	public String getSALES_GROUP() {
		return sales_group;
	}

	/**
	* 属性 T$ZTESTITEM$SALES_GROUP 的set方法
	* @return void
	*/
	public void setSALES_GROUP(String sales_group) {
		this.sales_group = sales_group;
	}

	/**
	* 属性 T$ZTESTITEM$SALES_AREA 的get方法
	* @return String
	*/
	public String getSALES_AREA() {
		return sales_area;
	}

	/**
	* 属性 T$ZTESTITEM$SALES_AREA 的set方法
	* @return void
	*/
	public void setSALES_AREA(String sales_area) {
		this.sales_area = sales_area;
	}

	/**
	* 属性 T$ZTESTITEM$IS_DELETESYS 的get方法
	* @return String
	*/
	public String getIS_DELETESYS() {
		return is_deletesys;
	}

	/**
	* 属性 T$ZTESTITEM$IS_DELETESYS 的set方法
	* @return void
	*/
	public void setIS_DELETESYS(String is_deletesys) {
		this.is_deletesys = is_deletesys;
	}

	/**
	* 属性 T$ZTESTITEM$UPDATE_DATESYS 的get方法
	* @return String
	*/
	public String getUPDATE_DATESYS() {
		return update_datesys;
	}

	/**
	* 属性 T$ZTESTITEM$UPDATE_DATESYS 的set方法
	* @return void
	*/
	public void setUPDATE_DATESYS(String update_datesys) {
		this.update_datesys = update_datesys;
	}

	/**
	* 属性 T$ZTESTITEM$PO_ITEM 的get方法
	* @return String
	*/
	public String getPO_ITEM() {
		return po_item;
	}

	/**
	* 属性 T$ZTESTITEM$PO_ITEM 的set方法
	* @return void
	*/
	public void setPO_ITEM(String po_item) {
		this.po_item = po_item;
	}

	/**
	* 属性 T$ZTESTITEM$VALUE 的get方法
	* @return String
	*/
	public String getVALUE() {
		return value;
	}

	/**
	* 属性 T$ZTESTITEM$VALUE 的set方法
	* @return void
	*/
	public void setVALUE(String value) {
		this.value = value;
	}

	/**
	* 属性 T$ZTESTITEM$HCODENUM 的get方法
	* @return String
	*/
	public String getHCODENUM() {
		return hcodenum;
	}

	/**
	* 属性 T$ZTESTITEM$HCODENUM 的set方法
	* @return void
	*/
	public void setHCODENUM(String hcodenum) {
		this.hcodenum = hcodenum;
	}

	/**
	* 是否删除标志的 set 方法
	*/
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}

	public String getIsDelete() {
		return this.isDelete;
	}

	public String toString() {
		StringBuffer sb = new StringBuffer();

		sb.append(" [ codenum=" + codenum);

		sb.append(", islockstatussys=" + islockstatussys);

		sb.append(", currentusersys=" + currentusersys);

		sb.append(", currentrolesys=" + currentrolesys);

		sb.append(", currentusergorupsys=" + currentusergorupsys);

		sb.append(", currentdepartmentsys=" + currentdepartmentsys);

		sb.append(", isstartrecycle=" + isstartrecycle);

		sb.append(", sharerolesys=" + sharerolesys);

		sb.append(", shareusersys=" + shareusersys);

		sb.append(", sharedepartmentsys=" + sharedepartmentsys);

		sb.append(", shareusergroup=" + shareusergroup);

		sb.append(", sales_org=" + sales_org);

		sb.append(", distr_chan=" + distr_chan);

		sb.append(", division=" + division);

		sb.append(", sales_office=" + sales_office);

		sb.append(", sales_group=" + sales_group);

		sb.append(", sales_area=" + sales_area);

		sb.append(", is_deletesys=" + is_deletesys);

		sb.append(", update_datesys=" + update_datesys);

		sb.append(", po_item=" + po_item);

		sb.append(", value=" + value);

		sb.append(", hcodenum=" + hcodenum);
		sb.append("]");

		return sb.toString();
	}

	//取版本信息
	public static String getVERInfo() {
		return "$Date$,$Author$,$Revision$";
	}

}