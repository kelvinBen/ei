/*     */ package net.mast.demo.combo.collection.cmd;
/*     */ 
/*     */ import java.io.IOException;
/*     */ import java.io.PrintWriter;
/*     */ import java.util.HashMap;
/*     */ import java.util.List;
/*     */ import java.util.Map;
/*     */ import javax.servlet.http.HttpServletRequest;
/*     */ import javax.servlet.http.HttpServletResponse;
/*     */ import org.apache.commons.logging.Log;
/*     */ import org.apache.commons.logging.LogFactory;
/*     */ import net.mast.demo.DP;
/*     */ import net.mast.demo.combo.collection.service.IComboCollectionService;
/*     */ import net.mast.demo.combo.collection.view.ComboCollectionView;
/*     */ import net.mast.util.IErrorHandler;
/*     */ import net.mast.util.IMessageHandler;
/*     */ import net.mast.util.Page;
/*     */ import net.mast.util.RowSelection;
/*     */ import net.mast.waf.mvc.MultiCommand;
/*     */ import net.mast.waf.mvc.ViewHelper;
/*     */ 
/*     */ public class ComboCollectionCmd extends MultiCommand
/*     */ {
/*  28 */   private static Log log = LogFactory.getLog(ComboCollectionCmd.class);
/*  29 */   private IComboCollectionService comboCollectionService = null;
/*     */ 
/*     */   public String test(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */     throws IOException
/*     */   {
/*  36 */     PrintWriter out = rep.getWriter();
/*  37 */     String key = req.getParameter("key");
/*  38 */     String type = req.getParameter("type");
/*  39 */     String temp = "";
/*  40 */     if ((type != null) && (type.equals("id"))) {
/*  41 */       ComboCollectionView view = getComboCollectionService().getComboCollectionView(key);
/*  42 */       temp = temp + view.getComboName() + "@,@" + view.getComboId() + "@,@" + view.getComboHelp();
/*     */     }
/*     */     else {
/*  45 */       RowSelection row = new RowSelection();
/*  46 */       row.setFirstRow(new Integer(0));
/*  47 */       row.setMaxRows(new Integer(5));
/*  48 */       Map mapCon = new HashMap();
/*  49 */       mapCon.put("combo_helpSearch", new String[] { key });
/*  50 */       Page page = getComboCollectionService().getAllComboCollection(row, mapCon);
/*  51 */       List list = page.getDatas();
/*  52 */       for (int i = 0; i < list.size(); ++i) {
/*  53 */         ComboCollectionView view = (ComboCollectionView)list.get(i);
/*  54 */         temp = temp + view.getComboName() + "@,@" + view.getComboId() + "@,@" + view.getComboHelp() + "@|@";
/*     */       }
/*  56 */       if (temp.endsWith("@|@")) {
/*  57 */         temp = temp.substring(0, temp.lastIndexOf("@|@"));
/*     */       }
/*     */     }
/*  60 */     out.print(temp);
/*     */ 
/*  62 */     return null;
/*     */   }
/*     */ 
/*     */   public String forinsert(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/*  81 */     ComboCollectionView vi = new ComboCollectionView();
/*  82 */     viewHelper.setView(vi);
/*  83 */     return "combocollectionView.forinsert";
/*     */   }
/*     */ 
/*     */   public String forupdate(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 100 */     String pkargs = req.getParameter("primaryKey");
/* 101 */     String comboId = pkargs;
/* 102 */     viewHelper.setView(getComboCollectionService().getComboCollectionView(comboId));
/* 103 */     return "combocollectionView.forupdate";
/*     */   }
/*     */ 
/*     */   public String detail(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 120 */     String pkargs = req.getParameter("primaryKey");
/* 121 */     String comboId = pkargs;
/* 122 */     viewHelper.setView(getComboCollectionService().getComboCollectionView(comboId));
/* 123 */     return "combocollectionView.detail";
/*     */   }
/*     */ 
/*     */   public String insert(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 140 */     ComboCollectionView viewin = (ComboCollectionView)viewHelper.getView();
/*     */ 
/* 142 */     viewHelper.setView(getComboCollectionService().insertComboCollection(viewin));
/* 143 */     return "combocollectionView.detail";
/*     */   }
/*     */ 
/*     */   public String insertContinue(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 160 */     ComboCollectionView viewin = (ComboCollectionView)viewHelper.getView();
/*     */ 
/* 162 */     getComboCollectionService().insertComboCollection(viewin);
/* 163 */     ComboCollectionView vi = new ComboCollectionView();
/* 164 */     viewHelper.setView(vi);
/* 165 */     return "combocollectionView.forinsert";
/*     */   }
/*     */ 
/*     */   public String update(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 182 */     viewHelper.setView(getComboCollectionService().updateComboCollection((ComboCollectionView)viewHelper.getView()));
/* 183 */     return "combocollectionView.detail";
/*     */   }
/*     */ 
/*     */   public String delete(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 200 */     String[] delPK = req.getParameterValues("primaryKey");
/* 201 */     for (int i = 0; i < delPK.length; ++i) {
/* 202 */       String comboId = delPK[i];
/* 203 */       getComboCollectionService().deleteComboCollection(comboId);
/*     */     }
/* 205 */     return "combocollectionViewChain.success";
/*     */   }
/*     */ 
/*     */   public void afterPropertiesSet()
/*     */     throws Exception
/*     */   {
/* 212 */     super.afterPropertiesSet();
/* 213 */     if (getComboCollectionService() == null)
/* 214 */       throw new RuntimeException("ComboCollectionCmd" + DP.getString("Demo.Common.ConfigureError") + "ComboCollectionService" + DP.getString("Demo.Common.Notbenull"));
/*     */   }
/*     */ 
/*     */   public IComboCollectionService getComboCollectionService()
/*     */   {
/* 222 */     return this.comboCollectionService;
/*     */   }
/*     */ 
/*     */   public void setComboCollectionService(IComboCollectionService service)
/*     */   {
/* 229 */     this.comboCollectionService = service;
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.combo.collection.cmd.ComboCollectionCmd
 * JD-Core Version:    0.5.3
 */