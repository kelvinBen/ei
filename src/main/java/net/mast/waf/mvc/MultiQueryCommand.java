package net.mast.waf.mvc;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.mast.beanutil.MethodUtils;
import net.mast.commons.exception.BaseInvocationTargetException;
import net.mast.util.IErrorHandler;
import net.mast.util.IMessageHandler;
import net.mast.util.Page;
import net.mast.util.RowSelection;
import net.mast.util.Tokens;
import net.mast.web.taglib.util.Global;

public abstract class MultiQueryCommand extends ViewCommandSupport {
	private int pageSize = -1;

	private int currentPageIndex = 1;
	private String foreignKeyName;
	private ResourceBundle resourceBundle = ResourceBundle.getBundle("loushang3-core");

	public String getForeignKeyName() {
		return this.foreignKeyName;
	}

	public void setForeignKeyName(String foreignKeyName) {
		this.foreignKeyName = foreignKeyName;
	}

	protected String execute(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler,
			IMessageHandler messageHandler, ViewHelper viewHelper) throws Exception {
		String farward = null;
		boolean rebit_repeat_submit = false;
		String repeat_submit = Global.getString("org.loushang.waf.rebit_repeat_submit");
		if ((repeat_submit != null) && (repeat_submit.equals("true"))) {
			rebit_repeat_submit = true;
		}
		String method = req.getParameter("method");
		Object[] objects = { req, rep, errorHandler, messageHandler, viewHelper };
		Class[] paramTypes = { HttpServletRequest.class, HttpServletResponse.class, IErrorHandler.class,
				IMessageHandler.class, ViewHelper.class };
		try {
			if ((!(rebit_repeat_submit)) || (testKey(method))) {
				farward = String.valueOf(MethodUtils.invokeMethod(this, method, objects, paramTypes));
				doQuery(req, rep, viewHelper);
				return farward;
			}
			if (isTokenValid(req)) {
				farward = String.valueOf(MethodUtils.invokeMethod(this, method, objects, paramTypes));
				doQuery(req, rep, viewHelper);
				if ((farward.equals("null")) || (farward.equals(""))) {
					HttpSession session = req.getSession(false);
					Tokens tokens = (Tokens) session.getAttribute("org.loushang.web.taglib.util.token");
					String token = req.getParameter("org.loushang.web.taglib.util.token");
					CommandSupport commandSupport = new CommandSupport();
					//					tokens.removeUrl(token, commandSupport.getCommandName(req));
				}
				return farward;
			}

			throw new Exception(this.resourceBundle.getString("MultiQueryCommand.execute_1"));
		} catch (NoSuchMethodException e) {
			throw e;
		} catch (IllegalAccessException e) {
			throw e;
		} catch (InvocationTargetException e) {
			throw new BaseInvocationTargetException(e);
		}
	}

	public boolean testKey(String method) {
		boolean isContain = false;
		String rebit_repeat_submit_key = Global.getString("org.loushang.waf.rebit_repeat_submit_key");
		if ((rebit_repeat_submit_key != null) && (!(rebit_repeat_submit_key.equals("")))) {
			String[] rebit_repeat_submit_keys = rebit_repeat_submit_key.split(",");
			for (int i = 0; i < rebit_repeat_submit_keys.length; ++i) {
				String key = rebit_repeat_submit_keys[i];
				if (method.indexOf(key) != -1) {
					isContain = true;
					return true;
				}
			}
		}
		return isContain;
	}

	protected abstract List[] query(HttpServletRequest paramHttpServletRequest,
			HttpServletResponse paramHttpServletResponse, QueryHelper paramQueryHelper, Map paramMap);

	public int getPageSize() {
		return this.pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	private void doQuery(HttpServletRequest req, HttpServletResponse rep, ViewHelper viewHelper) throws Exception {
		if (this.pageSize == -1)
			this.pageSize = Integer.parseInt(req.getParameter("org.loushang.web.taglib.util.EDITGRIDPAGESIZE"));
		String index = req.getParameter("org.loushang.web.taglib.util.EDITGRIDCURRENTPAGEINDEX");
		this.currentPageIndex = Integer.parseInt((index == null) ? "1" : index);
		req.setAttribute("org.loushang.web.taglib.util.EDITGRIDCURRENTPAGEINDEX", this.currentPageIndex);

		RowSelection rowSelection = new RowSelection(this.pageSize * (this.currentPageIndex - 1), getPageSize());
		QueryHelper helper = new QueryHelper();
		Map map = new HashMap();

		Map searchers = req.getParameterMap();
		Set set = searchers.keySet();
		Iterator iterator = set.iterator();
		while (iterator.hasNext()) {
			String temp = (String) iterator.next();
			if (temp.toLowerCase().indexOf("_search") != -1) {
				Object value = searchers.get(temp);
				map.put(temp, value);
			}
		}

		String primaryKey = req.getParameter("primaryKey");

		if ((primaryKey == null) || (primaryKey.equalsIgnoreCase("null"))) {
			primaryKey = (String) req.getAttribute("primaryKey");
		}

		if ((primaryKey == null) || (primaryKey.equalsIgnoreCase("null"))) {
			primaryKey = viewHelper.getPrimaryKey();
		}

		map.put(this.foreignKeyName, primaryKey);

		req.setAttribute("primaryKey", primaryKey);
		helper.setRowSelection(rowSelection);

		List[] results = { new ArrayList() };
		if (primaryKey != null) {
			results = query(req, rep, helper, map);

			int forword = 2;
			if (
			//					viewHelper.isSearch()
			true) {
				while ((helper.getPage().getDatas().size() == 0) && (helper.getPage().getCount() != 0)) {
					rowSelection = new RowSelection(this.pageSize * (this.currentPageIndex - forword), getPageSize());
					req.setAttribute("org.loushang.web.taglib.util.EDITGRIDCURRENTPAGEINDEX", this.currentPageIndex + 1
							- forword);
					helper.setRowSelection(rowSelection);
					results = query(req, rep, helper, map);
					++forword;
				}
			}
		}

		Page page = helper.getPage();
		int count = 0;
		if (page != null) {
			count = page.getCount();
		}

		req.setAttribute("pagecount", count);
		Object object = viewHelper.getView();
		if (object == null)
			throw new Exception(this.resourceBundle.getString("MultiQueryCommand.doQuery_1"));
		Class clazz = object.getClass();

		String[] listnames = viewHelper.getListnames();
		if (listnames != null) {
			for (int i = 0; i < listnames.length; ++i) {
				String name = listnames[i];
				Field list = clazz.getDeclaredField(name);
				list.setAccessible(true);
				list.set(object, results[i]);
			}
			viewHelper.setView(object);
		}
	}
}