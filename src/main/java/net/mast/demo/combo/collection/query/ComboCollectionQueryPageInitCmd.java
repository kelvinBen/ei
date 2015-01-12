/*    */ package net.mast.demo.combo.collection.query;
/*    */ 
/*    */ import java.util.Map;
/*    */ import javax.servlet.http.HttpServletRequest;
/*    */ import javax.servlet.http.HttpServletResponse;
/*    */ import org.apache.commons.logging.Log;
/*    */ import org.apache.commons.logging.LogFactory;
/*    */ import net.mast.demo.combo.collection.service.IComboCollectionService;
/*    */ import net.mast.waf.mvc.QueryCommandSupportWithInit;
/*    */ import net.mast.waf.mvc.QueryHelper;
/*    */ 
/*    */ public class ComboCollectionQueryPageInitCmd extends QueryCommandSupportWithInit
/*    */ {
/* 17 */   private static Log log = LogFactory.getLog(ComboCollectionQueryPageInitCmd.class);
/* 18 */   private IComboCollectionService comboCollectionService = null;
/*    */ 
/*    */   public String query(HttpServletRequest req, HttpServletResponse rep, QueryHelper helper, Map map)
/*    */     throws Exception
/*    */   {
/* 34 */     helper.setPage(
/* 35 */       getComboCollectionService().getAllComboCollection(helper.getRowSelection(), map));
/* 36 */     return "speQuery.queryPageInit";
/*    */   }
/*    */ 
/*    */   public IComboCollectionService getComboCollectionService()
/*    */   {
/* 43 */     return this.comboCollectionService;
/*    */   }
/*    */ 
/*    */   public void setComboCollectionService(IComboCollectionService service)
/*    */   {
/* 50 */     this.comboCollectionService = service;
/*    */   }
/*    */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.combo.collection.query.ComboCollectionQueryPageInitCmd
 * JD-Core Version:    0.5.3
 */