
/*
 * @(#)ViewUtils.java 
 *
 * Copyright (C) 2002-2008 The DiHua Software Foundation. All rights reserved.
 *
 * 程序生成时间：[Fri Jul 23 15:56:29 CST 2010] 生成
 */
package net.mast.demo.ztest.utils;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.mast.commons.exception.BaseRuntimeException;

import net.mast.demo.ztest.data.Ztest;
import net.mast.demo.ztest.data.Ztestitem;
import net.mast.demo.ztest.view.ZtestView;
import net.mast.demo.ztest.view.ZtestitemView;

/**
 * 功能:本类为测试行的ViewUtils
 *
 * @author  sp
 * @date    [Fri Jul 23 15:56:29 CST 2010]
 *
 * $Id$
 */
@SuppressWarnings({"unchecked", "unused"})
public class ZtestViewUtils {   
   /**
     * 通过databean取view list
     * @param list
     * @return
     */
    public static List getZtestListView(List list) {
        List view = new ArrayList(list.size());
        for (int i = 0; i < list.size(); i++) {
            view.add(getZtestView((Ztest) list.get(i)));
        }
        return view;
    }
    /**
     * 通过view取databean list
     * @param list
     * @return
     */
    public static List getZtestList(List list) {
        List datas = new ArrayList(list.size());
        for (int i = 0; i < list.size(); i++) {
            datas.add(getZtest((ZtestView) list.get(i)));
        }
        return datas;
    }
    
     /**
     * 通过databean取view list 2010-02-27新增
     * @param list
     * @return
     */
    public static List getZtestView_power(List list,Map map_power) {
        List view = new ArrayList(list.size());
        for (int i = 0; i < list.size(); i++) {
            view.add(getZtestView_power((Ztest) list.get(i), map_power)) ;
        }
        return view;
    }
    
