
/*
 * @(#)Ztest.java 
 *
 * Copyright (C) 2002-2008 The Dihua Software Foundation. All rights reserved.
 *
 * 程序生成时间：[Fri Jul 23 15:56:29 CST 2010] 生成
 */
package net.mast.demo.ztest.view;

//导入 java 类
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import net.mast.web.taglib.util.IAddEditGrid;

/**
 * 功能:本类测试行数据DataBean类
 *
 * @author  sp
 * @date    [Fri Jul 23 15:56:29 CST 2010]
 *
 * $Id$
 */
@SuppressWarnings({ "unchecked", "unused", "serial" })
public class ZtestView implements Serializable, IAddEditGrid {

	private String sign;//只读/可编辑标记

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	private List listztestitem = new ArrayList();
	//private Exttable exttable;

	/** 
	* 域 主键
	*/
	private String i$ZTEST$CODENUM;

	/** 
	* 域 销售地区
	*/
	private String i$ZTEST$SALES_AREA;

	/** 
	* 域 逻辑删除标识
	*/
	private String i$ZTEST$IS_DELETESYS;

	/** 
	* 域 逻辑删除恢复时间
	*/
	private String i$ZTEST$UPDATE_DATESYS;

	/** 
	* 域 是否启用回收站
	*/
	private String i$ZTEST$ISSTARTRECYCLE;

	/** 
	* 域 共享角色
	*/
	private String i$ZTEST$SHAREROLESYS;

	/** 
	* 域 键
	*/
	private String i$ZTEST$ID;

	/** 
	* 域 键值
	*/
	private String i$ZTEST$VALUE;

	/** 
	* 域 是否被锁定
	*/
	private String i$ZTEST$ISLOCKSTATUSSYS;

	/** 
	* 域 当前用户
	*/
	private String i$ZTEST$CURRENTUSERSYS;

	/** 
	* 域 当前角色
	*/
	private String i$ZTEST$CURRENTROLESYS;

	/** 
	* 域 用户组
	*/
	private String i$ZTEST$CURRENTUSERGORUPSYS;

	/** 
	* 域 产品组
	*/
	private String i$ZTEST$DIVISION;

	/** 
	* 域 销售部门（销售办公室）
	*/
	private String i$ZTEST$SALES_OFFICE;

	/** 
	* 域 销售组
	*/
	private String i$ZTEST$SALES_GROUP;

	/** 
	* 域 共享部门
	*/
	private String i$ZTEST$SHAREDEPARTMENTSYS;

	/** 
	* 域 共享用户组
	*/
	private String i$ZTEST$SHAREUSERGROUP;

	/** 
	* 域 当前部门
	*/
	private String i$ZTEST$CURRENTDEPARTMENTSYS;

	/** 
	* 域 销售组织
	*/
	private String i$ZTEST$SALES_ORG;

	/** 
	* 域 分销渠道
	*/
	private String i$ZTEST$DISTR_CHAN;

	/** 
	* 域 共享用户
	*/
	private String i$ZTEST$SHAREUSERSYS;

	/**
	* 导入附属表属性
	*/

	/**
	* Ztest构造函数
	*/
	public ZtestView() {
		super();
	}

	/**
	 * 多对一从表Ztestitem的get方法
	 * @return
	 */
	public List getListztestitem() {
		return listztestitem;
	}

	/**
	 * 多对一从表Ztestitem的set方法
	 * @param list
	 */
	public void setListztestitem(List list) {
		listztestitem = list;
	}

	/**
	* 属性 I$ZTEST$CODENUM 的get方法
	* @return String
	*/
	public String getI$ZTEST$CODENUM() {
		return i$ZTEST$CODENUM == null ? "" : i$ZTEST$CODENUM;
	}

	/**
	* 属性 I$ZTEST$CODENUM 的set方法
	* @return void
	*/
	public void setI$ZTEST$CODENUM(String i$ZTEST$CODENUM) {
		this.i$ZTEST$CODENUM = i$ZTEST$CODENUM;
	}

