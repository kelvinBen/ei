/*    */ package net.mast.demo.flexgrid.utils;
/*    */ 
/*    */ import java.util.ArrayList;
/*    */ import java.util.List;
/*    */ import net.mast.commons.exception.BaseRuntimeException;
/*    */ import net.mast.demo.DP;
/*    */ import net.mast.demo.flexgrid.data.Flexgrid;
/*    */ import net.mast.demo.flexgrid.view.FlexgridView;
/*    */ 
/*    */ public class FlexgridViewUtils
/*    */ {
/*    */   public static List getFlexgridListView(List list)
/*    */   {
/* 22 */     if (list == null) {
/* 23 */       return null;
/*    */     }
/* 25 */     List view = new ArrayList(list.size());
/* 26 */     for (int i = 0; i < list.size(); ++i) {
/* 27 */       view.add(getFlexgridView((Flexgrid)list.get(i)));
/*    */     }
/* 29 */     return view;
/*    */   }
/*    */ 
/*    */   public static List getFlexgridList(List list)
/*    */   {
/* 37 */     if (list == null) {
/* 38 */       return null;
/*    */     }
/* 40 */     List datas = new ArrayList(list.size());
/* 41 */     for (int i = 0; i < list.size(); ++i) {
/* 42 */       datas.add(getFlexgrid((FlexgridView)list.get(i)));
/*    */     }
/* 44 */     return datas;
/*    */   }
/*    */ 
/*    */   public static FlexgridView getFlexgridView(Flexgrid flexgrid)
/*    */   {
/* 51 */     if (flexgrid == null) {
/* 52 */       throw new BaseRuntimeException(DP.getString("Demo.Common.Query") + "Flexgrid" + DP.getString("Demo.Common.Recordisnull"));
/*    */     }
/* 54 */     FlexgridView view = new FlexgridView();
/*    */     try {
/* 56 */       view.setFlexId(flexgrid.getFlexId());
/* 57 */       view.setFlexText(flexgrid.getFlexText());
/* 58 */       view.setFlexCurrency(flexgrid.getFlexCurrency());
/* 59 */       view.setFlexDate(flexgrid.getFlexDate());
/* 60 */       view.setFlexNumeric(flexgrid.getFlexNumeric());
/* 61 */       view.setFlexEnum(flexgrid.getFlexEnum());
/* 62 */       view.setEmployeeCountry(flexgrid.getEmployeeCountry());
/* 63 */       view.setEmployeeProvince(flexgrid.getEmployeeProvince());
/* 64 */       view.setEmployeeCity(flexgrid.getEmployeeCity());
/* 65 */       String[] AllFlexListenum = flexgrid.getFlexListenum().split(",");
/* 66 */       view.setFlexListenum(AllFlexListenum);
/* 67 */       view.setFlexSql(flexgrid.getFlexSql());
/*    */     } catch (Exception e) {
/* 69 */       throw new BaseRuntimeException(DP.getString("Demo.Common.From") + "Flexgrid" + DP.getString("Demo.Common.Get") + "FlexgridView" + DP.getString("Demo.Common.Error"), e);
/*    */     }
/* 71 */     return view;
/*    */   }
/*    */ 
/*    */   public static Flexgrid getFlexgrid(FlexgridView flexgridView)
/*    */   {
/* 78 */     Flexgrid data = new Flexgrid();
/*    */     try {
/* 80 */       data.setFlexId(flexgridView.getFlexId());
/* 81 */       data.setFlexText(flexgridView.getFlexText());
/* 82 */       data.setFlexCurrency(flexgridView.getFlexCurrency());
/* 83 */       data.setFlexDate(flexgridView.getFlexDate());
/* 84 */       data.setFlexNumeric(flexgridView.getFlexNumeric());
/* 85 */       data.setFlexEnum(flexgridView.getFlexEnum());
/* 86 */       data.setEmployeeCountry(flexgridView.getEmployeeCountry());
/* 87 */       data.setEmployeeProvince(flexgridView.getEmployeeProvince());
/* 88 */       data.setEmployeeCity(flexgridView.getEmployeeCity());
/* 89 */       String AllFlexListenum = "";
/* 90 */       for (int k = 0; k < flexgridView.getFlexListenum().length; ++k) {
/* 91 */         AllFlexListenum = AllFlexListenum + flexgridView.getFlexListenum()[k] + ",";
/*    */       }
/* 93 */       data.setFlexListenum(AllFlexListenum);
/* 94 */       data.setFlexSql(flexgridView.getFlexSql());
/*    */     } catch (Exception e) {
/* 96 */       throw new BaseRuntimeException(DP.getString("Demo.Common.From") + "FlexgridView" + DP.getString("Demo.Common.Get") + "Flexgrid" + DP.getString("Demo.Common.Error"), e);
/*    */     }
/* 98 */     return data;
/*    */   }
/*    */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.flexgrid.utils.FlexgridViewUtils
 * JD-Core Version:    0.5.3
 */