/*
 * @(#)IZtestServiceSupport.java 
 *
 * Copyright (C) 2002-2008 The DiHua Software Foundation. All rights reserved.
 *
 * 程序生成时间：[Fri Jul 23 15:56:29 CST 2010] 生成
 */
package net.mast.demo.ztest.service.support;

//导入java类
import java.util.List;
import java.util.Map;

import net.mast.demo.ztest.data.Ztest;
import net.mast.demo.ztest.domain.IZtestDomain;
import net.mast.demo.ztest.service.IZtestService;
import net.mast.demo.ztest.utils.ZtestViewUtils;
import net.mast.demo.ztest.view.ZtestView;
import net.mast.util.Page;
import net.mast.util.RowSelection;
import net.mast.util.domain.BaseService;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;

/**
 * 功能:本类为测试行的Service实现类ZtestServiceImpl
 *
 * @author  sp
 * @date    [Fri Jul 23 15:56:29 CST 2010]
 *
 * $Id$
 */
@SuppressWarnings({ "unchecked", "unused" })
public class ZtestServiceImpl extends BaseService implements IZtestService, InitializingBean {
	private static Log log = LogFactory.getLog(ZtestServiceImpl.class);
	private IZtestDomain ztestDomain = null;

	//*******可申明其他的dao和domain,来实现其他功能

	/**
	 * 删除	测试行	一条记录
	 * @param  codenum     
	 */
	public void deleteZtest(String codenum) {
		final String tocodenum = codenum;
		getTransactionTemplate().execute(new TransactionCallbackWithoutResult() {
			protected void doInTransactionWithoutResult(TransactionStatus arg0) {
				getZtestDomain().deleteZtest(tocodenum);
			}
		});
	}

	/**
	 * 取得	测试行	一条明细
	 * @param  codenum     
	 * @return
	 */
	public ZtestView getZtestView(String codenum) {
		Ztest ztest = getZtestDomain().getZtest(codenum);

		return ZtestViewUtils.getZtestView(ztest);
	}

	/**
	 * 查询	测试行	一页记录
	 * @param rowSelection
	 * @param map
	 * @return
	 */
	public Page getAllZtest(final RowSelection rowSelection, final Map map) {
		Page page = getZtestDomain().getAllZtest(rowSelection, map);
		page.setDatas(ZtestViewUtils.getZtestListView(page.getDatas()));

		return page;
	}

	/**
	 * 查询	测试行	全部记录
	 * @param map
	 * @return
	 */
	public List getAllZtestNoPage(final Map map) {
		List datas = getZtestDomain().getAllZtestNoPage(map);
		datas = ZtestViewUtils.getZtestListView(datas);

		return datas;
	}

	/**
	 * 插入	测试行	一条记录
	 * @param ztest
	 * @return
	 */
	public ZtestView insertZtest(ZtestView ztestView) {
		final Ztest ztest = ZtestViewUtils.getZtest(ztestView);
		Ztest newZtest = (Ztest) getTransactionTemplate().execute(new TransactionCallback() {
			public Object doInTransaction(TransactionStatus arg0) {
				return getZtestDomain().insertZtest(ztest);
			}
		});
		return ZtestViewUtils.getZtestView(newZtest);
	}

	/**
	 * 修改	测试行	一条记录
	 * @param ztest
	 * @return
	 */
	public ZtestView updateZtest(ZtestView ztestView) {
		final Ztest ztest = ZtestViewUtils.getZtest(ztestView);
		Ztest newZtest = (Ztest) getTransactionTemplate().execute(new TransactionCallback() {
			public Object doInTransaction(TransactionStatus arg0) {
				return getZtestDomain().updateZtest(ztest);
			}
		});
		return ZtestViewUtils.getZtestView(newZtest);
	}

	/**
	 *  一页记录  [通过权限将BEAN中数据设置标记](2010-02-27增加方法)
	 * @param rowSelection
	 * @param map
	 * @return
	 */
	public Page getAllZtest_power(final RowSelection rowSelection, final Map map, Map powerMap) {
		Page page = getZtestDomain().getAllZtest(rowSelection, map);
		page.setDatas(ZtestViewUtils.getZtestView_power(page.getDatas(), powerMap));
		return page;
	}

	/**
	 * @return
	 */
	public IZtestDomain getZtestDomain() {
		return ztestDomain;
	}

	/**
	 * @param domain
	 */
	public void setZtestDomain(IZtestDomain domain) {
		ztestDomain = domain;
	}

	/**
	 * @throws java.lang.Exception
	 */
	protected void initService() {
		if (getZtestDomain() == null) {
			throw new RuntimeException("ZtestServiceSupport配置错误,属性ztestDomain不能为空");
		}
	}

}
