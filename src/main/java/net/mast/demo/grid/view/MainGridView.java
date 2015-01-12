/*     */ package net.mast.demo.grid.view;
/*     */ 
/*     */ import java.io.Serializable;
/*     */ import java.util.ArrayList;
/*     */ import java.util.List;
/*     */ import net.mast.web.taglib.util.IAddEditGrid;
/*     */ 
/*     */ public class MainGridView
/*     */   implements Serializable, IAddEditGrid
/*     */ {
/*  11 */   private List listGridItem = new ArrayList();
/*     */   private String mainGridId;
/*     */   private String operatorCode;
/*     */   private String operateName;
/*     */   private String operateCooperate;
/*     */   private String operateDept;
/*     */   private String operateDate;
/*     */   private String operateEffdate;
/*     */   private String operatorStatus;
/*     */   private String operatorDepot;
/*     */ 
/*     */   public List getListGridItem()
/*     */   {
/*  69 */     return this.listGridItem;
/*     */   }
/*     */ 
/*     */   public void setListGridItem(List list)
/*     */   {
/*  76 */     this.listGridItem = list;
/*     */   }
/*     */ 
/*     */   public void setAddGridDetail(String[] arg0)
/*     */   {
/*  83 */     if (arg0 == null) {
/*  84 */       return;
/*     */     }
/*  86 */     int itemNum = Integer.parseInt(arg0[0]);
/*  87 */     for (int i = 0; i < itemNum; ++i)
/*  88 */       this.listGridItem.add(new GridItemView());
/*     */   }
/*     */ 
/*     */   public String getMainGridId()
/*     */   {
/*  98 */     return ((this.mainGridId == null) ? "" : this.mainGridId);
/*     */   }
/*     */ 
/*     */   public void setMainGridId(String mainGridId)
/*     */   {
/* 107 */     this.mainGridId = mainGridId;
/*     */   }
/*     */ 
/*     */   public String getOperatorCode()
/*     */   {
/* 116 */     return ((this.operatorCode == null) ? "" : this.operatorCode);
/*     */   }
/*     */ 
/*     */   public void setOperatorCode(String operatorCode)
/*     */   {
/* 125 */     this.operatorCode = operatorCode;
/*     */   }
/*     */ 
/*     */   public String getOperateName()
/*     */   {
/* 134 */     return ((this.operateName == null) ? "" : this.operateName);
/*     */   }
/*     */ 
/*     */   public void setOperateName(String operateName)
/*     */   {
/* 143 */     this.operateName = operateName;
/*     */   }
/*     */ 
/*     */   public String getOperateCooperate()
/*     */   {
/* 152 */     return ((this.operateCooperate == null) ? "" : this.operateCooperate);
/*     */   }
/*     */ 
/*     */   public void setOperateCooperate(String operateCooperate)
/*     */   {
/* 161 */     this.operateCooperate = operateCooperate;
/*     */   }
/*     */ 
/*     */   public String getOperateDept()
/*     */   {
/* 170 */     return ((this.operateDept == null) ? "" : this.operateDept);
/*     */   }
/*     */ 
/*     */   public void setOperateDept(String operateDept)
/*     */   {
/* 179 */     this.operateDept = operateDept;
/*     */   }
/*     */ 
/*     */   public String getOperateDate()
/*     */   {
/* 188 */     return ((this.operateDate == null) ? "" : this.operateDate);
/*     */   }
/*     */ 
/*     */   public void setOperateDate(String operateDate)
/*     */   {
/* 197 */     this.operateDate = operateDate;
/*     */   }
/*     */ 
/*     */   public String getOperateEffdate()
/*     */   {
/* 206 */     return ((this.operateEffdate == null) ? "" : this.operateEffdate);
/*     */   }
/*     */ 
/*     */   public void setOperateEffdate(String operateEffdate)
/*     */   {
/* 215 */     this.operateEffdate = operateEffdate;
/*     */   }
/*     */ 
/*     */   public String getOperatorStatus()
/*     */   {
/* 224 */     return ((this.operatorStatus == null) ? "" : this.operatorStatus);
/*     */   }
/*     */ 
/*     */   public void setOperatorStatus(String operatorStatus)
/*     */   {
/* 233 */     this.operatorStatus = operatorStatus;
/*     */   }
/*     */ 
/*     */   public String getOperatorDepot()
/*     */   {
/* 242 */     return ((this.operatorDepot == null) ? "" : this.operatorDepot);
/*     */   }
/*     */ 
/*     */   public void setOperatorDepot(String operatorDepot)
/*     */   {
/* 251 */     this.operatorDepot = operatorDepot;
/*     */   }
/*     */ 
/*     */   public String toString() {
/* 255 */     StringBuffer sb = new StringBuffer();
/*     */ 
/* 257 */     sb.append(" [ mainGridId=" + this.mainGridId);
/*     */ 
/* 259 */     sb.append(", operatorCode=" + this.operatorCode);
/*     */ 
/* 261 */     sb.append(", operateName=" + this.operateName);
/*     */ 
/* 263 */     sb.append(", operateCooperate=" + this.operateCooperate);
/*     */ 
/* 265 */     sb.append(", operateDept=" + this.operateDept);
/*     */ 
/* 267 */     sb.append(", operateDate=" + this.operateDate);
/*     */ 
/* 269 */     sb.append(", operateEffdate=" + this.operateEffdate);
/*     */ 
/* 271 */     sb.append(", operatorStatus=" + this.operatorStatus);
/*     */ 
/* 273 */     sb.append(", operatorDepot=" + this.operatorDepot);
/* 274 */     sb.append("]");
/*     */ 
/* 276 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getVERInfo()
/*     */   {
/* 281 */     return "$Date$,$Author$,$Revision$";
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.grid.view.MainGridView
 * JD-Core Version:    0.5.3
 */