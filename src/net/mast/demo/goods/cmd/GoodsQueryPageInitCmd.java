/*    */ package net.mast.demo.goods.cmd;
/*    */ 
/*    */ import java.util.Map;
/*    */ import javax.servlet.http.HttpServletRequest;
/*    */ import javax.servlet.http.HttpServletResponse;
/*    */ import net.mast.demo.DP;
/*    */ import net.mast.demo.goods.service.IGoodsService;
/*    */ import net.mast.waf.mvc.QueryCommandSupportWithInit;
/*    */ import net.mast.waf.mvc.QueryHelper;
/*    */ 
/*    */ public class GoodsQueryPageInitCmd extends QueryCommandSupportWithInit
/*    */ {
/* 20 */   private IGoodsService goodsService = null;
/*    */ 
/*    */   private void putCollection(HttpServletRequest req, HttpServletResponse rep)
/*    */   {
/*    */   }
/*    */ 
/*    */   public String query(HttpServletRequest req, HttpServletResponse rep, QueryHelper helper, Map map)
/*    */     throws Exception
/*    */   {
/* 41 */     helper.setPage(
/* 42 */       getGoodsService().query(helper.getRowSelection(), map));
/* 43 */     putCollection(req, rep);
/* 44 */     return "speQuery.queryPageInit";
/*    */   }
/*    */ 
/*    */   public void afterPropertiesSet()
/*    */     throws Exception
/*    */   {
/* 52 */     super.afterPropertiesSet();
/* 53 */     if (getGoodsService() == null)
/* 54 */       throw new IllegalArgumentException("GoodsCmd" + DP.getString("Demo.Common.ConfigureError") + "goodsService" + DP.getString("Demo.Common.Notbenull"));
/*    */   }
/*    */ 
/*    */   public IGoodsService getGoodsService()
/*    */   {
/* 63 */     return this.goodsService;
/*    */   }
/*    */ 
/*    */   public void setGoodsService(IGoodsService service)
/*    */   {
/* 71 */     this.goodsService = service;
/*    */   }
/*    */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.goods.cmd.GoodsQueryPageInitCmd
 * JD-Core Version:    0.5.3
 */