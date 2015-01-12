/*    */ package net.mast.demo.foods.view;
/*    */ 
/*    */ import java.util.ArrayList;
/*    */ import java.util.List;
/*    */ import net.mast.demo.foods.domain.Xubiao;
/*    */ import net.mast.web.taglib.util.IDelete;
/*    */ 
/*    */ public class XubiaoViewUtils
/*    */ {
/*    */   public static Xubiao getXubiao(XubiaoView xubiaoView)
/*    */   {
/* 22 */     Xubiao xubiao = new Xubiao();
/* 23 */     List foodListView = removeDeleted(xubiaoView.getFoodList());
/* 24 */     List foodList = FoodViewUtils.getFoodList(foodListView);
/* 25 */     xubiao.setFoodList(foodList);
/* 26 */     return xubiao;
/*    */   }
/*    */ 
/*    */   private static List removeDeleted(List list) {
/* 30 */     List ret = new ArrayList(list.size());
/* 31 */     for (int i = 0; i < list.size(); ++i) {
/* 32 */       IDelete o = (IDelete)list.get(i);
/* 33 */       if (o.getIsDelete().equals("1")) {
/*    */         continue;
/*    */       }
/* 36 */       ret.add(o);
/*    */     }
/* 38 */     return ret;
/*    */   }
/*    */ 
/*    */   public static XubiaoView getXubiaoView(Xubiao xubiao)
/*    */   {
/* 45 */     XubiaoView xubiaoView = new XubiaoView();
/* 46 */     List foodList = xubiao.getFoodList();
/* 47 */     if (foodList != null) {
/* 48 */       List foodListView = FoodViewUtils.getFoodListView(foodList);
/* 49 */       xubiaoView.setFoodList(foodListView);
/*    */     }
/* 51 */     return xubiaoView;
/*    */   }
/*    */ 
/*    */   public static List getXubiaoList(List listView)
/*    */   {
/* 58 */     if (listView == null) {
/* 59 */       return null;
/*    */     }
/* 61 */     List ret = new ArrayList(listView.size());
/* 62 */     for (int i = 0; i < listView.size(); ++i) {
/* 63 */       ret.add(getXubiao((XubiaoView)listView.get(i)));
/*    */     }
/* 65 */     return ret;
/*    */   }
/*    */ 
/*    */   public static List getXubiaoListView(List listData)
/*    */   {
/* 72 */     if (listData == null) {
/* 73 */       return null;
/*    */     }
/* 75 */     List ret = new ArrayList(listData.size());
/* 76 */     for (int i = 0; i < listData.size(); ++i) {
/* 77 */       ret.add(getXubiaoView((Xubiao)listData.get(i)));
/*    */     }
/* 79 */     return ret;
/*    */   }
/*    */ 
/*    */   private static String ArrayToString(String[] args) {
/* 83 */     StringBuffer sb = new StringBuffer();
/* 84 */     for (int i = 0; i < args.length; ++i) {
/* 85 */       sb.append(args[i]);
/* 86 */       if (i < args.length - 1) {
/* 87 */         sb.append(",");
/*    */       }
/*    */     }
/* 90 */     return sb.toString();
/*    */   }
/*    */ 
/*    */   public static Xubiao getGoodsNoDelete(XubiaoView xubiaoView) {
/* 94 */     Xubiao xubiao = new Xubiao();
/* 95 */     List foodList = FoodViewUtils.getFoodList(xubiaoView.getFoodList());
/* 96 */     xubiao.setFoodList(foodList);
/* 97 */     return xubiao;
/*    */   }
/*    */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.foods.view.XubiaoViewUtils
 * JD-Core Version:    0.5.3
 */