/*
 * @(#)ViewUtils.java 
 *
 * Copyright (C) 2002-2008 The Dihua Software Foundation. All rights reserved.
 *
 * 程序生成时间：[Fri Jul 23 15:56:29 CST 2010] 生成
 */
package net.mast.demo.ztest.utils;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.mast.demo.ztest.view.ZtestitemView;

/**
 * 功能:本类为测试行项目的ObjProxyViewUtils
 *
 * @author  请务必填写
 * @date    [Fri Jul 23 15:56:29 CST 2010]
 *
 * $Id$
 */
   @SuppressWarnings("serial")
public class ZtestitemObjProxyUtils {   
 
 
 	/**
	 * 将新的map更新旧的map
	 * @param map1
	 * @param map2
	 * @return
	 */
	public static HashMap getCompareMap(HashMap map1 , HashMap map2){
		Map map = map2;		
		for (Iterator iter = map.entrySet().iterator(); iter.hasNext();) {
		    Map.Entry entry = (Map.Entry) iter.next();
		    Object key = entry.getKey();
		    Object val = entry.getValue();
		    if(val!=null&&!val.equals("")){
		    	map1.put(key, val);
		    }
		}
		return map1;
	}
	
   public static HashMap getMapForView(ZtestitemView view){
		//主表数据转换装载
		HashMap map = new HashMap();
				map.put("codenum", view.getT$ZTESTITEM$CODENUM());
				map.put("islockstatussys", view.getT$ZTESTITEM$ISLOCKSTATUSSYS());
				map.put("currentusersys", view.getT$ZTESTITEM$CURRENTUSERSYS());
				map.put("currentrolesys", view.getT$ZTESTITEM$CURRENTROLESYS());
				map.put("currentusergorupsys", view.getT$ZTESTITEM$CURRENTUSERGORUPSYS());
				map.put("currentdepartmentsys", view.getT$ZTESTITEM$CURRENTDEPARTMENTSYS());
				map.put("isstartrecycle", view.getT$ZTESTITEM$ISSTARTRECYCLE());
				map.put("sharerolesys", view.getT$ZTESTITEM$SHAREROLESYS());
				map.put("shareusersys", view.getT$ZTESTITEM$SHAREUSERSYS());
				map.put("sharedepartmentsys", view.getT$ZTESTITEM$SHAREDEPARTMENTSYS());
				map.put("shareusergroup", view.getT$ZTESTITEM$SHAREUSERGROUP());
				map.put("sales_org", view.getT$ZTESTITEM$SALES_ORG());
				map.put("distr_chan", view.getT$ZTESTITEM$DISTR_CHAN());
				map.put("division", view.getT$ZTESTITEM$DIVISION());
				map.put("sales_office", view.getT$ZTESTITEM$SALES_OFFICE());
				map.put("sales_group", view.getT$ZTESTITEM$SALES_GROUP());
				map.put("sales_area", view.getT$ZTESTITEM$SALES_AREA());
				map.put("is_deletesys", view.getT$ZTESTITEM$IS_DELETESYS());
				map.put("update_datesys", view.getT$ZTESTITEM$UPDATE_DATESYS());
				map.put("po_item", view.getT$ZTESTITEM$PO_ITEM());
				map.put("value", view.getT$ZTESTITEM$VALUE());
				map.put("hcodenum", view.getT$ZTESTITEM$HCODENUM());
					
	return map;
	}
	
	
		
}
