/*     */ package net.mast.demo.grid.data;
/*     */ 
/*     */ import java.io.Serializable;
/*     */ import java.util.ArrayList;
/*     */ import java.util.List;
/*     */ 
/*     */ public class MainGrid
/*     */   implements Serializable
/*     */ {
/*   8 */   private List listGridItem = new ArrayList();
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
/*  65 */     return this.listGridItem;
/*     */   }
/*     */ 
/*     */   public void setListGridItem(List list)
/*     */   {
/*  72 */     this.listGridItem = list;
/*     */   }
/*     */ 
/*     */   public void setAddGridDetail(String[] arg0)
/*     */   {
/*  78 */     if (arg0 == null) {
/*  79 */       return;
/*     */     }
/*  81 */     int itemNum = Integer.parseInt(arg0[0]);
/*  82 */     for (int i = 0; i < itemNum; ++i)
/*  83 */       this.listGridItem.add(new GridItem());
/*     */   }
/*     */ 
/*     */   public String getMainGridId()
/*     */   {
/*  94 */     return this.mainGridId;
/*     */   }
/*     */ 
/*     */   public void setMainGridId(String mainGridId)
/*     */   {
/* 103 */     this.mainGridId = mainGridId;
/*     */   }
/*     */ 
/*     */   public String getOperatorCode()
/*     */   {
/* 113 */     return this.operatorCode;
/*     */   }
/*     */ 
/*     */   public void setOperatorCode(String operatorCode)
/*     */   {
/* 122 */     this.operatorCode = operatorCode;
/*     */   }
/*     */ 
/*     */   public String getOperateName()
/*     */   {
/* 132 */     return this.operateName;
/*     */   }
/*     */ 
/*     */   public void setOperateName(String operateName)
/*     */   {
/* 141 */     this.operateName = operateName;
/*     */   }
/*     */ 
/*     */   public String getOperateCooperate()
/*     */   {
/* 151 */     return this.operateCooperate;
/*     */   }
/*     */ 
/*     */   public void setOperateCooperate(String operateCooperate)
/*     */   {
/* 160 */     this.operateCooperate = operateCooperate;
/*     */   }
/*     */ 
/*     */   public String getOperateDept()
/*     */   {
/* 170 */     return this.operateDept;
/*     */   }
/*     */ 
/*     */   public void setOperateDept(String operateDept)
/*     */   {
/* 179 */     this.operateDept = operateDept;
/*     */   }
/*     */ 
/*     */   public String getOperateDate()
/*     */   {
/* 189 */     return this.operateDate;
/*     */   }
/*     */ 
/*     */   public void setOperateDate(String operateDate)
/*     */   {
/* 198 */     this.operateDate = operateDate;
/*     */   }
/*     */ 
/*     */   public String getOperateEffdate()
/*     */   {
/* 208 */     return this.operateEffdate;
/*     */   }
/*     */ 
/*     */   public void setOperateEffdate(String operateEffdate)
/*     */   {
/* 217 */     this.operateEffdate = operateEffdate;
/*     */   }
/*     */ 
/*     */   public String getOperatorStatus()
/*     */   {
/* 227 */     return this.operatorStatus;
/*     */   }
/*     */ 
/*     */   public void setOperatorStatus(String operatorStatus)
/*     */   {
/* 236 */     this.operatorStatus = operatorStatus;
/*     */   }
/*     */ 
/*     */   public String getOperatorDepot()
/*     */   {
/* 246 */     return this.operatorDepot;
/*     */   }
/*     */ 
/*     */   public void setOperatorDepot(String operatorDepot)
/*     */   {
/* 255 */     this.operatorDepot = operatorDepot;
/*     */   }
/*     */ 
/*     */   public String toString()
/*     */   {
/* 262 */     StringBuffer sb = new StringBuffer();
/*     */ 
/* 264 */     sb.append(" [ mainGridId=" + this.mainGridId);
/*     */ 
/* 266 */     sb.append(", operatorCode=" + this.operatorCode);
/*     */ 
/* 268 */     sb.append(", operateName=" + this.operateName);
/*     */ 
/* 270 */     sb.append(", operateCooperate=" + this.operateCooperate);
/*     */ 
/* 272 */     sb.append(", operateDept=" + this.operateDept);
/*     */ 
/* 274 */     sb.append(", operateDate=" + this.operateDate);
/*     */ 
/* 276 */     sb.append(", operateEffdate=" + this.operateEffdate);
/*     */ 
/* 278 */     sb.append(", operatorStatus=" + this.operatorStatus);
/*     */ 
/* 280 */     sb.append(", operatorDepot=" + this.operatorDepot);
/* 281 */     sb.append("]");
/*     */ 
/* 283 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getVERInfo()
/*     */   {
/* 290 */     return "$Date$,$Author$,$Revision$";
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.grid.data.MainGrid
 * JD-Core Version:    0.5.3
 */