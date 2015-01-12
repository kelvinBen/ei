/*     */ package net.mast.demo.example.cmd;
/*     */ 
/*     */ import java.io.FileNotFoundException;
/*     */ import java.io.IOException;
/*     */ import java.io.PrintStream;
/*     */ import java.util.List;
/*     */ import javax.servlet.http.HttpServletRequest;
/*     */ import javax.servlet.http.HttpServletResponse;
/*     */ import org.apache.commons.logging.Log;
/*     */ import org.apache.commons.logging.LogFactory;
/*     */ import net.mast.demo.DP;
/*     */ import net.mast.demo.example.service.IMainblobService;
/*     */ import net.mast.demo.example.view.BlobitemView;
/*     */ import net.mast.demo.example.view.MainblobView;
/*     */ import net.mast.util.IErrorHandler;
/*     */ import net.mast.util.IMessageHandler;
/*     */ import net.mast.waf.mvc.MultiCommand;
/*     */ import net.mast.waf.mvc.ViewHelper;
/*     */ import net.mast.web.upload.UploadFile;
/*     */ import net.mast.web.upload.util.ByteArrayProxy;
/*     */ import net.mast.web.upload.util.ByteArrayProxyFactory;
/*     */ 
/*     */ public class MainblobCmd extends MultiCommand
/*     */ {
/*  24 */   private static Log log = LogFactory.getLog(MainblobCmd.class);
/*  25 */   private IMainblobService mainblobService = null;
/*     */ 
/*     */   public String forinsert(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/*  33 */     MainblobView vi = new MainblobView();
/*  34 */     viewHelper.setView(vi);
/*  35 */     return "mainblobView.forinsert";
/*     */   }
/*     */ 
/*     */   public String forupdate(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/*  44 */     String pkargs = req.getParameter("primaryKey");
/*  45 */     String mainId = pkargs;
/*     */ 
/*  47 */     viewHelper.setView(getMainblobService().getMainblobView(mainId));
/*  48 */     return "mainblobView.forupdate";
/*     */   }
/*     */ 
/*     */   public String detail(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/*  57 */     String pkargs = req.getParameter("primaryKey");
/*  58 */     String mainId = pkargs;
/*  59 */     System.out.println(mainId);
/*  60 */     viewHelper.setView(getMainblobService().getMainblobView(mainId));
/*  61 */     return "mainblobView.detail";
/*     */   }
/*     */ 
/*     */   public String insert(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/*  70 */     MainblobView viewin = (MainblobView)viewHelper.getView();
/*     */ 
/*  73 */     List list = viewin.getListBlobitem();
/*  74 */     for (int i = 0; i < list.size(); ++i)
/*     */     {
/*  76 */       BlobitemView oracleBlobView = (BlobitemView)list.get(i);
/*     */ 
/*  78 */       UploadFile file = oracleBlobView.getUploadFile();
/*  79 */       if ((file.getFileName() != null) && (!(file.getFileName().equals("")))) {
/*  80 */         oracleBlobView.setFileName(file.getFileName());
/*     */       }
/*  82 */       if ((file.getContentType() != null) && (!(file.getContentType().equals("")))) {
/*  83 */         oracleBlobView.setFileType(file.getContentType());
/*     */       }
/*     */       try
/*     */       {
/*  87 */         if ((file.getFileData() != null) && (!(file.getFileData().equals("")))) {
/*  88 */           ByteArrayProxy proxy = ByteArrayProxyFactory.getInstance().getProxy(file);
/*     */ 
/*  90 */           if (proxy.getLength() == 0L) {
/*  91 */             proxy = null;
/*     */           }
/*  93 */           oracleBlobView.setFileContent(proxy);
/*     */         }
/*     */       }
/*     */       catch (FileNotFoundException e) {
/*  97 */         new RuntimeException(e);
/*     */       }
/*     */       catch (IOException e) {
/* 100 */         new RuntimeException(e);
/*     */       }
/*     */ 
/*     */     }
/*     */ 
/* 105 */     viewHelper.setView(getMainblobService().insertMainblob(viewin));
/* 106 */     return "mainblobView.detail";
/*     */   }
/*     */ 
/*     */   public String insertContinue(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 115 */     MainblobView viewin = (MainblobView)viewHelper.getView();
/*     */ 
/* 118 */     List list = viewin.getListBlobitem();
/* 119 */     for (int i = 0; i < list.size(); ++i) {
/* 120 */       BlobitemView oracleBlobView = (BlobitemView)list.get(i);
/*     */ 
/* 122 */       UploadFile file = oracleBlobView.getUploadFile();
/*     */ 
/* 124 */       if ((file.getFileName() != null) && (!(file.getFileName().equals("")))) {
/* 125 */         oracleBlobView.setFileName(file.getFileName());
/*     */       }
/* 127 */       if ((file.getContentType() != null) && (!(file.getContentType().equals("")))) {
/* 128 */         oracleBlobView.setFileType(file.getContentType());
/*     */       }
/*     */       try
/*     */       {
/* 132 */         if ((file.getFileData() != null) && (!(file.getFileData().equals("")))) {
/* 133 */           ByteArrayProxy proxy = ByteArrayProxyFactory.getInstance().getProxy(file);
/*     */ 
/* 135 */           if (proxy.getLength() == 0L) {
/* 136 */             proxy = null;
/*     */           }
/* 138 */           oracleBlobView.setFileContent(proxy);
/*     */         }
/*     */       }
/*     */       catch (FileNotFoundException e) {
/* 142 */         new RuntimeException(e);
/*     */       }
/*     */       catch (IOException e) {
/* 145 */         new RuntimeException(e);
/*     */       }
/*     */ 
/*     */     }
/*     */ 
/* 151 */     getMainblobService().insertMainblob(viewin);
/* 152 */     MainblobView vi = new MainblobView();
/* 153 */     viewHelper.setView(vi);
/* 154 */     return "mainblobView.forinsert";
/*     */   }
/*     */ 
/*     */   public String update(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 163 */     MainblobView viewin = (MainblobView)viewHelper.getView();
/*     */ 
/* 165 */     List list = viewin.getListBlobitem();
/* 166 */     for (int i = 0; i < list.size(); ++i)
/*     */     {
/* 168 */       BlobitemView oracleBlobView = (BlobitemView)list.get(i);
/*     */ 
/* 170 */       UploadFile file = oracleBlobView.getUploadFile();
/*     */ 
/* 172 */       if ((file.getFileName() != null) && (!(file.getFileName().equals("")))) {
/* 173 */         oracleBlobView.setFileName(file.getFileName());
/*     */       }
/* 175 */       if ((file.getContentType() != null) && (!(file.getContentType().equals("")))) {
/* 176 */         oracleBlobView.setFileType(file.getContentType());
/*     */       }
/*     */       try
/*     */       {
/* 180 */         byte[] fileDate = file.getFileData();
/* 181 */         if ((fileDate != null) && (!(fileDate.equals(""))))
/*     */         {
/* 183 */           ByteArrayProxy proxy = ByteArrayProxyFactory.getInstance().getProxy(file);
/* 184 */           if (proxy.getLength() == 0L) {
/* 185 */             proxy = null;
/*     */           }
/* 187 */           oracleBlobView.setFileContent(proxy);
/*     */         }
/*     */       } catch (FileNotFoundException e) {
/* 190 */         new RuntimeException(e);
/*     */       } catch (IOException e) {
/* 192 */         new RuntimeException(e);
/*     */       }
/*     */     }
/*     */ 
/* 196 */     viewHelper.setView(getMainblobService().updateMainblob(viewin));
/* 197 */     return "mainblobView.detail";
/*     */   }
/*     */ 
/*     */   public String delete(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 206 */     String[] delPK = req.getParameterValues("primaryKey");
/* 207 */     for (int i = 0; i < delPK.length; ++i) {
/* 208 */       String mainId = delPK[i];
/* 209 */       getMainblobService().deleteMainblob(mainId);
/*     */     }
/* 211 */     return "mainblobViewChain.success";
/*     */   }
/*     */ 
/*     */   public void afterPropertiesSet()
/*     */     throws Exception
/*     */   {
/* 218 */     super.afterPropertiesSet();
/* 219 */     if (getMainblobService() == null)
/* 220 */       throw new RuntimeException("MainblobCmd" + DP.getString("Demo.Common.ConfigureError") + "MainblobService" + DP.getString("Demo.Common.Notbenull"));
/*     */   }
/*     */ 
/*     */   public IMainblobService getMainblobService()
/*     */   {
/* 228 */     return this.mainblobService;
/*     */   }
/*     */ 
/*     */   public void setMainblobService(IMainblobService service)
/*     */   {
/* 235 */     this.mainblobService = service;
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.example.cmd.MainblobCmd
 * JD-Core Version:    0.5.3
 */