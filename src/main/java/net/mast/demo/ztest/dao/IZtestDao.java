/*
 * @(#)IZtestDao.java 
 *
 * Copyright (C) 2002-2008 The Dihua Software Foundation. All rights reserved.
 *
 * ��������ʱ�䣺[Fri Jul 23 15:56:29 CST 2010] ����
 */
package net.mast.demo.ztest.dao;

import java.util.List;
import java.util.Map;

import net.mast.demo.ztest.data.Ztest;
import net.mast.util.Page;
import net.mast.util.RowSelection;

/**
 * ����:����Ϊ�����е�Dao�ӿ�
 *
 * @author  sp
 * @date    [Fri Jul 23 15:56:29 CST 2010]
 *
 * $Id$
 */
@SuppressWarnings({ "unchecked" })
public interface IZtestDao {

	/**
	 * ɾ��	������	һ����¼
	 * @param  codenum     */
	public void deleteZtest(String codenum);

	/**
	 * ȡ��	������	һ����¼
	 * @param  codenum     * @return
	 */
	public Ztest getZtest(String codenum);

	/**
	 * ����	������	һ����¼
	 * @param ztest
	 * @return
	 */
	public Ztest insertZtest(Ztest ztest);

	/**
	 * �޸�	������	һ����¼
	 * @param ztest
	 * @return
	 */
	public Ztest updateZtest(Ztest ztest);

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
}