/*
 * @(#)Ztestitem.java 
 *
 * Copyright (C) 2002-2008 The Dihua Software Foundation. All rights reserved.
 *
 * ��������ʱ�䣺[Fri Jul 23 15:56:29 CST 2010] ����
 */
package net.mast.demo.ztest.data;

//���� java ��
import java.io.Serializable;

/**
 * ����:�����������Ŀ����DataBean��
 *
 * @author  sp
 * @date    [Fri Jul 23 15:56:29 CST 2010]
 *
 * $Id$
 */
@SuppressWarnings({ "serial", "unused" })
public class Ztestitem implements Serializable {

	/** 
	* �� ����
	*/
	private String codenum;

	/** 
	* �� �Ƿ�����
	*/
	private String islockstatussys;

	/** 
	* �� ��ǰ�û�
	*/
	private String currentusersys;

	/** 
	* �� ��ǰ��ɫ
	*/
	private String currentrolesys;

	/** 
	* �� �û���
	*/
	private String currentusergorupsys;

	/** 
	* �� ��ǰ����
	*/
	private String currentdepartmentsys;

	/** 
	* �� �Ƿ����û���վ
	*/
	private String isstartrecycle;

	/** 
	* �� �����ɫ
	*/
	private String sharerolesys;

	/** 
	* �� �����û�
	*/
	private String shareusersys;

	/** 
	* �� ������
	*/
	private String sharedepartmentsys;

	/** 
	* �� �����û���
	*/
	private String shareusergroup;

	/** 
	* �� ������֯
	*/
	private String sales_org;

	/** 
	* �� ��������
	*/
	private String distr_chan;

	/** 
	* �� ��Ʒ��
	*/
	private String division;

	/** 
	* �� ���۲��ţ����۰칫�ң�
	*/
	private String sales_office;

	/** 
	* �� ������
	*/
	private String sales_group;

	/** 
	* �� ���۵���
	*/
	private String sales_area;

	/** 
	* �� �߼�ɾ����ʶ
	*/
	private String is_deletesys;

	/** 
	* �� �߼�ɾ���ָ�ʱ��
	*/
	private String update_datesys;

	/** 
	* �� ����Ŀ
	*/
	private String po_item;

	/** 
	* �� ֵ
	*/
	private String value;

	/** 
	* �� ��ͷ���
	*/
	private String hcodenum;

	/**
	* Ztestitem���캯��
	*/
	public Ztestitem() {
		super();
	}

	/**
	* �Ƿ�ɾ����־
	*/
	private String isDelete = "0";

	/**
	* ���� T$ZTESTITEM$CODENUM ��get����
	* @return String
	*/
	public String getCODENUM() {
		return codenum;
	}

	/**
	* ���� T$ZTESTITEM$CODENUM ��set����
	* @return void
	*/
	public void setCODENUM(String codenum) {
		this.codenum = codenum;
	}

	/**
	* ���� T$ZTESTITEM$ISLOCKSTATUSSYS ��get����
	* @return String
	*/
	public String getISLOCKSTATUSSYS() {
		return islockstatussys;
	}

	/**
	* ���� T$ZTESTITEM$ISLOCKSTATUSSYS ��set����
	* @return void
	*/
	public void setISLOCKSTATUSSYS(String islockstatussys) {
		this.islockstatussys = islockstatussys;
	}

	/**
	* ���� T$ZTESTITEM$CURRENTUSERSYS ��get����
	* @return String
	*/
	public String getCURRENTUSERSYS() {
		return currentusersys;
	}

	/**
	* ���� T$ZTESTITEM$CURRENTUSERSYS ��set����
	* @return void
	*/
	public void setCURRENTUSERSYS(String currentusersys) {
		this.currentusersys = currentusersys;
	}

	/**
	* ���� T$ZTESTITEM$CURRENTROLESYS ��get����
	* @return String
	*/
	public String getCURRENTROLESYS() {
		return currentrolesys;
	}

