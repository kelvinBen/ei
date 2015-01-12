/*    */ package net.mast.demo.combo.combobox.domain.support;
/*    */ 
/*    */ import java.util.List;
/*    */ import java.util.Map;
/*    */ import org.apache.commons.logging.Log;
/*    */ import org.apache.commons.logging.LogFactory;
/*    */ import net.mast.demo.DP;
/*    */ import net.mast.demo.combo.combobox.dao.IComboboxTestDao;
/*    */ import net.mast.demo.combo.combobox.data.ComboboxTest;
/*    */ import net.mast.demo.combo.combobox.domain.IComboboxTestDomain;
/*    */ import net.mast.util.Page;
/*    */ import net.mast.util.RowSelection;
/*    */ import net.mast.util.domain.BaseDomain;
/*    */ 
/*    */ public class ComboboxTestDomainImpl extends BaseDomain
/*    */   implements IComboboxTestDomain
/*    */ {
/* 19 */   private static Log log = LogFactory.getLog(ComboboxTestDomainImpl.class);
/* 20 */   private IComboboxTestDao comboboxTestDao = null;
/*    */ 
/*    */   public void deleteComboboxTest(String comboBoxId)
/*    */   {
/* 28 */     getComboboxTestDao().deleteComboboxTest(comboBoxId);
/*    */   }
/*    */ 
/*    */   public ComboboxTest getComboboxTest(String comboBoxId)
/*    */   {
/* 37 */     return getComboboxTestDao().getComboboxTest(comboBoxId);
/*    */   }
/*    */ 
/*    */   public Page getAllComboboxTest(RowSelection rowSelection, Map map)
/*    */   {
/* 47 */     return getComboboxTestDao().getAllComboboxTest(rowSelection, map);
/*    */   }
/*    */ 
/*    */   public List getAllComboboxTestNoPage(Map map)
/*    */   {
/* 55 */     return getComboboxTestDao().getAllComboboxTestNoPage(map);
/*    */   }
/*    */ 
/*    */   public ComboboxTest insertComboboxTest(ComboboxTest comboboxTest)
/*    */   {
/* 65 */     return getComboboxTestDao().insertComboboxTest(comboboxTest);
/*    */   }
/*    */ 
/*    */   public ComboboxTest updateComboboxTest(ComboboxTest comboboxTest)
/*    */   {
/* 75 */     return getComboboxTestDao().updateComboboxTest(comboboxTest);
/*    */   }
/*    */ 
/*    */   public IComboboxTestDao getComboboxTestDao()
/*    */   {
/* 81 */     return this.comboboxTestDao;
/*    */   }
/*    */ 
/*    */   public void setComboboxTestDao(IComboboxTestDao dao)
/*    */   {
/* 88 */     this.comboboxTestDao = dao;
/*    */   }
/*    */ 
/*    */   protected void initDomain()
/*    */   {
/* 95 */     if (getComboboxTestDao() == null)
/* 96 */       throw new RuntimeException("ComboboxTestDomainImpl" + DP.getString("Demo.Common.ConfigureError") + "comboboxTestDao" + DP.getString("Demo.Common.Notbenull"));
/*    */   }
/*    */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.combo.combobox.domain.support.ComboboxTestDomainImpl
 * JD-Core Version:    0.5.3
 */