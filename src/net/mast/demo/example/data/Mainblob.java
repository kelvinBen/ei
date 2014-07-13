/*     */ package net.mast.demo.example.data;
/*     */ 
/*     */ import java.io.Serializable;
/*     */ import java.util.ArrayList;
/*     */ import java.util.List;
/*     */ import net.mast.web.taglib.util.IAddEditGrid;
/*     */ 
/*     */ public class Mainblob
/*     */   implements Serializable, IAddEditGrid
/*     */ {
/*  10 */   private List listBlobitem = new ArrayList();
/*     */   private String mainId;
/*     */   private String mainOperatorcode;
/*     */   private String mainOperatedate;
/*     */ 
/*     */   public List getListBlobitem()
/*     */   {
/*  35 */     return this.listBlobitem;
/*     */   }
/*     */ 
/*     */   public void setListBlobitem(List list)
/*     */   {
/*  42 */     this.listBlobitem = list;
/*     */   }
/*     */ 
/*     */   public void setAddGridDetail(String[] arg0)
/*     */   {
/*  48 */     if (arg0 == null) {
/*  49 */       return;
/*     */     }
/*  51 */     int itemNum = Integer.parseInt(arg0[0]);
/*  52 */     for (int i = 0; i < itemNum; ++i)
/*  53 */       this.listBlobitem.add(new Blobitem());
/*     */   }
/*     */ 
/*     */   public String getMainId()
/*     */   {
/*  59 */     return this.mainId;
/*     */   }
/*     */ 
/*     */   public void setMainId(String mainId)
/*     */   {
/*  64 */     this.mainId = mainId;
/*     */   }
/*     */ 
/*     */   public String getMainOperatorcode()
/*     */   {
/*  70 */     return this.mainOperatorcode;
/*     */   }
/*     */ 
/*     */   public void setMainOperatorcode(String mainOperatorcode)
/*     */   {
/*  76 */     this.mainOperatorcode = mainOperatorcode;
/*     */   }
/*     */ 
/*     */   public String getMainOperatedate()
/*     */   {
/*  82 */     return this.mainOperatedate;
/*     */   }
/*     */ 
/*     */   public void setMainOperatedate(String mainOperatedate)
/*     */   {
/*  88 */     this.mainOperatedate = mainOperatedate;
/*     */   }
/*     */ 
/*     */   public String toString()
/*     */   {
/*  95 */     StringBuffer sb = new StringBuffer();
/*     */ 
/*  97 */     sb.append(" [ mainId=" + this.mainId);
/*     */ 
/*  99 */     sb.append(", mainOperatorcode=" + this.mainOperatorcode);
/*     */ 
/* 101 */     sb.append(", mainOperatedate=" + this.mainOperatedate);
/* 102 */     sb.append("]");
/*     */ 
/* 104 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getVERInfo()
/*     */   {
/* 111 */     return "$Date$,$Author$,$Revision$";
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.example.data.Mainblob
 * JD-Core Version:    0.5.3
 */