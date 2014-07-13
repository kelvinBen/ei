/*     */ package net.mast.demo.foods.domain;
/*     */ 
/*     */ import java.io.Serializable;
/*     */ import net.mast.web.taglib.util.IDelete;
/*     */ 
/*     */ public class Food
/*     */   implements Serializable, IDelete
/*     */ {
/*     */   private String foodId;
/*     */   private String foodName;
/*     */   private String foodOrigin;
/*     */   private String foodNum;
/*     */   private String foodPrice;
/*     */   private String xbId;
/*  60 */   private String isDelete = "0";
/*     */ 
/*     */   public String getFoodId()
/*     */   {
/*  68 */     return this.foodId;
/*     */   }
/*     */ 
/*     */   public void setFoodId(String foodId)
/*     */   {
/*  77 */     this.foodId = foodId;
/*     */   }
/*     */ 
/*     */   public String getFoodName()
/*     */   {
/*  86 */     return this.foodName;
/*     */   }
/*     */ 
/*     */   public void setFoodName(String foodName)
/*     */   {
/*  95 */     this.foodName = foodName;
/*     */   }
/*     */ 
/*     */   public String getFoodOrigin()
/*     */   {
/* 104 */     return this.foodOrigin;
/*     */   }
/*     */ 
/*     */   public void setFoodOrigin(String foodOrigin)
/*     */   {
/* 113 */     this.foodOrigin = foodOrigin;
/*     */   }
/*     */ 
/*     */   public String getFoodNum()
/*     */   {
/* 122 */     return this.foodNum;
/*     */   }
/*     */ 
/*     */   public void setFoodNum(String foodNum)
/*     */   {
/* 131 */     this.foodNum = foodNum;
/*     */   }
/*     */ 
/*     */   public String getFoodPrice()
/*     */   {
/* 140 */     return this.foodPrice;
/*     */   }
/*     */ 
/*     */   public void setFoodPrice(String foodPrice)
/*     */   {
/* 149 */     this.foodPrice = foodPrice;
/*     */   }
/*     */ 
/*     */   public String getXbId()
/*     */   {
/* 158 */     return this.xbId;
/*     */   }
/*     */ 
/*     */   public void setXbId(String xbId)
/*     */   {
/* 167 */     this.xbId = xbId;
/*     */   }
/*     */ 
/*     */   public String getIsDelete() {
/* 171 */     return this.isDelete;
/*     */   }
/*     */ 
/*     */   public void setIsDelete(String arg0) {
/* 175 */     this.isDelete = arg0;
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.foods.domain.Food
 * JD-Core Version:    0.5.3
 */