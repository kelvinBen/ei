/*     */ package net.mast.demo.foods.cmd;
/*     */ 
/*     */ import java.util.ArrayList;
/*     */ import java.util.List;
/*     */ import java.util.Map;
/*     */ import javax.servlet.http.HttpServletRequest;
/*     */ import javax.servlet.http.HttpServletResponse;
/*     */ import net.mast.demo.DP;
/*     */ import net.mast.demo.foods.dao.IFoodDao;
/*     */ import net.mast.demo.foods.service.IXubiaoService;
/*     */ import net.mast.demo.foods.view.XubiaoView;
/*     */ import net.mast.util.IErrorHandler;
/*     */ import net.mast.util.IMessageHandler;
/*     */ import net.mast.util.KeyValue;
/*     */ import net.mast.util.Page;
/*     */ import net.mast.waf.data.LazyInitList;
/*     */ import net.mast.waf.mvc.MultiQueryCommand;
/*     */ import net.mast.waf.mvc.QueryHelper;
/*     */ import net.mast.waf.mvc.ViewHelper;
/*     */ 
/*     */ public class FoodCmd extends MultiQueryCommand
/*     */ {
/*  25 */   private IXubiaoService xubiaoService = null;
/*  26 */   private IFoodDao foodDao = null;
/*     */ 
/*     */   protected List[] query(HttpServletRequest arg0, HttpServletResponse arg1, QueryHelper helper, Map map)
/*     */   {
/*  30 */     Page page = this.foodDao.query(helper.getRowSelection(), map);
/*     */ 
/*  32 */     helper.setPage(page);
/*  33 */     return new List[] { page.getDatas() };
/*     */   }
/*     */ 
/*     */   public IFoodDao getFoodDao() {
/*  37 */     return this.foodDao; }
/*     */ 
/*     */   public void setFoodDao(IFoodDao foodDao) {
/*  40 */     this.foodDao = foodDao;
/*     */   }
/*     */ 
/*     */   public String saveandupdate(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/*  49 */     viewHelper.setListnames(new String[] { "foodList" });
/*  50 */     getXubiaoService().saveandquery((XubiaoView)viewHelper.getView());
/*  51 */     viewHelper.setSearch(false);
/*  52 */     putCollection(req, rep);
/*  53 */     return "foodView.forupdate";
/*     */   }
/*     */ 
/*     */   public String saveandinsert(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/*  61 */     viewHelper.setListnames(new String[] { "foodList" });
/*  62 */     return "foodView.forinsert";
/*     */   }
/*     */ 
/*     */   private void putCollection(HttpServletRequest req, HttpServletResponse rep)
/*     */   {
/*  70 */     LazyInitList listFoodOrigin = new LazyInitList() {
/*     */       protected List init() {
/*  72 */         List list = new ArrayList();
/*  73 */         list.add(new KeyValue("1", DP.getString("Demo.Common.Chengdu")));
/*  74 */         list.add(new KeyValue("2", DP.getString("Demo.Common.SiziwangBanner")));
/*  75 */         list.add(new KeyValue("3", DP.getString("Demo.Common.Kunming")));
/*  76 */         list.add(new KeyValue("4", DP.getString("Demo.Common.Suzhou")));
/*  77 */         list.add(new KeyValue("5", DP.getString("Demo.Common.Hangzhou")));
/*  78 */         return list;
/*     */       }
/*     */     };
/*  81 */     req.setAttribute("FOOD_FOOD_ORIGIN_COLLECTION", listFoodOrigin);
/*     */   }
/*     */ 
/*     */   public String forinsert(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/*  94 */     XubiaoView view = new XubiaoView();
/*  95 */     viewHelper.setView(view);
/*  96 */     putCollection(req, rep);
/*  97 */     return "foodView.forinsert";
/*     */   }
/*     */ 
/*     */   public String forupdate(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 110 */     viewHelper.setListnames(new String[] { "foodList" });
/* 111 */     XubiaoView viewin = getXubiaoService().get();
/* 112 */     viewHelper.setView(viewin);
/* 113 */     putCollection(req, rep);
/* 114 */     querySearch(req, rep, errorHandler, messageHandler, viewHelper);
/* 115 */     return "foodView.forupdate";
/*     */   }
/*     */ 
/*     */   public String detail(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 129 */     viewHelper.setListnames(new String[] { "foodList" });
/* 130 */     String pk = req.getParameter("primaryKey");
/* 131 */     XubiaoView viewin = getXubiaoService().get();
/* 132 */     viewHelper.setView(viewin);
/* 133 */     putCollection(req, rep);
/* 134 */     return "foodView.detail";
/*     */   }
/*     */ 
/*     */   public String insert(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 147 */     XubiaoView viewin = (XubiaoView)viewHelper.getView();
/* 148 */     viewHelper.setView(getXubiaoService().insert(viewin));
/* 149 */     putCollection(req, rep);
/* 150 */     return "foodView.detail";
/*     */   }
/*     */ 
/*     */   public String insertContinue(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 163 */     XubiaoView viewin = (XubiaoView)viewHelper.getView();
/*     */ 
/* 165 */     getXubiaoService().insert(viewin);
/* 166 */     XubiaoView vi = new XubiaoView();
/* 167 */     viewHelper.setView(vi);
/* 168 */     putCollection(req, rep);
/* 169 */     return "foodView.forinsert";
/*     */   }
/*     */ 
/*     */   public String update(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 182 */     viewHelper.setListnames(new String[] { "foodList" });
/* 183 */     viewHelper.setView(getXubiaoService().saveandquery((XubiaoView)viewHelper.getView()));
/* 184 */     putCollection(req, rep);
/*     */ 
/* 186 */     return "foodView.forupdate";
/*     */   }
/*     */ 
/*     */   public String delete(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 199 */     String[] pk = req.getParameterValues("primaryKey");
/* 200 */     for (int i = 0; i < pk.length; ++i) {
/* 201 */       getXubiaoService().delete(pk[i]);
/*     */     }
/* 203 */     putCollection(req, rep);
/* 204 */     return "foodViewChain.success";
/*     */   }
/*     */ 
/*     */   public String querySearch(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 210 */     viewHelper.setListnames(new String[] { "foodList" });
/* 211 */     XubiaoView viewin = getXubiaoService().get();
/* 212 */     viewHelper.setView(viewin);
/* 213 */     viewHelper.setPrimaryKey("");
/* 214 */     putCollection(req, rep);
/* 215 */     return "foodView.forupdate";
/*     */   }
/*     */ 
/*     */   public void afterPropertiesSet()
/*     */     throws Exception
/*     */   {
/* 222 */     super.afterPropertiesSet();
/* 223 */     if (getXubiaoService() == null)
/* 224 */       throw new IllegalArgumentException("FoodCmd" + DP.getString("Demo.Common.ConfigureError") + "xubiaoService" + DP.getString("Demo.Common.Notbenull"));
/*     */   }
/*     */ 
/*     */   public IXubiaoService getXubiaoService()
/*     */   {
/* 233 */     return this.xubiaoService;
/*     */   }
/*     */ 
/*     */   public void setXubiaoService(IXubiaoService service)
/*     */   {
/* 241 */     this.xubiaoService = service;
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.foods.cmd.FoodCmd
 * JD-Core Version:    0.5.3
 */