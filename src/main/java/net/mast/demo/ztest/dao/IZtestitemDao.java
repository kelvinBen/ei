/*
 * @(#)IZtestitemDao.java 
 *
 * Copyright (C) 2002-2008 The Dihua Software Foundation. All rights reserved.
 *
 * ��������ʱ�䣺[Fri Jul 23 15:56:29 CST 2010] ����
 */
package net.mast.demo.ztest.dao;
//����java��
import java.util.List;
import java.util.Map;

import net.mast.util.Page;
import net.mast.util.RowSelection;

import net.mast.demo.ztest.data.Ztestitem;


/**
 * ����:����Ϊ��������Ŀ��Dao�ӿ�
 *
 * @author  sp
 * @date    [Fri Jul 23 15:56:29 CST 2010]
 *
 * $Id$
 */
@SuppressWarnings({"unchecked"})
public interface IZtestitemDao {
	/**
     * ɾ��	��������Ŀ	һ����¼
     * @param  codenum     */
    public void deleteZtestitem( String codenum);
    
    /**
     * ȡ��	��������Ŀ	һ����¼
     * @param  codenum
     * @return
     */
    public List getZtestitem( String codenum);
    /**
     * ��ѯ	��������Ŀ	һҳ��¼
     * @param rowSelection
     * @param map
     * @return
     */
    public Page getAllZtestitem(RowSelection rowSelection,Map map);

    /**
     * ��ѯ	��������Ŀ	ȫ����¼
     * @param map
     * @return
     */
	public List getAllZtestitemNoPage(Map map);	

	/**
     * ����	��������Ŀ	һ����¼
     * @param ztestitem
     * @return
     */
    public Ztestitem insertZtestitem(Ztestitem ztestitem);
    
    /**
     * �޸�	��������Ŀ	һ����¼
     * @param ztestitem
     * @return
     */
    public Ztestitem updateZtestitem(Ztestitem ztestitem);
    }