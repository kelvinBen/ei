/*
 * @(#)IZtestDomainSupport.java 
 *
 * Copyright (C) 2002-2009 The DiHua Software Foundation. All rights reserved.
 *
 * ��������ʱ�䣺[Fri Jul 23 15:56:29 CST 2010] ����
 */
package net.mast.demo.ztest.domain.support;

import java.util.List;
import java.util.Map;

import net.mast.bsp.base.id.dao.jdbc.IncrementDao;
import net.mast.demo.ztest.dao.IZtestDao;
import net.mast.demo.ztest.dao.IZtestitemDao;
import net.mast.demo.ztest.data.Ztest;
import net.mast.demo.ztest.domain.IZtestDomain;
import net.mast.util.Page;
import net.mast.util.RowSelection;
import net.mast.util.domain.BaseDomain;
import net.mast.waf.ComponentFactory;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * ����:����Ϊ�����еĽӿ�Domainʵ����ZtestDomainImpl
 *
 * @author  sp
 * @date    [Fri Jul 23 15:56:29 CST 2010]
 *
 * $Id$
 */
@SuppressWarnings({ "unused", "unchecked" })
public class ZtestDomainImpl extends BaseDomain implements IZtestDomain {
	private static Log log = LogFactory.getLog(ZtestDomainImpl.class);
	private IZtestDao ztestDao = null;
	//����������dao�����������������ɾ�Ĳ顣
	private IZtestitemDao ztestitemDao = null;

	//*******������������dao��ʵ����������

	/**
	 * ɾ��	������	һ����¼
	 * @param  codenum	 
	 */
	public void deleteZtest(String codenum) {
		getZtestDao().deleteZtest(codenum);
		//��ɾ�������ͬʱɾ��һЩ�ӱ���Ϣ��
		getZtestitemDao().deleteZtestitem(codenum);
	}

	/**
	 * ȡ��	������	һ����ϸ
	 * @param  codenum	 
	 * @return
	 */
	public Ztest getZtest(String codenum) {
		//��ȡ���������
		Ztest ztest = getZtestDao().getZtest(codenum);
		//��ȡ���һ�ӱ������
		//		ztest.setListZtestitem(getZtestitemDao().getZtestitem( codenum));
		//��ȡһ��һ�ӱ������ 
		return ztest;
	}

	/**
	 * ��ѯ	������	һҳ��¼
	 * @param rowSelection
	 * @param map
	 * @return
	 */
	public Page getAllZtest(RowSelection rowSelection, Map map) {
		return getZtestDao().getAllZtest(rowSelection, map);
	}

	/**
	 * ��ѯ	������	ȫ����¼
	 * @param map
	 * @return
	 */
	public List getAllZtestNoPage(Map map) {
		return getZtestDao().getAllZtestNoPage(map);
	}

	/**
	 * ����	������	һ����¼
	 * @param ztest
	 * @return
	 */
	public Ztest insertZtest(Ztest ztest) {
		String codenum = ((IncrementDao) ComponentFactory.getBean("ztestCodenum")).nextStringValue();
		ztest.setCODENUM(codenum);
		//һ�Զ�ӱ�
		//       	Iterator ztestitemList = ztest.getListZtestitem().iterator();
		//    	while(ztestitemList.hasNext()){
		//    		Ztestitem ztestitem= (Ztestitem)ztestitemList.next();
		//    		ztestitem.setCODENUM(ztest.getCODENUM()+ztestitem.getPO_ITEM());
		//			ztestitem.setHCODENUM(ztest.getCODENUM());
		//    		getZtestitemDao().insertZtestitem(ztestitem);
		//    	}
		//һ��һ�ӱ�

		return getZtestDao().insertZtest(ztest);
	}

	/**
	 * �޸�	������	һ����¼
	 * @param ztest
	 * @return
	 */
	public Ztest updateZtest(Ztest ztest) {
		//һ�Զ�ӱ�
		String codenum = ztest.getCODENUM();

		//        getZtestitemDao().deleteZtestitem( codenum);
		//       //  getZtestitemDao().deleteZtestitem( codenum);
		//
		//       	Iterator ztestitemList = ztest.getListZtestitem().iterator();
		//    	while(ztestitemList.hasNext()){
		//    		Ztestitem ztestitem= (Ztestitem)ztestitemList.next();
		//			if(!ztestitem.getIsDelete().equals("1")){
		//    			ztestitem.setCODENUM(ztest.getCODENUM()+ztestitem.getPO_ITEM());
		//    			getZtestitemDao().insertZtestitem(ztestitem);
		//    		}
		//    	}
		//һ��һ�ӱ�
		return getZtestDao().updateZtest(ztest);
	}

	/**
	  * @return
	  */
	public IZtestDao getZtestDao() {
		return ztestDao;
	}

	/**
	 * @param dao
	 */
	public void setZtestDao(IZtestDao dao) {
		ztestDao = dao;
	}

	//��������Get Set
	public IZtestitemDao getZtestitemDao() {
		return ztestitemDao;
	}

	public void setZtestitemDao(IZtestitemDao ztestitemDao) {
		this.ztestitemDao = ztestitemDao;
	}

	/**
	 * 
	 */
	protected void initDomain() {
		if (getZtestDao() == null) {
			throw new RuntimeException("ZtestServiceSupport���ô���,����ztestDao����Ϊ��");
		}
	}

	public Object back(Ztest ztest) {
		// TODO Auto-generated method stub
		return null;
	}

	public Ztest create(Ztest ztest) {
		// TODO Auto-generated method stub
		return null;
	}

}
