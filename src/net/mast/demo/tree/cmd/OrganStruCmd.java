/*     */ package net.mast.demo.tree.cmd;
/*     */ 
/*     */ import java.io.IOException;
/*     */ import java.io.PrintWriter;
/*     */ import java.text.SimpleDateFormat;
/*     */ import java.util.ArrayList;
/*     */ import java.util.Date;
/*     */ import java.util.HashMap;
/*     */ import java.util.Iterator;
/*     */ import java.util.List;
/*     */ import java.util.Map;
/*     */ import javax.servlet.http.HttpServletRequest;
/*     */ import javax.servlet.http.HttpServletResponse;
/*     */ import org.apache.commons.logging.Log;
/*     */ import org.apache.commons.logging.LogFactory;
/*     */ import net.mast.demo.DP;
/*     */ import net.mast.demo.tree.service.IOrganStruService;
/*     */ import net.mast.demo.tree.view.OrganStruView;
/*     */ import net.mast.util.IErrorHandler;
/*     */ import net.mast.util.IMessageHandler;
/*     */ import net.mast.waf.mvc.MultiCommand;
/*     */ import net.mast.waf.mvc.ViewHelper;
/*     */ import net.mast.web.taglib.util.skin.SkinUtils;
/*     */ 
/*     */ public class OrganStruCmd extends MultiCommand
/*     */ {
/*  38 */   private static Log log = LogFactory.getLog(OrganStruCmd.class);
/*  39 */   private IOrganStruService organStruService = null;
/*     */ 
/*     */   public final String changeStruOrder(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */     throws IOException
/*     */   {
/*  46 */     String parentId = req.getParameter("parentId");
/*     */ 
/*  48 */     String newOrderList = "";
/*     */     try {
/*  50 */       newOrderList = req.getParameter("newOrderList");
/*     */     } catch (Exception localException) {
/*     */     }
/*  53 */     if ((parentId == null) || (newOrderList == null)) {
/*  54 */       throw new RuntimeException(DP.getString("OrganStruCmd.changeStruOrder1"));
/*     */     }
/*  56 */     String[] order = newOrderList.split(",");
/*  57 */     int size = order.length;
/*  58 */     for (int i = 0; i < size; ++i)
/*     */     {
/*  60 */       OrganStruView vi = getOrganStruService().getOrganStruView(order[i]);
/*     */ 
/*  62 */       vi.setOrganOrder(size - i);
/*     */ 
/*  64 */       getOrganStruService().updateOrganStru(vi);
/*     */     }
/*     */ 
/*  67 */     req.setAttribute("REFRESHID", parentId);
/*  68 */     if (!(parentId.equals("root")))
/*     */     {
/*  70 */       viewHelper.setView(getOrganStruService().getOrganStruView(parentId));
/*     */     }
/*     */     else
/*     */     {
/*  75 */       OrganStruView vi = new OrganStruView();
/*  76 */       vi.setOrganId("root");
/*  77 */       vi.setOrganAlias(DP.getString("Demo.Common.Groupcompany"));
/*  78 */       vi.setOrganType("root");
/*  79 */       vi.setBeginDate("YYYYMMDD");
/*  80 */       vi.setEndDate("YYYYMMDD");
/*  81 */       vi.setParentId("root");
/*  82 */       vi.setPrincipalId("root");
/*  83 */       viewHelper.setView(vi);
/*     */     }
/*  85 */     return "organstruView.detail";
/*     */   }
/*     */ 
/*     */   public final String getChangeOrderRoot(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 100 */     String parentId = req.getParameter("primaryKey");
/* 101 */     req.setAttribute("parentId", parentId);
/*     */ 
/* 103 */     req.setAttribute("functree", getCheckChild(req, parentId));
/*     */ 
/* 105 */     return "organstruView.changeOrderRoot";
/*     */   }
/*     */ 
/*     */   public final List getCheckChild(HttpServletRequest req, String parentId)
/*     */   {
/* 114 */     if ((parentId == null) || (parentId.equals(""))) {
/* 115 */       throw new RuntimeException(DP.getString("OrganStruCmd.getCheckChild1"));
/*     */     }
/*     */ 
/* 118 */     List list = getOrganStruService().getChildren(parentId);
/* 119 */     List tree = new ArrayList();
/* 120 */     int size = list.size();
/* 121 */     for (int i = 0; i < size; ++i) {
/* 122 */       HashMap map = new HashMap();
/* 123 */       OrganStruView vi = (OrganStruView)list.get(i);
/* 124 */       map.put("organId", vi.getOrganId());
/* 125 */       map.put("organAlias", vi.getOrganAlias());
/* 126 */       tree.add(map);
/*     */     }
/* 128 */     return tree;
/*     */   }
/*     */ 
/*     */   public String getRoot(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 139 */     List list = new ArrayList();
/* 140 */     HashMap map = new HashMap();
/* 141 */     map.put("organId", "root");
/* 142 */     map.put("organAlias", DP.getString("Demo.Common.Groupcompany"));
/* 143 */     map.put("organType", "root");
/* 144 */     map.put("isLeaf", "root");
/*     */ 
/* 146 */     map.put("nodeImgSrc", SkinUtils.getImage(req, "322.gif"));
/* 147 */     list.add(map);
/* 148 */     req.setAttribute("treeCollection", list);
/* 149 */     return "organstruView.getRoot";
/*     */   }
/*     */ 
/*     */   public String getHelp(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 158 */     List list = new ArrayList();
/* 159 */     HashMap map = new HashMap();
/* 160 */     map.put("organId", "root");
/* 161 */     map.put("organAlias", DP.getString("Demo.Common.Groupcompany"));
/* 162 */     map.put("organType", "root");
/* 163 */     map.put("isLeaf", "root");
/* 164 */     map.put("nodeImgSrc", SkinUtils.getImage(req, "322.gif"));
/* 165 */     list.add(map);
/* 166 */     req.setAttribute("treeCollection", list);
/* 167 */     return "organstruView.getHelp";
/*     */   }
/*     */ 
/*     */   public String getHelpCh(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 177 */     String parentId = req.getParameter("nodeId");
/* 178 */     List list = getOrganStruService().getChildren(parentId);
/* 179 */     List ls = new ArrayList();
/* 180 */     Map map = null;
/* 181 */     OrganStruView view = null;
/*     */ 
/* 183 */     Iterator it = list.iterator();
/* 184 */     while (it.hasNext()) {
/* 185 */       view = (OrganStruView)it.next();
/* 186 */       map = new HashMap();
/* 187 */       map.put("organId", view.getOrganId());
/* 188 */       map.put("organAlias", view.getOrganAlias());
/* 189 */       map.put("organType", view.getOrganType());
/*     */ 
/* 191 */       if (view.getOrganType().equals("1")) {
/* 192 */         map.put("isLeaf", "0");
/* 193 */         map.put("nodeImgSrc", SkinUtils.getImage(req, "group_img.gif"));
/*     */       }
/* 195 */       if (view.getOrganType().equals("2")) {
/* 196 */         map.put("isLeaf", "0");
/* 197 */         map.put("nodeImgSrc", SkinUtils.getImage(req, "3.gif"));
/*     */       }
/* 199 */       if (view.getOrganType().equals("3")) {
/* 200 */         map.put("isLeaf", "0");
/* 201 */         map.put("nodeImgSrc", SkinUtils.getImage(req, "5.gif"));
/*     */       }
/*     */ 
/* 204 */       if (view.getOrganType().equals("4")) {
/* 205 */         map.put("checknodeId", view.getOrganId());
/*     */       }
/*     */ 
/* 208 */       ls.add(map);
/*     */     }
/* 210 */     req.setAttribute("treeCollection", ls);
/* 211 */     return "organstruView.getHelpCh";
/*     */   }
/*     */ 
/*     */   public String getChildren(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 239 */     String parentId = req.getParameter("nodeId");
/* 240 */     List list = getOrganStruService().getChildren(parentId);
/* 241 */     List ls = new ArrayList();
/* 242 */     Map map = null;
/* 243 */     OrganStruView view = null;
/* 244 */     Iterator it = list.iterator();
/* 245 */     while (it.hasNext()) {
/* 246 */       view = (OrganStruView)it.next();
/* 247 */       map = new HashMap();
/* 248 */       map.put("organId", view.getOrganId());
/* 249 */       map.put("organAlias", view.getOrganAlias());
/* 250 */       map.put("organType", view.getOrganType());
/*     */ 
/* 252 */       if (view.getOrganType().equals("1")) {
/* 253 */         map.put("isLeaf", "0");
/* 254 */         map.put("nodeImgSrc", SkinUtils.getImage(req, "group_img.gif"));
/*     */       }
/* 256 */       if (view.getOrganType().equals("2")) {
/* 257 */         map.put("isLeaf", "0");
/* 258 */         map.put("nodeImgSrc", SkinUtils.getImage(req, "3.gif"));
/*     */       }
/* 260 */       if (view.getOrganType().equals("3")) {
/* 261 */         map.put("isLeaf", "0");
/* 262 */         map.put("nodeImgSrc", SkinUtils.getImage(req, "5.gif"));
/*     */       }
/* 264 */       ls.add(map);
/*     */     }
/* 266 */     req.setAttribute("treeCollection", ls);
/* 267 */     return "organstruView.getChildren";
/*     */   }
/*     */ 
/*     */   public String forinsert(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 284 */     OrganStruView vi = new OrganStruView();
/*     */ 
/* 286 */     String parentId = req.getParameter("primaryKey");
/* 287 */     vi.setParentId(parentId);
/*     */ 
/* 289 */     SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
/* 290 */     Date date = new Date();
/* 291 */     String now = format.format(date);
/* 292 */     vi.setBeginDate(now);
/* 293 */     viewHelper.setView(vi);
/* 294 */     return "organstruView.forinsert";
/*     */   }
/*     */ 
/*     */   public String forupdate(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 311 */     String pkargs = req.getParameter("primaryKey");
/* 312 */     String organId = pkargs;
/*     */ 
/* 320 */     OrganStruView vi = getOrganStruService().getOrganStruView(organId);
/* 321 */     String principalId = vi.getPrincipalId();
/* 322 */     String name = "";
/*     */     try
/*     */     {
/* 325 */       name = getOrganStruService().getOrganStruView(principalId).getOrganAlias();
/*     */     } catch (Exception localException) {
/*     */     }
/* 328 */     vi.setPrincipalName(name);
/* 329 */     viewHelper.setView(vi);
/*     */ 
/* 331 */     return "organstruView.forupdate";
/*     */   }
/*     */ 
/*     */   public String detail(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 348 */     String pkargs = req.getParameter("primaryKey");
/* 349 */     String organId = pkargs;
/* 350 */     OrganStruView vi = getOrganStruService().getOrganStruView(organId);
/* 351 */     String principalId = vi.getPrincipalId();
/* 352 */     String name = "";
/*     */     try
/*     */     {
/* 355 */       name = getOrganStruService().getOrganStruView(principalId).getOrganAlias();
/*     */     } catch (Exception localException) {
/*     */     }
/* 358 */     vi.setPrincipalName(name);
/* 359 */     viewHelper.setView(vi);
/* 360 */     return "organstruView.detail";
/*     */   }
/*     */ 
/*     */   public String insert(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 377 */     OrganStruView viewin = (OrganStruView)viewHelper.getView();
/*     */ 
/* 381 */     if (viewin.getParentId().equals("root")) {
/* 382 */       viewin.setStruPath("root\\" + viewin.getOrganId());
/*     */     } else {
/* 384 */       String parentId = viewin.getParentId();
/* 385 */       viewin.setStruPath(getOrganStruService().getOrganStruView(parentId).getStruPath() + "\\" + viewin.getOrganId());
/*     */     }
/* 387 */     req.setAttribute("REFRESHID", viewin.getParentId());
/* 388 */     getOrganStruService().insertOrganStru(viewin);
/*     */ 
/* 392 */     String principalId = viewin.getPrincipalId();
/* 393 */     String name = "";
/*     */     try
/*     */     {
/* 396 */       name = getOrganStruService().getOrganStruView(principalId).getOrganAlias();
/*     */     } catch (Exception localException) {
/*     */     }
/* 399 */     viewin.setPrincipalName(name);
/* 400 */     viewHelper.setView(viewin);
/* 401 */     return "organstruView.detail";
/*     */   }
/*     */ 
/*     */   public String insertContinue(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 418 */     OrganStruView viewin = (OrganStruView)viewHelper.getView();
/*     */ 
/* 421 */     if (viewin.getParentId().equals("root")) {
/* 422 */       viewin.setStruPath("root\\" + viewin.getOrganId());
/*     */     } else {
/* 424 */       String parentId = viewin.getParentId();
/* 425 */       viewin.setStruPath(getOrganStruService().getOrganStruView(parentId).getStruPath() + "\\" + viewin.getOrganId());
/*     */     }
/* 427 */     getOrganStruService().insertOrganStru(viewin);
/* 428 */     OrganStruView vi = new OrganStruView();
/*     */ 
/* 430 */     String parentId = req.getParameter("primaryKey");
/* 431 */     String organType = req.getParameter("type");
/* 432 */     vi.setParentId(parentId);
/* 433 */     vi.setOrganType(organType);
/*     */ 
/* 435 */     SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
/* 436 */     Date date = new Date();
/* 437 */     String now = format.format(date);
/* 438 */     vi.setBeginDate(now);
/* 439 */     viewHelper.setView(vi);
/* 440 */     return "organstruView.forinsert";
/*     */   }
/*     */ 
/*     */   public String update(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 459 */     OrganStruView viewin = (OrganStruView)viewHelper.getView();
/*     */ 
/* 462 */     if (viewin.getParentId().equals("root")) {
/* 463 */       viewin.setStruPath("root\\" + viewin.getOrganId());
/*     */     } else {
/* 465 */       String parentId = viewin.getParentId();
/* 466 */       viewin.setStruPath(getOrganStruService().getOrganStruView(parentId).getStruPath() + "\\" + viewin.getOrganId());
/*     */     }
/*     */ 
/* 469 */     req.setAttribute("REFRESHID", viewin.getParentId());
/* 470 */     viewHelper.setView(getOrganStruService().updateOrganStru(viewin));
/* 471 */     return "organstruView.detail";
/*     */   }
/*     */ 
/*     */   public String delete(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 488 */     String[] delPK = req.getParameterValues("primaryKey");
/* 489 */     for (int i = 0; i < delPK.length; ++i) {
/* 490 */       String organId = delPK[i];
/* 491 */       getOrganStruService().deleteOrganStru(organId); }
/* 492 */     return "organstruViewChain.success";
/*     */   }
/*     */ 
/*     */   public String query(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 504 */     String organAlias = req.getParameter("organAlias");
/* 505 */     List list = getOrganStruService().getStruPath(organAlias);
/* 506 */     PrintWriter out = null;
/* 507 */     String struPath = "";
/* 508 */     StringBuffer sb = new StringBuffer();
/* 509 */     for (int i = 0; i < list.size(); ++i) {
/* 510 */       OrganStruView viewin = (OrganStruView)list.get(i);
/* 511 */       struPath = viewin.getStruPath();
/* 512 */       sb.append(struPath);
/* 513 */       sb.append(",");
/*     */     }
/*     */     try
/*     */     {
/* 517 */       out = rep.getWriter();
/* 518 */       out.print(sb.toString());
/*     */     }
/*     */     catch (IOException e) {
/* 521 */       e.printStackTrace();
/*     */     }
/* 523 */     return null;
/*     */   }
/*     */ 
/*     */   public void afterPropertiesSet()
/*     */     throws Exception
/*     */   {
/* 530 */     super.afterPropertiesSet();
/* 531 */     if (getOrganStruService() == null)
/* 532 */       throw new RuntimeException("OrganStruCmd" + DP.getString("Demo.Common.ConfigureError") + "OrganStruService" + DP.getString("Demo.Common.Notbenull"));
/*     */   }
/*     */ 
/*     */   public IOrganStruService getOrganStruService()
/*     */   {
/* 540 */     return this.organStruService;
/*     */   }
/*     */ 
/*     */   public void setOrganStruService(IOrganStruService service)
/*     */   {
/* 547 */     this.organStruService = service;
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.tree.cmd.OrganStruCmd
 * JD-Core Version:    0.5.3
 */