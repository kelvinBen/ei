
/*
 * @(#)Ztest.java 
 *
 * Copyright (C) 2002-2009 The DiHua Software Foundation. All rights reserved.
 *
 * ��������ʱ�䣺[Fri Jul 23 15:56:29 CST 2010] ����
 */
package net.mast.demo.ztest.data;

//���� java ��
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * ����:�������������DataBean��
 *
 * @author  sp
 * @date    [Fri Jul 23 15:56:29 CST 2010]
 *
 * $Id$
 */
@SuppressWarnings({ "serial", "unchecked" })
public class Ztest implements Serializable {
	//���� �ӱ����ݼ���
	private List listZtestitem = new ArrayList();;

	/** 
	* �� ����
	*/
	private String codenum;

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
	* �� �Ƿ����û���վ
	*/
	private String isstartrecycle;

	/** 
	* �� �����ɫ
	*/
	private String sharerolesys;

	/** 
	* �� ��
	*/
	private String id;

	/** 
	* �� ��ֵ
	*/
	private String value;

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
	* �� ������
	*/
	private String sharedepartmentsys;

	/** 
	* �� �����û���
	*/
	private String shareusergroup;

	/** 
	* �� ��ǰ����
	*/
	private String currentdepartmentsys;

	/** 
	* �� ������֯
	*/
	private String sales_org;

	/** 
	* �� ��������
	*/
	private String distr_chan;

	/** 
	* �� �����û�
	*/
	private String shareusersys;

	/**
	* Ztest���캯��
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
	* ���� I$ZTEST$CODENUM ��get����
	* @return String
	*/
	public String getCODENUM() {
		return codenum;
	}

	/**
	* ���� I$ZTEST$CODENUM ��set����
	* @return void
	*/
	public void setCODENUM(String codenum) {
		this.codenum = codenum;
	}

	/**
	* ���� I$ZTEST$SALES_AREA ��get����
	* @return String
	*/
	public String getSALES_AREA() {
		return sales_area;
	}

	/**
	* ���� I$ZTEST$SALES_AREA ��set����
	* @return void
	*/
	public void setSALES_AREA(String sales_area) {
		this.sales_area = sales_area;
	}

	/**
	* ���� I$ZTEST$IS_DELETESYS ��get����
	* @return String
	*/
	public String getIS_DELETESYS() {
		return is_deletesys;
	}

	/**
	* ���� I$ZTEST$IS_DELETESYS ��set����
	* @return void
	*/
	public void setIS_DELETESYS(String is_deletesys) {
		this.is_deletesys = is_deletesys;
	}

	/**
	* ���� I$ZTEST$UPDATE_DATESYS ��get����
	* @return String
	*/
	public String getUPDATE_DATESYS() {
		return update_datesys;
	}

	/**
	* ���� I$ZTEST$UPDATE_DATESYS ��set����
	* @return void
	*/
	public void setUPDATE_DATESYS(String update_datesys) {
		this.update_datesys = update_datesys;
	}

	/**
	* ���� I$ZTEST$ISSTARTRECYCLE ��get����
	* @return String
	*/
	public String getISSTARTRECYCLE() {
		return isstartrecycle;
	}

	/**
	* ���� I$ZTEST$ISSTARTRECYCLE ��set����
	* @return void
	*/
	public void setISSTARTRECYCLE(String isstartrecycle) {
		this.isstartrecycle = isstartrecycle;
	}

	/**
	* ���� I$ZTEST$SHAREROLESYS ��get����
	* @return String
	*/
	public String getSHAREROLESYS() {
		return sharerolesys;
	}

	/**
	* ���� I$ZTEST$SHAREROLESYS ��set����
	* @return void
	*/
	public void setSHAREROLESYS(String sharerolesys) {
		this.sharerolesys = sharerolesys;
	}

	/**
	* ���� I$ZTEST$ID ��get����
	* @return String
	*/
	public String getID() {
		return id;
	}

	/**
	* ���� I$ZTEST$ID ��set����
	* @return void
	*/
	public void setID(String id) {
		this.id = id;
	}

	/**
	* ���� I$ZTEST$VALUE ��get����
	* @return String
	*/
	public String getVALUE() {
		return value;
	}

	/**
	* ���� I$ZTEST$VALUE ��set����
	* @return void
	*/
	public void setVALUE(String value) {
		this.value = value;
	}

	/**
	* ���� I$ZTEST$ISLOCKSTATUSSYS ��get����
	* @return String
	*/
	public String getISLOCKSTATUSSYS() {
		return islockstatussys;
	}

	/**
	* ���� I$ZTEST$ISLOCKSTATUSSYS ��set����
	* @return void
	*/
	public void setISLOCKSTATUSSYS(String islockstatussys) {
		this.islockstatussys = islockstatussys;
	}

