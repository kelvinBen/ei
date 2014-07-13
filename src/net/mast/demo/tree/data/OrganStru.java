/*     */ package net.mast.demo.tree.data;
/*     */ 
/*     */ import java.io.Serializable;
/*     */ 
/*     */ public class OrganStru
/*     */   implements Serializable
/*     */ {
/*     */   private String organId;
/*     */   private String organAlias;
/*     */   private String organType;
/*     */   private String parentId;
/*     */   private String principalId;
/*     */   private String struPath;
/*     */   private int organOrder;
/*     */   private String beginDate;
/*     */   private String endDate;
/*     */   private String isLeaf;
/*     */ 
/*     */   public String getOrganId()
/*     */   {
/*  70 */     return this.organId;
/*     */   }
/*     */ 
/*     */   public void setOrganId(String organId)
/*     */   {
/*  75 */     this.organId = organId;
/*     */   }
/*     */ 
/*     */   public String getOrganAlias()
/*     */   {
/*  80 */     return this.organAlias;
/*     */   }
/*     */ 
/*     */   public void setOrganAlias(String organAlias)
/*     */   {
/*  85 */     this.organAlias = organAlias;
/*     */   }
/*     */ 
/*     */   public String getOrganType()
/*     */   {
/*  90 */     return this.organType;
/*     */   }
/*     */ 
/*     */   public void setOrganType(String organType)
/*     */   {
/*  95 */     this.organType = organType;
/*     */   }
/*     */ 
/*     */   public String getParentId()
/*     */   {
/* 101 */     return this.parentId;
/*     */   }
/*     */ 
/*     */   public void setParentId(String parentId)
/*     */   {
/* 106 */     this.parentId = parentId;
/*     */   }
/*     */ 
/*     */   public String getPrincipalId()
/*     */   {
/* 112 */     return this.principalId;
/*     */   }
/*     */ 
/*     */   public void setPrincipalId(String principalId)
/*     */   {
/* 117 */     this.principalId = principalId;
/*     */   }
/*     */ 
/*     */   public String getStruPath()
/*     */   {
/* 122 */     return this.struPath;
/*     */   }
/*     */ 
/*     */   public void setStruPath(String struPath)
/*     */   {
/* 127 */     this.struPath = struPath;
/*     */   }
/*     */ 
/*     */   public int getOrganOrder()
/*     */   {
/* 133 */     return this.organOrder;
/*     */   }
/*     */ 
/*     */   public void setOrganOrder(int organOrder)
/*     */   {
/* 139 */     this.organOrder = organOrder;
/*     */   }
/*     */ 
/*     */   public String getBeginDate()
/*     */   {
/* 145 */     return this.beginDate;
/*     */   }
/*     */ 
/*     */   public void setBeginDate(String beginDate)
/*     */   {
/* 150 */     this.beginDate = beginDate;
/*     */   }
/*     */ 
/*     */   public String getEndDate()
/*     */   {
/* 156 */     return this.endDate;
/*     */   }
/*     */ 
/*     */   public void setEndDate(String endDate)
/*     */   {
/* 161 */     this.endDate = endDate;
/*     */   }
/*     */ 
/*     */   public String getIsLeaf()
/*     */   {
/* 167 */     return this.isLeaf;
/*     */   }
/*     */ 
/*     */   public void setIsLeaf(String isLeaf)
/*     */   {
/* 173 */     this.isLeaf = isLeaf;
/*     */   }
/*     */ 
/*     */   public String toString()
/*     */   {
/* 180 */     StringBuffer sb = new StringBuffer();
/*     */ 
/* 182 */     sb.append(" [ organId=" + this.organId);
/*     */ 
/* 184 */     sb.append(", organAlias=" + this.organAlias);
/*     */ 
/* 186 */     sb.append(", organType=" + this.organType);
/*     */ 
/* 188 */     sb.append(", parentId=" + this.parentId);
/*     */ 
/* 190 */     sb.append(", principalId=" + this.principalId);
/*     */ 
/* 192 */     sb.append(", struPath=" + this.struPath);
/*     */ 
/* 194 */     sb.append(", organOrder=" + this.organOrder);
/*     */ 
/* 196 */     sb.append(", beginDate=" + this.beginDate);
/*     */ 
/* 198 */     sb.append(", endDate=" + this.endDate);
/*     */ 
/* 200 */     sb.append(", isLeaf=" + this.isLeaf);
/* 201 */     sb.append("]");
/*     */ 
/* 203 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getVERInfo()
/*     */   {
/* 211 */     return "$Date$,$Author$,$Revision$";
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.tree.data.OrganStru
 * JD-Core Version:    0.5.3
 */