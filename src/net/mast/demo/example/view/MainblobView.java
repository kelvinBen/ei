/*     */ package net.mast.demo.example.view;
/*     */ 
/*     */ import java.io.Serializable;
/*     */ import java.util.ArrayList;
/*     */ import java.util.List;
/*     */ import net.mast.web.taglib.util.IAddEditGrid;
/*     */ 
/*     */ public class MainblobView
/*     */   implements Serializable, IAddEditGrid
/*     */ {
/*  18 */   private List listBlobitem = new ArrayList();
/*     */   private String mainId;
/*     */   private String mainOperatorcode;
/*     */   private String mainOperatedate;
/*     */ 
/*     */   public List getListBlobitem()
/*     */   {
/*  43 */     return this.listBlobitem;
/*     */   }
/*     */ 
/*     */   public void setListBlobitem(List list)
/*     */   {
/*  50 */     this.listBlobitem = list;
/*     */   }
/*     */ 
/*     */   public void setAddGridDetail(String[] arg0)
/*     */   {
/*  56 */     if (arg0 == null) {
/*  57 */       return;
/*     */     }
/*     */ 
/*  60 */     int itemNum = Integer.parseInt(arg0[0]);
/*  61 */     for (int i = 0; i < itemNum; ++i)
/*  62 */       this.listBlobitem.add(new BlobitemView());
/*     */   }
/*     */ 
/*     */   public String getMainId()
/*     */   {
/*  69 */     return ((this.mainId == null) ? "" : this.mainId);
/*     */   }
/*     */ 
/*     */   public void setMainId(String mainId)
/*     */   {
/*  74 */     this.mainId = mainId;
/*     */   }
/*     */ 
/*     */   public String getMainOperatorcode()
/*     */   {
/*  80 */     return ((this.mainOperatorcode == null) ? "" : this.mainOperatorcode);
/*     */   }
/*     */ 
/*     */   public void setMainOperatorcode(String mainOperatorcode)
/*     */   {
/*  86 */     this.mainOperatorcode = mainOperatorcode;
/*     */   }
/*     */ 
/*     */   public String getMainOperatedate()
/*     */   {
/*  92 */     return ((this.mainOperatedate == null) ? "" : this.mainOperatedate);
/*     */   }
/*     */ 
/*     */   public void setMainOperatedate(String mainOperatedate)
/*     */   {
/*  98 */     this.mainOperatedate = mainOperatedate;
/*     */   }
/*     */ 
/*     */   public String toString()
/*     */   {
/* 105 */     StringBuffer sb = new StringBuffer();
/*     */ 
/* 107 */     sb.append(" [ mainId=" + this.mainId);
/*     */ 
/* 109 */     sb.append(", mainOperatorcode=" + this.mainOperatorcode);
/*     */ 
/* 111 */     sb.append(", mainOperatedate=" + this.mainOperatedate);
/* 112 */     sb.append("]");
/*     */ 
/* 114 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getVERInfo()
/*     */   {
/* 119 */     return "$Date$,$Author$,$Revision$";
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.example.view.MainblobView
 * JD-Core Version:    0.5.3
 */