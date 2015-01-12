/*    */ package net.mast.demo.combo.collection.domain.support;
/*    */ 
/*    */ import java.util.List;
/*    */ import java.util.Map;
/*    */ import org.apache.commons.logging.Log;
/*    */ import org.apache.commons.logging.LogFactory;
/*    */ import net.mast.demo.DP;
/*    */ import net.mast.demo.combo.collection.dao.IComboCollectionDao;
/*    */ import net.mast.demo.combo.collection.data.ComboCollection;
/*    */ import net.mast.demo.combo.collection.domain.IComboCollectionDomain;
/*    */ import net.mast.util.Page;
/*    */ import net.mast.util.RowSelection;
/*    */ import net.mast.util.domain.BaseDomain;
/*    */ 
/*    */ public class ComboCollectionDomainImpl extends BaseDomain
/*    */   implements IComboCollectionDomain
/*    */ {
/* 19 */   private static Log log = LogFactory.getLog(ComboCollectionDomainImpl.class);
/* 20 */   private IComboCollectionDao comboCollectionDao = null;
/*    */ 
/*    */   public void deleteComboCollection(String comboId)
/*    */   {
/* 27 */     getComboCollectionDao().deleteComboCollection(comboId);
/*    */   }
/*    */ 
/*    */   public ComboCollection getComboCollection(String comboId)
/*    */   {
/* 36 */     return getComboCollectionDao().getComboCollection(comboId);
/*    */   }
/*    */ 
/*    */   public Page getAllComboCollection(RowSelection rowSelection, Map map)
/*    */   {
/* 46 */     return getComboCollectionDao().getAllComboCollection(rowSelection, map);
/*    */   }
/*    */ 
/*    */   public List getAllComboCollectionNoPage(Map map)
/*    */   {
/* 54 */     return getComboCollectionDao().getAllComboCollectionNoPage(map);
/*    */   }
/*    */ 
/*    */   public ComboCollection insertComboCollection(ComboCollection comboCollection)
/*    */   {
/* 64 */     return getComboCollectionDao().insertComboCollection(comboCollection);
/*    */   }
/*    */ 
/*    */   public ComboCollection updateComboCollection(ComboCollection comboCollection)
/*    */   {
/* 74 */     return getComboCollectionDao().updateComboCollection(comboCollection);
/*    */   }
/*    */ 
/*    */   public IComboCollectionDao getComboCollectionDao()
/*    */   {
/* 80 */     return this.comboCollectionDao;
/*    */   }
/*    */ 
/*    */   public void setComboCollectionDao(IComboCollectionDao dao)
/*    */   {
/* 87 */     this.comboCollectionDao = dao;
/*    */   }
/*    */ 
/*    */   protected void initDomain()
/*    */   {
/* 94 */     if (getComboCollectionDao() == null)
/* 95 */       throw new RuntimeException("ComboCollectionDomainImpl" + DP.getString("Demo.Common.ConfigureError") + "comboCollectionDao" + DP.getString("Demo.Common.Notbenull"));
/*    */   }
/*    */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.combo.collection.domain.support.ComboCollectionDomainImpl
 * JD-Core Version:    0.5.3
 */