	/**
	* 属性 I$ZTEST$SALES_AREA 的get方法
	* @return String
	*/
	public String getI$ZTEST$SALES_AREA() {
		return i$ZTEST$SALES_AREA == null ? "" : i$ZTEST$SALES_AREA;
	}

	/**
	* 属性 I$ZTEST$SALES_AREA 的set方法
	* @return void
	*/
	public void setI$ZTEST$SALES_AREA(String i$ZTEST$SALES_AREA) {
		this.i$ZTEST$SALES_AREA = i$ZTEST$SALES_AREA;
	}

	/**
	* 属性 I$ZTEST$IS_DELETESYS 的get方法
	* @return String
	*/
	public String getI$ZTEST$IS_DELETESYS() {
		return i$ZTEST$IS_DELETESYS == null ? "" : i$ZTEST$IS_DELETESYS;
	}

	/**
	* 属性 I$ZTEST$IS_DELETESYS 的set方法
	* @return void
	*/
	public void setI$ZTEST$IS_DELETESYS(String i$ZTEST$IS_DELETESYS) {
		this.i$ZTEST$IS_DELETESYS = i$ZTEST$IS_DELETESYS;
	}

	/**
	* 属性 I$ZTEST$UPDATE_DATESYS 的get方法
	* @return String
	*/
	public String getI$ZTEST$UPDATE_DATESYS() {
		return i$ZTEST$UPDATE_DATESYS == null ? "" : i$ZTEST$UPDATE_DATESYS;
	}

	/**
	* 属性 I$ZTEST$UPDATE_DATESYS 的set方法
	* @return void
	*/
	public void setI$ZTEST$UPDATE_DATESYS(String i$ZTEST$UPDATE_DATESYS) {
		this.i$ZTEST$UPDATE_DATESYS = i$ZTEST$UPDATE_DATESYS;
	}

	/**
	* 属性 I$ZTEST$ISSTARTRECYCLE 的get方法
	* @return String
	*/
	public String getI$ZTEST$ISSTARTRECYCLE() {
		return i$ZTEST$ISSTARTRECYCLE == null ? "" : i$ZTEST$ISSTARTRECYCLE;
	}

	/**
	* 属性 I$ZTEST$ISSTARTRECYCLE 的set方法
	* @return void
	*/
	public void setI$ZTEST$ISSTARTRECYCLE(String i$ZTEST$ISSTARTRECYCLE) {
		this.i$ZTEST$ISSTARTRECYCLE = i$ZTEST$ISSTARTRECYCLE;
	}

	/**
	* 属性 I$ZTEST$SHAREROLESYS 的get方法
	* @return String
	*/
	public String getI$ZTEST$SHAREROLESYS() {
		return i$ZTEST$SHAREROLESYS == null ? "" : i$ZTEST$SHAREROLESYS;
	}

	/**
	* 属性 I$ZTEST$SHAREROLESYS 的set方法
	* @return void
	*/
	public void setI$ZTEST$SHAREROLESYS(String i$ZTEST$SHAREROLESYS) {
		this.i$ZTEST$SHAREROLESYS = i$ZTEST$SHAREROLESYS;
	}

	/**
	* 属性 I$ZTEST$ID 的get方法
	* @return String
	*/
	public String getI$ZTEST$ID() {
		return i$ZTEST$ID == null ? "" : i$ZTEST$ID;
	}

	/**
	* 属性 I$ZTEST$ID 的set方法
	* @return void
	*/
	public void setI$ZTEST$ID(String i$ZTEST$ID) {
		this.i$ZTEST$ID = i$ZTEST$ID;
	}

	/**
	* 属性 I$ZTEST$VALUE 的get方法
	* @return String
	*/
	public String getI$ZTEST$VALUE() {
		return i$ZTEST$VALUE == null ? "" : i$ZTEST$VALUE;
	}

