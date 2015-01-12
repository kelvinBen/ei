/*    */ package net.mast.demo.tree.query;
/*    */ 
/*    */ import java.util.Iterator;
/*    */ import java.util.List;
/*    */ import java.util.Map;
/*    */ import javax.servlet.http.HttpServletRequest;
/*    */ import javax.servlet.http.HttpServletResponse;
/*    */ import org.apache.commons.logging.Log;
/*    */ import org.apache.commons.logging.LogFactory;
/*    */ import net.mast.demo.tree.service.IOrganStruService;
/*    */ import net.mast.demo.tree.view.OrganStruView;
/*    */ import net.mast.util.Page;
/*    */ import net.mast.waf.mvc.QueryCommandSupportWithInit;
/*    */ import net.mast.waf.mvc.QueryHelper;
/*    */ 
/*    */ public class OrganStruQueryPageInitCmd extends QueryCommandSupportWithInit
/*    */ {
/* 22 */   private static Log log = LogFactory.getLog(OrganStruQueryPageInitCmd.class);
/*    */   private IOrganStruService organStruService;
/*    */ 
/*    */   public OrganStruQueryPageInitCmd()
/*    */   {
/* 27 */     this.organStruService = null;
/*    */   }
/*    */ 
/*    */   public String query(HttpServletRequest req, HttpServletResponse rep, QueryHelper helper, Map map)
/*    */     throws Exception
/*    */   {
/* 43 */     Page page = getOrganStruService().getAllOrganStru(helper.getRowSelection(), map);
/* 44 */     List list = page.getDatas();
/* 45 */     Iterator it = list.iterator();
/* 46 */     while (it.hasNext()) {
/* 47 */       OrganStruView vi = (OrganStruView)it.next();
/* 48 */       String principalId = vi.getPrincipalId();
/* 49 */       String name = "";
/*    */       try
/*    */       {
/* 52 */         name = getOrganStruService().getOrganStruView(principalId).getOrganAlias();
/*    */       } catch (Exception localException) {
/*    */       }
/* 55 */       vi.setPrincipalName(name);
/*    */     }
/* 57 */     helper.setPage(page);
/* 58 */     return "speQuery.queryPageInit";
/*    */   }
/*    */ 
/*    */   public IOrganStruService getOrganStruService()
/*    */   {
/* 65 */     return this.organStruService;
/*    */   }
/*    */ 
/*    */   public void setOrganStruService(IOrganStruService service)
/*    */   {
/* 72 */     this.organStruService = service;
/*    */   }
/*    */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.tree.query.OrganStruQueryPageInitCmd
 * JD-Core Version:    0.5.3
 */