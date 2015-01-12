/*     */ package net.mast.demo.example.view;
/*     */ 
/*     */ import java.io.Serializable;
/*     */ import net.mast.web.taglib.util.IDelete;
/*     */ import net.mast.web.upload.UploadFile;
/*     */ import net.mast.web.upload.util.ByteArrayProxy;
/*     */ 
/*     */ public class BlobitemView
/*     */   implements Serializable, IDelete
/*     */ {
/*     */   private String mainId;
/*     */   private String fileId;
/*     */   private String fileType;
/*     */   private String fileName;
/*     */   private ByteArrayProxy fileContent;
/*     */   private UploadFile uploadFile;
/*  43 */   private String isDelete = "0";
/*     */ 
/*     */   public String getMainId()
/*     */   {
/*  48 */     return ((this.mainId == null) ? "" : this.mainId);
/*     */   }
/*     */ 
/*     */   public void setMainId(String mainId)
/*     */   {
/*  54 */     this.mainId = mainId;
/*     */   }
/*     */ 
/*     */   public String getFileId()
/*     */   {
/*  60 */     return ((this.fileId == null) ? "" : this.fileId);
/*     */   }
/*     */ 
/*     */   public void setFileId(String fileId)
/*     */   {
/*  66 */     this.fileId = fileId;
/*     */   }
/*     */ 
/*     */   public String getFileType()
/*     */   {
/*  72 */     return ((this.fileType == null) ? "" : this.fileType);
/*     */   }
/*     */ 
/*     */   public void setFileType(String fileType)
/*     */   {
/*  77 */     this.fileType = fileType;
/*     */   }
/*     */ 
/*     */   public String getFileName()
/*     */   {
/*  83 */     return ((this.fileName == null) ? "" : this.fileName);
/*     */   }
/*     */ 
/*     */   public void setFileName(String fileName)
/*     */   {
/*  88 */     this.fileName = fileName;
/*     */   }
/*     */ 
/*     */   public void setIsDelete(String isDelete)
/*     */   {
/*  93 */     this.isDelete = isDelete;
/*     */   }
/*     */ 
/*     */   public String getIsDelete() {
/*  97 */     return this.isDelete;
/*     */   }
/*     */ 
/*     */   public String toString()
/*     */   {
/* 102 */     StringBuffer sb = new StringBuffer();
/*     */ 
/* 104 */     sb.append(" [ mainId=" + this.mainId);
/*     */ 
/* 106 */     sb.append(", fileId=" + this.fileId);
/*     */ 
/* 108 */     sb.append(", fileType=" + this.fileType);
/*     */ 
/* 110 */     sb.append(", fileName=" + this.fileName);
/*     */ 
/* 112 */     sb.append(", fileContent=" + this.fileContent);
/* 113 */     sb.append("]");
/*     */ 
/* 115 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getVERInfo()
/*     */   {
/* 120 */     return "$Date$,$Author$,$Revision$";
/*     */   }
/*     */ 
/*     */   public UploadFile getUploadFile() {
/* 124 */     return this.uploadFile;
/*     */   }
/*     */ 
/*     */   public void setUploadFile(UploadFile uploadFile) {
/* 128 */     this.uploadFile = uploadFile;
/*     */   }
/*     */ 
/*     */   public ByteArrayProxy getFileContent() {
/* 132 */     return this.fileContent;
/*     */   }
/*     */ 
/*     */   public void setFileContent(ByteArrayProxy fileContent) {
/* 136 */     this.fileContent = fileContent;
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.example.view.BlobitemView
 * JD-Core Version:    0.5.3
 */