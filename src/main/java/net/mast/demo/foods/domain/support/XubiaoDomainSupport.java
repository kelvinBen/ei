/*     */ package net.mast.demo.foods.domain.support;
/*     */ 
/*     */ import java.util.ArrayList;
/*     */ import java.util.HashMap;
/*     */ import java.util.Iterator;
/*     */ import java.util.List;
/*     */ import java.util.Map;
/*     */ import net.mast.demo.foods.dao.IFoodDao;
/*     */ import net.mast.demo.foods.dao.IXubiaoDao;
/*     */ import net.mast.demo.foods.domain.Food;
/*     */ import net.mast.demo.foods.domain.IXubiaoDomain;
/*     */ import net.mast.demo.foods.domain.Xubiao;
/*     */ import net.mast.util.Page;
/*     */ import net.mast.util.RowSelection;
/*     */ import net.mast.util.domain.BaseDomain;
/*     */ 
/*     */ public class XubiaoDomainSupport extends BaseDomain
/*     */   implements IXubiaoDomain
/*     */ {
/*     */   private IXubiaoDao xubiaoDao;
/*     */   private IFoodDao foodDao;
/*     */ 
/*     */   public int delete(String xbId)
/*     */   {
/*  43 */     return getXubiaoDao().delete(xbId);
/*     */   }
/*     */ 
/*     */   public Xubiao get(String xbId)
/*     */   {
/*  52 */     Xubiao xubiao = getXubiaoDao().get(xbId);
/*  53 */     if (getFoodDao() != null) {
/*  54 */       List foodList = getFoodDao().queryByXubiao(xbId);
/*  55 */       xubiao.setFoodList(foodList);
/*     */     }
/*  57 */     return xubiao;
/*     */   }
/*     */ 
/*     */   public Page query(RowSelection rowSelection, Map map)
/*     */   {
/*  66 */     return getXubiaoDao().query(rowSelection, map);
/*     */   }
/*     */ 
/*     */   public List queryNoPage(Map map)
/*     */   {
/*  75 */     return getXubiaoDao().queryNoPage(map);
/*     */   }
/*     */ 
/*     */   public Xubiao insert(Xubiao xubiao)
/*     */   {
/*  84 */     Xubiao mainData = getXubiaoDao().insert(xubiao);
/*  85 */     List foodList = xubiao.getFoodList();
/*  86 */     Iterator foodite = foodList.iterator();
/*  87 */     while (foodite.hasNext()) {
/*  88 */       Food localFood = (Food)foodite.next();
/*     */     }
/*  90 */     getFoodDao().batchInsert(foodList);
/*  91 */     return mainData;
/*     */   }
/*     */ 
/*     */   public Xubiao update(Xubiao xubiao)
/*     */   {
/* 100 */     Xubiao mainData = getXubiaoDao().update(xubiao);
/* 101 */     List foodList = xubiao.getFoodList();
/* 102 */     Iterator foodite = foodList.iterator();
/* 103 */     while (foodite.hasNext()) {
/* 104 */       Food localFood = (Food)foodite.next();
/*     */     }
/*     */ 
/* 107 */     getFoodDao().batchInsert(foodList);
/* 108 */     return mainData;
/*     */   }
/*     */ 
/*     */   public IXubiaoDao getXubiaoDao()
/*     */   {
/* 115 */     return this.xubiaoDao;
/*     */   }
/*     */ 
/*     */   public void setXubiaoDao(IXubiaoDao xubiaoDao)
/*     */   {
/* 122 */     this.xubiaoDao = xubiaoDao;
/*     */   }
/*     */ 
/*     */   protected void initDomain()
/*     */   {
/* 129 */     if (getXubiaoDao() == null)
/* 130 */       throw new IllegalArgumentException("XubiaoDao must not be null");
/*     */   }
/*     */ 
/*     */   public IFoodDao getFoodDao()
/*     */   {
/* 135 */     return this.foodDao;
/*     */   }
/*     */ 
/*     */   public void setFoodDao(IFoodDao foodDao) {
/* 139 */     this.foodDao = foodDao;
/*     */   }
/*     */ 
/*     */   public Xubiao saveandquery(Xubiao xubiao) {
/* 143 */     Xubiao mainData = new Xubiao();
/* 144 */     List foodList = xubiao.getFoodList();
/* 145 */     Iterator foodite = foodList.iterator();
/* 146 */     List insertList = new ArrayList();
/* 147 */     List deleteList = new ArrayList();
/* 148 */     List updateList = new ArrayList();
/* 149 */     while (foodite.hasNext()) {
/* 150 */       Food data = (Food)foodite.next();
/* 151 */       if (data.getFoodId().equals(""))
/* 152 */         insertList.add(data);
/* 153 */       else if (data.getIsDelete().equals("1"))
/* 154 */         deleteList.add(data.getFoodId());
/*     */       else
/* 156 */         updateList.add(data);
/*     */     }
/* 158 */     for (int j = 0; j < deleteList.size(); ++j)
/* 159 */       getFoodDao().delete((String)deleteList.get(j));
/* 160 */     getFoodDao().batchInsert(insertList);
/* 161 */     getFoodDao().batchUpdate(updateList);
/* 162 */     mainData.setFoodList(new ArrayList());
/* 163 */     return mainData;
/*     */   }
/*     */ 
/*     */   public Xubiao get() {
/* 167 */     Xubiao xubiao = new Xubiao();
/* 168 */     Map map = new HashMap();
/* 169 */     List foodList = getFoodDao().queryNoPage(map);
/* 170 */     xubiao.setFoodList(foodList);
/* 171 */     return xubiao;
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.foods.domain.support.XubiaoDomainSupport
 * JD-Core Version:    0.5.3
 */