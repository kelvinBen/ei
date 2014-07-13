/*     */ package net.mast.demo.example.utils;
/*     */ 
/*     */ import java.util.ArrayList;
/*     */ import java.util.Iterator;
/*     */ import java.util.List;
/*     */ import net.mast.commons.exception.BaseRuntimeException;
/*     */ import net.mast.demo.DP;
/*     */ import net.mast.demo.example.data.Blobitem;
/*     */ import net.mast.demo.example.data.Mainblob;
/*     */ import net.mast.demo.example.view.BlobitemView;
/*     */ import net.mast.demo.example.view.MainblobView;
/*     */ 
/*     */ public class MainblobViewUtils
/*     */ {
/*     */   public static List getMainblobListView(List list)
/*     */   {
/*  21 */     List view = new ArrayList(list.size());
/*  22 */     for (int i = 0; i < list.size(); ++i) {
/*  23 */       view.add(getMainblobView((Mainblob)list.get(i)));
/*     */     }
/*  25 */     return view;
/*     */   }
/*     */ 
/*     */   public static List getMainblobList(List list)
/*     */   {
/*  33 */     List datas = new ArrayList(list.size());
/*  34 */     for (int i = 0; i < list.size(); ++i) {
/*  35 */       datas.add(getMainblob((MainblobView)list.get(i)));
/*     */     }
/*  37 */     return datas;
/*     */   }
/*     */ 
/*     */   public static MainblobView getMainblobView(Mainblob mainblob)
/*     */   {
/*  44 */     if (mainblob == null) {
/*  45 */       throw new BaseRuntimeException(DP.getString("Demo.Common.Query") + "Mainblob" + DP.getString("Demo.Common.Recordisnull"));
/*     */     }
/*  47 */     MainblobView view = new MainblobView();
/*     */     try {
/*  49 */       view.setMainId(mainblob.getMainId());
/*  50 */       view.setMainOperatorcode(mainblob.getMainOperatorcode());
/*  51 */       view.setMainOperatedate(mainblob.getMainOperatedate());
/*  52 */       Iterator lines = mainblob.getListBlobitem().iterator();
/*  53 */       List detailview = new ArrayList();
/*  54 */       Blobitem line = null;
/*  55 */       BlobitemView lineView = null;
/*     */ 
/*  57 */       while (lines.hasNext()) {
/*  58 */         line = (Blobitem)lines.next();
/*  59 */         lineView = new BlobitemView();
/*  60 */         lineView.setMainId(line.getMainId());
/*  61 */         lineView.setFileId(line.getFileId());
/*  62 */         lineView.setFileType(line.getFileType());
/*  63 */         lineView.setFileName(line.getFileName());
/*  64 */         lineView.setFileContent(line.getFileContent());
/*  65 */         detailview.add(lineView); }
/*  66 */       view.setListBlobitem(detailview);
/*     */     } catch (Exception e) {
/*  68 */       throw new BaseRuntimeException(DP.getString("Demo.Common.From") + "Mainblob" + DP.getString("Demo.Common.Get") + "MainblobView" + DP.getString("Demo.Common.Error"), e);
/*     */     }
/*  70 */     return view;
/*     */   }
/*     */ 
/*     */   public static Mainblob getMainblob(MainblobView mainblobView)
/*     */   {
/*  77 */     Mainblob data = new Mainblob();
/*     */     try {
/*  79 */       data.setMainId(mainblobView.getMainId());
/*  80 */       data.setMainOperatorcode(mainblobView.getMainOperatorcode());
/*  81 */       data.setMainOperatedate(mainblobView.getMainOperatedate());
/*  82 */       Iterator lines = mainblobView.getListBlobitem().iterator();
/*  83 */       List detail = new ArrayList();
/*  84 */       BlobitemView lineView = null;
/*  85 */       Blobitem line = null;
/*  86 */       while (lines.hasNext()) {
/*  87 */         lineView = (BlobitemView)lines.next();
/*  88 */         line = new Blobitem();
/*  89 */         line.setMainId(lineView.getMainId());
/*  90 */         line.setFileId(lineView.getFileId());
/*  91 */         line.setFileType(lineView.getFileType());
/*  92 */         line.setFileName(lineView.getFileName());
/*  93 */         line.setFileContent(lineView.getFileContent());
/*  94 */         line.setIsDelete(lineView.getIsDelete());
/*  95 */         detail.add(line);
/*     */       }
/*  97 */       data.setListBlobitem(detail);
/*     */     } catch (Exception e) {
/*  99 */       throw new BaseRuntimeException(DP.getString("Demo.Common.From") + "MainblobView" + DP.getString("Demo.Common.Get") + "Mainblob" + DP.getString("Demo.Common.Error"), e);
/*     */     }
/* 101 */     return data;
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.example.utils.MainblobViewUtils
 * JD-Core Version:    0.5.3
 */