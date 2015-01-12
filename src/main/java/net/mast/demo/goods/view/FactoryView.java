/*     */ package net.mast.demo.goods.view;
/*     */ 
/*     */ import java.io.Serializable;
/*     */ import net.mast.web.taglib.util.IDelete;
/*     */ 
/*     */ public class FactoryView
/*     */   implements Serializable, IDelete
/*     */ {
/*     */   private String factoryId;
/*     */   private String factoryName;
/*     */   private String factoryAddress;
/*     */   private String goodsId;
/* 121 */   private String isDelete = "0";
/*     */ 
/*     */   public String getFactoryId()
/*     */   {
/*  52 */     return this.factoryId;
/*     */   }
/*     */ 
/*     */   public void setFactoryId(String factoryId)
/*     */   {
/*  61 */     this.factoryId = factoryId;
/*     */   }
/*     */ 
/*     */   public String getFactoryName()
/*     */   {
/*  70 */     return this.factoryName;
/*     */   }
/*     */ 
/*     */   public void setFactoryName(String factoryName)
/*     */   {
/*  79 */     this.factoryName = factoryName;
/*     */   }
/*     */ 
/*     */   public String getFactoryAddress()
/*     */   {
/*  88 */     return this.factoryAddress;
/*     */   }
/*     */ 
/*     */   public void setFactoryAddress(String factoryAddress)
/*     */   {
/*  97 */     this.factoryAddress = factoryAddress;
/*     */   }
/*     */ 
/*     */   public String getGoodsId()
/*     */   {
/* 106 */     return this.goodsId;
/*     */   }
/*     */ 
/*     */   public void setGoodsId(String goodsId)
/*     */   {
/* 115 */     this.goodsId = goodsId;
/*     */   }
/*     */ 
/*     */   public void setIsDelete(String isDelete)
/*     */   {
/* 127 */     this.isDelete = isDelete;
/*     */   }
/*     */ 
/*     */   public String getIsDelete()
/*     */   {
/* 134 */     return this.isDelete;
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.goods.view.FactoryView
 * JD-Core Version:    0.5.3
 */