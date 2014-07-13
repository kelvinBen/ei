/*    */ package net.mast.demo.foods.domain;
/*    */ 
/*    */ import java.io.Serializable;
/*    */ import java.util.ArrayList;
/*    */ import java.util.List;
/*    */ 
/*    */ public class Xubiao
/*    */   implements Serializable
/*    */ {
/* 19 */   private List foodList = new ArrayList();
/*    */ 
/*    */   public List getFoodList() {
/* 22 */     return this.foodList;
/*    */   }
/*    */ 
/*    */   public void setFoodList(List foodList) {
/* 26 */     this.foodList = foodList;
/*    */   }
/*    */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.foods.domain.Xubiao
 * JD-Core Version:    0.5.3
 */