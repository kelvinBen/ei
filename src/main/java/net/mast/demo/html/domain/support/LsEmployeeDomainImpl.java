/*     */ package net.mast.demo.html.domain.support;
/*     */ 
/*     */ import java.util.List;
/*     */ import java.util.Map;
/*     */ import org.apache.commons.logging.Log;
/*     */ import org.apache.commons.logging.LogFactory;
/*     */ import net.mast.demo.DP;
/*     */ import net.mast.demo.html.dao.ILsEmployeeDao;
/*     */ import net.mast.demo.html.data.LsEmployee;
/*     */ import net.mast.demo.html.domain.ILsEmployeeDomain;
/*     */ import net.mast.util.Page;
/*     */ import net.mast.util.RowSelection;
/*     */ import net.mast.util.domain.BaseDomain;
/*     */ import net.mast.web.upload.util.ByteArrayProxy;
/*     */ 
/*     */ public class LsEmployeeDomainImpl extends BaseDomain
/*     */   implements ILsEmployeeDomain
/*     */ {
/*  22 */   private static Log log = LogFactory.getLog(LsEmployeeDomainImpl.class);
/*  23 */   private ILsEmployeeDao lsEmployeeDao = null;
/*     */ 
/*     */   public void deleteLsEmployee(String employeeCode)
/*     */   {
/*  31 */     getLsEmployeeDao().deleteLsEmployee(employeeCode);
/*     */   }
/*     */ 
/*     */   public LsEmployee getLsEmployee(String employeeCode)
/*     */   {
/*  40 */     return getLsEmployeeDao().getLsEmployee(employeeCode);
/*     */   }
/*     */ 
/*     */   public Page getAllLsEmployee(RowSelection rowSelection, Map map)
/*     */   {
/*  50 */     return getLsEmployeeDao().getAllLsEmployee(rowSelection, map);
/*     */   }
/*     */ 
/*     */   public List getAllLsEmployeeNoPage(Map map)
/*     */   {
/*  58 */     return getLsEmployeeDao().getAllLsEmployeeNoPage(map); }
/*     */ 
/*     */   public List getNode() {
/*  61 */     return getLsEmployeeDao().getNode();
/*     */   }
/*     */ 
/*     */   public LsEmployee insertLsEmployee(LsEmployee lsEmployee)
/*     */   {
/*  71 */     LsEmployee relsEmployee = lsEmployee;
/*  72 */     LsEmployee outLsEmployee = getLsEmployeeDao().getLsEmployee(relsEmployee.getEmployeeCode());
/*  73 */     if (outLsEmployee != null) {
/*  74 */       throw new RuntimeException(DP.getString("Demo.Common.Nonexiststaff"));
/*     */     }
/*  76 */     return getLsEmployeeDao().insertLsEmployee(lsEmployee);
/*     */   }
/*     */ 
/*     */   public LsEmployee updateLsEmployee(LsEmployee lsEmployee)
/*     */   {
/*  86 */     LsEmployee relsEmployee = lsEmployee;
/*  87 */     if (lsEmployee.getImageContent().getLength() == 0L)
/*     */     {
/*  89 */       return getLsEmployeeDao().updateLsEmployeeNoImg(lsEmployee);
/*     */     }
/*     */ 
/*  92 */     return getLsEmployeeDao().updateLsEmployee(lsEmployee);
/*     */   }
/*     */ 
/*     */   public ILsEmployeeDao getLsEmployeeDao()
/*     */   {
/*  99 */     return this.lsEmployeeDao;
/*     */   }
/*     */ 
/*     */   public void setLsEmployeeDao(ILsEmployeeDao dao)
/*     */   {
/* 106 */     this.lsEmployeeDao = dao;
/*     */   }
/*     */ 
/*     */   protected void initDomain()
/*     */   {
/* 113 */     if (getLsEmployeeDao() == null)
/* 114 */       throw new RuntimeException("LsEmployeeDomainImpl" + DP.getString("Demo.Common.ConfigureError") + "lsEmployeeDao" + DP.getString("Demo.Common.Notbenull"));
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.html.domain.support.LsEmployeeDomainImpl
 * JD-Core Version:    0.5.3
 */