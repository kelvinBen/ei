/*     */ package net.mast.demo.example.data;
/*     */ 
/*     */ import java.io.Serializable;
/*     */ import net.mast.web.taglib.util.IDelete;
/*     */ import net.mast.web.upload.util.ByteArrayProxy;
/*     */ 
/*     */ public class Blobitem
/*     */   implements Serializable, IDelete
/*     */ {
/*     */   private String mainId;
/*     */   private String fileId;
/*     */   private String fileType;
/*     */   private String fileName;
/*     */   private ByteArrayProxy fileContent;
/*  38 */   private String isDelete = "0";
/*     */ 
/*     */   public String getMainId()
/*     */   {
/*  43 */     return this.mainId;
/*     */   }
/*     */ 
/*     */   public void setMainId(String mainId)
/*     */   {
/*  48 */     this.mainId = mainId;
/*     */   }
/*     */ 
/*     */   public String getFileId()
/*     */   {
/*  54 */     return this.fileId;
/*     */   }
/*     */ 
/*     */   public void setFileId(String fileId)
/*     */   {
/*  60 */     this.fileId = fileId;
/*     */   }
/*     */ 
/*     */   public String getFileType()
/*     */   {
/*  66 */     return this.fileType;
/*     */   }
/*     */ 
/*     */   public void setFileType(String fileType)
/*     */   {
/*  71 */     this.fileType = fileType;
/*     */   }
/*     */ 
/*     */   public String getFileName()
/*     */   {
/*  76 */     return this.fileName;
/*     */   }
/*     */ 
/*     */   public void setFileName(String fileName)
/*     */   {
/*  81 */     this.fileName = fileName;
/*     */   }
/*     */ 
/*     */   public void setIsDelete(String isDelete)
/*     */   {
/*  87 */     this.isDelete = isDelete;
/*     */   }
/*     */ 
/*     */   public String getIsDelete() {
/*  91 */     return this.isDelete;
/*     */   }
/*     */ 
/*     */   public String toString()
/*     */   {
/*  96 */     StringBuffer sb = new StringBuffer();
/*     */ 
/*  98 */     sb.append(" [ mainId=" + this.mainId);
/*     */ 
/* 100 */     sb.append(", fileId=" + this.fileId);
/*     */ 
/* 102 */     sb.append(", fileType=" + this.fileType);
/*     */ 
/* 104 */     sb.append(", fileName=" + this.fileName);
/*     */ 
/* 106 */     sb.append(", fileContent=" + this.fileContent);
/* 107 */     sb.append("]");
/*     */ 
/* 109 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getVERInfo()
/*     */   {
/* 116 */     return "$Date$,$Author$,$Revision$";
/*     */   }
/*     */ 
/*     */   public ByteArrayProxy getFileContent() {
/* 120 */     return this.fileContent;
/*     */   }
/*     */ 
/*     */   public void setFileContent(ByteArrayProxy fileContent) {
/* 124 */     this.fileContent = fileContent;
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.example.data.Blobitem
 * JD-Core Version:    0.5.3
 */