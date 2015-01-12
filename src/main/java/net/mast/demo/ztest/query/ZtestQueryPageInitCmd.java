/*
 * @(#) ZtestViewCommand.java 
 *
 * Copyright (C) 2002-2008 The Dihua Software Foundation. All rights reserved.
 *
 * ��������ʱ�䣺[Fri Jul 23 15:56:29 CST 2010] ����
 */
package net.mast.demo.ztest.query;
//����java��
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.mast.util.Page;
import net.mast.waf.mvc.QueryCommandSupportWithInit;
import net.mast.waf.mvc.QueryHelper;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import net.mast.demo.ztest.service.IZtestService;
/**
 * ����:����Ϊ�����е�QueryCommand
 *
 * @author  sp
 * @date    [Fri Jul 23 15:56:29 CST 2010]
 *
 * $Id$
 */
 @SuppressWarnings({"serial","unused","unchecked"})
public class ZtestQueryPageInitCmd extends QueryCommandSupportWithInit {
    private static Log log = LogFactory.getLog(ZtestQueryPageInitCmd.class);
    private IZtestService ztestService = null;

    /**
     * ��ҳ��ʼ�������ѯ	������
     * @param req
     * @param rep
     * @param helper
     * @param map
     * @return
     */
    public String query(
        HttpServletRequest req,
        HttpServletResponse rep,
        QueryHelper helper,
        Map map)
        throws Exception {
    	
            helper.setPage(getZtestService().getAllZtest_power(helper.getRowSelection(), map,new HashMap()));
        return "speQuery.queryPageInit";
    }

    /**
     * @return
     */
    public IZtestService getZtestService() {
        return ztestService;
    }

    /**
     * @param service
     */
    public void setZtestService(IZtestService service) {
        ztestService = service;
    }
}