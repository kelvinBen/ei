
/*
 * @(#)Ztest.java 
 *
 * Copyright (C) 2002-2009 The DiHua Software Foundation. All rights reserved.
 *
 * 程序生成时间：[Fri Jul 23 15:56:29 CST 2010] 生成
 */
package net.mast.demo.ztest.data;

//导入 java 类
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * 功能:本类测试行数据DataBean类
 *
 * @author  sp
 * @date    [Fri Jul 23 15:56:29 CST 2010]
 *
 * $Id$
 */
@SuppressWarnings({ "serial", "unchecked" })
public class Ztest implements Serializable {
	//定义 从表数据集合
	private List listZtestitem = new ArrayList();;

	/** 
	* 域 主键
	*/
	private String codenum;

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
	* 域 是否启用回收站
	*/
	private String isstartrecycle;

	/** 
	* 域 共享角色
	*/
	private String sharerolesys;

	/** 
	* 域 键
	*/
	private String id;

	/** 
	* 域 键值
	*/
	private String value;

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
	* 域 共享部门
	*/
	private String sharedepartmentsys;

	/** 
	* 域 共享用户组
	*/
	private String shareusergroup;

	/** 
	* 域 当前部门
	*/
	private String currentdepartmentsys;

	/** 
	* 域 销售组织
	*/
	private String sales_org;

	/** 
	* 域 分销渠道
	*/
	private String distr_chan;

	/** 
	* 域 共享用户
	*/
	private String shareusersys;

	/**
	* Ztest构造函数
	*/
	public Ztest() {
		super();
	}

	/**
	* @return
	*/

	public List getListZtestitem() {
		return listZtestitem;
	}

	/**
	 * @param list
	 */
	public void setListZtestitem(List list) {
		listZtestitem = list;
	}

	/**
	* 属性 I$ZTEST$CODENUM 的get方法
	* @return String
	*/
	public String getCODENUM() {
		return codenum;
	}

	/**
	* 属性 I$ZTEST$CODENUM 的set方法
	* @return void
	*/
	public void setCODENUM(String codenum) {
		this.codenum = codenum;
	}

	/**
	* 属性 I$ZTEST$SALES_AREA 的get方法
	* @return String
	*/
	public String getSALES_AREA() {
		return sales_area;
	}

	/**
	* 属性 I$ZTEST$SALES_AREA 的set方法
	* @return void
	*/
	public void setSALES_AREA(String sales_area) {
		this.sales_area = sales_area;
	}

	/**
	* 属性 I$ZTEST$IS_DELETESYS 的get方法
	* @return String
	*/
	public String getIS_DELETESYS() {
		return is_deletesys;
	}

	/**
	* 属性 I$ZTEST$IS_DELETESYS 的set方法
	* @return void
	*/
	public void setIS_DELETESYS(String is_deletesys) {
		this.is_deletesys = is_deletesys;
	}

	/**
	* 属性 I$ZTEST$UPDATE_DATESYS 的get方法
	* @return String
	*/
	public String getUPDATE_DATESYS() {
		return update_datesys;
	}

	/**
	* 属性 I$ZTEST$UPDATE_DATESYS 的set方法
	* @return void
	*/
	public void setUPDATE_DATESYS(String update_datesys) {
		this.update_datesys = update_datesys;
	}

	/**
	* 属性 I$ZTEST$ISSTARTRECYCLE 的get方法
	* @return String
	*/
	public String getISSTARTRECYCLE() {
		return isstartrecycle;
	}

	/**
	* 属性 I$ZTEST$ISSTARTRECYCLE 的set方法
	* @return void
	*/
	public void setISSTARTRECYCLE(String isstartrecycle) {
		this.isstartrecycle = isstartrecycle;
	}

	/**
	* 属性 I$ZTEST$SHAREROLESYS 的get方法
	* @return String
	*/
	public String getSHAREROLESYS() {
		return sharerolesys;
	}

	/**
	* 属性 I$ZTEST$SHAREROLESYS 的set方法
	* @return void
	*/
	public void setSHAREROLESYS(String sharerolesys) {
		this.sharerolesys = sharerolesys;
	}

	/**
	* 属性 I$ZTEST$ID 的get方法
	* @return String
	*/
	public String getID() {
		return id;
	}

	/**
	* 属性 I$ZTEST$ID 的set方法
	* @return void
	*/
	public void setID(String id) {
		this.id = id;
	}

	/**
	* 属性 I$ZTEST$VALUE 的get方法
	* @return String
	*/
	public String getVALUE() {
		return value;
	}

	/**
	* 属性 I$ZTEST$VALUE 的set方法
	* @return void
	*/
	public void setVALUE(String value) {
		this.value = value;
	}

	/**
	* 属性 I$ZTEST$ISLOCKSTATUSSYS 的get方法
	* @return String
	*/
	public String getISLOCKSTATUSSYS() {
		return islockstatussys;
	}

	/**
	* 属性 I$ZTEST$ISLOCKSTATUSSYS 的set方法
	* @return void
	*/
	public void setISLOCKSTATUSSYS(String islockstatussys) {
		this.islockstatussys = islockstatussys;
	}

	/**
	* 属性 I$ZTEST$CURRENTUSERSYS 的get方法
	* @return String
	*/
	public String getCURRENTUSERSYS() {
		return currentusersys;
	}

	/**
	* 属性 I$ZTEST$CURRENTUSERSYS 的set方法
	* @return void
	*/
	public void setCURRENTUSERSYS(String currentusersys) {
		this.currentusersys = currentusersys;
	}

	/**
	* 属性 I$ZTEST$CURRENTROLESYS 的get方法
	* @return String
	*/
	public String getCURRENTROLESYS() {
		return currentrolesys;
	}

