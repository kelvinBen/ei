/*    */ package net.mast.demo.combo.combobox.query;
/*    */ 
/*    */ import java.util.HashMap;
/*    */ import java.util.Map;
/*    */ import javax.servlet.http.HttpServletRequest;
/*    */ import javax.servlet.http.HttpServletResponse;
/*    */ import org.apache.commons.logging.Log;
/*    */ import org.apache.commons.logging.LogFactory;
/*    */ import net.mast.demo.DP;
/*    */ import net.mast.demo.combo.combobox.service.IComboboxTestService;
/*    */ import net.mast.waf.mvc.QueryCommandSupportWithInit;
/*    */ import net.mast.waf.mvc.QueryHelper;
/*    */ 
/*    */ public class ComboboxTestQueryPageInitCmd extends QueryCommandSupportWithInit
/*    */ {
/* 18 */   private static Log log = LogFactory.getLog(ComboboxTestQueryPageInitCmd.class);
/* 19 */   private IComboboxTestService comboboxTestService = null;
/*    */ 
/*    */   public String query(HttpServletRequest req, HttpServletResponse rep, QueryHelper helper, Map map)
/*    */     throws Exception
/*    */   {
/* 36 */     Map nationMap = new HashMap();
/* 37 */     nationMap.put("1", DP.getString("Demo.Common.Han"));
/* 38 */     nationMap.put("2", DP.getString("Demo.Common.Hui"));
/* 39 */     nationMap.put("3", DP.getString("Demo.Common.Miao"));
/* 40 */     nationMap.put("4", DP.getString("Demo.Common.Zhuang"));
/* 41 */     nationMap.put("5", DP.getString("Demo.Common.Mongolia"));
/* 42 */     nationMap.put("6", DP.getString("Demo.Common.Korean"));
/* 43 */     nationMap.put("7", DP.getString("Demo.Common.Uygur"));
/* 44 */     nationMap.put("8", DP.getString("Demo.Common.Yi"));
/* 45 */     nationMap.put("9", DP.getString("Demo.Common.Dai"));
/* 46 */     req.setAttribute("nationCollection", nationMap.entrySet());
/* 47 */     helper.setPage(
/* 48 */       getComboboxTestService().getAllComboboxTest(helper.getRowSelection(), map));
/* 49 */     return "speQuery.queryPageInit";
/*    */   }
/*    */ 
/*    */   public IComboboxTestService getComboboxTestService()
/*    */   {
/* 56 */     return this.comboboxTestService;
/*    */   }
/*    */ 
/*    */   public void setComboboxTestService(IComboboxTestService service)
/*    */   {
/* 63 */     this.comboboxTestService = service;
/*    */   }
/*    */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.combo.combobox.query.ComboboxTestQueryPageInitCmd
 * JD-Core Version:    0.5.3
 */