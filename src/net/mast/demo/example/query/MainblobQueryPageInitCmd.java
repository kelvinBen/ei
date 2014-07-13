/*    */ package net.mast.demo.example.query;
/*    */ 
/*    */ import java.util.Map;
/*    */ import javax.servlet.http.HttpServletRequest;
/*    */ import javax.servlet.http.HttpServletResponse;
/*    */ import org.apache.commons.logging.Log;
/*    */ import org.apache.commons.logging.LogFactory;
/*    */ import net.mast.demo.example.service.IMainblobService;
/*    */ import net.mast.waf.mvc.QueryCommandSupportWithInit;
/*    */ import net.mast.waf.mvc.QueryHelper;
/*    */ 
/*    */ public class MainblobQueryPageInitCmd extends QueryCommandSupportWithInit
/*    */ {
/* 15 */   private static Log log = LogFactory.getLog(MainblobQueryPageInitCmd.class);
/* 16 */   private IMainblobService mainblobService = null;
/*    */ 
/*    */   public String query(HttpServletRequest req, HttpServletResponse rep, QueryHelper helper, Map map)
/*    */     throws Exception
/*    */   {
/* 32 */     helper.setPage(
/* 33 */       getMainblobService().getAllMainblob(helper.getRowSelection(), map));
/* 34 */     return "speQuery.queryPageInit";
/*    */   }
/*    */ 
/*    */   public IMainblobService getMainblobService()
/*    */   {
/* 41 */     return this.mainblobService;
/*    */   }
/*    */ 
/*    */   public void setMainblobService(IMainblobService service)
/*    */   {
/* 48 */     this.mainblobService = service;
/*    */   }
/*    */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.example.query.MainblobQueryPageInitCmd
 * JD-Core Version:    0.5.3
 */