/*     */ package net.mast.demo.grid.domain.support;
/*     */ 
/*     */ import java.util.List;
/*     */ import java.util.Map;
/*     */ import org.apache.commons.logging.Log;
/*     */ import org.apache.commons.logging.LogFactory;
/*     */ import net.mast.demo.DP;
/*     */ import net.mast.demo.grid.dao.IProductDao;
/*     */ import net.mast.demo.grid.data.Product;
/*     */ import net.mast.demo.grid.domain.IProductDomain;
/*     */ import net.mast.util.Page;
/*     */ import net.mast.util.RowSelection;
/*     */ import net.mast.util.domain.BaseDomain;
/*     */ 
/*     */ public class ProductDomainImpl extends BaseDomain
/*     */   implements IProductDomain
/*     */ {
/*  17 */   private static Log log = LogFactory.getLog(ProductDomainImpl.class);
/*  18 */   private IProductDao productDao = null;
/*     */ 
/*     */   public void deleteProduct(String itemProductid)
/*     */   {
/*  26 */     getProductDao().deleteProduct(itemProductid);
/*     */   }
/*     */ 
/*     */   public Product getProduct(String itemProductid)
/*     */   {
/*  36 */     return getProductDao().getProduct(itemProductid);
/*     */   }
/*     */ 
/*     */   public Page getAllProduct(RowSelection rowSelection, Map map)
/*     */   {
/*  47 */     return getProductDao().getAllProduct(rowSelection, map);
/*     */   }
/*     */ 
/*     */   public List getAllProductNoPage(Map map)
/*     */   {
/*  57 */     return getProductDao().getAllProductNoPage(map);
/*     */   }
/*     */ 
/*     */   public Product insertProduct(Product product)
/*     */   {
/*  68 */     return getProductDao().insertProduct(product);
/*     */   }
/*     */ 
/*     */   public Product updateProduct(Product product)
/*     */   {
/*  79 */     return getProductDao().updateProduct(product);
/*     */   }
/*     */ 
/*     */   public IProductDao getProductDao()
/*     */   {
/*  86 */     return this.productDao;
/*     */   }
/*     */ 
/*     */   public void setProductDao(IProductDao dao)
/*     */   {
/*  93 */     this.productDao = dao;
/*     */   }
/*     */ 
/*     */   protected void initDomain()
/*     */   {
/* 100 */     if (getProductDao() == null)
/* 101 */       throw new RuntimeException("ProductDomainImpl" + 
/* 102 */         DP.getString("Demo.Common.ConfigureError") + "productDao" + 
/* 103 */         DP.getString("Demo.Common.Notbenull"));
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.grid.domain.support.ProductDomainImpl
 * JD-Core Version:    0.5.3
 */