/*     */ package net.mast.demo.goods.view;
/*     */ 
/*     */ import java.io.Serializable;
/*     */ import java.util.ArrayList;
/*     */ import java.util.List;
/*     */ import net.mast.web.taglib.util.IAddEditGrid;
/*     */ 
/*     */ public class GoodsView
/*     */   implements Serializable, IAddEditGrid
/*     */ {
/*     */   private String goodsId;
/*     */   private String goodsName;
/*     */   private String goodsPrice;
/*  42 */   private List factoryList = new ArrayList();
/*     */ 
/*     */   public String getGoodsId()
/*     */   {
/*  50 */     return this.goodsId;
/*     */   }
/*     */ 
/*     */   public void setGoodsId(String goodsId)
/*     */   {
/*  59 */     this.goodsId = goodsId;
/*     */   }
/*     */ 
/*     */   public String getGoodsName()
/*     */   {
/*  68 */     return this.goodsName;
/*     */   }
/*     */ 
/*     */   public void setGoodsName(String goodsName)
/*     */   {
/*  77 */     this.goodsName = goodsName;
/*     */   }
/*     */ 
/*     */   public String getGoodsPrice()
/*     */   {
/*  86 */     return this.goodsPrice;
/*     */   }
/*     */ 
/*     */   public void setGoodsPrice(String goodsPrice)
/*     */   {
/*  95 */     this.goodsPrice = goodsPrice;
/*     */   }
/*     */ 
/*     */   public void setAddGridDetail(String[] numberstr)
/*     */   {
/* 101 */     if (numberstr == null) {
/* 102 */       return;
/*     */     }
/* 104 */     for (int i = 0; i < Integer.parseInt(numberstr[0]); ++i)
/* 105 */       this.factoryList.add(new FactoryView());
/*     */   }
/*     */ 
/*     */   public List getFactoryList()
/*     */   {
/* 114 */     return this.factoryList;
/*     */   }
/*     */ 
/*     */   public void setFactoryList(List factoryList)
/*     */   {
/* 122 */     this.factoryList = factoryList;
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.goods.view.GoodsView
 * JD-Core Version:    0.5.3
 */