	/**
	* ���� T$ZTESTITEM$CURRENTROLESYS ��set����
	* @return void
	*/
	public void setCURRENTROLESYS(String currentrolesys) {
		this.currentrolesys = currentrolesys;
	}

	/**
	* ���� T$ZTESTITEM$CURRENTUSERGORUPSYS ��get����
	* @return String
	*/
	public String getCURRENTUSERGORUPSYS() {
		return currentusergorupsys;
	}

	/**
	* ���� T$ZTESTITEM$CURRENTUSERGORUPSYS ��set����
	* @return void
	*/
	public void setCURRENTUSERGORUPSYS(String currentusergorupsys) {
		this.currentusergorupsys = currentusergorupsys;
	}

	/**
	* ���� T$ZTESTITEM$CURRENTDEPARTMENTSYS ��get����
	* @return String
	*/
	public String getCURRENTDEPARTMENTSYS() {
		return currentdepartmentsys;
	}

	/**
	* ���� T$ZTESTITEM$CURRENTDEPARTMENTSYS ��set����
	* @return void
	*/
	public void setCURRENTDEPARTMENTSYS(String currentdepartmentsys) {
		this.currentdepartmentsys = currentdepartmentsys;
	}

	/**
	* ���� T$ZTESTITEM$ISSTARTRECYCLE ��get����
	* @return String
	*/
	public String getISSTARTRECYCLE() {
		return isstartrecycle;
	}

	/**
	* ���� T$ZTESTITEM$ISSTARTRECYCLE ��set����
	* @return void
	*/
	public void setISSTARTRECYCLE(String isstartrecycle) {
		this.isstartrecycle = isstartrecycle;
	}

	/**
	* ���� T$ZTESTITEM$SHAREROLESYS ��get����
	* @return String
	*/
	public String getSHAREROLESYS() {
		return sharerolesys;
	}

	/**
	* ���� T$ZTESTITEM$SHAREROLESYS ��set����
	* @return void
	*/
	public void setSHAREROLESYS(String sharerolesys) {
		this.sharerolesys = sharerolesys;
	}

	/**
	* ���� T$ZTESTITEM$SHAREUSERSYS ��get����
	* @return String
	*/
	public String getSHAREUSERSYS() {
		return shareusersys;
	}

	/**
	* ���� T$ZTESTITEM$SHAREUSERSYS ��set����
	* @return void
	*/
	public void setSHAREUSERSYS(String shareusersys) {
		this.shareusersys = shareusersys;
	}

	/**
	* ���� T$ZTESTITEM$SHAREDEPARTMENTSYS ��get����
	* @return String
	*/
	public String getSHAREDEPARTMENTSYS() {
		return sharedepartmentsys;
	}

	/**
	* ���� T$ZTESTITEM$SHAREDEPARTMENTSYS ��set����
	* @return void
	*/
	public void setSHAREDEPARTMENTSYS(String sharedepartmentsys) {
		this.sharedepartmentsys = sharedepartmentsys;
	}

	/**
	* ���� T$ZTESTITEM$SHAREUSERGROUP ��get����
	* @return String
	*/
	public String getSHAREUSERGROUP() {
		return shareusergroup;
	}

	/**
	* ���� T$ZTESTITEM$SHAREUSERGROUP ��set����
	* @return void
	*/
	public void setSHAREUSERGROUP(String shareusergroup) {
		this.shareusergroup = shareusergroup;
	}

	/**
	* ���� T$ZTESTITEM$SALES_ORG ��get����
	* @return String
	*/
	public String getSALES_ORG() {
		return sales_org;
	}

	/**
	* ���� T$ZTESTITEM$SALES_ORG ��set����
	* @return void
	*/
	public void setSALES_ORG(String sales_org) {
		this.sales_org = sales_org;
	}

