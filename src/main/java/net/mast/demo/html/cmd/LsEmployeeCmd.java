/*     */ package net.mast.demo.html.cmd;
/*     */ 
/*     */ import java.io.FileNotFoundException;
/*     */ import java.io.IOException;
/*     */ import java.io.InputStream;
/*     */ import java.io.OutputStream;
/*     */ import java.io.PrintWriter;
/*     */ import java.util.ArrayList;
/*     */ import java.util.HashMap;
/*     */ import java.util.Iterator;
/*     */ import java.util.List;
/*     */ import javax.servlet.http.HttpServletRequest;
/*     */ import javax.servlet.http.HttpServletResponse;
/*     */ import org.apache.commons.logging.Log;
/*     */ import org.apache.commons.logging.LogFactory;
/*     */ import net.mast.demo.DP;
/*     */ import net.mast.demo.flexgrid.data.FlexPlaceDao;
/*     */ import net.mast.demo.html.data.City;
/*     */ import net.mast.demo.html.data.PlaceDao;
/*     */ import net.mast.demo.html.data.Province;
/*     */ import net.mast.demo.html.service.ILsEmployeeService;
/*     */ import net.mast.demo.html.view.LsEmployeeView;
/*     */ import net.mast.util.IErrorHandler;
/*     */ import net.mast.util.IMessageHandler;
/*     */ import net.mast.waf.ext.service.servicetask.ServiceTaskInfoService;
/*     */ import net.mast.waf.ext.service.servicetask.ServiceTaskInfoView;
/*     */ import net.mast.waf.mvc.MultiCommand;
/*     */ import net.mast.waf.mvc.ViewHelper;
/*     */ import net.mast.web.upload.UploadFile;
/*     */ import net.mast.web.upload.util.ByteArrayProxy;
/*     */ import net.mast.web.upload.util.ByteArrayProxyFactory;
/*     */ 
/*     */ public class LsEmployeeCmd extends MultiCommand
/*     */ {
/*  35 */   private static Log log = LogFactory.getLog(LsEmployeeCmd.class);
/*  36 */   private ServiceTaskInfoService taskInfoService = null;
/*     */ 
/*  38 */   private ILsEmployeeService lsEmployeeService = null;
/*  39 */   PlaceDao placeDao = new PlaceDao();
/*  40 */   FlexPlaceDao flexplaceDao = new FlexPlaceDao();
/*     */ 
/*     */   public String getRoot(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/*  48 */     HashMap map = new HashMap();
/*  49 */     LsEmployeeView view = null;
/*  50 */     List list1 = getLsEmployeeService().getNode();
/*  51 */     Iterator it = list1.iterator();
/*  52 */     List list = new ArrayList();
/*  53 */     while (it.hasNext()) {
/*  54 */       view = (LsEmployeeView)it.next();
/*  55 */       map = new HashMap();
/*  56 */       map.put("organId", view.getEmployeeCode());
/*  57 */       map.put("organAlias", view.getEmployeeName());
/*  58 */       map.put("organType", view.getEmployeeDegree());
/*  59 */       map.put("isLeaf", "root");
/*  60 */       list.add(map);
/*     */     }
/*  62 */     req.setAttribute("treeCollection", list);
/*  63 */     return "lsemployeeView.getRoot";
/*     */   }
/*     */ 
/*     */   public String getImgUrl(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/*  71 */     OutputStream outData = null;
/*     */     try
/*     */     {
/*  74 */       outData = rep.getOutputStream();
/*     */     }
/*     */     catch (IOException e1) {
/*  77 */       e1.printStackTrace();
/*     */     }
/*     */ 
/*  80 */     rep.setContentType("image/*");
/*     */ 
/*  82 */     String pkargs = req.getParameter("primaryKey");
/*  83 */     String employeeCode = pkargs;
/*     */ 
/*  85 */     ByteArrayProxy imgUrl = getLsEmployeeService().getLsEmployeeView(employeeCode).getImageContent();
/*  86 */     InputStream ins = imgUrl.getInputStream();
/*  87 */     byte[] data = new byte[1024];
/*     */     try
/*     */     {
/*  90 */       while (ins.read(data) > 0) {
/*  91 */         outData.write(data, 0, data.length);
/*     */       }
/*     */     }
/*     */     catch (IOException e)
/*     */     {
/*  96 */       e.printStackTrace();
/*     */     }
/*  98 */     return null;
/*     */   }
/*     */ 
/*     */   public String getProvinces(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 106 */     String countryId = req.getParameter("countryId");
/*     */ 
/* 108 */     String defaut = req.getParameter("default");
/*     */ 
/* 110 */     List list = this.placeDao.getProvinceByCountryId(countryId);
/* 111 */     PrintWriter out = null;
/*     */ 
/* 113 */     StringBuffer sb = new StringBuffer();
/* 114 */     if (list != null) {
/* 115 */       for (int i = 0; i < list.size(); ++i) {
/* 116 */         Province province = (Province)list.get(i);
/* 117 */         if (province.getId().equals(defaut))
/*     */         {
/* 119 */           sb.append("<option value=" + province.getId() + " selected>" + province.getName() + "</option>");
/*     */         }
/*     */         else sb.append("<option value=" + province.getId() + ">" + province.getName() + "</option>");
/*     */       }
/*     */     }
/*     */ 
/*     */     try
/*     */     {
/* 127 */       out = rep.getWriter();
/* 128 */       out.print(sb.toString());
/*     */     }
/*     */     catch (IOException e) {
/* 131 */       e.printStackTrace();
/*     */     }
/* 133 */     return null;
/*     */   }
/*     */ 
/*     */   public String getCitys(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 141 */     String provinceId = req.getParameter("provinceId");
/*     */ 
/* 143 */     String defaut = req.getParameter("default");
/*     */ 
/* 145 */     List list = new ArrayList();
/* 146 */     list = getPlaceDao().getCityByProvinceId(provinceId);
/* 147 */     PrintWriter out = null;
/*     */ 
/* 149 */     StringBuffer sb = new StringBuffer();
/* 150 */     for (int i = 0; i < list.size(); ++i) {
/* 151 */       City city = (City)list.get(i);
/* 152 */       if (city.getId().equals(defaut))
/*     */       {
/* 155 */         sb.append("<option value=" + city.getId() + "  selected>" + city.getName() + "</option>");
/*     */       }
/*     */       else sb.append("<option value=" + city.getId() + ">" + city.getName() + "</option>");
/*     */     }
/*     */ 
/*     */     try
/*     */     {
/* 162 */       out = rep.getWriter();
/* 163 */       out.print(sb.toString());
/*     */     } catch (IOException e) {
/* 165 */       e.printStackTrace();
/*     */     }
/* 167 */     return null;
/*     */   }
/*     */ 
/*     */   public String forinsert(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 185 */     req.setAttribute("countrys", this.placeDao.getAllCountry());
/* 186 */     LsEmployeeView vi = new LsEmployeeView();
/*     */ 
/* 188 */     vi.setEmployeeMarry("1");
/* 189 */     viewHelper.setView(vi);
/* 190 */     return "lsemployeeView.forinsert";
/*     */   }
/*     */ 
/*     */   public String forupdate(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 209 */     req.setAttribute("countrys", this.placeDao.getAllCountry());
/* 210 */     String pkargs = req.getParameter("primaryKey");
/*     */ 
/* 213 */     String employeeCode = pkargs;
/*     */ 
/* 215 */     viewHelper.setView(getLsEmployeeService().getLsEmployeeView(employeeCode));
/* 216 */     return "lsemployeeView.forupdate";
/*     */   }
/*     */ 
/*     */   public String detail(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 234 */     String pkargs = req.getParameter("primaryKey");
/* 235 */     String employeeCode = pkargs;
/* 236 */     req.setAttribute("primaryKey", pkargs);
/* 237 */     viewHelper.setView(getLsEmployeeService().getLsEmployeeView(employeeCode));
/*     */ 
/* 240 */     req.setAttribute("COUNTRYS", this.flexplaceDao.getAllCountry());
/* 241 */     req.setAttribute("PROVINCES", this.flexplaceDao.getAllProvince());
/* 242 */     req.setAttribute("CITYS", this.flexplaceDao.getAllCity());
/*     */ 
/* 244 */     return "lsemployeeView.detail";
/*     */   }
/*     */ 
/*     */   public String insert(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 263 */     LsEmployeeView viewin = (LsEmployeeView)viewHelper.getView();
/* 264 */     UploadFile file = viewin.getUploadFile();
/*     */     try
/*     */     {
/* 269 */       if ((file.getFileData() != null) && (!(file.getFileData().equals(""))))
/* 270 */         viewin.setImageContent(ByteArrayProxyFactory.getInstance().getProxy(
/* 271 */           viewin.getUploadFile()));
/*     */     }
/*     */     catch (FileNotFoundException e)
/*     */     {
/* 275 */       e.printStackTrace();
/*     */     }
/*     */     catch (IOException e) {
/* 278 */       e.printStackTrace();
/*     */     }
/*     */ 
/* 281 */     String pkargs = req.getParameter("primaryKey");
/* 282 */     req.setAttribute("primaryKey", pkargs);
/* 283 */     viewHelper.setView(getLsEmployeeService().insertLsEmployee(viewin));
/*     */ 
/* 286 */     req.setAttribute("COUNTRYS", this.flexplaceDao.getAllCountry());
/* 287 */     req.setAttribute("PROVINCES", this.flexplaceDao.getAllProvince());
/* 288 */     req.setAttribute("CITYS", this.flexplaceDao.getAllCity());
/*     */ 
/* 290 */     return "lsemployeeView.detail";
/*     */   }
/*     */ 
/*     */   public String insertContinue(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 309 */     LsEmployeeView viewin = (LsEmployeeView)viewHelper.getView();
/* 310 */     UploadFile file = viewin.getUploadFile();
/*     */     try
/*     */     {
/* 315 */       if ((file.getFileData() != null) && (!(file.getFileData().equals(""))))
/* 316 */         viewin.setImageContent(ByteArrayProxyFactory.getInstance().getProxy(
/* 317 */           viewin.getUploadFile()));
/*     */     }
/*     */     catch (FileNotFoundException e)
/*     */     {
/* 321 */       e.printStackTrace();
/*     */     }
/*     */     catch (IOException e) {
/* 324 */       e.printStackTrace();
/*     */     }
/*     */ 
/* 327 */     getLsEmployeeService().insertLsEmployee(viewin);
/*     */ 
/* 329 */     LsEmployeeView vi = new LsEmployeeView();
/*     */ 
/* 331 */     req.setAttribute("countrys", this.placeDao.getAllCountry());
/*     */ 
/* 333 */     vi.setEmployeeMarry("1");
/* 334 */     viewHelper.setView(vi);
/* 335 */     return "lsemployeeView.forinsert";
/*     */   }
/*     */ 
/*     */   public String update(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 353 */     LsEmployeeView viewin = (LsEmployeeView)viewHelper.getView();
/* 354 */     UploadFile file = viewin.getUploadFile();
/*     */     try
/*     */     {
/* 359 */       if ((file.getFileData() != null) && (!(file.getFileData().equals(""))))
/* 360 */         viewin.setImageContent(ByteArrayProxyFactory.getInstance().getProxy(
/* 361 */           viewin.getUploadFile()));
/*     */     }
/*     */     catch (FileNotFoundException e)
/*     */     {
/* 365 */       e.printStackTrace();
/*     */     }
/*     */     catch (IOException e) {
/* 368 */       e.printStackTrace();
/*     */     }
/*     */ 
/* 371 */     String pkargs = req.getParameter("employeeCode");
/*     */ 
/* 373 */     req.setAttribute("primaryKey", pkargs);
/* 374 */     viewHelper.setView(getLsEmployeeService().updateLsEmployee((LsEmployeeView)viewHelper.getView()));
/*     */ 
/* 377 */     req.setAttribute("COUNTRYS", this.flexplaceDao.getAllCountry());
/* 378 */     req.setAttribute("PROVINCES", this.flexplaceDao.getAllProvince());
/* 379 */     req.setAttribute("CITYS", this.flexplaceDao.getAllCity());
/*     */ 
/* 381 */     return "lsemployeeView.detail";
/*     */   }
/*     */ 
/*     */   public String delete(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 399 */     String[] delPK = req.getParameterValues("primaryKey");
/* 400 */     for (int i = 0; i < delPK.length; ++i) {
/* 401 */       String employeeCode = delPK[i];
/* 402 */       getLsEmployeeService().deleteLsEmployee(employeeCode);
/*     */     }
/* 404 */     return "lsemployeeViewChain.success";
/*     */   }
/*     */ 
/*     */   public String asynDelete(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 422 */     String[] delPK = req.getParameterValues("primaryKey");
/* 423 */     for (int i = 0; i < delPK.length; ++i)
/*     */     {
/* 425 */       String employeeCode = delPK[i];
/* 426 */       ServiceTaskInfoView view = new ServiceTaskInfoView();
/*     */ 
/* 429 */       view.setDescription(DP.getString("LsEmployeeCmd.asynDelete"));
/*     */ 
/* 431 */       view.setService("lsEmployeeService");
/*     */ 
/* 433 */       view.setMethod("deleteLsEmployee");
/*     */ 
/* 435 */       view.setArgs(new Object[] { employeeCode });
/* 436 */       getTaskInfoService().addTask(view);
/*     */     }
/* 438 */     return "lsemployeeView.asynDeleteSuccess";
/*     */   }
/*     */ 
/*     */   public void afterPropertiesSet()
/*     */     throws Exception
/*     */   {
/* 444 */     super.afterPropertiesSet();
/* 445 */     if (getLsEmployeeService() == null)
/* 446 */       throw new RuntimeException("LsEmployeeCmd" + DP.getString("Demo.Common.ConfigureError") + "LsEmployeeService" + DP.getString("Demo.Common.Notbenull"));
/*     */   }
/*     */ 
/*     */   public ILsEmployeeService getLsEmployeeService()
/*     */   {
/* 453 */     return this.lsEmployeeService;
/*     */   }
/*     */ 
/*     */   public void setLsEmployeeService(ILsEmployeeService service)
/*     */   {
/* 460 */     this.lsEmployeeService = service;
/*     */   }
/*     */ 
/*     */   public PlaceDao getPlaceDao() {
/* 464 */     return this.placeDao; }
/*     */ 
/*     */   public void setPlaceDao(PlaceDao placeDao) {
/* 467 */     this.placeDao = placeDao;
/*     */   }
/*     */ 
/*     */   public ServiceTaskInfoService getTaskInfoService() {
/* 471 */     return this.taskInfoService;
/*     */   }
/*     */ 
/*     */   public void setTaskInfoService(ServiceTaskInfoService taskInfoService) {
/* 475 */     this.taskInfoService = taskInfoService;
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.html.cmd.LsEmployeeCmd
 * JD-Core Version:    0.5.3
 */