	/**
	* 属性 I$ZTEST$VALUE 的set方法
	* @return void
	*/
	public void setI$ZTEST$VALUE(String i$ZTEST$VALUE) {
		this.i$ZTEST$VALUE = i$ZTEST$VALUE;
	}

	/**
	* 属性 I$ZTEST$ISLOCKSTATUSSYS 的get方法
	* @return String
	*/
	public String getI$ZTEST$ISLOCKSTATUSSYS() {
		return i$ZTEST$ISLOCKSTATUSSYS == null ? "" : i$ZTEST$ISLOCKSTATUSSYS;
	}

	/**
	* 属性 I$ZTEST$ISLOCKSTATUSSYS 的set方法
	* @return void
	*/
	public void setI$ZTEST$ISLOCKSTATUSSYS(String i$ZTEST$ISLOCKSTATUSSYS) {
		this.i$ZTEST$ISLOCKSTATUSSYS = i$ZTEST$ISLOCKSTATUSSYS;
	}

	/**
	* 属性 I$ZTEST$CURRENTUSERSYS 的get方法
	* @return String
	*/
	public String getI$ZTEST$CURRENTUSERSYS() {
		return i$ZTEST$CURRENTUSERSYS == null ? "" : i$ZTEST$CURRENTUSERSYS;
	}

	/**
	* 属性 I$ZTEST$CURRENTUSERSYS 的set方法
	* @return void
	*/
	public void setI$ZTEST$CURRENTUSERSYS(String i$ZTEST$CURRENTUSERSYS) {
		this.i$ZTEST$CURRENTUSERSYS = i$ZTEST$CURRENTUSERSYS;
	}

	/**
	* 属性 I$ZTEST$CURRENTROLESYS 的get方法
	* @return String
	*/
	public String getI$ZTEST$CURRENTROLESYS() {
		return i$ZTEST$CURRENTROLESYS == null ? "" : i$ZTEST$CURRENTROLESYS;
	}

	/**
	* 属性 I$ZTEST$CURRENTROLESYS 的set方法
	* @return void
	*/
	public void setI$ZTEST$CURRENTROLESYS(String i$ZTEST$CURRENTROLESYS) {
		this.i$ZTEST$CURRENTROLESYS = i$ZTEST$CURRENTROLESYS;
	}

	/**
	* 属性 I$ZTEST$CURRENTUSERGORUPSYS 的get方法
	* @return String
	*/
	public String getI$ZTEST$CURRENTUSERGORUPSYS() {
		return i$ZTEST$CURRENTUSERGORUPSYS == null ? "" : i$ZTEST$CURRENTUSERGORUPSYS;
	}

	/**
	* 属性 I$ZTEST$CURRENTUSERGORUPSYS 的set方法
	* @return void
	*/
	public void setI$ZTEST$CURRENTUSERGORUPSYS(String i$ZTEST$CURRENTUSERGORUPSYS) {
		this.i$ZTEST$CURRENTUSERGORUPSYS = i$ZTEST$CURRENTUSERGORUPSYS;
	}

	/**
	* 属性 I$ZTEST$DIVISION 的get方法
	* @return String
	*/
	public String getI$ZTEST$DIVISION() {
		return i$ZTEST$DIVISION == null ? "" : i$ZTEST$DIVISION;
	}

	/**
	* 属性 I$ZTEST$DIVISION 的set方法
	* @return void
	*/
	public void setI$ZTEST$DIVISION(String i$ZTEST$DIVISION) {
		this.i$ZTEST$DIVISION = i$ZTEST$DIVISION;
	}

	/**
	* 属性 I$ZTEST$SALES_OFFICE 的get方法
	* @return String
	*/
	public String getI$ZTEST$SALES_OFFICE() {
		return i$ZTEST$SALES_OFFICE == null ? "" : i$ZTEST$SALES_OFFICE;
	}

