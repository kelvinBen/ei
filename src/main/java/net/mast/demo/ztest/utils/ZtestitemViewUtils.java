/*
 * @(#)ViewUtils.java 
 *
 * Copyright (C) 2002-2008 The Dihua Software Foundation. All rights reserved.
 *
 * 程序生成时间：[Fri Jul 23 15:56:29 CST 2010] 生成
 */
package net.mast.demo.ztest.utils;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.mast.commons.exception.BaseRuntimeException;

import net.mast.demo.ztest.data.Ztestitem;
import net.mast.demo.ztest.view.ZtestitemView;

/**
 * 功能:本类为测试行项目的ViewUtils
 *
 * @author  sp
 * @date    [Fri Jul 23 15:56:29 CST 2010]
 *
 * $Id$
 */
@SuppressWarnings({"unchecked","unused"})
public class ZtestitemViewUtils {   
    /**
     * 通过databean取view list
     * @param list
     * @return
     */
    public static List getZtestitemListView(List list) {
    	if(list==null){
    		return null;
    	}
        List view = new ArrayList(list.size());
        for (int i = 0; i < list.size(); i++) {
            view.add(getZtestitemView((Ztestitem) list.get(i)));
        }
        return view;
    }
    /**
     * 通过view取databean list
     * @param list
     * @return
     */
    public static List getZtestitemList(List list) {
    	if(list==null){
    	return null;
    	}
        List datas = new ArrayList(list.size());
        for (int i = 0; i < list.size(); i++) {
            datas.add(getZtestitem((ZtestitemView) list.get(i)));
        }
        return datas;
    }
    
      /**
     * 通过databean取view list 2010-02-27新增
     * @param list
     * @return
     */
    public static List getZtestitemView_power(List list,Map map_power) {
        List view = new ArrayList(list.size());
        for (int i = 0; i < list.size(); i++) {
            view.add(getZtestitemView_power((Ztestitem) list.get(i), map_power)) ;
        }
        return view;
    }
      

    /** 
     * 2010-02-27新增
     * @param ztestitem
     * @return
     */
    public static ZtestitemView getZtestitemView_power(Ztestitem ztestitem,Map map_power) {
     	if(ztestitem==null){
    		throw new BaseRuntimeException("查询Ztestitem 记录为空 出错");
    	}
        ZtestitemView view = new ZtestitemView();
        try {
	    view.setT$ZTESTITEM$CODENUM(ztestitem.getCODENUM());		
	    view.setT$ZTESTITEM$ISLOCKSTATUSSYS(ztestitem.getISLOCKSTATUSSYS());		
	    view.setT$ZTESTITEM$CURRENTUSERSYS(ztestitem.getCURRENTUSERSYS());		
	    view.setT$ZTESTITEM$CURRENTROLESYS(ztestitem.getCURRENTROLESYS());		
	    view.setT$ZTESTITEM$CURRENTUSERGORUPSYS(ztestitem.getCURRENTUSERGORUPSYS());		
	    view.setT$ZTESTITEM$CURRENTDEPARTMENTSYS(ztestitem.getCURRENTDEPARTMENTSYS());		
	    view.setT$ZTESTITEM$ISSTARTRECYCLE(ztestitem.getISSTARTRECYCLE());		
	    view.setT$ZTESTITEM$SHAREROLESYS(ztestitem.getSHAREROLESYS());		
	    view.setT$ZTESTITEM$SHAREUSERSYS(ztestitem.getSHAREUSERSYS());		
	    view.setT$ZTESTITEM$SHAREDEPARTMENTSYS(ztestitem.getSHAREDEPARTMENTSYS());		
	    view.setT$ZTESTITEM$SHAREUSERGROUP(ztestitem.getSHAREUSERGROUP());		
	    view.setT$ZTESTITEM$SALES_ORG(ztestitem.getSALES_ORG());		
	    view.setT$ZTESTITEM$DISTR_CHAN(ztestitem.getDISTR_CHAN());		
	    view.setT$ZTESTITEM$DIVISION(ztestitem.getDIVISION());		
	    view.setT$ZTESTITEM$SALES_OFFICE(ztestitem.getSALES_OFFICE());		
	    view.setT$ZTESTITEM$SALES_GROUP(ztestitem.getSALES_GROUP());		
	    view.setT$ZTESTITEM$SALES_AREA(ztestitem.getSALES_AREA());		
	    view.setT$ZTESTITEM$IS_DELETESYS(ztestitem.getIS_DELETESYS());		
	    view.setT$ZTESTITEM$UPDATE_DATESYS(ztestitem.getUPDATE_DATESYS());		
	    view.setT$ZTESTITEM$PO_ITEM(ztestitem.getPO_ITEM());		
	    view.setT$ZTESTITEM$VALUE(ztestitem.getVALUE());		
	    view.setT$ZTESTITEM$HCODENUM(ztestitem.getHCODENUM());		
      		/**开始设置权限标记*/  
      		String all_power = map_power.get("3")==null?"":map_power.get("3").toString();
      		String sign="";
      		if(!all_power.equalsIgnoreCase("")){
      			sign=all_power;
      		}
      		else{
	      		String depsign = map_power.get(ztestitem.getCURRENTDEPARTMENTSYS())==null?"":map_power.get(ztestitem.getCURRENTDEPARTMENTSYS()).toString();
				sign = map_power.get(ztestitem.getCURRENTUSERSYS())==null?depsign:map_power.get(ztestitem.getCURRENTUSERSYS()).toString();
      		}
			view.setSign(sign);             
        } catch (Exception e) {
            throw new BaseRuntimeException("由Ztestitem得到ZtestitemView出错", e);
        }
        return view;
    }

    
    
