/*
 * @(#)ZtestitemView.java 
 *
 * Copyright (C) 2002-2008 The Dihua Software Foundation. All rights reserved.
 *
 * ��������ʱ�䣺[Fri Jul 23 15:56:29 CST 2010] ����
 */

package net.mast.demo.ztest.view;

//���� java ��
import java.io.Serializable;

/**
 * ����:�����������Ŀ������ʾview��
 *
 * @author  sp
 * @date    [Fri Jul 23 15:56:29 CST 2010]
 *
 * $Id$
 */
@SuppressWarnings({ "serial", "unused" })
public class ZtestitemView implements Serializable {

	private String sign;//ֻ��/�ɱ༭���

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	/** 
	* �� ����
	*/
	private String t$ZTESTITEM$CODENUM;

	/** 
	* �� �Ƿ�����
	*/
	private String t$ZTESTITEM$ISLOCKSTATUSSYS;

	/** 
	* �� ��ǰ�û�
	*/
	private String t$ZTESTITEM$CURRENTUSERSYS;

	/** 
	* �� ��ǰ��ɫ
	*/
	private String t$ZTESTITEM$CURRENTROLESYS;

	/** 
	* �� �û���
	*/
	private String t$ZTESTITEM$CURRENTUSERGORUPSYS;

	/** 
	* �� ��ǰ����
	*/
	private String t$ZTESTITEM$CURRENTDEPARTMENTSYS;

	/** 
	* �� �Ƿ����û���վ
	*/
	private String t$ZTESTITEM$ISSTARTRECYCLE;

	/** 
	* �� �����ɫ
	*/
	private String t$ZTESTITEM$SHAREROLESYS;

	/** 
	* �� �����û�
	*/
	private String t$ZTESTITEM$SHAREUSERSYS;

	/** 
	* �� ������
	*/
	private String t$ZTESTITEM$SHAREDEPARTMENTSYS;

	/** 
	* �� �����û���
	*/
	private String t$ZTESTITEM$SHAREUSERGROUP;

	/** 
	* �� ������֯
	*/
	private String t$ZTESTITEM$SALES_ORG;

	/** 
	* �� ��������
	*/
	private String t$ZTESTITEM$DISTR_CHAN;

	/** 
	* �� ��Ʒ��
	*/
	private String t$ZTESTITEM$DIVISION;

	/** 
	* �� ���۲��ţ����۰칫�ң�
	*/
	private String t$ZTESTITEM$SALES_OFFICE;

	/** 
	* �� ������
	*/
	private String t$ZTESTITEM$SALES_GROUP;

	/** 
	* �� ���۵���
	*/
	private String t$ZTESTITEM$SALES_AREA;

	/** 
	* �� �߼�ɾ����ʶ
	*/
	private String t$ZTESTITEM$IS_DELETESYS;

	/** 
	* �� �߼�ɾ���ָ�ʱ��
	*/
	private String t$ZTESTITEM$UPDATE_DATESYS;

	/** 
	* �� ����Ŀ
	*/
	private String t$ZTESTITEM$PO_ITEM;

	/** 
	* �� ֵ
	*/
	private String t$ZTESTITEM$VALUE;

	/** 
	* �� ��ͷ���
	*/
	private String t$ZTESTITEM$HCODENUM;

	/**
	* Ztestitem���캯��
	*/
	public ZtestitemView() {
		super();
	}

	/**
	* �Ƿ�ɾ����־
	*/
	private int isDelete;

	/**
	* ���� T$ZTESTITEM$CODENUM ��get����
	* @return String T$ZTESTITEM$CODENUM
	*/
	public String getT$ZTESTITEM$CODENUM() {
		return t$ZTESTITEM$CODENUM == null ? "" : t$ZTESTITEM$CODENUM;
	}

	/**
	* ���� T$ZTESTITEM$CODENUM ��set����
	* @return void
	*/
	public void setT$ZTESTITEM$CODENUM(String t$ZTESTITEM$CODENUM) {
		this.t$ZTESTITEM$CODENUM = t$ZTESTITEM$CODENUM;
	}

	/**
	* ���� T$ZTESTITEM$ISLOCKSTATUSSYS ��get����
	* @return String T$ZTESTITEM$ISLOCKSTATUSSYS
	*/
	public String getT$ZTESTITEM$ISLOCKSTATUSSYS() {
		return t$ZTESTITEM$ISLOCKSTATUSSYS == null ? "" : t$ZTESTITEM$ISLOCKSTATUSSYS;
	}

