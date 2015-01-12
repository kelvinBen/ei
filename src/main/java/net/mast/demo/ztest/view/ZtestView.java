
/*
 * @(#)Ztest.java 
 *
 * Copyright (C) 2002-2008 The Dihua Software Foundation. All rights reserved.
 *
 * ��������ʱ�䣺[Fri Jul 23 15:56:29 CST 2010] ����
 */
package net.mast.demo.ztest.view;

//���� java ��
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import net.mast.web.taglib.util.IAddEditGrid;

/**
 * ����:�������������DataBean��
 *
 * @author  sp
 * @date    [Fri Jul 23 15:56:29 CST 2010]
 *
 * $Id$
 */
@SuppressWarnings({ "unchecked", "unused", "serial" })
public class ZtestView implements Serializable, IAddEditGrid {

	private String sign;//ֻ��/�ɱ༭���

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	private List listztestitem = new ArrayList();
	//private Exttable exttable;

	/** 
	* �� ����
	*/
	private String i$ZTEST$CODENUM;

	/** 
	* �� ���۵���
	*/
	private String i$ZTEST$SALES_AREA;

	/** 
	* �� �߼�ɾ����ʶ
	*/
	private String i$ZTEST$IS_DELETESYS;

	/** 
	* �� �߼�ɾ���ָ�ʱ��
	*/
	private String i$ZTEST$UPDATE_DATESYS;

	/** 
	* �� �Ƿ����û���վ
	*/
	private String i$ZTEST$ISSTARTRECYCLE;

	/** 
	* �� �����ɫ
	*/
	private String i$ZTEST$SHAREROLESYS;

	/** 
	* �� ��
	*/
	private String i$ZTEST$ID;

	/** 
	* �� ��ֵ
	*/
	private String i$ZTEST$VALUE;

	/** 
	* �� �Ƿ�����
	*/
	private String i$ZTEST$ISLOCKSTATUSSYS;

	/** 
	* �� ��ǰ�û�
	*/
	private String i$ZTEST$CURRENTUSERSYS;

	/** 
	* �� ��ǰ��ɫ
	*/
	private String i$ZTEST$CURRENTROLESYS;

	/** 
	* �� �û���
	*/
	private String i$ZTEST$CURRENTUSERGORUPSYS;

	/** 
	* �� ��Ʒ��
	*/
	private String i$ZTEST$DIVISION;

	/** 
	* �� ���۲��ţ����۰칫�ң�
	*/
	private String i$ZTEST$SALES_OFFICE;

	/** 
	* �� ������
	*/
	private String i$ZTEST$SALES_GROUP;

	/** 
	* �� ������
	*/
	private String i$ZTEST$SHAREDEPARTMENTSYS;

	/** 
	* �� �����û���
	*/
	private String i$ZTEST$SHAREUSERGROUP;

	/** 
	* �� ��ǰ����
	*/
	private String i$ZTEST$CURRENTDEPARTMENTSYS;

	/** 
	* �� ������֯
	*/
	private String i$ZTEST$SALES_ORG;

	/** 
	* �� ��������
	*/
	private String i$ZTEST$DISTR_CHAN;

	/** 
	* �� �����û�
	*/
	private String i$ZTEST$SHAREUSERSYS;

	/**
	* ���븽��������
	*/

	/**
	* Ztest���캯��
	*/
	public ZtestView() {
		super();
	}

	/**
	 * ���һ�ӱ�Ztestitem��get����
	 * @return
	 */
	public List getListztestitem() {
		return listztestitem;
	}

	/**
	 * ���һ�ӱ�Ztestitem��set����
	 * @param list
	 */
	public void setListztestitem(List list) {
		listztestitem = list;
	}

	/**
	* ���� I$ZTEST$CODENUM ��get����
	* @return String
	*/
	public String getI$ZTEST$CODENUM() {
		return i$ZTEST$CODENUM == null ? "" : i$ZTEST$CODENUM;
	}

	/**
	* ���� I$ZTEST$CODENUM ��set����
	* @return void
	*/
	public void setI$ZTEST$CODENUM(String i$ZTEST$CODENUM) {
		this.i$ZTEST$CODENUM = i$ZTEST$CODENUM;
	}