	/**
	* 属性 I$ZTEST$CURRENTROLESYS 的set方法
	* @return void
	*/
	public void setCURRENTROLESYS(String currentrolesys) {
		this.currentrolesys = currentrolesys;
	}

	/**
	* 属性 I$ZTEST$CURRENTUSERGORUPSYS 的get方法
	* @return String
	*/
	public String getCURRENTUSERGORUPSYS() {
		return currentusergorupsys;
	}

	/**
	* 属性 I$ZTEST$CURRENTUSERGORUPSYS 的set方法
	* @return void
	*/
	public void setCURRENTUSERGORUPSYS(String currentusergorupsys) {
		this.currentusergorupsys = currentusergorupsys;
	}

	/**
	* 属性 I$ZTEST$DIVISION 的get方法
	* @return String
	*/
	public String getDIVISION() {
		return division;
	}

	/**
	* 属性 I$ZTEST$DIVISION 的set方法
	* @return void
	*/
	public void setDIVISION(String division) {
		this.division = division;
	}

	/**
	* 属性 I$ZTEST$SALES_OFFICE 的get方法
	* @return String
	*/
	public String getSALES_OFFICE() {
		return sales_office;
	}

	/**
	* 属性 I$ZTEST$SALES_OFFICE 的set方法
	* @return void
	*/
	public void setSALES_OFFICE(String sales_office) {
		this.sales_office = sales_office;
	}

	/**
	* 属性 I$ZTEST$SALES_GROUP 的get方法
	* @return String
	*/
	public String getSALES_GROUP() {
		return sales_group;
	}

	/**
	* 属性 I$ZTEST$SALES_GROUP 的set方法
	* @return void
	*/
	public void setSALES_GROUP(String sales_group) {
		this.sales_group = sales_group;
	}

	/**
	* 属性 I$ZTEST$SHAREDEPARTMENTSYS 的get方法
	* @return String
	*/
	public String getSHAREDEPARTMENTSYS() {
		return sharedepartmentsys;
	}

	/**
	* 属性 I$ZTEST$SHAREDEPARTMENTSYS 的set方法
	* @return void
	*/
	public void setSHAREDEPARTMENTSYS(String sharedepartmentsys) {
		this.sharedepartmentsys = sharedepartmentsys;
	}

	/**
	* 属性 I$ZTEST$SHAREUSERGROUP 的get方法
	* @return String
	*/
	public String getSHAREUSERGROUP() {
		return shareusergroup;
	}

	/**
	* 属性 I$ZTEST$SHAREUSERGROUP 的set方法
	* @return void
	*/
	public void setSHAREUSERGROUP(String shareusergroup) {
		this.shareusergroup = shareusergroup;
	}

	/**
	* 属性 I$ZTEST$CURRENTDEPARTMENTSYS 的get方法
	* @return String
	*/
	public String getCURRENTDEPARTMENTSYS() {
		return currentdepartmentsys;
	}

	/**
	* 属性 I$ZTEST$CURRENTDEPARTMENTSYS 的set方法
	* @return void
	*/
	public void setCURRENTDEPARTMENTSYS(String currentdepartmentsys) {
		this.currentdepartmentsys = currentdepartmentsys;
	}

	/**
	* 属性 I$ZTEST$SALES_ORG 的get方法
	* @return String
	*/
	public String getSALES_ORG() {
		return sales_org;
	}

	/**
	* 属性 I$ZTEST$SALES_ORG 的set方法
	* @return void
	*/
	public void setSALES_ORG(String sales_org) {
		this.sales_org = sales_org;
	}

	/**
	* 属性 I$ZTEST$DISTR_CHAN 的get方法
	* @return String
	*/
	public String getDISTR_CHAN() {
		return distr_chan;
	}

	/**
	* 属性 I$ZTEST$DISTR_CHAN 的set方法
	* @return void
	*/
	public void setDISTR_CHAN(String distr_chan) {
		this.distr_chan = distr_chan;
	}

	/**
	* 属性 I$ZTEST$SHAREUSERSYS 的get方法
	* @return String
	*/
	public String getSHAREUSERSYS() {
		return shareusersys;
	}

	/**
	* 属性 I$ZTEST$SHAREUSERSYS 的set方法
	* @return void
	*/
	public void setSHAREUSERSYS(String shareusersys) {
		this.shareusersys = shareusersys;
	}

	public String toString() {
		StringBuffer sb = new StringBuffer();

		sb.append(" [ codenum=" + codenum);

		sb.append(", sales_area=" + sales_area);

		sb.append(", is_deletesys=" + is_deletesys);

		sb.append(", update_datesys=" + update_datesys);

		sb.append(", isstartrecycle=" + isstartrecycle);

		sb.append(", sharerolesys=" + sharerolesys);

		sb.append(", id=" + id);

		sb.append(", value=" + value);

		sb.append(", islockstatussys=" + islockstatussys);

		sb.append(", currentusersys=" + currentusersys);

		sb.append(", currentrolesys=" + currentrolesys);

		sb.append(", currentusergorupsys=" + currentusergorupsys);

		sb.append(", division=" + division);

		sb.append(", sales_office=" + sales_office);

		sb.append(", sales_group=" + sales_group);

		sb.append(", sharedepartmentsys=" + sharedepartmentsys);

		sb.append(", shareusergroup=" + shareusergroup);

		sb.append(", currentdepartmentsys=" + currentdepartmentsys);

		sb.append(", sales_org=" + sales_org);

		sb.append(", distr_chan=" + distr_chan);

		sb.append(", shareusersys=" + shareusersys);
		sb.append("]");

		return sb.toString();
	}

	/**
	* 取版本信息
	*/
	public static String getVERInfo() {
		return "$Date$,$Author$,$Revision$";
	}

}