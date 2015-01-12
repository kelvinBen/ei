/*    */ package net.mast.demo.example.domain.support;
/*    */ 
/*    */ import java.util.List;
/*    */ import java.util.Map;
/*    */ import org.apache.commons.logging.Log;
/*    */ import org.apache.commons.logging.LogFactory;
/*    */ import net.mast.demo.DP;
/*    */ import net.mast.demo.example.dao.IMainblobDao;
/*    */ import net.mast.demo.example.data.Mainblob;
/*    */ import net.mast.demo.example.domain.IMainblobDomain;
/*    */ import net.mast.util.Page;
/*    */ import net.mast.util.RowSelection;
/*    */ import net.mast.util.domain.BaseDomain;
/*    */ 
/*    */ public class MainblobDomainImpl extends BaseDomain
/*    */   implements IMainblobDomain
/*    */ {
/* 18 */   private static Log log = LogFactory.getLog(MainblobDomainImpl.class);
/* 19 */   private IMainblobDao mainblobDao = null;
/*    */ 
/*    */   public void deleteMainblob(String mainId)
/*    */   {
/* 26 */     getMainblobDao().deleteMainblob(mainId);
/*    */   }
/*    */ 
/*    */   public Mainblob getMainblob(String mainId)
/*    */   {
/* 35 */     return getMainblobDao().getMainblob(mainId);
/*    */   }
/*    */ 
/*    */   public Page getAllMainblob(RowSelection rowSelection, Map map)
/*    */   {
/* 45 */     return getMainblobDao().getAllMainblob(rowSelection, map);
/*    */   }
/*    */ 
/*    */   public List getAllMainblobNoPage(Map map)
/*    */   {
/* 54 */     return getMainblobDao().getAllMainblobNoPage(map);
/*    */   }
/*    */ 
/*    */   public Mainblob insertMainblob(Mainblob mainblob)
/*    */   {
/* 64 */     return getMainblobDao().insertMainblob(mainblob);
/*    */   }
/*    */ 
/*    */   public Mainblob updateMainblob(Mainblob mainblob)
/*    */   {
/* 74 */     return getMainblobDao().updateMainblob(mainblob);
/*    */   }
/*    */ 
/*    */   public IMainblobDao getMainblobDao()
/*    */   {
/* 80 */     return this.mainblobDao;
/*    */   }
/*    */ 
/*    */   public void setMainblobDao(IMainblobDao dao)
/*    */   {
/* 87 */     this.mainblobDao = dao;
/*    */   }
/*    */ 
/*    */   protected void initDomain()
/*    */   {
/* 94 */     if (getMainblobDao() == null)
/* 95 */       throw new RuntimeException("MainblobServiceSupport" + DP.getString("Demo.Common.ConfigureError") + "mainblobDao" + DP.getString("Demo.Common.Notbenull"));
/*    */   }
/*    */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.example.domain.support.MainblobDomainImpl
 * JD-Core Version:    0.5.3
 */