	/**
	* ���� I$ZTEST$SALES_AREA ��get����
	* @return String
	*/
	public String getI$ZTEST$SALES_AREA() {
		return i$ZTEST$SALES_AREA == null ? "" : i$ZTEST$SALES_AREA;
	}

	/**
	* ���� I$ZTEST$SALES_AREA ��set����
	* @return void
	*/
	public void setI$ZTEST$SALES_AREA(String i$ZTEST$SALES_AREA) {
		this.i$ZTEST$SALES_AREA = i$ZTEST$SALES_AREA;
	}

	/**
	* ���� I$ZTEST$IS_DELETESYS ��get����
	* @return String
	*/
	public String getI$ZTEST$IS_DELETESYS() {
		return i$ZTEST$IS_DELETESYS == null ? "" : i$ZTEST$IS_DELETESYS;
	}

	/**
	* ���� I$ZTEST$IS_DELETESYS ��set����
	* @return void
	*/
	public void setI$ZTEST$IS_DELETESYS(String i$ZTEST$IS_DELETESYS) {
		this.i$ZTEST$IS_DELETESYS = i$ZTEST$IS_DELETESYS;
	}

	/**
	* ���� I$ZTEST$UPDATE_DATESYS ��get����
	* @return String
	*/
	public String getI$ZTEST$UPDATE_DATESYS() {
		return i$ZTEST$UPDATE_DATESYS == null ? "" : i$ZTEST$UPDATE_DATESYS;
	}

	/**
	* ���� I$ZTEST$UPDATE_DATESYS ��set����
	* @return void
	*/
	public void setI$ZTEST$UPDATE_DATESYS(String i$ZTEST$UPDATE_DATESYS) {
		this.i$ZTEST$UPDATE_DATESYS = i$ZTEST$UPDATE_DATESYS;
	}

	/**
	* ���� I$ZTEST$ISSTARTRECYCLE ��get����
	* @return String
	*/
	public String getI$ZTEST$ISSTARTRECYCLE() {
		return i$ZTEST$ISSTARTRECYCLE == null ? "" : i$ZTEST$ISSTARTRECYCLE;
	}

	/**
	* ���� I$ZTEST$ISSTARTRECYCLE ��set����
	* @return void
	*/
	public void setI$ZTEST$ISSTARTRECYCLE(String i$ZTEST$ISSTARTRECYCLE) {
		this.i$ZTEST$ISSTARTRECYCLE = i$ZTEST$ISSTARTRECYCLE;
	}

	/**
	* ���� I$ZTEST$SHAREROLESYS ��get����
	* @return String
	*/
	public String getI$ZTEST$SHAREROLESYS() {
		return i$ZTEST$SHAREROLESYS == null ? "" : i$ZTEST$SHAREROLESYS;
	}

	/**
	* ���� I$ZTEST$SHAREROLESYS ��set����
	* @return void
	*/
	public void setI$ZTEST$SHAREROLESYS(String i$ZTEST$SHAREROLESYS) {
		this.i$ZTEST$SHAREROLESYS = i$ZTEST$SHAREROLESYS;
	}

	/**
	* ���� I$ZTEST$ID ��get����
	* @return String
	*/
	public String getI$ZTEST$ID() {
		return i$ZTEST$ID == null ? "" : i$ZTEST$ID;
	}

	/**
	* ���� I$ZTEST$ID ��set����
	* @return void
	*/
	public void setI$ZTEST$ID(String i$ZTEST$ID) {
		this.i$ZTEST$ID = i$ZTEST$ID;
	}

	/**
	* ���� I$ZTEST$VALUE ��get����
	* @return String
	*/
	public String getI$ZTEST$VALUE() {
		return i$ZTEST$VALUE == null ? "" : i$ZTEST$VALUE;
	}

	/**
	* ���� I$ZTEST$VALUE ��set����
	* @return void
	*/
	public void setI$ZTEST$VALUE(String i$ZTEST$VALUE) {
		this.i$ZTEST$VALUE = i$ZTEST$VALUE;
	}

