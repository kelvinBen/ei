/*    */ package net.mast.demo.grid.query;
/*    */ 
/*    */ import java.util.Map;
/*    */ import javax.servlet.http.HttpServletRequest;
/*    */ import javax.servlet.http.HttpServletResponse;
/*    */ import org.apache.commons.logging.Log;
/*    */ import org.apache.commons.logging.LogFactory;
/*    */ import net.mast.demo.grid.service.IMainGridService;
/*    */ import net.mast.waf.mvc.QueryCommandSupportWithInit;
/*    */ import net.mast.waf.mvc.QueryHelper;
/*    */ 
/*    */ public class MainGridQueryPageInitCmd extends QueryCommandSupportWithInit
/*    */ {
/* 23 */   private static Log log = LogFactory.getLog(MainGridQueryPageInitCmd.class);
/* 24 */   private IMainGridService mainGridService = null;
/*    */ 
/*    */   public String query(HttpServletRequest req, HttpServletResponse rep, QueryHelper helper, Map map)
/*    */     throws Exception
/*    */   {
/* 37 */     helper.setPage(getMainGridService().getAllMainGrid(
/* 38 */       helper.getRowSelection(), map));
/* 39 */     return "speQuery.queryPageInit";
/*    */   }
/*    */ 
/*    */   public IMainGridService getMainGridService()
/*    */   {
/* 46 */     return this.mainGridService;
/*    */   }
/*    */ 
/*    */   public void setMainGridService(IMainGridService service)
/*    */   {
/* 53 */     this.mainGridService = service;
/*    */   }
/*    */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.grid.query.MainGridQueryPageInitCmd
 * JD-Core Version:    0.5.3
 */