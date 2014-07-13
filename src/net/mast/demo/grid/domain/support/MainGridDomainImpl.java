/*     */ package net.mast.demo.grid.domain.support;
/*     */ 
/*     */ import java.util.List;
/*     */ import java.util.Map;
/*     */ import org.apache.commons.logging.Log;
/*     */ import org.apache.commons.logging.LogFactory;
/*     */ import net.mast.demo.DP;
/*     */ import net.mast.demo.grid.dao.IMainGridDao;
/*     */ import net.mast.demo.grid.data.MainGrid;
/*     */ import net.mast.demo.grid.domain.IMainGridDomain;
/*     */ import net.mast.util.Page;
/*     */ import net.mast.util.RowSelection;
/*     */ import net.mast.util.domain.BaseDomain;
/*     */ 
/*     */ public class MainGridDomainImpl extends BaseDomain
/*     */   implements IMainGridDomain
/*     */ {
/*  20 */   private static Log log = LogFactory.getLog(MainGridDomainImpl.class);
/*  21 */   private IMainGridDao mainGridDao = null;
/*     */ 
/*     */   public void deleteMainGrid(String mainGridId)
/*     */   {
/*  29 */     getMainGridDao().deleteMainGrid(mainGridId);
/*     */   }
/*     */ 
/*     */   public MainGrid getMainGrid(String mainGridId)
/*     */   {
/*  39 */     return getMainGridDao().getMainGrid(mainGridId);
/*     */   }
/*     */ 
/*     */   public Page getAllMainGrid(RowSelection rowSelection, Map map)
/*     */   {
/*  50 */     return getMainGridDao().getAllMainGrid(rowSelection, map);
/*     */   }
/*     */ 
/*     */   public List getAllMainGridNoPage(Map map)
/*     */   {
/*  60 */     return getMainGridDao().getAllMainGridNoPage(map);
/*     */   }
/*     */ 
/*     */   public MainGrid insertMainGrid(MainGrid mainGrid)
/*     */   {
/*  71 */     return getMainGridDao().insertMainGrid(mainGrid);
/*     */   }
/*     */ 
/*     */   public MainGrid updateMainGrid(MainGrid mainGrid)
/*     */   {
/*  82 */     return getMainGridDao().updateMainGrid(mainGrid);
/*     */   }
/*     */ 
/*     */   public IMainGridDao getMainGridDao()
/*     */   {
/*  89 */     return this.mainGridDao;
/*     */   }
/*     */ 
/*     */   public void setMainGridDao(IMainGridDao dao)
/*     */   {
/*  96 */     this.mainGridDao = dao;
/*     */   }
/*     */ 
/*     */   protected void initDomain()
/*     */   {
/* 103 */     if (getMainGridDao() == null)
/* 104 */       throw new RuntimeException("MainGridServiceSupport" + 
/* 105 */         DP.getString("Demo.Common.ConfigureError") + 
/* 106 */         "mainGridDao" + DP.getString("Demo.Common.Notbenull"));
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.grid.domain.support.MainGridDomainImpl
 * JD-Core Version:    0.5.3
 */