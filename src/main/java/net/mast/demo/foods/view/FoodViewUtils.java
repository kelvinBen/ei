/*    */ package net.mast.demo.foods.view;
/*    */ 
/*    */ import java.util.ArrayList;
/*    */ import java.util.List;
/*    */ import net.mast.demo.foods.domain.Food;
/*    */ 
/*    */ public class FoodViewUtils
/*    */ {
/*    */   public static Food getFood(FoodView foodView)
/*    */   {
/* 21 */     Food food = new Food();
/* 22 */     food.setFoodId(foodView.getFoodId());
/* 23 */     food.setFoodName(foodView.getFoodName());
/* 24 */     food.setFoodOrigin(foodView.getFoodOrigin());
/* 25 */     food.setFoodNum(foodView.getFoodNum());
/* 26 */     food.setFoodPrice(foodView.getFoodPrice());
/* 27 */     food.setXbId(foodView.getXbId());
/* 28 */     food.setIsDelete(foodView.getIsDelete());
/* 29 */     return food;
/*    */   }
/*    */ 
/*    */   public static FoodView getFoodView(Food food)
/*    */   {
/* 36 */     FoodView foodView = new FoodView();
/* 37 */     foodView.setFoodId(food.getFoodId());
/* 38 */     foodView.setFoodName(food.getFoodName());
/* 39 */     foodView.setFoodOrigin(food.getFoodOrigin());
/* 40 */     foodView.setFoodNum(food.getFoodNum());
/* 41 */     foodView.setFoodPrice(food.getFoodPrice());
/* 42 */     foodView.setXbId(food.getXbId());
/* 43 */     foodView.setIsDelete(food.getIsDelete());
/* 44 */     return foodView;
/*    */   }
/*    */ 
/*    */   public static List getFoodList(List listView)
/*    */   {
/* 51 */     if (listView == null) {
/* 52 */       return null;
/*    */     }
/* 54 */     List ret = new ArrayList(listView.size());
/* 55 */     for (int i = 0; i < listView.size(); ++i) {
/* 56 */       ret.add(getFood((FoodView)listView.get(i)));
/*    */     }
/* 58 */     return ret;
/*    */   }
/*    */ 
/*    */   public static List getFoodListView(List listData)
/*    */   {
/* 65 */     if (listData == null) {
/* 66 */       return null;
/*    */     }
/* 68 */     List ret = new ArrayList(listData.size());
/* 69 */     for (int i = 0; i < listData.size(); ++i) {
/* 70 */       ret.add(getFoodView((Food)listData.get(i)));
/*    */     }
/* 72 */     return ret;
/*    */   }
/*    */ 
/*    */   private static String ArrayToString(String[] args) {
/* 76 */     StringBuffer sb = new StringBuffer();
/* 77 */     for (int i = 0; i < args.length; ++i) {
/* 78 */       sb.append(args[i]);
/* 79 */       if (i < args.length - 1) {
/* 80 */         sb.append(",");
/*    */       }
/*    */     }
/* 83 */     return sb.toString();
/*    */   }
/*    */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.foods.view.FoodViewUtils
 * JD-Core Version:    0.5.3
 */