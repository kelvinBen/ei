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

import net.mast.demo.ztest.view.ZtestView;
import net.mast.demo.ztest.view.ZtestitemView;

/**
 * 功能:本类为测试行的ObjProxyViewUtils
 *
 * @author  请务必填写
 * @date    [Fri Jul 23 15:56:29 CST 2010]
 *
 * $Id$
 */
   @SuppressWarnings("serial")
public class ZtestObjProxyUtils {   
 
 
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
	
   public static HashMap getMapForView(ZtestView view){
		//主表数据转换装载
		HashMap map = new HashMap();
				map.put("codenum", view.getI$ZTEST$CODENUM());
				map.put("sales_area", view.getI$ZTEST$SALES_AREA());
				map.put("is_deletesys", view.getI$ZTEST$IS_DELETESYS());
				map.put("update_datesys", view.getI$ZTEST$UPDATE_DATESYS());
				map.put("isstartrecycle", view.getI$ZTEST$ISSTARTRECYCLE());
				map.put("sharerolesys", view.getI$ZTEST$SHAREROLESYS());
				map.put("id", view.getI$ZTEST$ID());
				map.put("value", view.getI$ZTEST$VALUE());
				map.put("islockstatussys", view.getI$ZTEST$ISLOCKSTATUSSYS());
				map.put("currentusersys", view.getI$ZTEST$CURRENTUSERSYS());
				map.put("currentrolesys", view.getI$ZTEST$CURRENTROLESYS());
				map.put("currentusergorupsys", view.getI$ZTEST$CURRENTUSERGORUPSYS());
				map.put("division", view.getI$ZTEST$DIVISION());
				map.put("sales_office", view.getI$ZTEST$SALES_OFFICE());
				map.put("sales_group", view.getI$ZTEST$SALES_GROUP());
				map.put("sharedepartmentsys", view.getI$ZTEST$SHAREDEPARTMENTSYS());
				map.put("shareusergroup", view.getI$ZTEST$SHAREUSERGROUP());
				map.put("currentdepartmentsys", view.getI$ZTEST$CURRENTDEPARTMENTSYS());
				map.put("sales_org", view.getI$ZTEST$SALES_ORG());
				map.put("distr_chan", view.getI$ZTEST$DISTR_CHAN());
				map.put("shareusersys", view.getI$ZTEST$SHAREUSERSYS());
			
/**
	 * 多对一从表
	 * @return
	 */	
						List linelist = view.getListztestitem();
	List Ztestitemlist = new ArrayList();
	HashMap Ztestitemmap = new HashMap();
				for(int i=0;i<linelist.size();i++){
	
						ZtestitemView lineview = (ZtestitemView)linelist.get(i);		
	Ztestitemmap = ZtestitemObjProxyUtils.getMapForView(lineview);
	Ztestitemlist.add(map);
				}
	/**
	 * 多对一从表
	 * @return
	 */
					    Ztestitemlist.add(Ztestitemmap);	
	map.put("Ztestitemlist",Ztestitemlist);	
					
	return map;
	}
	
	
		
}