	/**
	* ���� T$ZTESTITEM$ISLOCKSTATUSSYS ��set����
	* @return void
	*/
	public void setT$ZTESTITEM$ISLOCKSTATUSSYS(String t$ZTESTITEM$ISLOCKSTATUSSYS) {
		this.t$ZTESTITEM$ISLOCKSTATUSSYS = t$ZTESTITEM$ISLOCKSTATUSSYS;
	}

	/**
	* ���� T$ZTESTITEM$CURRENTUSERSYS ��get����
	* @return String T$ZTESTITEM$CURRENTUSERSYS
	*/
	public String getT$ZTESTITEM$CURRENTUSERSYS() {
		return t$ZTESTITEM$CURRENTUSERSYS == null ? "" : t$ZTESTITEM$CURRENTUSERSYS;
	}

	/**
	* ���� T$ZTESTITEM$CURRENTUSERSYS ��set����
	* @return void
	*/
	public void setT$ZTESTITEM$CURRENTUSERSYS(String t$ZTESTITEM$CURRENTUSERSYS) {
		this.t$ZTESTITEM$CURRENTUSERSYS = t$ZTESTITEM$CURRENTUSERSYS;
	}

	/**
	* ���� T$ZTESTITEM$CURRENTROLESYS ��get����
	* @return String T$ZTESTITEM$CURRENTROLESYS
	*/
	public String getT$ZTESTITEM$CURRENTROLESYS() {
		return t$ZTESTITEM$CURRENTROLESYS == null ? "" : t$ZTESTITEM$CURRENTROLESYS;
	}

	/**
	* ���� T$ZTESTITEM$CURRENTROLESYS ��set����
	* @return void
	*/
	public void setT$ZTESTITEM$CURRENTROLESYS(String t$ZTESTITEM$CURRENTROLESYS) {
		this.t$ZTESTITEM$CURRENTROLESYS = t$ZTESTITEM$CURRENTROLESYS;
	}

	/**
	* ���� T$ZTESTITEM$CURRENTUSERGORUPSYS ��get����
	* @return String T$ZTESTITEM$CURRENTUSERGORUPSYS
	*/
	public String getT$ZTESTITEM$CURRENTUSERGORUPSYS() {
		return t$ZTESTITEM$CURRENTUSERGORUPSYS == null ? "" : t$ZTESTITEM$CURRENTUSERGORUPSYS;
	}

	/**
	* ���� T$ZTESTITEM$CURRENTUSERGORUPSYS ��set����
	* @return void
	*/
	public void setT$ZTESTITEM$CURRENTUSERGORUPSYS(String t$ZTESTITEM$CURRENTUSERGORUPSYS) {
		this.t$ZTESTITEM$CURRENTUSERGORUPSYS = t$ZTESTITEM$CURRENTUSERGORUPSYS;
	}

	/**
	* ���� T$ZTESTITEM$CURRENTDEPARTMENTSYS ��get����
	* @return String T$ZTESTITEM$CURRENTDEPARTMENTSYS
	*/
	public String getT$ZTESTITEM$CURRENTDEPARTMENTSYS() {
		return t$ZTESTITEM$CURRENTDEPARTMENTSYS == null ? "" : t$ZTESTITEM$CURRENTDEPARTMENTSYS;
	}

	/**
	* ���� T$ZTESTITEM$CURRENTDEPARTMENTSYS ��set����
	* @return void
	*/
	public void setT$ZTESTITEM$CURRENTDEPARTMENTSYS(String t$ZTESTITEM$CURRENTDEPARTMENTSYS) {
		this.t$ZTESTITEM$CURRENTDEPARTMENTSYS = t$ZTESTITEM$CURRENTDEPARTMENTSYS;
	}

	/**
	* ���� T$ZTESTITEM$ISSTARTRECYCLE ��get����
	* @return String T$ZTESTITEM$ISSTARTRECYCLE
	*/
	public String getT$ZTESTITEM$ISSTARTRECYCLE() {
		return t$ZTESTITEM$ISSTARTRECYCLE == null ? "" : t$ZTESTITEM$ISSTARTRECYCLE;
	}

	/**
	* ���� T$ZTESTITEM$ISSTARTRECYCLE ��set����
	* @return void
	*/
	public void setT$ZTESTITEM$ISSTARTRECYCLE(String t$ZTESTITEM$ISSTARTRECYCLE) {
		this.t$ZTESTITEM$ISSTARTRECYCLE = t$ZTESTITEM$ISSTARTRECYCLE;
	}

	/**
	* ���� T$ZTESTITEM$SHAREROLESYS ��get����
	* @return String T$ZTESTITEM$SHAREROLESYS
	*/
	public String getT$ZTESTITEM$SHAREROLESYS() {
		return t$ZTESTITEM$SHAREROLESYS == null ? "" : t$ZTESTITEM$SHAREROLESYS;
	}