	/**
	* ���� T$ZTESTITEM$DISTR_CHAN ��get����
	* @return String
	*/
	public String getDISTR_CHAN() {
		return distr_chan;
	}

	/**
	* ���� T$ZTESTITEM$DISTR_CHAN ��set����
	* @return void
	*/
	public void setDISTR_CHAN(String distr_chan) {
		this.distr_chan = distr_chan;
	}

	/**
	* ���� T$ZTESTITEM$DIVISION ��get����
	* @return String
	*/
	public String getDIVISION() {
		return division;
	}

	/**
	* ���� T$ZTESTITEM$DIVISION ��set����
	* @return void
	*/
	public void setDIVISION(String division) {
		this.division = division;
	}

	/**
	* ���� T$ZTESTITEM$SALES_OFFICE ��get����
	* @return String
	*/
	public String getSALES_OFFICE() {
		return sales_office;
	}

	/**
	* ���� T$ZTESTITEM$SALES_OFFICE ��set����
	* @return void
	*/
	public void setSALES_OFFICE(String sales_office) {
		this.sales_office = sales_office;
	}

	/**
	* ���� T$ZTESTITEM$SALES_GROUP ��get����
	* @return String
	*/
	public String getSALES_GROUP() {
		return sales_group;
	}

	/**
	* ���� T$ZTESTITEM$SALES_GROUP ��set����
	* @return void
	*/
	public void setSALES_GROUP(String sales_group) {
		this.sales_group = sales_group;
	}

	/**
	* ���� T$ZTESTITEM$SALES_AREA ��get����
	* @return String
	*/
	public String getSALES_AREA() {
		return sales_area;
	}

	/**
	* ���� T$ZTESTITEM$SALES_AREA ��set����
	* @return void
	*/
	public void setSALES_AREA(String sales_area) {
		this.sales_area = sales_area;
	}

	/**
	* ���� T$ZTESTITEM$IS_DELETESYS ��get����
	* @return String
	*/
	public String getIS_DELETESYS() {
		return is_deletesys;
	}

	/**
	* ���� T$ZTESTITEM$IS_DELETESYS ��set����
	* @return void
	*/
	public void setIS_DELETESYS(String is_deletesys) {
		this.is_deletesys = is_deletesys;
	}

	/**
	* ���� T$ZTESTITEM$UPDATE_DATESYS ��get����
	* @return String
	*/
	public String getUPDATE_DATESYS() {
		return update_datesys;
	}

	/**
	* ���� T$ZTESTITEM$UPDATE_DATESYS ��set����
	* @return void
	*/
	public void setUPDATE_DATESYS(String update_datesys) {
		this.update_datesys = update_datesys;
	}

	/**
	* ���� T$ZTESTITEM$PO_ITEM ��get����
	* @return String
	*/
	public String getPO_ITEM() {
		return po_item;
	}

	/**
	* ���� T$ZTESTITEM$PO_ITEM ��set����
	* @return void
	*/
	public void setPO_ITEM(String po_item) {
		this.po_item = po_item;
	}

	/**
	* ���� T$ZTESTITEM$VALUE ��get����
	* @return String
	*/
	public String getVALUE() {
		return value;
	}

	/**
	* ���� T$ZTESTITEM$VALUE ��set����
	* @return void
	*/
	public void setVALUE(String value) {
		this.value = value;
	}

	/**
	* ���� T$ZTESTITEM$HCODENUM ��get����
	* @return String
	*/
	public String getHCODENUM() {
		return hcodenum;
	}

	/**
	* ���� T$ZTESTITEM$HCODENUM ��set����
	* @return void
	*/
	public void setHCODENUM(String hcodenum) {
		this.hcodenum = hcodenum;
	}

	/**
	* �Ƿ�ɾ����־�� set ����
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

	//ȡ�汾��Ϣ
	public static String getVERInfo() {
		return "$Date$,$Author$,$Revision$";
	}

}