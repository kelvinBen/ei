/*
 * @(#)IZtestDomain.java 
 *
 * Copyright (C) 2002-2009 The DiHua Software Foundation. All rights reserved.
 *
 * 程序生成时间：[Fri Jul 23 15:56:29 CST 2010] 生成
 */
package net.mast.demo.ztest.domain;

import java.util.List;
import java.util.Map;

import net.mast.demo.ztest.data.Ztest;
import net.mast.util.Page;
import net.mast.util.RowSelection;

/**
 * 功能:本类为测试行的Domain接口
 *
 * @author  sp
 * @date    [Fri Jul 23 15:56:29 CST 2010]
 *
 * $Id$
 */
@SuppressWarnings("unchecked")
public interface IZtestDomain {
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
	public Ztest getZtest(String codenum);

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
	public Ztest insertZtest(Ztest ztest);

	/**
	 * 修改	测试行	一条记录
	 * @param ztest
	 * @return
	 */
	public Ztest updateZtest(Ztest ztest);

}