    /** 
     * @param ztestitem
     * @return
     */
    public static ZtestitemView getZtestitemView(Ztestitem ztestitem) {
    	if(ztestitem==null){
    		throw new BaseRuntimeException("查询Ztestitem 记录为空 出错");
    	}
        ZtestitemView view = new ZtestitemView();
        try {
	    view.setT$ZTESTITEM$CODENUM(ztestitem.getCODENUM());		
	    view.setT$ZTESTITEM$ISLOCKSTATUSSYS(ztestitem.getISLOCKSTATUSSYS());		
	    view.setT$ZTESTITEM$CURRENTUSERSYS(ztestitem.getCURRENTUSERSYS());		
	    view.setT$ZTESTITEM$CURRENTROLESYS(ztestitem.getCURRENTROLESYS());		
	    view.setT$ZTESTITEM$CURRENTUSERGORUPSYS(ztestitem.getCURRENTUSERGORUPSYS());		
	    view.setT$ZTESTITEM$CURRENTDEPARTMENTSYS(ztestitem.getCURRENTDEPARTMENTSYS());		
	    view.setT$ZTESTITEM$ISSTARTRECYCLE(ztestitem.getISSTARTRECYCLE());		
	    view.setT$ZTESTITEM$SHAREROLESYS(ztestitem.getSHAREROLESYS());		
	    view.setT$ZTESTITEM$SHAREUSERSYS(ztestitem.getSHAREUSERSYS());		
	    view.setT$ZTESTITEM$SHAREDEPARTMENTSYS(ztestitem.getSHAREDEPARTMENTSYS());		
	    view.setT$ZTESTITEM$SHAREUSERGROUP(ztestitem.getSHAREUSERGROUP());		
	    view.setT$ZTESTITEM$SALES_ORG(ztestitem.getSALES_ORG());		
	    view.setT$ZTESTITEM$DISTR_CHAN(ztestitem.getDISTR_CHAN());		
	    view.setT$ZTESTITEM$DIVISION(ztestitem.getDIVISION());		
	    view.setT$ZTESTITEM$SALES_OFFICE(ztestitem.getSALES_OFFICE());		
	    view.setT$ZTESTITEM$SALES_GROUP(ztestitem.getSALES_GROUP());		
	    view.setT$ZTESTITEM$SALES_AREA(ztestitem.getSALES_AREA());		
	    view.setT$ZTESTITEM$IS_DELETESYS(ztestitem.getIS_DELETESYS());		
	    view.setT$ZTESTITEM$UPDATE_DATESYS(ztestitem.getUPDATE_DATESYS());		
	    view.setT$ZTESTITEM$PO_ITEM(ztestitem.getPO_ITEM());		
	    view.setT$ZTESTITEM$VALUE(ztestitem.getVALUE());		
	    view.setT$ZTESTITEM$HCODENUM(ztestitem.getHCODENUM());		
        } catch (Exception e) {
            throw new BaseRuntimeException("由Ztestitem得到ZtestitemView出错", e);
        }
        return view;
    }
    
    
    /** 
     * @param ztestitemView
     * @return
     */
    public static Ztestitem getZtestitem(ZtestitemView ztestitemView) {
        Ztestitem data = new Ztestitem();
        try {
	    data.setCODENUM(ztestitemView.getT$ZTESTITEM$CODENUM());	
	    data.setISLOCKSTATUSSYS(ztestitemView.getT$ZTESTITEM$ISLOCKSTATUSSYS());	
	    data.setCURRENTUSERSYS(ztestitemView.getT$ZTESTITEM$CURRENTUSERSYS());	
	    data.setCURRENTROLESYS(ztestitemView.getT$ZTESTITEM$CURRENTROLESYS());	
	    data.setCURRENTUSERGORUPSYS(ztestitemView.getT$ZTESTITEM$CURRENTUSERGORUPSYS());	
	    data.setCURRENTDEPARTMENTSYS(ztestitemView.getT$ZTESTITEM$CURRENTDEPARTMENTSYS());	
	    data.setISSTARTRECYCLE(ztestitemView.getT$ZTESTITEM$ISSTARTRECYCLE());	
	    data.setSHAREROLESYS(ztestitemView.getT$ZTESTITEM$SHAREROLESYS());	
	    data.setSHAREUSERSYS(ztestitemView.getT$ZTESTITEM$SHAREUSERSYS());	
	    data.setSHAREDEPARTMENTSYS(ztestitemView.getT$ZTESTITEM$SHAREDEPARTMENTSYS());	
	    data.setSHAREUSERGROUP(ztestitemView.getT$ZTESTITEM$SHAREUSERGROUP());	
	    data.setSALES_ORG(ztestitemView.getT$ZTESTITEM$SALES_ORG());	
	    data.setDISTR_CHAN(ztestitemView.getT$ZTESTITEM$DISTR_CHAN());	
	    data.setDIVISION(ztestitemView.getT$ZTESTITEM$DIVISION());	
	    data.setSALES_OFFICE(ztestitemView.getT$ZTESTITEM$SALES_OFFICE());	
	    data.setSALES_GROUP(ztestitemView.getT$ZTESTITEM$SALES_GROUP());	
	    data.setSALES_AREA(ztestitemView.getT$ZTESTITEM$SALES_AREA());	
	    data.setIS_DELETESYS(ztestitemView.getT$ZTESTITEM$IS_DELETESYS());	
	    data.setUPDATE_DATESYS(ztestitemView.getT$ZTESTITEM$UPDATE_DATESYS());	
	    data.setPO_ITEM(ztestitemView.getT$ZTESTITEM$PO_ITEM());	
	    data.setVALUE(ztestitemView.getT$ZTESTITEM$VALUE());	
	    data.setHCODENUM(ztestitemView.getT$ZTESTITEM$HCODENUM());	
        } catch (Exception e) {
            throw new BaseRuntimeException("由ZtestitemView得到Ztestitem出错", e);
        }
        return data;
    }  
}