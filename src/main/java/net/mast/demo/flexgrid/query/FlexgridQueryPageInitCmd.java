/*    */ package net.mast.demo.flexgrid.query;
/*    */ 
/*    */ import java.util.Map;
/*    */ import javax.servlet.http.HttpServletRequest;
/*    */ import javax.servlet.http.HttpServletResponse;
/*    */ import org.apache.commons.logging.Log;
/*    */ import org.apache.commons.logging.LogFactory;
/*    */ import net.mast.demo.flexgrid.data.FlexPlaceDao;
/*    */ import net.mast.demo.flexgrid.service.IFlexgridService;
/*    */ import net.mast.waf.mvc.QueryCommandSupportWithInit;
/*    */ import net.mast.waf.mvc.QueryHelper;
/*    */ 
/*    */ public class FlexgridQueryPageInitCmd extends QueryCommandSupportWithInit
/*    */ {
/* 21 */   private static Log log = LogFactory.getLog(FlexgridQueryPageInitCmd.class);
/* 22 */   private IFlexgridService flexgridService = null;
/* 23 */   FlexPlaceDao flexplaceDao = new FlexPlaceDao();
/*    */ 
/*    */   public String query(HttpServletRequest req, HttpServletResponse rep, QueryHelper helper, Map map)
/*    */     throws Exception
/*    */   {
/* 38 */     helper.setPage(
/* 39 */       getFlexgridService().getAllFlexgrid(helper.getRowSelection(), map));
/* 40 */     req.setAttribute("countrys", this.flexplaceDao.getAllCountry());
/* 41 */     req.setAttribute("provinces", this.flexplaceDao.getAllProvince());
/* 42 */     req.setAttribute("citys", this.flexplaceDao.getAllCity());
/* 43 */     return "speQuery.queryPageInit";
/*    */   }
/*    */ 
/*    */   public IFlexgridService getFlexgridService()
/*    */   {
/* 50 */     return this.flexgridService;
/*    */   }
/*    */ 
/*    */   public void setFlexgridService(IFlexgridService service)
/*    */   {
/* 57 */     this.flexgridService = service;
/*    */   }
/*    */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.flexgrid.query.FlexgridQueryPageInitCmd
 * JD-Core Version:    0.5.3
 */