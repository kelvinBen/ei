/*    */ package net.mast.demo.grid.query;
/*    */ 
/*    */ import java.util.Map;
/*    */ import javax.servlet.http.HttpServletRequest;
/*    */ import javax.servlet.http.HttpServletResponse;
/*    */ import org.apache.commons.logging.Log;
/*    */ import org.apache.commons.logging.LogFactory;
/*    */ import net.mast.demo.grid.service.IProductService;
/*    */ import net.mast.waf.mvc.QueryCommandSupportWithInit;
/*    */ import net.mast.waf.mvc.QueryHelper;
/*    */ 
/*    */ public class ProductQueryPageInitCmd extends QueryCommandSupportWithInit
/*    */ {
/* 22 */   private static Log log = LogFactory.getLog(ProductQueryPageInitCmd.class);
/* 23 */   private IProductService productService = null;
/*    */ 
/*    */   public String query(HttpServletRequest req, HttpServletResponse rep, QueryHelper helper, Map map)
/*    */     throws Exception
/*    */   {
/* 39 */     helper.setPage(
/* 40 */       getProductService().getAllProduct(helper.getRowSelection(), map));
/* 41 */     return "speQuery.queryPageInit";
/*    */   }
/*    */ 
/*    */   public IProductService getProductService()
/*    */   {
/* 48 */     return this.productService;
/*    */   }
/*    */ 
/*    */   public void setProductService(IProductService service)
/*    */   {
/* 55 */     this.productService = service;
/*    */   }
/*    */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.grid.query.ProductQueryPageInitCmd
 * JD-Core Version:    0.5.3
 */