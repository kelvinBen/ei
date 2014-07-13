/*    */ package net.mast.demo.foods.cmd;
/*    */ 
/*    */ import java.util.ArrayList;
/*    */ import java.util.List;
/*    */ import java.util.Map;
/*    */ import javax.servlet.http.HttpServletRequest;
/*    */ import javax.servlet.http.HttpServletResponse;
/*    */ import net.mast.demo.DP;
/*    */ import net.mast.demo.foods.service.IXubiaoService;
/*    */ import net.mast.util.KeyValue;
/*    */ import net.mast.waf.data.LazyInitList;
/*    */ import net.mast.waf.mvc.QueryCommandSupportWithInit;
/*    */ import net.mast.waf.mvc.QueryHelper;
/*    */ 
/*    */ public class FoodQueryPageInitCmd extends QueryCommandSupportWithInit
/*    */ {
/* 20 */   private IXubiaoService xubiaoService = null;
/*    */ 
/*    */   private void putCollection(HttpServletRequest req, HttpServletResponse rep)
/*    */   {
/* 28 */     LazyInitList listFoodOrigin = new LazyInitList() {
/*    */       protected List init() {
/* 30 */         List list = new ArrayList();
/* 31 */         list.add(new KeyValue("1", DP.getString("Demo.Common.Chengdu")));
/* 32 */         list.add(new KeyValue("2", DP.getString("Demo.Common.SiziwangBanner")));
/* 33 */         list.add(new KeyValue("3", DP.getString("Demo.Common.Kunming")));
/* 34 */         list.add(new KeyValue("4", DP.getString("Demo.Common.Suzhou")));
/* 35 */         list.add(new KeyValue("5", DP.getString("Demo.Common.Hangzhou")));
/* 36 */         return list;
/*    */       }
/*    */     };
/* 39 */     req.setAttribute("FOOD_FOOD_ORIGIN_COLLECTION", listFoodOrigin);
/*    */   }
/*    */ 
/*    */   public String query(HttpServletRequest req, HttpServletResponse rep, QueryHelper helper, Map map)
/*    */     throws Exception
/*    */   {
/* 53 */     helper.setPage(
/* 54 */       getXubiaoService().query(helper.getRowSelection(), map));
/* 55 */     putCollection(req, rep);
/* 56 */     return "speQuery.queryPageInit";
/*    */   }
/*    */ 
/*    */   public void afterPropertiesSet()
/*    */     throws Exception
/*    */   {
/* 64 */     super.afterPropertiesSet();
/* 65 */     if (getXubiaoService() == null)
/* 66 */       throw new IllegalArgumentException("FoodCmd" + DP.getString("Demo.Common.ConfigureError") + "xubiaoService" + DP.getString("Demo.Common.Notbenull"));
/*    */   }
/*    */ 
/*    */   public IXubiaoService getXubiaoService()
/*    */   {
/* 75 */     return this.xubiaoService;
/*    */   }
/*    */ 
/*    */   public void setXubiaoService(IXubiaoService service)
/*    */   {
/* 83 */     this.xubiaoService = service;
/*    */   }
/*    */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.foods.cmd.FoodQueryPageInitCmd
 * JD-Core Version:    0.5.3
 */