	/**
	* ���� T$ZTESTITEM$SHAREROLESYS ��set����
	* @return void
	*/
	public void setT$ZTESTITEM$SHAREROLESYS(String t$ZTESTITEM$SHAREROLESYS) {
		this.t$ZTESTITEM$SHAREROLESYS = t$ZTESTITEM$SHAREROLESYS;
	}

	/**
	* ���� T$ZTESTITEM$SHAREUSERSYS ��get����
	* @return String T$ZTESTITEM$SHAREUSERSYS
	*/
	public String getT$ZTESTITEM$SHAREUSERSYS() {
		return t$ZTESTITEM$SHAREUSERSYS == null ? "" : t$ZTESTITEM$SHAREUSERSYS;
	}

	/**
	* ���� T$ZTESTITEM$SHAREUSERSYS ��set����
	* @return void
	*/
	public void setT$ZTESTITEM$SHAREUSERSYS(String t$ZTESTITEM$SHAREUSERSYS) {
		this.t$ZTESTITEM$SHAREUSERSYS = t$ZTESTITEM$SHAREUSERSYS;
	}

	/**
	* ���� T$ZTESTITEM$SHAREDEPARTMENTSYS ��get����
	* @return String T$ZTESTITEM$SHAREDEPARTMENTSYS
	*/
	public String getT$ZTESTITEM$SHAREDEPARTMENTSYS() {
		return t$ZTESTITEM$SHAREDEPARTMENTSYS == null ? "" : t$ZTESTITEM$SHAREDEPARTMENTSYS;
	}

	/**
	* ���� T$ZTESTITEM$SHAREDEPARTMENTSYS ��set����
	* @return void
	*/
	public void setT$ZTESTITEM$SHAREDEPARTMENTSYS(String t$ZTESTITEM$SHAREDEPARTMENTSYS) {
		this.t$ZTESTITEM$SHAREDEPARTMENTSYS = t$ZTESTITEM$SHAREDEPARTMENTSYS;
	}

	/**
	* ���� T$ZTESTITEM$SHAREUSERGROUP ��get����
	* @return String T$ZTESTITEM$SHAREUSERGROUP
	*/
	public String getT$ZTESTITEM$SHAREUSERGROUP() {
		return t$ZTESTITEM$SHAREUSERGROUP == null ? "" : t$ZTESTITEM$SHAREUSERGROUP;
	}

	/**
	* ���� T$ZTESTITEM$SHAREUSERGROUP ��set����
	* @return void
	*/
	public void setT$ZTESTITEM$SHAREUSERGROUP(String t$ZTESTITEM$SHAREUSERGROUP) {
		this.t$ZTESTITEM$SHAREUSERGROUP = t$ZTESTITEM$SHAREUSERGROUP;
	}

	/**
	* ���� T$ZTESTITEM$SALES_ORG ��get����
	* @return String T$ZTESTITEM$SALES_ORG
	*/
	public String getT$ZTESTITEM$SALES_ORG() {
		return t$ZTESTITEM$SALES_ORG == null ? "" : t$ZTESTITEM$SALES_ORG;
	}

	/**
	* ���� T$ZTESTITEM$SALES_ORG ��set����
	* @return void
	*/
	public void setT$ZTESTITEM$SALES_ORG(String t$ZTESTITEM$SALES_ORG) {
		this.t$ZTESTITEM$SALES_ORG = t$ZTESTITEM$SALES_ORG;
	}

	/**
	* ���� T$ZTESTITEM$DISTR_CHAN ��get����
	* @return String T$ZTESTITEM$DISTR_CHAN
	*/
	public String getT$ZTESTITEM$DISTR_CHAN() {
		return t$ZTESTITEM$DISTR_CHAN == null ? "" : t$ZTESTITEM$DISTR_CHAN;
	}

	/**
	* ���� T$ZTESTITEM$DISTR_CHAN ��set����
	* @return void
	*/
	public void setT$ZTESTITEM$DISTR_CHAN(String t$ZTESTITEM$DISTR_CHAN) {
		this.t$ZTESTITEM$DISTR_CHAN = t$ZTESTITEM$DISTR_CHAN;
	}

	/**
	* ���� T$ZTESTITEM$DIVISION ��get����
	* @return String T$ZTESTITEM$DIVISION
	*/
	public String getT$ZTESTITEM$DIVISION() {
		return t$ZTESTITEM$DIVISION == null ? "" : t$ZTESTITEM$DIVISION;
	}

