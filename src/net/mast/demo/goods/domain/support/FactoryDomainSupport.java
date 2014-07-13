/*     */ package net.mast.demo.goods.domain.support;
/*     */ 
/*     */ import java.util.List;
/*     */ import java.util.Map;
/*     */ import net.mast.demo.goods.dao.IFactoryDao;
/*     */ import net.mast.demo.goods.domain.Factory;
/*     */ import net.mast.demo.goods.domain.IFactoryDomain;
/*     */ import net.mast.util.Page;
/*     */ import net.mast.util.RowSelection;
/*     */ import net.mast.util.domain.BaseDomain;
/*     */ 
/*     */ public class FactoryDomainSupport extends BaseDomain
/*     */   implements IFactoryDomain
/*     */ {
/*     */   private IFactoryDao factoryDao;
/*     */ 
/*     */   public int delete(String factoryId)
/*     */   {
/*  34 */     return getFactoryDao().delete(factoryId);
/*     */   }
/*     */ 
/*     */   public Factory get(String factoryId)
/*     */   {
/*  43 */     Factory factory = getFactoryDao().get(factoryId);
/*  44 */     return factory;
/*     */   }
/*     */ 
/*     */   public Page query(RowSelection rowSelection, Map map)
/*     */   {
/*  53 */     return getFactoryDao().query(rowSelection, map);
/*     */   }
/*     */ 
/*     */   public List queryNoPage(Map map)
/*     */   {
/*  62 */     return getFactoryDao().queryNoPage(map);
/*     */   }
/*     */ 
/*     */   public Factory insert(Factory factory)
/*     */   {
/*  71 */     Factory mainData = getFactoryDao().insert(factory);
/*  72 */     return mainData;
/*     */   }
/*     */ 
/*     */   public Factory update(Factory factory)
/*     */   {
/*  81 */     Factory mainData = getFactoryDao().update(factory);
/*  82 */     return mainData;
/*     */   }
/*     */ 
/*     */   public IFactoryDao getFactoryDao()
/*     */   {
/*  88 */     return this.factoryDao;
/*     */   }
/*     */ 
/*     */   public void setFactoryDao(IFactoryDao factoryDao)
/*     */   {
/*  95 */     this.factoryDao = factoryDao;
/*     */   }
/*     */ 
/*     */   protected void initDomain()
/*     */   {
/* 102 */     if (getFactoryDao() == null)
/* 103 */       throw new IllegalArgumentException("FactoryDao must not be null");
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.goods.domain.support.FactoryDomainSupport
 * JD-Core Version:    0.5.3
 */