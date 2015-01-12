/*     */ package net.mast.demo.tree.view;
/*     */ 
/*     */ import java.io.Serializable;
/*     */ 
/*     */ public class OrganStruView
/*     */   implements Serializable
/*     */ {
/*     */   private String organId;
/*     */   private String organAlias;
/*     */   private String organType;
/*     */   private String parentId;
/*     */   private String principalId;
/*     */   private String principalName;
/*     */   private String struPath;
/*     */   private int organOrder;
/*     */   private String beginDate;
/*     */   private String endDate;
/*     */   private String isLeaf;
/*     */ 
/*     */   public String getOrganId()
/*     */   {
/*  73 */     return ((this.organId == null) ? "" : this.organId);
/*     */   }
/*     */ 
/*     */   public void setOrganId(String organId)
/*     */   {
/*  78 */     this.organId = organId;
/*     */   }
/*     */ 
/*     */   public String getOrganAlias()
/*     */   {
/*  84 */     return ((this.organAlias == null) ? "" : this.organAlias);
/*     */   }
/*     */ 
/*     */   public void setOrganAlias(String organAlias)
/*     */   {
/*  90 */     this.organAlias = organAlias;
/*     */   }
/*     */ 
/*     */   public String getOrganType()
/*     */   {
/*  96 */     return ((this.organType == null) ? "" : this.organType);
/*     */   }
/*     */ 
/*     */   public void setOrganType(String organType)
/*     */   {
/* 102 */     this.organType = organType;
/*     */   }
/*     */ 
/*     */   public String getParentId()
/*     */   {
/* 108 */     return ((this.parentId == null) ? "" : this.parentId);
/*     */   }
/*     */ 
/*     */   public void setParentId(String parentId)
/*     */   {
/* 113 */     this.parentId = parentId;
/*     */   }
/*     */ 
/*     */   public String getPrincipalId()
/*     */   {
/* 119 */     return ((this.principalId == null) ? "" : this.principalId);
/*     */   }
/*     */ 
/*     */   public void setPrincipalId(String principalId)
/*     */   {
/* 125 */     this.principalId = principalId;
/*     */   }
/*     */ 
/*     */   public String getStruPath()
/*     */   {
/* 130 */     return ((this.struPath == null) ? "" : this.struPath);
/*     */   }
/*     */ 
/*     */   public void setStruPath(String struPath)
/*     */   {
/* 135 */     this.struPath = struPath;
/*     */   }
/*     */ 
/*     */   public int getOrganOrder()
/*     */   {
/* 141 */     return this.organOrder;
/*     */   }
/*     */ 
/*     */   public void setOrganOrder(int organOrder)
/*     */   {
/* 146 */     this.organOrder = organOrder;
/*     */   }
/*     */ 
/*     */   public String getBeginDate()
/*     */   {
/* 152 */     return ((this.beginDate == null) ? "" : this.beginDate);
/*     */   }
/*     */ 
/*     */   public void setBeginDate(String beginDate)
/*     */   {
/* 158 */     this.beginDate = beginDate;
/*     */   }
/*     */ 
/*     */   public String getEndDate()
/*     */   {
/* 164 */     return ((this.endDate == null) ? "" : this.endDate);
/*     */   }
/*     */ 
/*     */   public void setEndDate(String endDate)
/*     */   {
/* 169 */     this.endDate = endDate;
/*     */   }
/*     */ 
/*     */   public String getIsLeaf()
/*     */   {
/* 175 */     return ((this.isLeaf == null) ? "" : this.isLeaf);
/*     */   }
/*     */ 
/*     */   public void setIsLeaf(String isLeaf)
/*     */   {
/* 181 */     this.isLeaf = isLeaf;
/*     */   }
/*     */ 
/*     */   public String toString()
/*     */   {
/* 187 */     StringBuffer sb = new StringBuffer();
/* 188 */     sb.append(" [ organId=" + getOrganId());
/* 189 */     sb.append(", organAlias=" + getOrganAlias());
/* 190 */     sb.append(", organType=" + getOrganType());
/* 191 */     sb.append(", parentId=" + getParentId());
/* 192 */     sb.append(", principalId=" + getPrincipalId());
/* 193 */     sb.append(", struPath=" + getStruPath());
/* 194 */     sb.append(", organOrder=" + getOrganOrder());
/* 195 */     sb.append(", beginDate=" + getBeginDate());
/* 196 */     sb.append(", endDate=" + getEndDate());
/* 197 */     sb.append(", isLeaf=" + getIsLeaf());
/* 198 */     sb.append("]");
/*     */ 
/* 200 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getVERInfo()
/*     */   {
/* 206 */     return "$Date$,$Author$,$Revision$";
/*     */   }
/*     */ 
/*     */   public String getPrincipalName()
/*     */   {
/* 211 */     return this.principalName;
/*     */   }
/*     */ 
/*     */   public void setPrincipalName(String principalName)
/*     */   {
/* 216 */     this.principalName = principalName;
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.tree.view.OrganStruView
 * JD-Core Version:    0.5.3
 */