    /** 
     * 2010-02-27新增
     * @param ztest
     * @return
     */
    public static ZtestView getZtestView_power(Ztest ztest,Map map_power) {
    	if(ztest==null){
    		throw new BaseRuntimeException("查询Ztest 记录为空 出错");
    	}
        ZtestView view = new ZtestView();
        try {
      		view.setI$ZTEST$CODENUM(ztest.getCODENUM());			          
      		view.setI$ZTEST$SALES_AREA(ztest.getSALES_AREA());			          
      		view.setI$ZTEST$IS_DELETESYS(ztest.getIS_DELETESYS());			          
      		view.setI$ZTEST$UPDATE_DATESYS(ztest.getUPDATE_DATESYS());			          
      		view.setI$ZTEST$ISSTARTRECYCLE(ztest.getISSTARTRECYCLE());			          
      		view.setI$ZTEST$SHAREROLESYS(ztest.getSHAREROLESYS());			          
      		view.setI$ZTEST$ID(ztest.getID());			          
      		view.setI$ZTEST$VALUE(ztest.getVALUE());			          
      		view.setI$ZTEST$ISLOCKSTATUSSYS(ztest.getISLOCKSTATUSSYS());			          
      		view.setI$ZTEST$CURRENTUSERSYS(ztest.getCURRENTUSERSYS());			          
      		view.setI$ZTEST$CURRENTROLESYS(ztest.getCURRENTROLESYS());			          
      		view.setI$ZTEST$CURRENTUSERGORUPSYS(ztest.getCURRENTUSERGORUPSYS());			          
      		view.setI$ZTEST$DIVISION(ztest.getDIVISION());			          
      		view.setI$ZTEST$SALES_OFFICE(ztest.getSALES_OFFICE());			          
      		view.setI$ZTEST$SALES_GROUP(ztest.getSALES_GROUP());			          
      		view.setI$ZTEST$SHAREDEPARTMENTSYS(ztest.getSHAREDEPARTMENTSYS());			          
      		view.setI$ZTEST$SHAREUSERGROUP(ztest.getSHAREUSERGROUP());			          
      		view.setI$ZTEST$CURRENTDEPARTMENTSYS(ztest.getCURRENTDEPARTMENTSYS());			          
      		view.setI$ZTEST$SALES_ORG(ztest.getSALES_ORG());			          
      		view.setI$ZTEST$DISTR_CHAN(ztest.getDISTR_CHAN());			          
      		view.setI$ZTEST$SHAREUSERSYS(ztest.getSHAREUSERSYS());			          
			//一对一表从表转换
			//一对多表从表转换
			Iterator lines0 = ztest.getListZtestitem().iterator();
			List detailview0  = new ArrayList();
			Ztestitem Ztestitem = null;
			ZtestitemView ZtestitemView=null;
			while(lines0.hasNext()){
				Ztestitem=(Ztestitem) lines0.next();
				ZtestitemView = new ZtestitemView();
				ZtestitemView.setT$ZTESTITEM$CODENUM(Ztestitem.getCODENUM());
				ZtestitemView.setT$ZTESTITEM$ISLOCKSTATUSSYS(Ztestitem.getISLOCKSTATUSSYS());
				ZtestitemView.setT$ZTESTITEM$CURRENTUSERSYS(Ztestitem.getCURRENTUSERSYS());
				ZtestitemView.setT$ZTESTITEM$CURRENTROLESYS(Ztestitem.getCURRENTROLESYS());
				ZtestitemView.setT$ZTESTITEM$CURRENTUSERGORUPSYS(Ztestitem.getCURRENTUSERGORUPSYS());
				ZtestitemView.setT$ZTESTITEM$CURRENTDEPARTMENTSYS(Ztestitem.getCURRENTDEPARTMENTSYS());
				ZtestitemView.setT$ZTESTITEM$ISSTARTRECYCLE(Ztestitem.getISSTARTRECYCLE());
				ZtestitemView.setT$ZTESTITEM$SHAREROLESYS(Ztestitem.getSHAREROLESYS());
				ZtestitemView.setT$ZTESTITEM$SHAREUSERSYS(Ztestitem.getSHAREUSERSYS());
				ZtestitemView.setT$ZTESTITEM$SHAREDEPARTMENTSYS(Ztestitem.getSHAREDEPARTMENTSYS());
				ZtestitemView.setT$ZTESTITEM$SHAREUSERGROUP(Ztestitem.getSHAREUSERGROUP());
				ZtestitemView.setT$ZTESTITEM$SALES_ORG(Ztestitem.getSALES_ORG());
				ZtestitemView.setT$ZTESTITEM$DISTR_CHAN(Ztestitem.getDISTR_CHAN());
				ZtestitemView.setT$ZTESTITEM$DIVISION(Ztestitem.getDIVISION());
				ZtestitemView.setT$ZTESTITEM$SALES_OFFICE(Ztestitem.getSALES_OFFICE());
				ZtestitemView.setT$ZTESTITEM$SALES_GROUP(Ztestitem.getSALES_GROUP());
				ZtestitemView.setT$ZTESTITEM$SALES_AREA(Ztestitem.getSALES_AREA());
				ZtestitemView.setT$ZTESTITEM$IS_DELETESYS(Ztestitem.getIS_DELETESYS());
				ZtestitemView.setT$ZTESTITEM$UPDATE_DATESYS(Ztestitem.getUPDATE_DATESYS());
				ZtestitemView.setT$ZTESTITEM$PO_ITEM(Ztestitem.getPO_ITEM());
				ZtestitemView.setT$ZTESTITEM$VALUE(Ztestitem.getVALUE());
				ZtestitemView.setT$ZTESTITEM$HCODENUM(Ztestitem.getHCODENUM());
				detailview0.add(ZtestitemView);
	    	}
	    	view.setListztestitem(detailview0);  

      		/*开始设置权限标记*/  
      		String all_power = map_power.get("3")==null?"":map_power.get("3").toString();
      		String sign="";
      		if(!all_power.equalsIgnoreCase("")){
      			sign=all_power;
      		}
      		else{
	      		//String depsign = map_power.get(ztest.getCURRENTDEPARTMENTSYS())==null?"":map_power.get(ztest.getCURRENTDEPARTMENTSYS()).toString();
				//sign = map_power.get(ztest.getCURRENTUSERSYS())==null?depsign:map_power.get(ztest.getCURRENTUSERSYS()).toString();
      		}
			view.setSign(sign);
         
        } catch (Exception e) {
            throw new BaseRuntimeException("由Ztest得到ZtestView出错", e);
        }
        return view;
    }
    
    
    /** 
     * @param ztest
     * @return
     */
    public static ZtestView getZtestView(Ztest ztest) {
    	if(ztest==null){
    		throw new BaseRuntimeException("查询Ztest 记录为空 出错");
    	}
        ZtestView view = new ZtestView();
        try {
      		view.setI$ZTEST$CODENUM(ztest.getCODENUM());			          
      		view.setI$ZTEST$SALES_AREA(ztest.getSALES_AREA());			          
      		view.setI$ZTEST$IS_DELETESYS(ztest.getIS_DELETESYS());			          
      		view.setI$ZTEST$UPDATE_DATESYS(ztest.getUPDATE_DATESYS());			          
      		view.setI$ZTEST$ISSTARTRECYCLE(ztest.getISSTARTRECYCLE());			          
      		view.setI$ZTEST$SHAREROLESYS(ztest.getSHAREROLESYS());			          
      		view.setI$ZTEST$ID(ztest.getID());			          
      		view.setI$ZTEST$VALUE(ztest.getVALUE());			          
      		view.setI$ZTEST$ISLOCKSTATUSSYS(ztest.getISLOCKSTATUSSYS());			          
      		view.setI$ZTEST$CURRENTUSERSYS(ztest.getCURRENTUSERSYS());			          
      		view.setI$ZTEST$CURRENTROLESYS(ztest.getCURRENTROLESYS());			          
      		view.setI$ZTEST$CURRENTUSERGORUPSYS(ztest.getCURRENTUSERGORUPSYS());			          
      		view.setI$ZTEST$DIVISION(ztest.getDIVISION());			          
      		view.setI$ZTEST$SALES_OFFICE(ztest.getSALES_OFFICE());			          
      		view.setI$ZTEST$SALES_GROUP(ztest.getSALES_GROUP());			          
      		view.setI$ZTEST$SHAREDEPARTMENTSYS(ztest.getSHAREDEPARTMENTSYS());			          
      		view.setI$ZTEST$SHAREUSERGROUP(ztest.getSHAREUSERGROUP());			          
      		view.setI$ZTEST$CURRENTDEPARTMENTSYS(ztest.getCURRENTDEPARTMENTSYS());			          
      		view.setI$ZTEST$SALES_ORG(ztest.getSALES_ORG());			          
      		view.setI$ZTEST$DISTR_CHAN(ztest.getDISTR_CHAN());			          
      		view.setI$ZTEST$SHAREUSERSYS(ztest.getSHAREUSERSYS());			          
			//一对一表从表转换
			//一对多表从表转换
			Iterator lines0 = ztest.getListZtestitem().iterator();
			List detailview0  = new ArrayList();
			Ztestitem Ztestitem = null;
			ZtestitemView ZtestitemView=null;
			while(lines0.hasNext()){
				Ztestitem=(Ztestitem) lines0.next();
				ZtestitemView = new ZtestitemView();
				ZtestitemView.setT$ZTESTITEM$CODENUM(Ztestitem.getCODENUM());
				ZtestitemView.setT$ZTESTITEM$ISLOCKSTATUSSYS(Ztestitem.getISLOCKSTATUSSYS());
				ZtestitemView.setT$ZTESTITEM$CURRENTUSERSYS(Ztestitem.getCURRENTUSERSYS());
				ZtestitemView.setT$ZTESTITEM$CURRENTROLESYS(Ztestitem.getCURRENTROLESYS());
				ZtestitemView.setT$ZTESTITEM$CURRENTUSERGORUPSYS(Ztestitem.getCURRENTUSERGORUPSYS());
				ZtestitemView.setT$ZTESTITEM$CURRENTDEPARTMENTSYS(Ztestitem.getCURRENTDEPARTMENTSYS());
				ZtestitemView.setT$ZTESTITEM$ISSTARTRECYCLE(Ztestitem.getISSTARTRECYCLE());
				ZtestitemView.setT$ZTESTITEM$SHAREROLESYS(Ztestitem.getSHAREROLESYS());
				ZtestitemView.setT$ZTESTITEM$SHAREUSERSYS(Ztestitem.getSHAREUSERSYS());
				ZtestitemView.setT$ZTESTITEM$SHAREDEPARTMENTSYS(Ztestitem.getSHAREDEPARTMENTSYS());
				ZtestitemView.setT$ZTESTITEM$SHAREUSERGROUP(Ztestitem.getSHAREUSERGROUP());
				ZtestitemView.setT$ZTESTITEM$SALES_ORG(Ztestitem.getSALES_ORG());
				ZtestitemView.setT$ZTESTITEM$DISTR_CHAN(Ztestitem.getDISTR_CHAN());
				ZtestitemView.setT$ZTESTITEM$DIVISION(Ztestitem.getDIVISION());
				ZtestitemView.setT$ZTESTITEM$SALES_OFFICE(Ztestitem.getSALES_OFFICE());
				ZtestitemView.setT$ZTESTITEM$SALES_GROUP(Ztestitem.getSALES_GROUP());
				ZtestitemView.setT$ZTESTITEM$SALES_AREA(Ztestitem.getSALES_AREA());
				ZtestitemView.setT$ZTESTITEM$IS_DELETESYS(Ztestitem.getIS_DELETESYS());
				ZtestitemView.setT$ZTESTITEM$UPDATE_DATESYS(Ztestitem.getUPDATE_DATESYS());
				ZtestitemView.setT$ZTESTITEM$PO_ITEM(Ztestitem.getPO_ITEM());
				ZtestitemView.setT$ZTESTITEM$VALUE(Ztestitem.getVALUE());
				ZtestitemView.setT$ZTESTITEM$HCODENUM(Ztestitem.getHCODENUM());
				detailview0.add(ZtestitemView);
	    	}
	    	view.setListztestitem(detailview0);  
        } catch (Exception e) {
            throw new BaseRuntimeException("由Ztest得到ZtestView出错", e);
        }
        return view;
    }

