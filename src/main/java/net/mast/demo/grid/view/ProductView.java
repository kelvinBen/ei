/*     */ package net.mast.demo.grid.view;
/*     */ 
/*     */ import java.io.Serializable;
/*     */ import java.math.BigDecimal;
/*     */ 
/*     */ public class ProductView
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
/*  51 */     return ((this.itemProductid == null) ? "" : this.itemProductid);
/*     */   }
/*     */ 
/*     */   public void setItemProductid(String itemProductid)
/*     */   {
/*  60 */     this.itemProductid = itemProductid;
/*     */   }
/*     */ 
/*     */   public String getItemProductname()
/*     */   {
/*  69 */     return ((this.itemProductname == null) ? "" : this.itemProductname);
/*     */   }
/*     */ 
/*     */   public void setItemProductname(String itemProductname)
/*     */   {
/*  78 */     this.itemProductname = itemProductname;
/*     */   }
/*     */ 
/*     */   public BigDecimal getItemUnitprice()
/*     */   {
/*  87 */     return ((this.itemUnitprice == null) ? new BigDecimal(0) : this.itemUnitprice);
/*     */   }
/*     */ 
/*     */   public void setItemUnitprice(BigDecimal itemUnitprice)
/*     */   {
/*  96 */     this.itemUnitprice = itemUnitprice;
/*     */   }
/*     */ 
/*     */   public BigDecimal getItemQuantity()
/*     */   {
/* 105 */     return ((this.itemQuantity == null) ? new BigDecimal(0) : this.itemQuantity);
/*     */   }
/*     */ 
/*     */   public void setItemQuantity(BigDecimal itemQuantity)
/*     */   {
/* 114 */     this.itemQuantity = itemQuantity;
/*     */   }
/*     */ 
/*     */   public BigDecimal getItemAmount()
/*     */   {
/* 123 */     return ((this.itemAmount == null) ? new BigDecimal(0) : this.itemAmount);
/*     */   }
/*     */ 
/*     */   public void setItemAmount(BigDecimal itemAmount)
/*     */   {
/* 132 */     this.itemAmount = itemAmount;
/*     */   }
/*     */ 
/*     */   public String getItemLevel()
/*     */   {
/* 141 */     return ((this.itemLevel == null) ? "" : this.itemLevel);
/*     */   }
/*     */ 
/*     */   public void setItemLevel(String itemLevel)
/*     */   {
/* 150 */     this.itemLevel = itemLevel;
/*     */   }
/*     */ 
/*     */   public String toString() {
/* 154 */     StringBuffer sb = new StringBuffer();
/* 155 */     sb.append(" [ itemProductid=" + getItemProductid());
/* 156 */     sb.append(", itemProductname=" + getItemProductname());
/* 157 */     sb.append(", itemUnitprice=" + getItemUnitprice());
/* 158 */     sb.append(", itemQuantity=" + getItemQuantity());
/* 159 */     sb.append(", itemAmount=" + getItemAmount());
/* 160 */     sb.append(", itemLevel=" + getItemLevel());
/* 161 */     sb.append("]");
/*     */ 
/* 163 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getVERInfo()
/*     */   {
/* 168 */     return "$Date$,$Author$,$Revision$";
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.grid.view.ProductView
 * JD-Core Version:    0.5.3
 */