	/**
	* ���� I$ZTEST$ISLOCKSTATUSSYS ��get����
	* @return String
	*/
	public String getI$ZTEST$ISLOCKSTATUSSYS() {
		return i$ZTEST$ISLOCKSTATUSSYS == null ? "" : i$ZTEST$ISLOCKSTATUSSYS;
	}

	/**
	* ���� I$ZTEST$ISLOCKSTATUSSYS ��set����
	* @return void
	*/
	public void setI$ZTEST$ISLOCKSTATUSSYS(String i$ZTEST$ISLOCKSTATUSSYS) {
		this.i$ZTEST$ISLOCKSTATUSSYS = i$ZTEST$ISLOCKSTATUSSYS;
	}

	/**
	* ���� I$ZTEST$CURRENTUSERSYS ��get����
	* @return String
	*/
	public String getI$ZTEST$CURRENTUSERSYS() {
		return i$ZTEST$CURRENTUSERSYS == null ? "" : i$ZTEST$CURRENTUSERSYS;
	}

	/**
	* ���� I$ZTEST$CURRENTUSERSYS ��set����
	* @return void
	*/
	public void setI$ZTEST$CURRENTUSERSYS(String i$ZTEST$CURRENTUSERSYS) {
		this.i$ZTEST$CURRENTUSERSYS = i$ZTEST$CURRENTUSERSYS;
	}

	/**
	* ���� I$ZTEST$CURRENTROLESYS ��get����
	* @return String
	*/
	public String getI$ZTEST$CURRENTROLESYS() {
		return i$ZTEST$CURRENTROLESYS == null ? "" : i$ZTEST$CURRENTROLESYS;
	}

	/**
	* ���� I$ZTEST$CURRENTROLESYS ��set����
	* @return void
	*/
	public void setI$ZTEST$CURRENTROLESYS(String i$ZTEST$CURRENTROLESYS) {
		this.i$ZTEST$CURRENTROLESYS = i$ZTEST$CURRENTROLESYS;
	}

	/**
	* ���� I$ZTEST$CURRENTUSERGORUPSYS ��get����
	* @return String
	*/
	public String getI$ZTEST$CURRENTUSERGORUPSYS() {
		return i$ZTEST$CURRENTUSERGORUPSYS == null ? "" : i$ZTEST$CURRENTUSERGORUPSYS;
	}

	/**
	* ���� I$ZTEST$CURRENTUSERGORUPSYS ��set����
	* @return void
	*/
	public void setI$ZTEST$CURRENTUSERGORUPSYS(String i$ZTEST$CURRENTUSERGORUPSYS) {
		this.i$ZTEST$CURRENTUSERGORUPSYS = i$ZTEST$CURRENTUSERGORUPSYS;
	}

	/**
	* ���� I$ZTEST$DIVISION ��get����
	* @return String
	*/
	public String getI$ZTEST$DIVISION() {
		return i$ZTEST$DIVISION == null ? "" : i$ZTEST$DIVISION;
	}

	/**
	* ���� I$ZTEST$DIVISION ��set����
	* @return void
	*/
	public void setI$ZTEST$DIVISION(String i$ZTEST$DIVISION) {
		this.i$ZTEST$DIVISION = i$ZTEST$DIVISION;
	}

	/**
	* ���� I$ZTEST$SALES_OFFICE ��get����
	* @return String
	*/
	public String getI$ZTEST$SALES_OFFICE() {
		return i$ZTEST$SALES_OFFICE == null ? "" : i$ZTEST$SALES_OFFICE;
	}

	/**
	* ���� I$ZTEST$SALES_OFFICE ��set����
	* @return void
	*/
	public void setI$ZTEST$SALES_OFFICE(String i$ZTEST$SALES_OFFICE) {
		this.i$ZTEST$SALES_OFFICE = i$ZTEST$SALES_OFFICE;
	}

	/**
	* ���� I$ZTEST$SALES_GROUP ��get����
	* @return String
	*/
	public String getI$ZTEST$SALES_GROUP() {
		return i$ZTEST$SALES_GROUP == null ? "" : i$ZTEST$SALES_GROUP;
	}

	/**
	* ���� I$ZTEST$SALES_GROUP ��set����
	* @return void
	*/
	public void setI$ZTEST$SALES_GROUP(String i$ZTEST$SALES_GROUP) {
		this.i$ZTEST$SALES_GROUP = i$ZTEST$SALES_GROUP;
	}

