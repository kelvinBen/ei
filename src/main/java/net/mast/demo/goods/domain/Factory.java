/*     */ package net.mast.demo.goods.domain;
/*     */ 
/*     */ import java.io.Serializable;
/*     */ import net.mast.web.taglib.util.IDelete;
/*     */ 
/*     */ public class Factory
/*     */   implements Serializable, IDelete
/*     */ {
/*     */   private String isDelete;
/*     */   private String factoryId;
/*     */   private String factoryName;
/*     */   private String factoryAddress;
/*     */   private String goodsId;
/*     */ 
/*     */   public String getFactoryId()
/*     */   {
/*  53 */     return this.factoryId;
/*     */   }
/*     */ 
/*     */   public void setFactoryId(String factoryId)
/*     */   {
/*  62 */     this.factoryId = factoryId;
/*     */   }
/*     */ 
/*     */   public String getFactoryName()
/*     */   {
/*  71 */     return this.factoryName;
/*     */   }
/*     */ 
/*     */   public void setFactoryName(String factoryName)
/*     */   {
/*  80 */     this.factoryName = factoryName;
/*     */   }
/*     */ 
/*     */   public String getFactoryAddress()
/*     */   {
/*  89 */     return this.factoryAddress;
/*     */   }
/*     */ 
/*     */   public void setFactoryAddress(String factoryAddress)
/*     */   {
/*  98 */     this.factoryAddress = factoryAddress;
/*     */   }
/*     */ 
/*     */   public String getGoodsId()
/*     */   {
/* 107 */     return this.goodsId;
/*     */   }
/*     */ 
/*     */   public void setGoodsId(String goodsId)
/*     */   {
/* 116 */     this.goodsId = goodsId;
/*     */   }
/*     */ 
/*     */   public String getIsDelete()
/*     */   {
/* 121 */     return this.isDelete;
/*     */   }
/*     */ 
/*     */   public void setIsDelete(String arg0) {
/* 125 */     this.isDelete = arg0;
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.goods.domain.Factory
 * JD-Core Version:    0.5.3
 */