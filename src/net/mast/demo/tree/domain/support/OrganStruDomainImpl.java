/*     */ package net.mast.demo.tree.domain.support;
/*     */ 
/*     */ import java.util.List;
/*     */ import java.util.Map;
/*     */ import org.apache.commons.logging.Log;
/*     */ import org.apache.commons.logging.LogFactory;
/*     */ import net.mast.demo.DP;
/*     */ import net.mast.demo.tree.dao.IOrganStruDao;
/*     */ import net.mast.demo.tree.data.OrganStru;
/*     */ import net.mast.demo.tree.domain.IOrganStruDomain;
/*     */ import net.mast.util.Page;
/*     */ import net.mast.util.RowSelection;
/*     */ import net.mast.util.domain.BaseDomain;
/*     */ 
/*     */ public class OrganStruDomainImpl extends BaseDomain
/*     */   implements IOrganStruDomain
/*     */ {
/*  21 */   private static Log log = LogFactory.getLog(OrganStruDomainImpl.class);
/*  22 */   private IOrganStruDao organStruDao = null;
/*     */ 
/*     */   public void deleteOrganStru(String organId)
/*     */   {
/*  30 */     getOrganStruDao().deleteOrganStru(organId);
/*     */   }
/*     */ 
/*     */   public OrganStru getOrganStru(String organId)
/*     */   {
/*  39 */     return getOrganStruDao().getOrganStru(organId);
/*     */   }
/*     */ 
/*     */   public Page getAllOrganStru(RowSelection rowSelection, Map map)
/*     */   {
/*  49 */     return getOrganStruDao().getAllOrganStru(rowSelection, map);
/*     */   }
/*     */ 
/*     */   public List getAllOrganStruNoPage(Map map)
/*     */   {
/*  57 */     return getOrganStruDao().getAllOrganStruNoPage(map);
/*     */   }
/*     */ 
/*     */   public OrganStru insertOrganStru(OrganStru organStru)
/*     */   {
/*  67 */     return getOrganStruDao().insertOrganStru(organStru);
/*     */   }
/*     */ 
/*     */   public OrganStru updateOrganStru(OrganStru organStru)
/*     */   {
/*  77 */     return getOrganStruDao().updateOrganStru(organStru);
/*     */   }
/*     */ 
/*     */   public IOrganStruDao getOrganStruDao()
/*     */   {
/*  83 */     return this.organStruDao;
/*     */   }
/*     */ 
/*     */   public void setOrganStruDao(IOrganStruDao dao)
/*     */   {
/*  90 */     this.organStruDao = dao;
/*     */   }
/*     */ 
/*     */   protected void initDomain()
/*     */   {
/*  97 */     if (getOrganStruDao() == null)
/*  98 */       throw new RuntimeException("OrganStruDomainImpl" + DP.getString("Demo.Common.ConfigureError") + "organStruDao" + DP.getString("Demo.Common.Notbenull"));
/*     */   }
/*     */ 
/*     */   public List getStruPath(String organAlias) {
/* 102 */     return getOrganStruDao().getStruPath(organAlias); }
/*     */ 
/*     */   public List getChildren(String code) {
/* 105 */     return getOrganStruDao().getChildren(code);
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.tree.domain.support.OrganStruDomainImpl
 * JD-Core Version:    0.5.3
 */