/*     */ package net.mast.demo.grid.cmd;
/*     */ 
/*     */ import java.util.Iterator;
/*     */ import java.util.List;
/*     */ import javax.servlet.http.HttpServletRequest;
/*     */ import javax.servlet.http.HttpServletResponse;
/*     */ import org.apache.commons.logging.Log;
/*     */ import org.apache.commons.logging.LogFactory;
/*     */ import net.mast.demo.DP;
/*     */ import net.mast.demo.grid.service.IMainGridService;
/*     */ import net.mast.demo.grid.service.IProductService;
/*     */ import net.mast.demo.grid.view.GridItemView;
/*     */ import net.mast.demo.grid.view.MainGridView;
/*     */ import net.mast.demo.grid.view.ProductView;
/*     */ import net.mast.util.IErrorHandler;
/*     */ import net.mast.util.IMessageHandler;
/*     */ import net.mast.waf.mvc.MultiCommand;
/*     */ import net.mast.waf.mvc.ViewHelper;
/*     */ 
/*     */ public class MainGridCmd extends MultiCommand
/*     */ {
/*  29 */   private static Log log = LogFactory.getLog(MainGridCmd.class);
/*  30 */   private IMainGridService mainGridService = null;
/*  31 */   private IProductService productService = null;
/*     */ 
/*     */   public String forinsert(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/*  46 */     MainGridView vi = new MainGridView();
/*  47 */     viewHelper.setView(vi);
/*  48 */     return "maingridView.forinsert";
/*     */   }
/*     */ 
/*     */   public String forupdate(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/*  64 */     String pkargs = req.getParameter("primaryKey");
/*  65 */     String mainGridId = pkargs;
/*  66 */     MainGridView viewin = getMainGridService().getMainGridView(mainGridId);
/*  67 */     List list = viewin.getListGridItem();
/*  68 */     Iterator it = list.iterator();
/*  69 */     while (it.hasNext()) {
/*  70 */       GridItemView gridItemVeiw = (GridItemView)it.next();
/*  71 */       String itemProductid = gridItemVeiw.getItemProductid();
/*  72 */       ProductView productView = getProductService().getProductView(
/*  73 */         itemProductid);
/*  74 */       gridItemVeiw.setItemProductname(productView.getItemProductname());
/*     */     }
/*  76 */     viewHelper.setView(viewin);
/*  77 */     return "maingridView.forupdate";
/*     */   }
/*     */ 
/*     */   public String detail(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/*  93 */     String pkargs = req.getParameter("primaryKey");
/*  94 */     String mainGridId = pkargs;
/*  95 */     viewHelper.setView(getMainGridService().getMainGridView(mainGridId));
/*  96 */     return "maingridView.detail";
/*     */   }
/*     */ 
/*     */   public String insert(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 112 */     MainGridView viewin = (MainGridView)viewHelper.getView();
/*     */ 
/* 114 */     viewHelper.setView(getMainGridService().insertMainGrid(viewin));
/* 115 */     return "maingridView.detail";
/*     */   }
/*     */ 
/*     */   public String insertContinue(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 131 */     MainGridView viewin = (MainGridView)viewHelper.getView();
/*     */ 
/* 133 */     getMainGridService().insertMainGrid(viewin);
/* 134 */     MainGridView vi = new MainGridView();
/* 135 */     viewHelper.setView(vi);
/* 136 */     return "maingridView.forinsert";
/*     */   }
/*     */ 
/*     */   public String update(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 152 */     viewHelper.setView(getMainGridService().updateMainGrid(
/* 153 */       (MainGridView)viewHelper.getView()));
/* 154 */     return "maingridView.detail";
/*     */   }
/*     */ 
/*     */   public String delete(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 170 */     String[] delPK = req.getParameterValues("primaryKey");
/* 171 */     for (int i = 0; i < delPK.length; ++i) {
/* 172 */       String mainGridId = delPK[i];
/* 173 */       getMainGridService().deleteMainGrid(mainGridId);
/*     */     }
/* 175 */     return "maingridViewChain.success";
/*     */   }
/*     */ 
/*     */   public void afterPropertiesSet()
/*     */     throws Exception
/*     */   {
/* 182 */     super.afterPropertiesSet();
/* 183 */     if (getMainGridService() == null)
/* 184 */       throw new RuntimeException("MainGridCmd" + 
/* 185 */         DP.getString("Demo.Common.ConfigureError") + 
/* 186 */         "MainGridService" + DP.getString("Demo.Common.Notbenull"));
/*     */   }
/*     */ 
/*     */   public IMainGridService getMainGridService()
/*     */   {
/* 194 */     return this.mainGridService;
/*     */   }
/*     */ 
/*     */   public void setMainGridService(IMainGridService service)
/*     */   {
/* 201 */     this.mainGridService = service;
/*     */   }
/*     */ 
/*     */   public IProductService getProductService()
/*     */   {
/* 208 */     return this.productService;
/*     */   }
/*     */ 
/*     */   public void setProductService(IProductService service)
/*     */   {
/* 215 */     this.productService = service;
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.grid.cmd.MainGridCmd
 * JD-Core Version:    0.5.3
 */