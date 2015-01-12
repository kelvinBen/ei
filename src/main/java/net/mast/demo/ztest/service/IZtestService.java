/*
 * @(#)IZtestService.java 
 *
 * Copyright (C) 2002-2008 The Dihua Software Foundation. All rights reserved.
 *
 * 程序生成时间：[Fri Jul 23 15:56:29 CST 2010] 生成
 */
package net.mast.demo.ztest.service;

import java.util.List;
import java.util.Map;

import net.mast.demo.ztest.view.ZtestView;
import net.mast.util.Page;
import net.mast.util.RowSelection;

/**
 * 功能:本类为测试行的Service接口
 *
 * @author  sp
 * @date    [Fri Jul 23 15:56:29 CST 2010]
 *
 * $Id$
 */
@SuppressWarnings({ "unchecked" })
public interface IZtestService {

	/**
	*  一页记录  [通过权限将BEAN中数据设置标记](2010-02-27增加方法)
	* @param rowSelection
	* @param map
	* @return
	*/
	public Page getAllZtest_power(final RowSelection rowSelection, final Map map, Map powerMap);

	/**
	 * 删除	测试行	一条记录
	 * @param  codenum     
	 */
	public void deleteZtest(String codenum);

	/**
	 * 取得	测试行	一条明细
	 * @param  codenum     
	 * @return
	 */
	public ZtestView getZtestView(String codenum);

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

	/**
	 * 插入	测试行	一条记录
	 * @param ztest
	 * @return
	 */
	public ZtestView insertZtest(ZtestView ztest);

	/**
	 * 修改	测试行	一条记录
	 * @param ztest
	 * @return
	 */
	public ZtestView updateZtest(ZtestView ztest);

}