	/**
	* ���� T$ZTESTITEM$DIVISION ��set����
	* @return void
	*/
	public void setT$ZTESTITEM$DIVISION(String t$ZTESTITEM$DIVISION) {
		this.t$ZTESTITEM$DIVISION = t$ZTESTITEM$DIVISION;
	}

	/**
	* ���� T$ZTESTITEM$SALES_OFFICE ��get����
	* @return String T$ZTESTITEM$SALES_OFFICE
	*/
	public String getT$ZTESTITEM$SALES_OFFICE() {
		return t$ZTESTITEM$SALES_OFFICE == null ? "" : t$ZTESTITEM$SALES_OFFICE;
	}

	/**
	* ���� T$ZTESTITEM$SALES_OFFICE ��set����
	* @return void
	*/
	public void setT$ZTESTITEM$SALES_OFFICE(String t$ZTESTITEM$SALES_OFFICE) {
		this.t$ZTESTITEM$SALES_OFFICE = t$ZTESTITEM$SALES_OFFICE;
	}

	/**
	* ���� T$ZTESTITEM$SALES_GROUP ��get����
	* @return String T$ZTESTITEM$SALES_GROUP
	*/
	public String getT$ZTESTITEM$SALES_GROUP() {
		return t$ZTESTITEM$SALES_GROUP == null ? "" : t$ZTESTITEM$SALES_GROUP;
	}

	/**
	* ���� T$ZTESTITEM$SALES_GROUP ��set����
	* @return void
	*/
	public void setT$ZTESTITEM$SALES_GROUP(String t$ZTESTITEM$SALES_GROUP) {
		this.t$ZTESTITEM$SALES_GROUP = t$ZTESTITEM$SALES_GROUP;
	}

	/**
	* ���� T$ZTESTITEM$SALES_AREA ��get����
	* @return String T$ZTESTITEM$SALES_AREA
	*/
	public String getT$ZTESTITEM$SALES_AREA() {
		return t$ZTESTITEM$SALES_AREA == null ? "" : t$ZTESTITEM$SALES_AREA;
	}

	/**
	* ���� T$ZTESTITEM$SALES_AREA ��set����
	* @return void
	*/
	public void setT$ZTESTITEM$SALES_AREA(String t$ZTESTITEM$SALES_AREA) {
		this.t$ZTESTITEM$SALES_AREA = t$ZTESTITEM$SALES_AREA;
	}

	/**
	* ���� T$ZTESTITEM$IS_DELETESYS ��get����
	* @return String T$ZTESTITEM$IS_DELETESYS
	*/
	public String getT$ZTESTITEM$IS_DELETESYS() {
		return t$ZTESTITEM$IS_DELETESYS == null ? "" : t$ZTESTITEM$IS_DELETESYS;
	}

	/**
	* ���� T$ZTESTITEM$IS_DELETESYS ��set����
	* @return void
	*/
	public void setT$ZTESTITEM$IS_DELETESYS(String t$ZTESTITEM$IS_DELETESYS) {
		this.t$ZTESTITEM$IS_DELETESYS = t$ZTESTITEM$IS_DELETESYS;
	}

	/**
	* ���� T$ZTESTITEM$UPDATE_DATESYS ��get����
	* @return String T$ZTESTITEM$UPDATE_DATESYS
	*/
	public String getT$ZTESTITEM$UPDATE_DATESYS() {
		return t$ZTESTITEM$UPDATE_DATESYS == null ? "" : t$ZTESTITEM$UPDATE_DATESYS;
	}

	/**
	* ���� T$ZTESTITEM$UPDATE_DATESYS ��set����
	* @return void
	*/
	public void setT$ZTESTITEM$UPDATE_DATESYS(String t$ZTESTITEM$UPDATE_DATESYS) {
		this.t$ZTESTITEM$UPDATE_DATESYS = t$ZTESTITEM$UPDATE_DATESYS;
	}

	/**
	* ���� T$ZTESTITEM$PO_ITEM ��get����
	* @return String T$ZTESTITEM$PO_ITEM
	*/
	public String getT$ZTESTITEM$PO_ITEM() {
		return t$ZTESTITEM$PO_ITEM == null ? "" : t$ZTESTITEM$PO_ITEM;
	}

	/**
	* ���� T$ZTESTITEM$PO_ITEM ��set����
	* @return void
	*/
	public void setT$ZTESTITEM$PO_ITEM(String t$ZTESTITEM$PO_ITEM) {
		this.t$ZTESTITEM$PO_ITEM = t$ZTESTITEM$PO_ITEM;
	}

