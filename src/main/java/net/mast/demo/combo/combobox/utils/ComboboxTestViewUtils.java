/*    */ package net.mast.demo.combo.combobox.utils;
/*    */ 
/*    */ import java.util.ArrayList;
/*    */ import java.util.List;
/*    */ import net.mast.commons.exception.BaseRuntimeException;
/*    */ import net.mast.demo.DP;
/*    */ import net.mast.demo.combo.combobox.data.ComboboxTest;
/*    */ import net.mast.demo.combo.combobox.view.ComboboxTestView;
/*    */ 
/*    */ public class ComboboxTestViewUtils
/*    */ {
/*    */   public static List getComboboxTestListView(List list)
/*    */   {
/* 21 */     if (list == null) {
/* 22 */       return null;
/*    */     }
/* 24 */     List view = new ArrayList(list.size());
/* 25 */     for (int i = 0; i < list.size(); ++i) {
/* 26 */       view.add(getComboboxTestView((ComboboxTest)list.get(i)));
/*    */     }
/* 28 */     return view;
/*    */   }
/*    */ 
/*    */   public static List getComboboxTestList(List list)
/*    */   {
/* 36 */     if (list == null) {
/* 37 */       return null;
/*    */     }
/* 39 */     List datas = new ArrayList(list.size());
/* 40 */     for (int i = 0; i < list.size(); ++i) {
/* 41 */       datas.add(getComboboxTest((ComboboxTestView)list.get(i)));
/*    */     }
/* 43 */     return datas;
/*    */   }
/*    */ 
/*    */   public static ComboboxTestView getComboboxTestView(ComboboxTest comboboxTest)
/*    */   {
/* 50 */     if (comboboxTest == null) {
/* 51 */       throw new BaseRuntimeException(DP.getString("Demo.Common.Query") + "ComboboxTest" + DP.getString("Demo.Common.Recordisnull"));
/*    */     }
/* 53 */     ComboboxTestView view = new ComboboxTestView();
/*    */     try {
/* 55 */       view.setComboBoxId(comboboxTest.getComboBoxId());
/* 56 */       view.setComboBoxName(comboboxTest.getComboBoxName());
/* 57 */       view.setComboBoxSex(comboboxTest.getComboBoxSex());
/* 58 */       view.setComboBoxNation(comboboxTest.getComboBoxNation());
/* 59 */       view.setComboBoxAddress(comboboxTest.getComboBoxAddress());
/*    */     } catch (Exception e) {
/* 61 */       throw new BaseRuntimeException(DP.getString("Demo.Common.From") + "ComboboxTest" + DP.getString("Demo.Common.Get") + "ComboboxTestView" + DP.getString("Demo.Common.Error"), e);
/*    */     }
/* 63 */     return view;
/*    */   }
/*    */ 
/*    */   public static ComboboxTest getComboboxTest(ComboboxTestView comboboxTestView)
/*    */   {
/* 70 */     ComboboxTest data = new ComboboxTest();
/*    */     try {
/* 72 */       data.setComboBoxId(comboboxTestView.getComboBoxId());
/* 73 */       data.setComboBoxName(comboboxTestView.getComboBoxName());
/* 74 */       data.setComboBoxSex(comboboxTestView.getComboBoxSex());
/* 75 */       data.setComboBoxNation(comboboxTestView.getComboBoxNation());
/* 76 */       data.setComboBoxAddress(comboboxTestView.getComboBoxAddress());
/*    */     } catch (Exception e) {
/* 78 */       throw new BaseRuntimeException(DP.getString("Demo.Common.From") + "ComboboxTestView" + DP.getString("Demo.Common.Get") + "ComboboxTest" + DP.getString("Demo.Common.Error"), e);
/*    */     }
/* 80 */     return data;
/*    */   }
/*    */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.combo.combobox.utils.ComboboxTestViewUtils
 * JD-Core Version:    0.5.3
 */