/*
 * @(#)IZtestServiceSupport.java 
 *
 * Copyright (C) 2002-2008 The DiHua Software Foundation. All rights reserved.
 *
 * ��������ʱ�䣺[Fri Jul 23 15:56:29 CST 2010] ����
 */
package net.mast.demo.ztest.service.support;

//����java��
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
 * ����:����Ϊ�����е�Serviceʵ����ZtestServiceImpl
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

	//*******������������dao��domain,��ʵ����������

	/**
	 * ɾ��	������	һ����¼
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
	 * ȡ��	������	һ����ϸ
	 * @param  codenum     
	 * @return
	 */
	public ZtestView getZtestView(String codenum) {
		Ztest ztest = getZtestDomain().getZtest(codenum);

		return ZtestViewUtils.getZtestView(ztest);
	}

	/**
	 * ��ѯ	������	һҳ��¼
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
	 * ��ѯ	������	ȫ����¼
	 * @param map
	 * @return
	 */
	public List getAllZtestNoPage(final Map map) {
		List datas = getZtestDomain().getAllZtestNoPage(map);
		datas = ZtestViewUtils.getZtestListView(datas);

		return datas;
	}

	/**
	 * ����	������	һ����¼
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
	 * �޸�	������	һ����¼
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
	 *  һҳ��¼  [ͨ��Ȩ�޽�BEAN���������ñ��](2010-02-27���ӷ���)
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
			throw new RuntimeException("ZtestServiceSupport���ô���,����ztestDomain����Ϊ��");
		}
	}

}
