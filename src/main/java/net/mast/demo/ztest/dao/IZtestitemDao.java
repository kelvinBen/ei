/*
 * @(#)IZtestitemDao.java 
 *
 * Copyright (C) 2002-2008 The Dihua Software Foundation. All rights reserved.
 *
 * 程序生成时间：[Fri Jul 23 15:56:29 CST 2010] 生成
 */
package net.mast.demo.ztest.dao;
//导入java类
import java.util.List;
import java.util.Map;

import net.mast.util.Page;
import net.mast.util.RowSelection;

import net.mast.demo.ztest.data.Ztestitem;


/**
 * 功能:本类为测试行项目的Dao接口
 *
 * @author  sp
 * @date    [Fri Jul 23 15:56:29 CST 2010]
 *
 * $Id$
 */
@SuppressWarnings({"unchecked"})
public interface IZtestitemDao {
	/**
     * 删除	测试行项目	一条记录
     * @param  codenum     */
    public void deleteZtestitem( String codenum);
    
    /**
     * 取得	测试行项目	一条记录
     * @param  codenum
     * @return
     */
    public List getZtestitem( String codenum);
    /**
     * 查询	测试行项目	一页记录
     * @param rowSelection
     * @param map
     * @return
     */
    public Page getAllZtestitem(RowSelection rowSelection,Map map);

    /**
     * 查询	测试行项目	全部记录
     * @param map
     * @return
     */
	public List getAllZtestitemNoPage(Map map);	

	/**
     * 插入	测试行项目	一条记录
     * @param ztestitem
     * @return
     */
    public Ztestitem insertZtestitem(Ztestitem ztestitem);
    
    /**
     * 修改	测试行项目	一条记录
     * @param ztestitem
     * @return
     */
    public Ztestitem updateZtestitem(Ztestitem ztestitem);
    }