/*    */ package net.mast.demo.tree.utils;
/*    */ 
/*    */ import java.util.ArrayList;
/*    */ import java.util.List;
/*    */ import net.mast.commons.exception.BaseRuntimeException;
/*    */ import net.mast.demo.tree.data.OrganStru;
/*    */ import net.mast.demo.tree.view.OrganStruView;
/*    */ 
/*    */ public class OrganStruViewUtils
/*    */ {
/*    */   public static List getOrganStruListView(List list)
/*    */   {
/* 20 */     if (list == null) {
/* 21 */       return null;
/*    */     }
/* 23 */     List view = new ArrayList(list.size());
/* 24 */     for (int i = 0; i < list.size(); ++i) {
/* 25 */       view.add(getOrganStruView((OrganStru)list.get(i)));
/*    */     }
/* 27 */     return view;
/*    */   }
/*    */ 
/*    */   public static List getOrganStruList(List list)
/*    */   {
/* 35 */     if (list == null) {
/* 36 */       return null;
/*    */     }
/* 38 */     List datas = new ArrayList(list.size());
/* 39 */     for (int i = 0; i < list.size(); ++i) {
/* 40 */       datas.add(getOrganStru((OrganStruView)list.get(i)));
/*    */     }
/* 42 */     return datas;
/*    */   }
/*    */ 
/*    */   public static OrganStruView getOrganStruView(OrganStru organStru)
/*    */   {
/* 49 */     if (organStru == null) {
/* 50 */       throw new BaseRuntimeException("query OrganStru record is null  Error");
/*    */     }
/* 52 */     OrganStruView view = new OrganStruView();
/*    */     try {
/* 54 */       view.setOrganId(organStru.getOrganId());
/* 55 */       view.setOrganAlias(organStru.getOrganAlias());
/* 56 */       view.setOrganType(organStru.getOrganType());
/* 57 */       view.setParentId(organStru.getParentId());
/* 58 */       view.setPrincipalId(organStru.getPrincipalId());
/* 59 */       view.setStruPath(organStru.getStruPath());
/* 60 */       view.setOrganOrder(organStru.getOrganOrder());
/* 61 */       view.setBeginDate(organStru.getBeginDate());
/* 62 */       view.setEndDate(organStru.getEndDate());
/* 63 */       view.setIsLeaf(organStru.getIsLeaf());
/*    */     } catch (Exception e) {
/* 65 */       throw new BaseRuntimeException("Error getting OrganStruView from OrganStru", e);
/*    */     }
/* 67 */     return view;
/*    */   }
/*    */ 
/*    */   public static OrganStru getOrganStru(OrganStruView organStruView)
/*    */   {
/* 74 */     OrganStru data = new OrganStru();
/*    */     try {
/* 76 */       data.setOrganId(organStruView.getOrganId());
/* 77 */       data.setOrganAlias(organStruView.getOrganAlias());
/* 78 */       data.setOrganType(organStruView.getOrganType());
/* 79 */       data.setParentId(organStruView.getParentId());
/* 80 */       data.setPrincipalId(organStruView.getPrincipalId());
/* 81 */       data.setStruPath(organStruView.getStruPath());
/* 82 */       data.setOrganOrder(organStruView.getOrganOrder());
/* 83 */       data.setBeginDate(organStruView.getBeginDate());
/* 84 */       data.setEndDate(organStruView.getEndDate());
/* 85 */       data.setIsLeaf(organStruView.getIsLeaf());
/*    */     } catch (Exception e) {
/* 87 */       throw new BaseRuntimeException("Error getting OrganStru from OrganStruView", e);
/*    */     }
/* 89 */     return data;
/*    */   }
/*    */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.tree.utils.OrganStruViewUtils
 * JD-Core Version:    0.5.3
 */