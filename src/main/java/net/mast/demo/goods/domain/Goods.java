/*     */ package net.mast.demo.goods.domain;
/*     */ 
/*     */ import java.io.Serializable;
/*     */ import java.util.ArrayList;
/*     */ import java.util.List;
/*     */ 
/*     */ public class Goods
/*     */   implements Serializable
/*     */ {
/*     */   private String goodsId;
/*     */   private String goodsName;
/*     */   private String goodsPrice;
/*  41 */   private List factoryList = new ArrayList();
/*     */ 
/*     */   public String getGoodsId()
/*     */   {
/*  49 */     return this.goodsId;
/*     */   }
/*     */ 
/*     */   public void setGoodsId(String goodsId)
/*     */   {
/*  58 */     this.goodsId = goodsId;
/*     */   }
/*     */ 
/*     */   public String getGoodsName()
/*     */   {
/*  67 */     return this.goodsName;
/*     */   }
/*     */ 
/*     */   public void setGoodsName(String goodsName)
/*     */   {
/*  76 */     this.goodsName = goodsName;
/*     */   }
/*     */ 
/*     */   public String getGoodsPrice()
/*     */   {
/*  85 */     return this.goodsPrice;
/*     */   }
/*     */ 
/*     */   public void setGoodsPrice(String goodsPrice)
/*     */   {
/*  94 */     this.goodsPrice = goodsPrice;
/*     */   }
/*     */ 
/*     */   public List getFactoryList()
/*     */   {
/* 103 */     return this.factoryList;
/*     */   }
/*     */ 
/*     */   public void setFactoryList(List factoryList)
/*     */   {
/* 111 */     this.factoryList = factoryList;
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.goods.domain.Goods
 * JD-Core Version:    0.5.3
 */