/*     */ package net.mast.demo.grid.data;
/*     */ 
/*     */ import java.io.Serializable;
/*     */ import java.math.BigDecimal;
/*     */ 
/*     */ public class Product
/*     */   implements Serializable
/*     */ {
/*     */   private String itemProductid;
/*     */   private String itemProductname;
/*     */   private BigDecimal itemUnitprice;
/*     */   private BigDecimal itemQuantity;
/*     */   private BigDecimal itemAmount;
/*     */   private String itemLevel;
/*     */ 
/*     */   public String getItemProductid()
/*     */   {
/*  51 */     return this.itemProductid;
/*     */   }
/*     */ 
/*     */   public void setItemProductid(String itemProductid)
/*     */   {
/*  60 */     this.itemProductid = itemProductid;
/*     */   }
/*     */ 
/*     */   public String getItemProductname()
/*     */   {
/*  69 */     return this.itemProductname;
/*     */   }
/*     */ 
/*     */   public void setItemProductname(String itemProductname)
/*     */   {
/*  78 */     this.itemProductname = itemProductname;
/*     */   }
/*     */ 
/*     */   public BigDecimal getItemUnitprice()
/*     */   {
/*  87 */     return this.itemUnitprice;
/*     */   }
/*     */ 
/*     */   public void setItemUnitprice(BigDecimal itemUnitprice)
/*     */   {
/*  96 */     this.itemUnitprice = itemUnitprice;
/*     */   }
/*     */ 
/*     */   public BigDecimal getItemQuantity()
/*     */   {
/* 105 */     return this.itemQuantity;
/*     */   }
/*     */ 
/*     */   public void setItemQuantity(BigDecimal itemQuantity)
/*     */   {
/* 114 */     this.itemQuantity = itemQuantity;
/*     */   }
/*     */ 
/*     */   public BigDecimal getItemAmount()
/*     */   {
/* 123 */     return this.itemAmount;
/*     */   }
/*     */ 
/*     */   public void setItemAmount(BigDecimal itemAmount)
/*     */   {
/* 132 */     this.itemAmount = itemAmount;
/*     */   }
/*     */ 
/*     */   public String getItemLevel()
/*     */   {
/* 141 */     return this.itemLevel;
/*     */   }
/*     */ 
/*     */   public void setItemLevel(String itemLevel)
/*     */   {
/* 150 */     this.itemLevel = itemLevel;
/*     */   }
/*     */ 
/*     */   public String toString() {
/* 154 */     StringBuffer sb = new StringBuffer();
/*     */ 
/* 156 */     sb.append(" [ itemProductid=" + this.itemProductid);
/*     */ 
/* 158 */     sb.append(", itemProductname=" + this.itemProductname);
/*     */ 
/* 160 */     sb.append(", itemUnitprice=" + this.itemUnitprice);
/*     */ 
/* 162 */     sb.append(", itemQuantity=" + this.itemQuantity);
/*     */ 
/* 164 */     sb.append(", itemAmount=" + this.itemAmount);
/*     */ 
/* 166 */     sb.append(", itemLevel=" + this.itemLevel);
/* 167 */     sb.append("]");
/*     */ 
/* 169 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getVERInfo()
/*     */   {
/* 174 */     return "$Date$,$Author$,$Revision$";
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.grid.data.Product
 * JD-Core Version:    0.5.3
 */