	/**
	* 属性 I$ZTEST$SALES_OFFICE 的set方法
	* @return void
	*/
	public void setI$ZTEST$SALES_OFFICE(String i$ZTEST$SALES_OFFICE) {
		this.i$ZTEST$SALES_OFFICE = i$ZTEST$SALES_OFFICE;
	}

	/**
	* 属性 I$ZTEST$SALES_GROUP 的get方法
	* @return String
	*/
	public String getI$ZTEST$SALES_GROUP() {
		return i$ZTEST$SALES_GROUP == null ? "" : i$ZTEST$SALES_GROUP;
	}

	/**
	* 属性 I$ZTEST$SALES_GROUP 的set方法
	* @return void
	*/
	public void setI$ZTEST$SALES_GROUP(String i$ZTEST$SALES_GROUP) {
		this.i$ZTEST$SALES_GROUP = i$ZTEST$SALES_GROUP;
	}

	/**
	* 属性 I$ZTEST$SHAREDEPARTMENTSYS 的get方法
	* @return String
	*/
	public String getI$ZTEST$SHAREDEPARTMENTSYS() {
		return i$ZTEST$SHAREDEPARTMENTSYS == null ? "" : i$ZTEST$SHAREDEPARTMENTSYS;
	}

	/**
	* 属性 I$ZTEST$SHAREDEPARTMENTSYS 的set方法
	* @return void
	*/
	public void setI$ZTEST$SHAREDEPARTMENTSYS(String i$ZTEST$SHAREDEPARTMENTSYS) {
		this.i$ZTEST$SHAREDEPARTMENTSYS = i$ZTEST$SHAREDEPARTMENTSYS;
	}

	/**
	* 属性 I$ZTEST$SHAREUSERGROUP 的get方法
	* @return String
	*/
	public String getI$ZTEST$SHAREUSERGROUP() {
		return i$ZTEST$SHAREUSERGROUP == null ? "" : i$ZTEST$SHAREUSERGROUP;
	}

	/**
	* 属性 I$ZTEST$SHAREUSERGROUP 的set方法
	* @return void
	*/
	public void setI$ZTEST$SHAREUSERGROUP(String i$ZTEST$SHAREUSERGROUP) {
		this.i$ZTEST$SHAREUSERGROUP = i$ZTEST$SHAREUSERGROUP;
	}

	/**
	* 属性 I$ZTEST$CURRENTDEPARTMENTSYS 的get方法
	* @return String
	*/
	public String getI$ZTEST$CURRENTDEPARTMENTSYS() {
		return i$ZTEST$CURRENTDEPARTMENTSYS == null ? "" : i$ZTEST$CURRENTDEPARTMENTSYS;
	}

	/**
	* 属性 I$ZTEST$CURRENTDEPARTMENTSYS 的set方法
	* @return void
	*/
	public void setI$ZTEST$CURRENTDEPARTMENTSYS(String i$ZTEST$CURRENTDEPARTMENTSYS) {
		this.i$ZTEST$CURRENTDEPARTMENTSYS = i$ZTEST$CURRENTDEPARTMENTSYS;
	}

	/**
	* 属性 I$ZTEST$SALES_ORG 的get方法
	* @return String
	*/
	public String getI$ZTEST$SALES_ORG() {
		return i$ZTEST$SALES_ORG == null ? "" : i$ZTEST$SALES_ORG;
	}

	/**
	* 属性 I$ZTEST$SALES_ORG 的set方法
	* @return void
	*/
	public void setI$ZTEST$SALES_ORG(String i$ZTEST$SALES_ORG) {
		this.i$ZTEST$SALES_ORG = i$ZTEST$SALES_ORG;
	}

	/**
	* 属性 I$ZTEST$DISTR_CHAN 的get方法
	* @return String
	*/
	public String getI$ZTEST$DISTR_CHAN() {
		return i$ZTEST$DISTR_CHAN == null ? "" : i$ZTEST$DISTR_CHAN;
	}