	/**
	* ���� I$ZTEST$CURRENTUSERSYS ��get����
	* @return String
	*/
	public String getCURRENTUSERSYS() {
		return currentusersys;
	}

	/**
	* ���� I$ZTEST$CURRENTUSERSYS ��set����
	* @return void
	*/
	public void setCURRENTUSERSYS(String currentusersys) {
		this.currentusersys = currentusersys;
	}

	/**
	* ���� I$ZTEST$CURRENTROLESYS ��get����
	* @return String
	*/
	public String getCURRENTROLESYS() {
		return currentrolesys;
	}

	/**
	* ���� I$ZTEST$CURRENTROLESYS ��set����
	* @return void
	*/
	public void setCURRENTROLESYS(String currentrolesys) {
		this.currentrolesys = currentrolesys;
	}

	/**
	* ���� I$ZTEST$CURRENTUSERGORUPSYS ��get����
	* @return String
	*/
	public String getCURRENTUSERGORUPSYS() {
		return currentusergorupsys;
	}

	/**
	* ���� I$ZTEST$CURRENTUSERGORUPSYS ��set����
	* @return void
	*/
	public void setCURRENTUSERGORUPSYS(String currentusergorupsys) {
		this.currentusergorupsys = currentusergorupsys;
	}

	/**
	* ���� I$ZTEST$DIVISION ��get����
	* @return String
	*/
	public String getDIVISION() {
		return division;
	}

	/**
	* ���� I$ZTEST$DIVISION ��set����
	* @return void
	*/
	public void setDIVISION(String division) {
		this.division = division;
	}

	/**
	* ���� I$ZTEST$SALES_OFFICE ��get����
	* @return String
	*/
	public String getSALES_OFFICE() {
		return sales_office;
	}

	/**
	* ���� I$ZTEST$SALES_OFFICE ��set����
	* @return void
	*/
	public void setSALES_OFFICE(String sales_office) {
		this.sales_office = sales_office;
	}

	/**
	* ���� I$ZTEST$SALES_GROUP ��get����
	* @return String
	*/
	public String getSALES_GROUP() {
		return sales_group;
	}

	/**
	* ���� I$ZTEST$SALES_GROUP ��set����
	* @return void
	*/
	public void setSALES_GROUP(String sales_group) {
		this.sales_group = sales_group;
	}

	/**
	* ���� I$ZTEST$SHAREDEPARTMENTSYS ��get����
	* @return String
	*/
	public String getSHAREDEPARTMENTSYS() {
		return sharedepartmentsys;
	}

	/**
	* ���� I$ZTEST$SHAREDEPARTMENTSYS ��set����
	* @return void
	*/
	public void setSHAREDEPARTMENTSYS(String sharedepartmentsys) {
		this.sharedepartmentsys = sharedepartmentsys;
	}

	/**
	* ���� I$ZTEST$SHAREUSERGROUP ��get����
	* @return String
	*/
	public String getSHAREUSERGROUP() {
		return shareusergroup;
	}

	/**
	* ���� I$ZTEST$SHAREUSERGROUP ��set����
	* @return void
	*/
	public void setSHAREUSERGROUP(String shareusergroup) {
		this.shareusergroup = shareusergroup;
	}

	/**
	* ���� I$ZTEST$CURRENTDEPARTMENTSYS ��get����
	* @return String
	*/
	public String getCURRENTDEPARTMENTSYS() {
		return currentdepartmentsys;
	}

	/**
	* ���� I$ZTEST$CURRENTDEPARTMENTSYS ��set����
	* @return void
	*/
	public void setCURRENTDEPARTMENTSYS(String currentdepartmentsys) {
		this.currentdepartmentsys = currentdepartmentsys;
	}

	/**
	* ���� I$ZTEST$SALES_ORG ��get����
	* @return String
	*/
	public String getSALES_ORG() {
		return sales_org;
	}

	/**
	* ���� I$ZTEST$SALES_ORG ��set����
	* @return void
	*/
	public void setSALES_ORG(String sales_org) {
		this.sales_org = sales_org;
	}

	/**
	* ���� I$ZTEST$DISTR_CHAN ��get����
	* @return String
	*/
	public String getDISTR_CHAN() {
		return distr_chan;
	}

	/**
	* ���� I$ZTEST$DISTR_CHAN ��set����
	* @return void
	*/
	public void setDISTR_CHAN(String distr_chan) {
		this.distr_chan = distr_chan;
	}

	/**
	* ���� I$ZTEST$SHAREUSERSYS ��get����
	* @return String
	*/
	public String getSHAREUSERSYS() {
		return shareusersys;
	}

	/**
	* ���� I$ZTEST$SHAREUSERSYS ��set����
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
	* ȡ�汾��Ϣ
	*/
	public static String getVERInfo() {
		return "$Date$,$Author$,$Revision$";
	}

}