    /** 
     * @param ztestView
     * @return
     */
    public static Ztest getZtest(ZtestView ztestView) {
        Ztest data = new Ztest();
        try {
      	data.setCODENUM(ztestView.getI$ZTEST$CODENUM());			          
      	data.setSALES_AREA(ztestView.getI$ZTEST$SALES_AREA());			          
      	data.setIS_DELETESYS(ztestView.getI$ZTEST$IS_DELETESYS());			          
      	data.setUPDATE_DATESYS(ztestView.getI$ZTEST$UPDATE_DATESYS());			          
      	data.setISSTARTRECYCLE(ztestView.getI$ZTEST$ISSTARTRECYCLE());			          
      	data.setSHAREROLESYS(ztestView.getI$ZTEST$SHAREROLESYS());			          
      	data.setID(ztestView.getI$ZTEST$ID());			          
      	data.setVALUE(ztestView.getI$ZTEST$VALUE());			          
      	data.setISLOCKSTATUSSYS(ztestView.getI$ZTEST$ISLOCKSTATUSSYS());			          
      	data.setCURRENTUSERSYS(ztestView.getI$ZTEST$CURRENTUSERSYS());			          
      	data.setCURRENTROLESYS(ztestView.getI$ZTEST$CURRENTROLESYS());			          
      	data.setCURRENTUSERGORUPSYS(ztestView.getI$ZTEST$CURRENTUSERGORUPSYS());			          
      	data.setDIVISION(ztestView.getI$ZTEST$DIVISION());			          
      	data.setSALES_OFFICE(ztestView.getI$ZTEST$SALES_OFFICE());			          
      	data.setSALES_GROUP(ztestView.getI$ZTEST$SALES_GROUP());			          
      	data.setSHAREDEPARTMENTSYS(ztestView.getI$ZTEST$SHAREDEPARTMENTSYS());			          
      	data.setSHAREUSERGROUP(ztestView.getI$ZTEST$SHAREUSERGROUP());			          
      	data.setCURRENTDEPARTMENTSYS(ztestView.getI$ZTEST$CURRENTDEPARTMENTSYS());			          
      	data.setSALES_ORG(ztestView.getI$ZTEST$SALES_ORG());			          
      	data.setDISTR_CHAN(ztestView.getI$ZTEST$DISTR_CHAN());			          
      	data.setSHAREUSERSYS(ztestView.getI$ZTEST$SHAREUSERSYS());			          
		//下面是对那个一对一的表的转化。
        //下面是对那个一对多的表的转化。
			Iterator lines0 = ztestView.getListztestitem().iterator();
			List detailview0  = new ArrayList();
			Ztestitem  Ztestitem = null;
			ZtestitemView  ZtestitemView = null;
			while(lines0.hasNext()){
				ZtestitemView=(ZtestitemView) lines0.next();
				Ztestitem = new Ztestitem();
				Ztestitem.setCODENUM(ZtestitemView.getT$ZTESTITEM$CODENUM());
				Ztestitem.setISLOCKSTATUSSYS(ZtestitemView.getT$ZTESTITEM$ISLOCKSTATUSSYS());
				Ztestitem.setCURRENTUSERSYS(ZtestitemView.getT$ZTESTITEM$CURRENTUSERSYS());
				Ztestitem.setCURRENTROLESYS(ZtestitemView.getT$ZTESTITEM$CURRENTROLESYS());
				Ztestitem.setCURRENTUSERGORUPSYS(ZtestitemView.getT$ZTESTITEM$CURRENTUSERGORUPSYS());
				Ztestitem.setCURRENTDEPARTMENTSYS(ZtestitemView.getT$ZTESTITEM$CURRENTDEPARTMENTSYS());
				Ztestitem.setISSTARTRECYCLE(ZtestitemView.getT$ZTESTITEM$ISSTARTRECYCLE());
				Ztestitem.setSHAREROLESYS(ZtestitemView.getT$ZTESTITEM$SHAREROLESYS());
				Ztestitem.setSHAREUSERSYS(ZtestitemView.getT$ZTESTITEM$SHAREUSERSYS());
				Ztestitem.setSHAREDEPARTMENTSYS(ZtestitemView.getT$ZTESTITEM$SHAREDEPARTMENTSYS());
				Ztestitem.setSHAREUSERGROUP(ZtestitemView.getT$ZTESTITEM$SHAREUSERGROUP());
				Ztestitem.setSALES_ORG(ZtestitemView.getT$ZTESTITEM$SALES_ORG());
				Ztestitem.setDISTR_CHAN(ZtestitemView.getT$ZTESTITEM$DISTR_CHAN());
				Ztestitem.setDIVISION(ZtestitemView.getT$ZTESTITEM$DIVISION());
				Ztestitem.setSALES_OFFICE(ZtestitemView.getT$ZTESTITEM$SALES_OFFICE());
				Ztestitem.setSALES_GROUP(ZtestitemView.getT$ZTESTITEM$SALES_GROUP());
				Ztestitem.setSALES_AREA(ZtestitemView.getT$ZTESTITEM$SALES_AREA());
				Ztestitem.setIS_DELETESYS(ZtestitemView.getT$ZTESTITEM$IS_DELETESYS());
				Ztestitem.setUPDATE_DATESYS(ZtestitemView.getT$ZTESTITEM$UPDATE_DATESYS());
				Ztestitem.setPO_ITEM(ZtestitemView.getT$ZTESTITEM$PO_ITEM());
				Ztestitem.setVALUE(ZtestitemView.getT$ZTESTITEM$VALUE());
				Ztestitem.setHCODENUM(ZtestitemView.getT$ZTESTITEM$HCODENUM());
				detailview0.add(Ztestitem);
	    	}
	    	data.setListZtestitem(detailview0);   
        } catch (Exception e) {
            throw new BaseRuntimeException("由ZtestView得到Ztest出错", e);
        }
        return data;
    }
   
}