	/**
	* 属性 I$ZTEST$DISTR_CHAN 的set方法
	* @return void
	*/
	public void setI$ZTEST$DISTR_CHAN(String i$ZTEST$DISTR_CHAN) {
		this.i$ZTEST$DISTR_CHAN = i$ZTEST$DISTR_CHAN;
	}

	/**
	* 属性 I$ZTEST$SHAREUSERSYS 的get方法
	* @return String
	*/
	public String getI$ZTEST$SHAREUSERSYS() {
		return i$ZTEST$SHAREUSERSYS == null ? "" : i$ZTEST$SHAREUSERSYS;
	}

	/**
	* 属性 I$ZTEST$SHAREUSERSYS 的set方法
	* @return void
	*/
	public void setI$ZTEST$SHAREUSERSYS(String i$ZTEST$SHAREUSERSYS) {
		this.i$ZTEST$SHAREUSERSYS = i$ZTEST$SHAREUSERSYS;
	}

	/*
	*附属表的属性信息
	*/
	public String toString() {
		StringBuffer sb = new StringBuffer();

		sb.append(" [ i$ZTEST$CODENUM=" + i$ZTEST$CODENUM);

		sb.append(", i$ZTEST$SALES_AREA=" + i$ZTEST$SALES_AREA);

		sb.append(", i$ZTEST$IS_DELETESYS=" + i$ZTEST$IS_DELETESYS);

		sb.append(", i$ZTEST$UPDATE_DATESYS=" + i$ZTEST$UPDATE_DATESYS);

		sb.append(", i$ZTEST$ISSTARTRECYCLE=" + i$ZTEST$ISSTARTRECYCLE);

		sb.append(", i$ZTEST$SHAREROLESYS=" + i$ZTEST$SHAREROLESYS);

		sb.append(", i$ZTEST$ID=" + i$ZTEST$ID);

		sb.append(", i$ZTEST$VALUE=" + i$ZTEST$VALUE);

		sb.append(", i$ZTEST$ISLOCKSTATUSSYS=" + i$ZTEST$ISLOCKSTATUSSYS);

		sb.append(", i$ZTEST$CURRENTUSERSYS=" + i$ZTEST$CURRENTUSERSYS);

		sb.append(", i$ZTEST$CURRENTROLESYS=" + i$ZTEST$CURRENTROLESYS);

		sb.append(", i$ZTEST$CURRENTUSERGORUPSYS=" + i$ZTEST$CURRENTUSERGORUPSYS);

		sb.append(", i$ZTEST$DIVISION=" + i$ZTEST$DIVISION);

		sb.append(", i$ZTEST$SALES_OFFICE=" + i$ZTEST$SALES_OFFICE);

		sb.append(", i$ZTEST$SALES_GROUP=" + i$ZTEST$SALES_GROUP);

		sb.append(", i$ZTEST$SHAREDEPARTMENTSYS=" + i$ZTEST$SHAREDEPARTMENTSYS);

		sb.append(", i$ZTEST$SHAREUSERGROUP=" + i$ZTEST$SHAREUSERGROUP);

		sb.append(", i$ZTEST$CURRENTDEPARTMENTSYS=" + i$ZTEST$CURRENTDEPARTMENTSYS);

		sb.append(", i$ZTEST$SALES_ORG=" + i$ZTEST$SALES_ORG);

		sb.append(", i$ZTEST$DISTR_CHAN=" + i$ZTEST$DISTR_CHAN);

		sb.append(", i$ZTEST$SHAREUSERSYS=" + i$ZTEST$SHAREUSERSYS);
		sb.append("]");

		return sb.toString();
	}

	//取版本信息
	public static String getVERInfo() {
		return "$Date$,$Author$,$Revision$";
	}

	public void setAddGridDetail(String[] arg0) {
		if (arg0 == null) {
			return;
		}
		int itemNum0 = Integer.parseInt(arg0[0]);
		for (int i = 0; i < itemNum0; i++) {
			listztestitem.add(new ZtestitemView());
		}
	}
}