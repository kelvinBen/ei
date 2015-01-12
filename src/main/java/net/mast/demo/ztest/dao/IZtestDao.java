/*
 * @(#)IZtestDao.java 
 *
 * Copyright (C) 2002-2008 The Dihua Software Foundation. All rights reserved.
 *
 * 程序生成时间：[Fri Jul 23 15:56:29 CST 2010] 生成
 */
package net.mast.demo.ztest.dao;

import java.util.List;
import java.util.Map;

import net.mast.demo.ztest.data.Ztest;
import net.mast.util.Page;
import net.mast.util.RowSelection;

/**
 * 功能:本类为测试行的Dao接口
 *
 * @author  sp
 * @date    [Fri Jul 23 15:56:29 CST 2010]
 *
 * $Id$
 */
@SuppressWarnings({ "unchecked" })
public interface IZtestDao {

	/**
	 * 删除	测试行	一条记录
	 * @param  codenum     */
	public void deleteZtest(String codenum);

	/**
	 * 取得	测试行	一条记录
	 * @param  codenum     * @return
	 */
	public Ztest getZtest(String codenum);

	/**
	 * 插入	测试行	一条记录
	 * @param ztest
	 * @return
	 */
	public Ztest insertZtest(Ztest ztest);

	/**
	 * 修改	测试行	一条记录
	 * @param ztest
	 * @return
	 */
	public Ztest updateZtest(Ztest ztest);

	/**
	 * 查询	测试行	一页记录
	 * @param rowSelection
	 * @param map
	 * @return
	 */
	public Page getAllZtest(RowSelection rowSelection, Map map);

	/**
	 * 查询	测试行	全部记录
	 * @param map
	 * @return
	 */
	public List getAllZtestNoPage(Map map);
}