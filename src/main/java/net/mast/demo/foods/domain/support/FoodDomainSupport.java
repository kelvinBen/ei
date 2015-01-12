/*     */ package net.mast.demo.foods.domain.support;
/*     */ 
/*     */ import java.util.List;
/*     */ import java.util.Map;
/*     */ import net.mast.demo.foods.dao.IFoodDao;
/*     */ import net.mast.demo.foods.domain.Food;
/*     */ import net.mast.demo.foods.domain.IFoodDomain;
/*     */ import net.mast.util.Page;
/*     */ import net.mast.util.RowSelection;
/*     */ import net.mast.util.domain.BaseDomain;
/*     */ 
/*     */ public class FoodDomainSupport extends BaseDomain
/*     */   implements IFoodDomain
/*     */ {
/*     */   private IFoodDao foodDao;
/*     */ 
/*     */   public int delete(String foodId)
/*     */   {
/*  32 */     return getFoodDao().delete(foodId);
/*     */   }
/*     */ 
/*     */   public Food get(String foodId)
/*     */   {
/*  41 */     Food food = getFoodDao().get(foodId);
/*  42 */     return food;
/*     */   }
/*     */ 
/*     */   public Page query(RowSelection rowSelection, Map map)
/*     */   {
/*  51 */     return getFoodDao().query(rowSelection, map);
/*     */   }
/*     */ 
/*     */   public List queryNoPage(Map map)
/*     */   {
/*  60 */     return getFoodDao().queryNoPage(map);
/*     */   }
/*     */ 
/*     */   public Food insert(Food food)
/*     */   {
/*  69 */     Food mainData = getFoodDao().insert(food);
/*  70 */     return mainData;
/*     */   }
/*     */ 
/*     */   public Food update(Food food)
/*     */   {
/*  79 */     Food mainData = getFoodDao().update(food);
/*  80 */     return mainData;
/*     */   }
/*     */ 
/*     */   public IFoodDao getFoodDao()
/*     */   {
/*  87 */     return this.foodDao;
/*     */   }
/*     */ 
/*     */   public void setFoodDao(IFoodDao foodDao)
/*     */   {
/*  94 */     this.foodDao = foodDao;
/*     */   }
/*     */ 
/*     */   protected void initDomain()
/*     */   {
/* 101 */     if (getFoodDao() == null)
/* 102 */       throw new IllegalArgumentException("FoodDao must not be null");
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.foods.domain.support.FoodDomainSupport
 * JD-Core Version:    0.5.3
 */