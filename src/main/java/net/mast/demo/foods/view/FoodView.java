/*     */ package net.mast.demo.foods.view;
/*     */ 
/*     */ import java.io.Serializable;
/*     */ import net.mast.web.taglib.util.IDelete;
/*     */ 
/*     */ public class FoodView
/*     */   implements Serializable, IDelete
/*     */ {
/*     */   private String foodId;
/*     */   private String foodName;
/*     */   private String foodOrigin;
/*     */   private String foodNum;
/*     */   private String foodPrice;
/*     */   private String xbId;
/*  58 */   private String isDelete = "0";
/*     */ 
/*     */   public String getFoodId()
/*     */   {
/*  66 */     return this.foodId;
/*     */   }
/*     */ 
/*     */   public void setFoodId(String foodId)
/*     */   {
/*  75 */     this.foodId = foodId;
/*     */   }
/*     */ 
/*     */   public String getFoodName()
/*     */   {
/*  84 */     return this.foodName;
/*     */   }
/*     */ 
/*     */   public void setFoodName(String foodName)
/*     */   {
/*  93 */     this.foodName = foodName;
/*     */   }
/*     */ 
/*     */   public String getFoodOrigin()
/*     */   {
/* 102 */     return this.foodOrigin;
/*     */   }
/*     */ 
/*     */   public void setFoodOrigin(String foodOrigin)
/*     */   {
/* 111 */     this.foodOrigin = foodOrigin;
/*     */   }
/*     */ 
/*     */   public String getFoodNum()
/*     */   {
/* 120 */     return this.foodNum;
/*     */   }
/*     */ 
/*     */   public void setFoodNum(String foodNum)
/*     */   {
/* 129 */     this.foodNum = foodNum;
/*     */   }
/*     */ 
/*     */   public String getFoodPrice()
/*     */   {
/* 138 */     return this.foodPrice;
/*     */   }
/*     */ 
/*     */   public void setFoodPrice(String foodPrice)
/*     */   {
/* 147 */     this.foodPrice = foodPrice;
/*     */   }
/*     */ 
/*     */   public String getXbId()
/*     */   {
/* 156 */     return this.xbId;
/*     */   }
/*     */ 
/*     */   public void setXbId(String xbId)
/*     */   {
/* 165 */     this.xbId = xbId;
/*     */   }
/*     */ 
/*     */   public String getIsDelete() {
/* 169 */     return this.isDelete;
/*     */   }
/*     */ 
/*     */   public void setIsDelete(String arg0) {
/* 173 */     this.isDelete = arg0;
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.foods.view.FoodView
 * JD-Core Version:    0.5.3
 */