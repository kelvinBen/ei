/*    */ package net.mast.demo.flexgrid.domain.support;
/*    */ 
/*    */ import java.util.List;
/*    */ import java.util.Map;
/*    */ import org.apache.commons.logging.Log;
/*    */ import org.apache.commons.logging.LogFactory;
/*    */ import net.mast.demo.DP;
/*    */ import net.mast.demo.flexgrid.dao.IFlexgridDao;
/*    */ import net.mast.demo.flexgrid.data.Flexgrid;
/*    */ import net.mast.demo.flexgrid.domain.IFlexgridDomain;
/*    */ import net.mast.util.Page;
/*    */ import net.mast.util.RowSelection;
/*    */ import net.mast.util.domain.BaseDomain;
/*    */ 
/*    */ public class FlexgridDomainImpl extends BaseDomain
/*    */   implements IFlexgridDomain
/*    */ {
/* 20 */   private static Log log = LogFactory.getLog(FlexgridDomainImpl.class);
/* 21 */   private IFlexgridDao flexgridDao = null;
/*    */ 
/*    */   public void deleteFlexgrid(String flexId)
/*    */   {
/* 28 */     getFlexgridDao().deleteFlexgrid(flexId);
/*    */   }
/*    */ 
/*    */   public Flexgrid getFlexgrid(String flexId)
/*    */   {
/* 37 */     return getFlexgridDao().getFlexgrid(flexId);
/*    */   }
/*    */ 
/*    */   public Page getAllFlexgrid(RowSelection rowSelection, Map map)
/*    */   {
/* 47 */     return getFlexgridDao().getAllFlexgrid(rowSelection, map);
/*    */   }
/*    */ 
/*    */   public List getAllFlexgridNoPage(Map map)
/*    */   {
/* 55 */     return getFlexgridDao().getAllFlexgridNoPage(map);
/*    */   }
/*    */ 
/*    */   public Flexgrid insertFlexgrid(Flexgrid flexgrid)
/*    */   {
/* 65 */     return getFlexgridDao().insertFlexgrid(flexgrid);
/*    */   }
/*    */ 
/*    */   public Flexgrid updateFlexgrid(Flexgrid flexgrid)
/*    */   {
/* 75 */     return getFlexgridDao().updateFlexgrid(flexgrid);
/*    */   }
/*    */ 
/*    */   public IFlexgridDao getFlexgridDao()
/*    */   {
/* 81 */     return this.flexgridDao;
/*    */   }
/*    */ 
/*    */   public void setFlexgridDao(IFlexgridDao dao)
/*    */   {
/* 88 */     this.flexgridDao = dao;
/*    */   }
/*    */ 
/*    */   protected void initDomain()
/*    */   {
/* 95 */     if (getFlexgridDao() == null)
/* 96 */       throw new RuntimeException("FlexgridDomainImpl" + DP.getString("Demo.Common.ConfigureError") + "flexgridDao" + DP.getString("Demo.Common.Notbenull"));
/*    */   }
/*    */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.flexgrid.domain.support.FlexgridDomainImpl
 * JD-Core Version:    0.5.3
 */