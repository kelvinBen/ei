/*    */ package net.mast.demo.html.query;
/*    */ 
/*    */ import java.util.Map;
/*    */ import javax.servlet.http.HttpServletRequest;
/*    */ import javax.servlet.http.HttpServletResponse;
/*    */ import org.apache.commons.logging.Log;
/*    */ import org.apache.commons.logging.LogFactory;
/*    */ import net.mast.demo.html.service.ILsEmployeeService;
/*    */ import net.mast.waf.mvc.QueryCommandSupportWithInit;
/*    */ import net.mast.waf.mvc.QueryHelper;
/*    */ 
/*    */ public class LsEmployeeQueryPageInitCmd extends QueryCommandSupportWithInit
/*    */ {
/* 18 */   private static Log log = LogFactory.getLog(LsEmployeeQueryPageInitCmd.class);
/* 19 */   private ILsEmployeeService lsEmployeeService = null;
/*    */ 
/*    */   public String query(HttpServletRequest req, HttpServletResponse rep, QueryHelper helper, Map map)
/*    */     throws Exception
/*    */   {
/* 35 */     helper.setPage(
/* 36 */       getLsEmployeeService().getAllLsEmployee(helper.getRowSelection(), map));
/* 37 */     return "speQuery.queryPageInit";
/*    */   }
/*    */ 
/*    */   public ILsEmployeeService getLsEmployeeService()
/*    */   {
/* 44 */     return this.lsEmployeeService;
/*    */   }
/*    */ 
/*    */   public void setLsEmployeeService(ILsEmployeeService service)
/*    */   {
/* 51 */     this.lsEmployeeService = service;
/*    */   }
/*    */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.html.query.LsEmployeeQueryPageInitCmd
 * JD-Core Version:    0.5.3
 */