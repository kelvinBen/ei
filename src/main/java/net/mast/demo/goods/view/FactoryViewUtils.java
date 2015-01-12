/*    */ package net.mast.demo.goods.view;
/*    */ 
/*    */ import java.util.ArrayList;
/*    */ import java.util.List;
/*    */ import net.mast.demo.goods.domain.Factory;
/*    */ 
/*    */ public class FactoryViewUtils
/*    */ {
/*    */   public static Factory getFactory(FactoryView factoryView)
/*    */   {
/* 20 */     Factory factory = new Factory();
/*    */ 
/* 22 */     factory.setFactoryId(factoryView.getFactoryId());
/*    */ 
/* 25 */     factory.setFactoryName(factoryView.getFactoryName());
/*    */ 
/* 28 */     factory.setFactoryAddress(factoryView.getFactoryAddress());
/*    */ 
/* 31 */     factory.setGoodsId(factoryView.getGoodsId());
/*    */ 
/* 33 */     factory.setIsDelete(factoryView.getIsDelete());
/*    */ 
/* 35 */     return factory;
/*    */   }
/*    */ 
/*    */   public static FactoryView getFactoryView(Factory factory)
/*    */   {
/* 42 */     FactoryView factoryView = new FactoryView();
/* 43 */     factoryView.setFactoryId(factory.getFactoryId());
/*    */ 
/* 45 */     factoryView.setFactoryName(factory.getFactoryName());
/*    */ 
/* 47 */     factoryView.setFactoryAddress(factory.getFactoryAddress());
/*    */ 
/* 49 */     factoryView.setGoodsId(factory.getGoodsId());
/*    */ 
/* 51 */     factoryView.setIsDelete(factory.getIsDelete());
/*    */ 
/* 53 */     return factoryView;
/*    */   }
/*    */ 
/*    */   public static List getFactoryList(List listView)
/*    */   {
/* 60 */     if (listView == null) {
/* 61 */       return null;
/*    */     }
/* 63 */     List ret = new ArrayList(listView.size());
/* 64 */     for (int i = 0; i < listView.size(); ++i) {
/* 65 */       ret.add(getFactory((FactoryView)listView.get(i)));
/*    */     }
/* 67 */     return ret;
/*    */   }
/*    */ 
/*    */   public static List getFactoryListView(List listData)
/*    */   {
/* 74 */     if (listData == null) {
/* 75 */       return null;
/*    */     }
/* 77 */     List ret = new ArrayList(listData.size());
/* 78 */     for (int i = 0; i < listData.size(); ++i) {
/* 79 */       ret.add(getFactoryView((Factory)listData.get(i)));
/*    */     }
/* 81 */     return ret;
/*    */   }
/*    */ 
/*    */   private static String ArrayToString(String[] args) {
/* 85 */     StringBuffer sb = new StringBuffer();
/* 86 */     for (int i = 0; i < args.length; ++i) {
/* 87 */       sb.append(args[i]);
/* 88 */       if (i < args.length - 1) {
/* 89 */         sb.append(",");
/*    */       }
/*    */     }
/* 92 */     return sb.toString();
/*    */   }
/*    */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.goods.view.FactoryViewUtils
 * JD-Core Version:    0.5.3
 */