	/**
	* ���� T$ZTESTITEM$VALUE ��get����
	* @return String T$ZTESTITEM$VALUE
	*/
	public String getT$ZTESTITEM$VALUE() {
		return t$ZTESTITEM$VALUE == null ? "" : t$ZTESTITEM$VALUE;
	}

	/**
	* ���� T$ZTESTITEM$VALUE ��set����
	* @return void
	*/
	public void setT$ZTESTITEM$VALUE(String t$ZTESTITEM$VALUE) {
		this.t$ZTESTITEM$VALUE = t$ZTESTITEM$VALUE;
	}

	/**
	* ���� T$ZTESTITEM$HCODENUM ��get����
	* @return String T$ZTESTITEM$HCODENUM
	*/
	public String getT$ZTESTITEM$HCODENUM() {
		return t$ZTESTITEM$HCODENUM == null ? "" : t$ZTESTITEM$HCODENUM;
	}

	/**
	* ���� T$ZTESTITEM$HCODENUM ��set����
	* @return void
	*/
	public void setT$ZTESTITEM$HCODENUM(String t$ZTESTITEM$HCODENUM) {
		this.t$ZTESTITEM$HCODENUM = t$ZTESTITEM$HCODENUM;
	}

	/**
	* �Ƿ�ɾ����־�� set ����
	*/
	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}

	public int getIsDelete() {
		return this.isDelete;
	}

	public String toString() {
		StringBuffer sb = new StringBuffer();
		sb.append(" [ t$ZTESTITEM$CODENUM=" + getT$ZTESTITEM$CODENUM());
		sb.append(", t$ZTESTITEM$ISLOCKSTATUSSYS=" + getT$ZTESTITEM$ISLOCKSTATUSSYS());
		sb.append(", t$ZTESTITEM$CURRENTUSERSYS=" + getT$ZTESTITEM$CURRENTUSERSYS());
		sb.append(", t$ZTESTITEM$CURRENTROLESYS=" + getT$ZTESTITEM$CURRENTROLESYS());
		sb.append(", t$ZTESTITEM$CURRENTUSERGORUPSYS=" + getT$ZTESTITEM$CURRENTUSERGORUPSYS());
		sb.append(", t$ZTESTITEM$CURRENTDEPARTMENTSYS=" + getT$ZTESTITEM$CURRENTDEPARTMENTSYS());
		sb.append(", t$ZTESTITEM$ISSTARTRECYCLE=" + getT$ZTESTITEM$ISSTARTRECYCLE());
		sb.append(", t$ZTESTITEM$SHAREROLESYS=" + getT$ZTESTITEM$SHAREROLESYS());
		sb.append(", t$ZTESTITEM$SHAREUSERSYS=" + getT$ZTESTITEM$SHAREUSERSYS());
		sb.append(", t$ZTESTITEM$SHAREDEPARTMENTSYS=" + getT$ZTESTITEM$SHAREDEPARTMENTSYS());
		sb.append(", t$ZTESTITEM$SHAREUSERGROUP=" + getT$ZTESTITEM$SHAREUSERGROUP());
		sb.append(", t$ZTESTITEM$SALES_ORG=" + getT$ZTESTITEM$SALES_ORG());
		sb.append(", t$ZTESTITEM$DISTR_CHAN=" + getT$ZTESTITEM$DISTR_CHAN());
		sb.append(", t$ZTESTITEM$DIVISION=" + getT$ZTESTITEM$DIVISION());
		sb.append(", t$ZTESTITEM$SALES_OFFICE=" + getT$ZTESTITEM$SALES_OFFICE());
		sb.append(", t$ZTESTITEM$SALES_GROUP=" + getT$ZTESTITEM$SALES_GROUP());
		sb.append(", t$ZTESTITEM$SALES_AREA=" + getT$ZTESTITEM$SALES_AREA());
		sb.append(", t$ZTESTITEM$IS_DELETESYS=" + getT$ZTESTITEM$IS_DELETESYS());
		sb.append(", t$ZTESTITEM$UPDATE_DATESYS=" + getT$ZTESTITEM$UPDATE_DATESYS());
		sb.append(", t$ZTESTITEM$PO_ITEM=" + getT$ZTESTITEM$PO_ITEM());
		sb.append(", t$ZTESTITEM$VALUE=" + getT$ZTESTITEM$VALUE());
		sb.append(", t$ZTESTITEM$HCODENUM=" + getT$ZTESTITEM$HCODENUM());
		sb.append("]");

		return sb.toString();
	}

	//ȡ�汾��Ϣ
	public static String getVERInfo() {
		return "$Date$,$Author$,$Revision$";
	}
}