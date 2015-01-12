/*
 * @(#) ZtestViewCommand.java 
 *
 * Copyright (C) 2002-2008 The DiHua Software Foundation. All rights reserved.
 *
 * 程序生成时间：[Fri Jul 23 15:56:29 CST 2010] 生成
 */
package net.mast.demo.ztest.cmd;

//导入java类
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.mast.bsp.util.StringUtil;
import net.mast.demo.ztest.service.IZtestService;
import net.mast.demo.ztest.view.ZtestView;
import net.mast.util.IErrorHandler;
import net.mast.util.IMessageHandler;
import net.mast.util.RequestUtil;
import net.mast.waf.mvc.MultiCommand;
import net.mast.waf.mvc.ViewHelper;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 功能:本类为测试行的Command
 *
 * @author  sp
 * @date    [Fri Jul 23 15:56:29 CST 2010]
 *
 * $Id$
 */
@SuppressWarnings({ "serial", "unused", "unchecked" })
public class ZtestCmd extends MultiCommand {
	private static Log log = LogFactory.getLog(ZtestCmd.class);
	private IZtestService ztestService = null;

	/**
	 * 新增  测试行  初始化
	 * @param req
	 * @param rep
	 * @param errorHandler
	 * @param messageHandler
	 * @param viewHelper
	 * @return
	 */
	public String forinsert(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler,
			IMessageHandler messageHandler, ViewHelper viewHelper) {
		ZtestView vi = new ZtestView();
		viewHelper.setView(vi);

		return "ztestView.forinsert";
	}

	/**
	 * 修改 测试行  初始化
	 * @param req
	 * @param rep
	 * @param errorHandler
	 * @param messageHandler
	 * @param viewHelper
	 * @return
	 */
	public String forupdate(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler,
			IMessageHandler messageHandler, ViewHelper viewHelper) {
		String pkargs = req.getParameter("primaryKey");
		String codenum = pkargs;
		if (StringUtil.isEmptyString(codenum)) {
			codenum = RequestUtil.getAttrOrPara2String(req, "sourceReferenceId");
		}
		ZtestView viewin = getZtestService().getZtestView(codenum);
		viewHelper.setView(viewin);
		return "ztestView.forupdate";
	}

	/**
	 * 查 测试行   明细
	 * @param req
	 * @param rep
	 * @param errorHandler
	 * @param messageHandler
	 * @param viewHelper
	 * @return
	 */
	public String detail(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler,
			IMessageHandler messageHandler, ViewHelper viewHelper) {
		String pkargs = req.getParameter("primaryKey");
		String codenum = pkargs;
		if (StringUtil.isEmptyString(codenum)) {
			codenum = RequestUtil.getAttrOrPara2String(req, "sourceReferenceId");
		}
		ZtestView viewin = getZtestService().getZtestView(codenum);
		viewHelper.setView(viewin);
		return "ztestView.detail";
	}

	/**
	 * 新增	测试行
	 * @param req
	 * @param rep
	 * @param errorHandler
	 * @param messageHandler
	 * @param viewHelper
	 * @return
	 */
	public String insert(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler,
			IMessageHandler messageHandler, ViewHelper viewHelper) {
		ZtestView viewin = (ZtestView) viewHelper.getView();
		viewin = getZtestService().insertZtest(viewin);
		viewHelper.setView(viewin);
		return "ztestView.detail";
	}

	/**
	 * 修改 测试行
	 * @param req
	 * @param rep
	 * @param errorHandler
	 * @param messageHandler
	 * @param viewHelper
	 * @return
	 */
	public String update(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler,
			IMessageHandler messageHandler, ViewHelper viewHelper) {
		ZtestView viewin = (ZtestView) viewHelper.getView();
		viewin = getZtestService().updateZtest(viewin);
		viewHelper.setView(viewin);

		return "ztestView.detail";
	}

	/**
	 * 删除 测试行
	 * @param req
	 * @param rep
	 * @param errorHandler
	 * @param messageHandler
	 * @param viewHelper
	 * @return
	 */
	public String delete(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler,
			IMessageHandler messageHandler, ViewHelper viewHelper) {
		String[] delPK = req.getParameterValues("primaryKey");
		for (int i = 0; i < delPK.length; i++) {
			String codenum = delPK[i];
			getZtestService().deleteZtest(codenum);
		}
		return "ztestViewChain.success";
	}

	/**
	 * @see org.springframework.beans.factory.InitializingBean#afterPropertiesSet()
	 */
	public void afterPropertiesSet() throws Exception {
		super.afterPropertiesSet();
		if (getZtestService() == null) {
			throw new RuntimeException("ZtestCmd配置错误,属性ZtestService不能为空");
		}
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