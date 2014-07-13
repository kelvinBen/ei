/*    */ package net.mast.demo.combo.collection.utils;
/*    */ 
/*    */ import java.util.ArrayList;
/*    */ import java.util.List;
/*    */ import net.mast.commons.exception.BaseRuntimeException;
/*    */ import net.mast.demo.DP;
/*    */ import net.mast.demo.combo.collection.data.ComboCollection;
/*    */ import net.mast.demo.combo.collection.view.ComboCollectionView;
/*    */ 
/*    */ public class ComboCollectionViewUtils
/*    */ {
/*    */   public static List getComboCollectionListView(List list)
/*    */   {
/* 21 */     if (list == null) {
/* 22 */       return null;
/*    */     }
/* 24 */     List view = new ArrayList(list.size());
/* 25 */     for (int i = 0; i < list.size(); ++i) {
/* 26 */       view.add(getComboCollectionView((ComboCollection)list.get(i)));
/*    */     }
/* 28 */     return view;
/*    */   }
/*    */ 
/*    */   public static List getComboCollectionList(List list)
/*    */   {
/* 36 */     if (list == null) {
/* 37 */       return null;
/*    */     }
/* 39 */     List datas = new ArrayList(list.size());
/* 40 */     for (int i = 0; i < list.size(); ++i) {
/* 41 */       datas.add(getComboCollection((ComboCollectionView)list.get(i)));
/*    */     }
/* 43 */     return datas;
/*    */   }
/*    */ 
/*    */   public static ComboCollectionView getComboCollectionView(ComboCollection comboCollection)
/*    */   {
/* 50 */     if (comboCollection == null) {
/* 51 */       throw new BaseRuntimeException(DP.getString("Demo.Common.Query") + "ComboCollection" + DP.getString("Demo.Common.Recordisnull"));
/*    */     }
/* 53 */     ComboCollectionView view = new ComboCollectionView();
/*    */     try {
/* 55 */       view.setComboId(comboCollection.getComboId());
/* 56 */       view.setComboName(comboCollection.getComboName());
/* 57 */       view.setComboHelp(comboCollection.getComboHelp());
/*    */     } catch (Exception e) {
/* 59 */       throw new BaseRuntimeException(DP.getString("Demo.Common.From") + "ComboCollection" + DP.getString("Demo.Common.Get") + "ComboCollectionView" + DP.getString("Demo.Common.Error"), e);
/*    */     }
/* 61 */     return view;
/*    */   }
/*    */ 
/*    */   public static ComboCollection getComboCollection(ComboCollectionView comboCollectionView)
/*    */   {
/* 68 */     ComboCollection data = new ComboCollection();
/*    */     try {
/* 70 */       data.setComboId(comboCollectionView.getComboId());
/* 71 */       data.setComboName(comboCollectionView.getComboName());
/* 72 */       data.setComboHelp(comboCollectionView.getComboHelp());
/*    */     } catch (Exception e) {
/* 74 */       throw new BaseRuntimeException(DP.getString("Demo.Common.From") + "ComboCollectionView" + DP.getString("Demo.Common.Get") + "ComboCollection" + DP.getString("Demo.Common.Error"), e);
/*    */     }
/* 76 */     return data;
/*    */   }
/*    */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.combo.collection.utils.ComboCollectionViewUtils
 * JD-Core Version:    0.5.3
 */