/*
 * @(#)IZtestDomainSupport.java 
 *
 * Copyright (C) 2002-2009 The DiHua Software Foundation. All rights reserved.
 *
 * 程序生成时间：[Fri Jul 23 15:56:29 CST 2010] 生成
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
 * 功能:本类为测试行的接口Domain实现类ZtestDomainImpl
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
	//声名的其他dao用来处理其他表的增删改查。
	private IZtestitemDao ztestitemDao = null;

	//*******可申明其他的dao来实现其他功能

	/**
	 * 删除	测试行	一条记录
	 * @param  codenum	 
	 */
	public void deleteZtest(String codenum) {
		getZtestDao().deleteZtest(codenum);
		//在删除主表的同时删除一些从表信息。
		getZtestitemDao().deleteZtestitem(codenum);
	}

	/**
	 * 取得	测试行	一条明细
	 * @param  codenum	 
	 * @return
	 */
	public Ztest getZtest(String codenum) {
		//获取主表的数据
		Ztest ztest = getZtestDao().getZtest(codenum);
		//获取多对一从表的数据
		//		ztest.setListZtestitem(getZtestitemDao().getZtestitem( codenum));
		//获取一对一从表的数据 
		return ztest;
	}

	/**
	 * 查询	测试行	一页记录
	 * @param rowSelection
	 * @param map
	 * @return
	 */
	public Page getAllZtest(RowSelection rowSelection, Map map) {
		return getZtestDao().getAllZtest(rowSelection, map);
	}

	/**
	 * 查询	测试行	全部记录
	 * @param map
	 * @return
	 */
	public List getAllZtestNoPage(Map map) {
		return getZtestDao().getAllZtestNoPage(map);
	}

	/**
	 * 插入	测试行	一条记录
	 * @param ztest
	 * @return
	 */
	public Ztest insertZtest(Ztest ztest) {
		String codenum = ((IncrementDao) ComponentFactory.getBean("ztestCodenum")).nextStringValue();
		ztest.setCODENUM(codenum);
		//一对多从表
		//       	Iterator ztestitemList = ztest.getListZtestitem().iterator();
		//    	while(ztestitemList.hasNext()){
		//    		Ztestitem ztestitem= (Ztestitem)ztestitemList.next();
		//    		ztestitem.setCODENUM(ztest.getCODENUM()+ztestitem.getPO_ITEM());
		//			ztestitem.setHCODENUM(ztest.getCODENUM());
		//    		getZtestitemDao().insertZtestitem(ztestitem);
		//    	}
		//一对一从表

		return getZtestDao().insertZtest(ztest);
	}

	/**
	 * 修改	测试行	一条记录
	 * @param ztest
	 * @return
	 */
	public Ztest updateZtest(Ztest ztest) {
		//一对多从表
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
		//一对一从表
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

	//增加其他Get Set
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
			throw new RuntimeException("ZtestServiceSupport配置错误,属性ztestDao不能为空");
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