	/**
	* ���� I$ZTEST$SHAREDEPARTMENTSYS ��get����
	* @return String
	*/
	public String getI$ZTEST$SHAREDEPARTMENTSYS() {
		return i$ZTEST$SHAREDEPARTMENTSYS == null ? "" : i$ZTEST$SHAREDEPARTMENTSYS;
	}

	/**
	* ���� I$ZTEST$SHAREDEPARTMENTSYS ��set����
	* @return void
	*/
	public void setI$ZTEST$SHAREDEPARTMENTSYS(String i$ZTEST$SHAREDEPARTMENTSYS) {
		this.i$ZTEST$SHAREDEPARTMENTSYS = i$ZTEST$SHAREDEPARTMENTSYS;
	}

	/**
	* ���� I$ZTEST$SHAREUSERGROUP ��get����
	* @return String
	*/
	public String getI$ZTEST$SHAREUSERGROUP() {
		return i$ZTEST$SHAREUSERGROUP == null ? "" : i$ZTEST$SHAREUSERGROUP;
	}

	/**
	* ���� I$ZTEST$SHAREUSERGROUP ��set����
	* @return void
	*/
	public void setI$ZTEST$SHAREUSERGROUP(String i$ZTEST$SHAREUSERGROUP) {
		this.i$ZTEST$SHAREUSERGROUP = i$ZTEST$SHAREUSERGROUP;
	}

	/**
	* ���� I$ZTEST$CURRENTDEPARTMENTSYS ��get����
	* @return String
	*/
	public String getI$ZTEST$CURRENTDEPARTMENTSYS() {
		return i$ZTEST$CURRENTDEPARTMENTSYS == null ? "" : i$ZTEST$CURRENTDEPARTMENTSYS;
	}

	/**
	* ���� I$ZTEST$CURRENTDEPARTMENTSYS ��set����
	* @return void
	*/
	public void setI$ZTEST$CURRENTDEPARTMENTSYS(String i$ZTEST$CURRENTDEPARTMENTSYS) {
		this.i$ZTEST$CURRENTDEPARTMENTSYS = i$ZTEST$CURRENTDEPARTMENTSYS;
	}

	/**
	* ���� I$ZTEST$SALES_ORG ��get����
	* @return String
	*/
	public String getI$ZTEST$SALES_ORG() {
		return i$ZTEST$SALES_ORG == null ? "" : i$ZTEST$SALES_ORG;
	}

	/**
	* ���� I$ZTEST$SALES_ORG ��set����
	* @return void
	*/
	public void setI$ZTEST$SALES_ORG(String i$ZTEST$SALES_ORG) {
		this.i$ZTEST$SALES_ORG = i$ZTEST$SALES_ORG;
	}

	/**
	* ���� I$ZTEST$DISTR_CHAN ��get����
	* @return String
	*/
	public String getI$ZTEST$DISTR_CHAN() {
		return i$ZTEST$DISTR_CHAN == null ? "" : i$ZTEST$DISTR_CHAN;
	}

	/**
	* ���� I$ZTEST$DISTR_CHAN ��set����
	* @return void
	*/
	public void setI$ZTEST$DISTR_CHAN(String i$ZTEST$DISTR_CHAN) {
		this.i$ZTEST$DISTR_CHAN = i$ZTEST$DISTR_CHAN;
	}

	/**
	* ���� I$ZTEST$SHAREUSERSYS ��get����
	* @return String
	*/
	public String getI$ZTEST$SHAREUSERSYS() {
		return i$ZTEST$SHAREUSERSYS == null ? "" : i$ZTEST$SHAREUSERSYS;
	}

	/**
	* ���� I$ZTEST$SHAREUSERSYS ��set����
	* @return void
	*/
	public void setI$ZTEST$SHAREUSERSYS(String i$ZTEST$SHAREUSERSYS) {
		this.i$ZTEST$SHAREUSERSYS = i$ZTEST$SHAREUSERSYS;
	}

	/*
	*�������������Ϣ
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

	//ȡ�汾��Ϣ
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