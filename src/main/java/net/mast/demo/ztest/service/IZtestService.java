/*
 * @(#)IZtestService.java 
 *
 * Copyright (C) 2002-2008 The Dihua Software Foundation. All rights reserved.
 *
 * ��������ʱ�䣺[Fri Jul 23 15:56:29 CST 2010] ����
 */
package net.mast.demo.ztest.service;

import java.util.List;
import java.util.Map;

import net.mast.demo.ztest.view.ZtestView;
import net.mast.util.Page;
import net.mast.util.RowSelection;

/**
 * ����:����Ϊ�����е�Service�ӿ�
 *
 * @author  sp
 * @date    [Fri Jul 23 15:56:29 CST 2010]
 *
 * $Id$
 */
@SuppressWarnings({ "unchecked" })
public interface IZtestService {

	/**
	*  һҳ��¼  [ͨ��Ȩ�޽�BEAN���������ñ��](2010-02-27���ӷ���)
	* @param rowSelection
	* @param map
	* @return
	*/
	public Page getAllZtest_power(final RowSelection rowSelection, final Map map, Map powerMap);

	/**
	 * ɾ��	������	һ����¼
	 * @param  codenum     
	 */
	public void deleteZtest(String codenum);

	/**
	 * ȡ��	������	һ����ϸ
	 * @param  codenum     
	 * @return
	 */
	public ZtestView getZtestView(String codenum);

	/**
	 * ��ѯ	������	һҳ��¼
	 * @param rowSelection
	 * @param map
	 * @return
	 */
	public Page getAllZtest(RowSelection rowSelection, Map map);

	/**
	 * ��ѯ	������	ȫ����¼
	 * @param map
	 * @return
	 */
	public List getAllZtestNoPage(Map map);

	/**
	 * ����	������	һ����¼
	 * @param ztest
	 * @return
	 */
	public ZtestView insertZtest(ZtestView ztest);

	/**
	 * �޸�	������	һ����¼
	 * @param ztest
	 * @return
	 */
	public ZtestView updateZtest(ZtestView ztest);

}