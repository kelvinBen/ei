/*    */ package net.mast.demo.foods.view;
/*    */ 
/*    */ import java.io.Serializable;
/*    */ import java.util.ArrayList;
/*    */ import java.util.List;
/*    */ import net.mast.web.taglib.util.IAddEditGrid;
/*    */ 
/*    */ public class XubiaoView
/*    */   implements Serializable, IAddEditGrid
/*    */ {
/* 20 */   private List foodList = new ArrayList();
/*    */ 
/*    */   public List getFoodList() {
/* 23 */     return this.foodList;
/*    */   }
/*    */ 
/*    */   public void setFoodList(List foodList) {
/* 27 */     this.foodList = foodList;
/*    */   }
/*    */ 
/*    */   public void setAddGridDetail(String[] numberstr)
/*    */   {
/* 34 */     if (numberstr == null) {
/* 35 */       return;
/*    */     }
/* 37 */     for (int i = 0; i < Integer.parseInt(numberstr[0]); ++i)
/* 38 */       this.foodList.add(new FoodView());
/*    */   }
/*    */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.foods.view.XubiaoView
 * JD-Core Version:    0.5.3
 */