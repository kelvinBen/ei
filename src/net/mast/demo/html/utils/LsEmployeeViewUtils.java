/*     */ package net.mast.demo.html.utils;
/*     */ 
/*     */ import java.util.ArrayList;
/*     */ import java.util.List;
/*     */ import net.mast.commons.exception.BaseRuntimeException;
/*     */ import net.mast.demo.DP;
/*     */ import net.mast.demo.html.data.LsEmployee;
/*     */ import net.mast.demo.html.view.LsEmployeeView;
/*     */ 
/*     */ public class LsEmployeeViewUtils
/*     */ {
/*     */   public static List getLsEmployeeListView(List list)
/*     */   {
/*  22 */     if (list == null) {
/*  23 */       return null;
/*     */     }
/*  25 */     List view = new ArrayList(list.size());
/*  26 */     for (int i = 0; i < list.size(); ++i) {
/*  27 */       view.add(getLsEmployeeView((LsEmployee)list.get(i)));
/*     */     }
/*  29 */     return view;
/*     */   }
/*     */ 
/*     */   public static List getLsEmployeeList(List list)
/*     */   {
/*  37 */     if (list == null) {
/*  38 */       return null;
/*     */     }
/*  40 */     List datas = new ArrayList(list.size());
/*  41 */     for (int i = 0; i < list.size(); ++i) {
/*  42 */       datas.add(getLsEmployee((LsEmployeeView)list.get(i)));
/*     */     }
/*  44 */     return datas;
/*     */   }
/*     */ 
/*     */   public static LsEmployeeView getLsEmployeeView(LsEmployee lsEmployee)
/*     */   {
/*  51 */     if (lsEmployee == null) {
/*  52 */       throw new BaseRuntimeException(DP.getString("Demo.Common.Query") + "LsEmployee " + DP.getString("Demo.Common.Recordisnull"));
/*     */     }
/*  54 */     LsEmployeeView view = new LsEmployeeView();
/*     */     try {
/*  56 */       view.setEmployeeCode(lsEmployee.getEmployeeCode());
/*  57 */       view.setEmployeeSex(lsEmployee.getEmployeeSex());
/*  58 */       view.setEmployeeName(lsEmployee.getEmployeeName());
/*  59 */       view.setEmployeeAge(lsEmployee.getEmployeeAge());
/*  60 */       view.setEmployeeMarry(lsEmployee.getEmployeeMarry());
/*  61 */       view.setEmployeeBirth(lsEmployee.getEmployeeBirth());
/*  62 */       view.setEmployeeEnterDate(lsEmployee.getEmployeeEnterDate());
/*  63 */       view.setEmployeeCompany(lsEmployee.getEmployeeCompany());
/*  64 */       view.setEmployeeDegree(lsEmployee.getEmployeeDegree());
/*  65 */       view.setEmployeeFax(lsEmployee.getEmployeeFax());
/*  66 */       view.setEmployeeCountry(lsEmployee.getEmployeeCountry());
/*  67 */       view.setEmployeeProvince(lsEmployee.getEmployeeProvince());
/*  68 */       view.setEmployeeCity(lsEmployee.getEmployeeCity());
/*  69 */       view.setEmployeePhone(lsEmployee.getEmployeePhone());
/*  70 */       view.setEmployeeDept(lsEmployee.getEmployeeDept());
/*  71 */       view.setEmployeePost(lsEmployee.getEmployeePost());
/*     */ 
/*  73 */       view.setImageContent(lsEmployee.getImageContent());
/*     */ 
/*  76 */       String[] AllEmployeePreference = lsEmployee.getEmployeePreference().split(",");
/*  77 */       view.setEmployeePreference(AllEmployeePreference);
/*  78 */       view.setEmployeeNote(lsEmployee.getEmployeeNote());
/*     */     } catch (Exception e) {
/*  80 */       throw new BaseRuntimeException(DP.getString("Demo.Common.From") + "LsEmployee" + DP.getString("Demo.Common.Get") + "LsEmployeeView" + DP.getString("Demo.Common.Error"), e);
/*     */     }
/*  82 */     return view;
/*     */   }
/*     */ 
/*     */   public static LsEmployee getLsEmployee(LsEmployeeView lsEmployeeView)
/*     */   {
/*  89 */     LsEmployee data = new LsEmployee();
/*     */     try {
/*  91 */       data.setEmployeeCode(lsEmployeeView.getEmployeeCode());
/*  92 */       data.setEmployeeSex(lsEmployeeView.getEmployeeSex());
/*  93 */       data.setEmployeeName(lsEmployeeView.getEmployeeName());
/*  94 */       data.setEmployeeAge(lsEmployeeView.getEmployeeAge());
/*  95 */       data.setEmployeeMarry(lsEmployeeView.getEmployeeMarry());
/*  96 */       data.setEmployeeBirth(lsEmployeeView.getEmployeeBirth());
/*  97 */       data.setEmployeeEnterDate(lsEmployeeView.getEmployeeEnterDate());
/*  98 */       data.setEmployeeCompany(lsEmployeeView.getEmployeeCompany());
/*  99 */       data.setEmployeeDegree(lsEmployeeView.getEmployeeDegree());
/* 100 */       data.setEmployeeFax(lsEmployeeView.getEmployeeFax());
/* 101 */       data.setEmployeeCountry(lsEmployeeView.getEmployeeCountry());
/* 102 */       data.setEmployeeProvince(lsEmployeeView.getEmployeeProvince());
/* 103 */       data.setEmployeeCity(lsEmployeeView.getEmployeeCity());
/* 104 */       data.setEmployeePhone(lsEmployeeView.getEmployeePhone());
/* 105 */       data.setEmployeeDept(lsEmployeeView.getEmployeeDept());
/* 106 */       data.setEmployeePost(lsEmployeeView.getEmployeePost());
/*     */ 
/* 108 */       data.setImageContent(lsEmployeeView.getImageContent());
/*     */ 
/* 111 */       String AllEmployeePreference = "";
/* 112 */       for (int k = 0; k < lsEmployeeView.getEmployeePreference().length; ++k) {
/* 113 */         AllEmployeePreference = AllEmployeePreference + lsEmployeeView.getEmployeePreference()[k] + ",";
/*     */       }
/*     */ 
/* 116 */       data.setEmployeePreference(AllEmployeePreference);
/* 117 */       data.setEmployeeNote(lsEmployeeView.getEmployeeNote());
/*     */     } catch (Exception e) {
/* 119 */       throw new BaseRuntimeException(DP.getString("Demo.Common.From") + "LsEmployeeView" + DP.getString("Demo.Common.Get") + "LsEmployee" + DP.getString("Demo.Common.Error"), e);
/*     */     }
/* 121 */     return data;
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.html.utils.LsEmployeeViewUtils
 * JD-Core Version:    0.5.3
 */