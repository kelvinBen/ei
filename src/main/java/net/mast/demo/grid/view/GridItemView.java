/*     */ package net.mast.demo.grid.view;
/*     */ 
/*     */ import java.io.Serializable;
/*     */ import java.math.BigDecimal;
/*     */ import net.mast.web.taglib.util.IDelete;
/*     */ 
/*     */ public class GridItemView
/*     */   implements Serializable, IDelete
/*     */ {
/*     */   private String mainGridId;
/*     */   private String itemDetailid;
/*     */   private String itemProductid;
/*     */   private String itemProductname;
/*     */   private BigDecimal itemUnitprice;
/*     */   private String itemDiscount;
/*     */   private BigDecimal itemQuantity;
/*     */   private BigDecimal itemAmount;
/*     */   private String itemDate;
/*     */   private String itemDatetime;
/*     */   private String itemLevel;
/*     */   private String itemNote;
/*  76 */   private String isDelete = "0";
/*     */ 
/*     */   public String getMainGridId()
/*     */   {
/*  84 */     return ((this.mainGridId == null) ? "" : this.mainGridId);
/*     */   }
/*     */ 
/*     */   public void setMainGridId(String mainGridId)
/*     */   {
/*  93 */     this.mainGridId = mainGridId;
/*     */   }
/*     */ 
/*     */   public String getItemDetailid()
/*     */   {
/* 102 */     return ((this.itemDetailid == null) ? "" : this.itemDetailid);
/*     */   }
/*     */ 
/*     */   public void setItemDetailid(String itemDetailid)
/*     */   {
/* 111 */     this.itemDetailid = itemDetailid;
/*     */   }
/*     */ 
/*     */   public String getItemProductid()
/*     */   {
/* 120 */     return ((this.itemProductid == null) ? "" : this.itemProductid);
/*     */   }
/*     */ 
/*     */   public void setItemProductid(String itemProductid)
/*     */   {
/* 129 */     this.itemProductid = itemProductid;
/*     */   }
/*     */ 
/*     */   public BigDecimal getItemUnitprice()
/*     */   {
/* 138 */     return ((this.itemUnitprice == null) ? new BigDecimal(0) : this.itemUnitprice);
/*     */   }
/*     */ 
/*     */   public void setItemUnitprice(BigDecimal itemUnitprice)
/*     */   {
/* 147 */     this.itemUnitprice = itemUnitprice;
/*     */   }
/*     */ 
/*     */   public String getItemDiscount()
/*     */   {
/* 156 */     return ((this.itemDiscount == null) ? "" : this.itemDiscount);
/*     */   }
/*     */ 
/*     */   public void setItemDiscount(String itemDiscount)
/*     */   {
/* 165 */     this.itemDiscount = itemDiscount;
/*     */   }
/*     */ 
/*     */   public BigDecimal getItemQuantity()
/*     */   {
/* 174 */     return ((this.itemQuantity == null) ? new BigDecimal(0) : this.itemQuantity);
/*     */   }
/*     */ 
/*     */   public void setItemQuantity(BigDecimal itemQuantity)
/*     */   {
/* 183 */     this.itemQuantity = itemQuantity;
/*     */   }
/*     */ 
/*     */   public BigDecimal getItemAmount()
/*     */   {
/* 192 */     return ((this.itemAmount == null) ? new BigDecimal(0) : this.itemAmount);
/*     */   }
/*     */ 
/*     */   public void setItemAmount(BigDecimal itemAmount)
/*     */   {
/* 201 */     this.itemAmount = itemAmount;
/*     */   }
/*     */ 
/*     */   public String getItemDate()
/*     */   {
/* 210 */     return ((this.itemDate == null) ? "" : this.itemDate);
/*     */   }
/*     */ 
/*     */   public void setItemDate(String itemDate)
/*     */   {
/* 219 */     this.itemDate = itemDate;
/*     */   }
/*     */ 
/*     */   public String getItemDatetime()
/*     */   {
/* 228 */     return ((this.itemDatetime == null) ? "" : this.itemDatetime);
/*     */   }
/*     */ 
/*     */   public void setItemDatetime(String itemDatetime)
/*     */   {
/* 237 */     this.itemDatetime = itemDatetime;
/*     */   }
/*     */ 
/*     */   public String getItemLevel()
/*     */   {
/* 246 */     return ((this.itemLevel == null) ? "" : this.itemLevel);
/*     */   }
/*     */ 
/*     */   public void setItemLevel(String itemLevel)
/*     */   {
/* 255 */     this.itemLevel = itemLevel;
/*     */   }
/*     */ 
/*     */   public String getItemNote()
/*     */   {
/* 264 */     return ((this.itemNote == null) ? "" : this.itemNote);
/*     */   }
/*     */ 
/*     */   public void setItemNote(String itemNote)
/*     */   {
/* 273 */     this.itemNote = itemNote;
/*     */   }
/*     */ 
/*     */   public void setIsDelete(String isDelete)
/*     */   {
/* 280 */     this.isDelete = isDelete;
/*     */   }
/*     */ 
/*     */   public String getIsDelete() {
/* 284 */     return this.isDelete;
/*     */   }
/*     */ 
/*     */   public String toString() {
/* 288 */     StringBuffer sb = new StringBuffer();
/*     */ 
/* 290 */     sb.append(" [ mainGridId=" + this.mainGridId);
/*     */ 
/* 292 */     sb.append(", itemDetailid=" + this.itemDetailid);
/*     */ 
/* 294 */     sb.append(", itemProductid=" + this.itemProductid);
/* 295 */     sb.append(", itemProductname=" + this.itemProductname);
/*     */ 
/* 297 */     sb.append(", itemUnitprice=" + this.itemUnitprice);
/*     */ 
/* 299 */     sb.append(", itemDiscount=" + this.itemDiscount);
/*     */ 
/* 301 */     sb.append(", itemQuantity=" + this.itemQuantity);
/*     */ 
/* 303 */     sb.append(", itemAmount=" + this.itemAmount);
/*     */ 
/* 305 */     sb.append(", itemDate=" + this.itemDate);
/*     */ 
/* 307 */     sb.append(", itemDatetime=" + this.itemDatetime);
/*     */ 
/* 309 */     sb.append(", itemLevel=" + this.itemLevel);
/*     */ 
/* 311 */     sb.append(", itemNote=" + this.itemNote);
/* 312 */     sb.append("]");
/*     */ 
/* 314 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getVERInfo()
/*     */   {
/* 319 */     return "$Date$,$Author$,$Revision$";
/*     */   }
/*     */ 
/*     */   public String getItemProductname() {
/* 323 */     return this.itemProductname;
/*     */   }
/*     */ 
/*     */   public void setItemProductname(String itemProductname) {
/* 327 */     this.itemProductname = itemProductname;
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.grid.view.GridItemView
 * JD-Core Version:    0.5.3
 */