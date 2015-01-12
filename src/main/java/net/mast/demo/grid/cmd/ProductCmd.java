/*     */ package net.mast.demo.grid.cmd;
/*     */ 
/*     */ import javax.servlet.http.HttpServletRequest;
/*     */ import javax.servlet.http.HttpServletResponse;
/*     */ import org.apache.commons.logging.Log;
/*     */ import org.apache.commons.logging.LogFactory;
/*     */ import net.mast.demo.DP;
/*     */ import net.mast.demo.grid.service.IProductService;
/*     */ import net.mast.demo.grid.view.ProductView;
/*     */ import net.mast.util.IErrorHandler;
/*     */ import net.mast.util.IMessageHandler;
/*     */ import net.mast.waf.mvc.MultiCommand;
/*     */ import net.mast.waf.mvc.ViewHelper;
/*     */ 
/*     */ public class ProductCmd extends MultiCommand
/*     */ {
/*  25 */   private static Log log = LogFactory.getLog(ProductCmd.class);
/*  26 */   private IProductService productService = null;
/*     */ 
/*     */   public String forinsert(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/*  41 */     ProductView vi = new ProductView();
/*  42 */     viewHelper.setView(vi);
/*  43 */     return "productView.forinsert";
/*     */   }
/*     */ 
/*     */   public String forupdate(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/*  59 */     String pkargs = req.getParameter("primaryKey");
/*  60 */     String itemProductid = pkargs;
/*  61 */     viewHelper.setView(getProductService().getProductView(itemProductid));
/*  62 */     return "productView.forupdate";
/*     */   }
/*     */ 
/*     */   public String detail(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/*  78 */     String pkargs = req.getParameter("primaryKey");
/*  79 */     String itemProductid = pkargs;
/*  80 */     viewHelper.setView(getProductService().getProductView(itemProductid));
/*  81 */     return "productView.detail";
/*     */   }
/*     */ 
/*     */   public String insert(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/*  97 */     ProductView viewin = (ProductView)viewHelper.getView();
/*     */ 
/*  99 */     viewHelper.setView(getProductService().insertProduct(viewin));
/* 100 */     return "productView.detail";
/*     */   }
/*     */ 
/*     */   public String insertContinue(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 116 */     ProductView viewin = (ProductView)viewHelper.getView();
/*     */ 
/* 118 */     getProductService().insertProduct(viewin);
/* 119 */     ProductView vi = new ProductView();
/* 120 */     viewHelper.setView(vi);
/* 121 */     return "productView.forinsert";
/*     */   }
/*     */ 
/*     */   public String update(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 137 */     viewHelper.setView(getProductService().updateProduct(
/* 138 */       (ProductView)viewHelper.getView()));
/* 139 */     return "productView.detail";
/*     */   }
/*     */ 
/*     */   public String delete(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 155 */     String[] delPK = req.getParameterValues("primaryKey");
/* 156 */     for (int i = 0; i < delPK.length; ++i) {
/* 157 */       String itemProductid = delPK[i];
/* 158 */       getProductService().deleteProduct(itemProductid);
/*     */     }
/* 160 */     return "productViewChain.success";
/*     */   }
/*     */ 
/*     */   public void afterPropertiesSet()
/*     */     throws Exception
/*     */   {
/* 167 */     super.afterPropertiesSet();
/* 168 */     if (getProductService() == null)
/* 169 */       throw new RuntimeException("ProductCmd" + 
/* 170 */         DP.getString("Demo.Common.ConfigureError") + 
/* 171 */         "ProductService" + DP.getString("Demo.Common.Notbenull"));
/*     */   }
/*     */ 
/*     */   public IProductService getProductService()
/*     */   {
/* 179 */     return this.productService;
/*     */   }
/*     */ 
/*     */   public void setProductService(IProductService service)
/*     */   {
/* 186 */     this.productService = service;
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.grid.cmd.ProductCmd
 * JD-Core Version:    0.5.3
 */