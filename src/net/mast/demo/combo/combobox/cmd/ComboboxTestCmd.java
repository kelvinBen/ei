/*     */ package net.mast.demo.combo.combobox.cmd;
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
/*     */ import net.mast.demo.combo.combobox.data.Nation;
/*     */ import net.mast.demo.combo.combobox.service.IComboboxTestService;
/*     */ import net.mast.demo.combo.combobox.view.ComboboxTestView;
/*     */ import net.mast.util.IErrorHandler;
/*     */ import net.mast.util.IMessageHandler;
/*     */ import net.mast.util.Page;
/*     */ import net.mast.util.RowSelection;
/*     */ import net.mast.waf.mvc.MultiCommand;
/*     */ import net.mast.waf.mvc.ViewHelper;
/*     */ 
/*     */ public class ComboboxTestCmd extends MultiCommand
/*     */ {
/*  33 */   private static Log log = LogFactory.getLog(ComboboxTestCmd.class);
/*  34 */   private IComboboxTestService comboboxTestService = null;
/*  35 */   private IComboCollectionService comboCollectionService = null;
/*  36 */   Nation nation = new Nation();
/*     */ 
/*     */   public String test(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */     throws IOException
/*     */   {
/*  43 */     PrintWriter out = rep.getWriter();
/*  44 */     String key = req.getParameter("key");
/*  45 */     String type = req.getParameter("type");
/*  46 */     String temp = "";
/*  47 */     if ((type != null) && (type.equals("id"))) {
/*  48 */       ComboCollectionView view = getComboCollectionService().getComboCollectionView(key);
/*  49 */       temp = temp + view.getComboName() + "@,@" + view.getComboId() + "@,@" + view.getComboHelp();
/*     */     }
/*     */     else {
/*  52 */       RowSelection row = new RowSelection();
/*  53 */       row.setFirstRow(new Integer(0));
/*  54 */       row.setMaxRows(new Integer(5));
/*  55 */       Map mapCon = new HashMap();
/*  56 */       mapCon.put("combo_helpSearch", new String[] { key });
/*  57 */       Page page = getComboCollectionService().getAllComboCollection(row, mapCon);
/*  58 */       List list = page.getDatas();
/*  59 */       for (int i = 0; i < list.size(); ++i) {
/*  60 */         ComboCollectionView view = (ComboCollectionView)list.get(i);
/*  61 */         temp = temp + view.getComboName() + "@,@" + view.getComboId() + "@,@" + view.getComboHelp() + "@|@";
/*     */       }
/*  63 */       if (temp.endsWith("@|@")) {
/*  64 */         temp = temp.substring(0, temp.lastIndexOf("@|@"));
/*     */       }
/*     */     }
/*  67 */     out.print(temp);
/*     */ 
/*  69 */     return null; }
/*     */ 
/*     */   public IComboCollectionService getComboCollectionService() {
/*  72 */     return this.comboCollectionService;
/*     */   }
/*     */ 
/*     */   public void setComboCollectionService(IComboCollectionService comboCollectionService) {
/*  76 */     this.comboCollectionService = comboCollectionService;
/*     */   }
/*     */ 
/*     */   public String forinsert(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/*  88 */     req.setAttribute("collection", this.nation.getNation());
/*  89 */     ComboboxTestView vi = new ComboboxTestView();
/*  90 */     viewHelper.setView(vi);
/*  91 */     return "comboboxtestView.forinsert";
/*     */   }
/*     */ 
/*     */   public String forupdate(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 108 */     req.setAttribute("collection", this.nation.getNation());
/* 109 */     String pkargs = req.getParameter("primaryKey");
/* 110 */     String comboBoxId = pkargs;
/* 111 */     viewHelper.setView(getComboboxTestService().getComboboxTestView(comboBoxId));
/* 112 */     return "comboboxtestView.forupdate";
/*     */   }
/*     */ 
/*     */   public String detail(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 129 */     String pkargs = req.getParameter("primaryKey");
/* 130 */     String comboBoxId = pkargs;
/* 131 */     viewHelper.setView(getComboboxTestService().getComboboxTestView(comboBoxId));
/*     */ 
/* 134 */     req.setAttribute("collection", this.nation.getNation());
/*     */ 
/* 136 */     return "comboboxtestView.detail";
/*     */   }
/*     */ 
/*     */   public String insert(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 153 */     ComboboxTestView viewin = (ComboboxTestView)viewHelper.getView();
/*     */ 
/* 155 */     viewHelper.setView(getComboboxTestService().insertComboboxTest(viewin));
/*     */ 
/* 158 */     req.setAttribute("collection", this.nation.getNation());
/* 159 */     return "comboboxtestView.detail";
/*     */   }
/*     */ 
/*     */   public String insertContinue(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 176 */     ComboboxTestView viewin = (ComboboxTestView)viewHelper.getView();
/*     */ 
/* 178 */     getComboboxTestService().insertComboboxTest(viewin);
/* 179 */     req.setAttribute("collection", this.nation.getNation());
/* 180 */     ComboboxTestView vi = new ComboboxTestView();
/* 181 */     viewHelper.setView(vi);
/* 182 */     return "comboboxtestView.forinsert";
/*     */   }
/*     */ 
/*     */   public String update(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 199 */     viewHelper.setView(getComboboxTestService().updateComboboxTest((ComboboxTestView)viewHelper.getView()));
/*     */ 
/* 202 */     req.setAttribute("collection", this.nation.getNation());
/*     */ 
/* 204 */     return "comboboxtestView.detail";
/*     */   }
/*     */ 
/*     */   public String delete(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 221 */     String[] delPK = req.getParameterValues("primaryKey");
/* 222 */     for (int i = 0; i < delPK.length; ++i) {
/* 223 */       String comboBoxId = delPK[i];
/* 224 */       getComboboxTestService().deleteComboboxTest(comboBoxId);
/*     */     }
/* 226 */     return "comboboxtestViewChain.success";
/*     */   }
/*     */ 
/*     */   public void afterPropertiesSet()
/*     */     throws Exception
/*     */   {
/* 233 */     super.afterPropertiesSet();
/* 234 */     if (getComboboxTestService() == null)
/* 235 */       throw new RuntimeException("ComboboxTestCmd" + DP.getString("Demo.Common.ConfigureError") + "ComboboxTestService" + DP.getString("Demo.Common.Notbenull"));
/*     */   }
/*     */ 
/*     */   public IComboboxTestService getComboboxTestService()
/*     */   {
/* 243 */     return this.comboboxTestService;
/*     */   }
/*     */ 
/*     */   public void setComboboxTestService(IComboboxTestService service)
/*     */   {
/* 250 */     this.comboboxTestService = service;
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.combo.combobox.cmd.ComboboxTestCmd
 * JD-Core Version:    0.5.3
 */