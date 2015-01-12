/*     */ package net.mast.demo.grid.data;
/*     */ 
/*     */ import java.io.Serializable;
/*     */ import java.math.BigDecimal;
/*     */ import net.mast.web.taglib.util.IDelete;
/*     */ 
/*     */ public class GridItem
/*     */   implements Serializable, IDelete
/*     */ {
/*     */   private String mainGridId;
/*     */   private String itemDetailid;
/*     */   private String itemProductid;
/*     */   private BigDecimal itemUnitprice;
/*     */   private String itemDiscount;
/*     */   private BigDecimal itemQuantity;
/*     */   private BigDecimal itemAmount;
/*     */   private String itemDate;
/*     */   private String itemDatetime;
/*     */   private String itemLevel;
/*     */   private String itemNote;
/*  75 */   private String isDelete = "0";
/*     */ 
/*     */   public String getMainGridId()
/*     */   {
/*  83 */     return this.mainGridId;
/*     */   }
/*     */ 
/*     */   public void setMainGridId(String mainGridId)
/*     */   {
/*  92 */     this.mainGridId = mainGridId;
/*     */   }
/*     */ 
/*     */   public String getItemDetailid()
/*     */   {
/* 101 */     return this.itemDetailid;
/*     */   }
/*     */ 
/*     */   public void setItemDetailid(String itemDetailid)
/*     */   {
/* 110 */     this.itemDetailid = itemDetailid;
/*     */   }
/*     */ 
/*     */   public String getItemProductid()
/*     */   {
/* 119 */     return this.itemProductid;
/*     */   }
/*     */ 
/*     */   public void setItemProductid(String itemProductid)
/*     */   {
/* 128 */     this.itemProductid = itemProductid;
/*     */   }
/*     */ 
/*     */   public BigDecimal getItemUnitprice()
/*     */   {
/* 137 */     return this.itemUnitprice;
/*     */   }
/*     */ 
/*     */   public void setItemUnitprice(BigDecimal itemUnitprice)
/*     */   {
/* 146 */     this.itemUnitprice = itemUnitprice;
/*     */   }
/*     */ 
/*     */   public String getItemDiscount()
/*     */   {
/* 155 */     return this.itemDiscount;
/*     */   }
/*     */ 
/*     */   public void setItemDiscount(String itemDiscount)
/*     */   {
/* 164 */     this.itemDiscount = itemDiscount;
/*     */   }
/*     */ 
/*     */   public BigDecimal getItemQuantity()
/*     */   {
/* 173 */     return this.itemQuantity;
/*     */   }
/*     */ 
/*     */   public void setItemQuantity(BigDecimal itemQuantity)
/*     */   {
/* 182 */     this.itemQuantity = itemQuantity;
/*     */   }
/*     */ 
/*     */   public BigDecimal getItemAmount()
/*     */   {
/* 191 */     return this.itemAmount;
/*     */   }
/*     */ 
/*     */   public void setItemAmount(BigDecimal itemAmount)
/*     */   {
/* 200 */     this.itemAmount = itemAmount;
/*     */   }
/*     */ 
/*     */   public String getItemDate()
/*     */   {
/* 209 */     return this.itemDate;
/*     */   }
/*     */ 
/*     */   public void setItemDate(String itemDate)
/*     */   {
/* 218 */     this.itemDate = itemDate;
/*     */   }
/*     */ 
/*     */   public String getItemDatetime()
/*     */   {
/* 227 */     return this.itemDatetime;
/*     */   }
/*     */ 
/*     */   public void setItemDatetime(String itemDatetime)
/*     */   {
/* 236 */     this.itemDatetime = itemDatetime;
/*     */   }
/*     */ 
/*     */   public String getItemLevel()
/*     */   {
/* 245 */     return this.itemLevel;
/*     */   }
/*     */ 
/*     */   public void setItemLevel(String itemLevel)
/*     */   {
/* 254 */     this.itemLevel = itemLevel;
/*     */   }
/*     */ 
/*     */   public String getItemNote()
/*     */   {
/* 263 */     return this.itemNote;
/*     */   }
/*     */ 
/*     */   public void setItemNote(String itemNote)
/*     */   {
/* 272 */     this.itemNote = itemNote;
/*     */   }
/*     */ 
/*     */   public void setIsDelete(String isDelete)
/*     */   {
/* 279 */     this.isDelete = isDelete;
/*     */   }
/*     */ 
/*     */   public String getIsDelete() {
/* 283 */     return this.isDelete;
/*     */   }
/*     */ 
/*     */   public String toString() {
/* 287 */     StringBuffer sb = new StringBuffer();
/*     */ 
/* 289 */     sb.append(" [ mainGridId=" + this.mainGridId);
/*     */ 
/* 291 */     sb.append(", itemDetailid=" + this.itemDetailid);
/*     */ 
/* 293 */     sb.append(", itemProductid=" + this.itemProductid);
/*     */ 
/* 295 */     sb.append(", itemUnitprice=" + this.itemUnitprice);
/*     */ 
/* 297 */     sb.append(", itemDiscount=" + this.itemDiscount);
/*     */ 
/* 299 */     sb.append(", itemQuantity=" + this.itemQuantity);
/*     */ 
/* 301 */     sb.append(", itemAmount=" + this.itemAmount);
/*     */ 
/* 303 */     sb.append(", itemDate=" + this.itemDate);
/*     */ 
/* 305 */     sb.append(", itemDatetime=" + this.itemDatetime);
/*     */ 
/* 307 */     sb.append(", itemLevel=" + this.itemLevel);
/*     */ 
/* 309 */     sb.append(", itemNote=" + this.itemNote);
/* 310 */     sb.append("]");
/*     */ 
/* 312 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getVERInfo()
/*     */   {
/* 319 */     return "$Date$,$Author$,$Revision$";
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.grid.data.GridItem
 * JD-Core Version:    0.5.3
 */