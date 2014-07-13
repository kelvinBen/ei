/*     */ package net.mast.demo.flexgrid.cmd;
/*     */ 
/*     */ import java.io.IOException;
/*     */ import java.io.PrintWriter;
/*     */ import java.util.ArrayList;
/*     */ import java.util.List;
/*     */ import javax.servlet.http.HttpServletRequest;
/*     */ import javax.servlet.http.HttpServletResponse;
/*     */ import org.apache.commons.logging.Log;
/*     */ import org.apache.commons.logging.LogFactory;
/*     */ import net.mast.demo.DP;
/*     */ import net.mast.demo.flexgrid.data.FlexPlaceDao;
/*     */ import net.mast.demo.flexgrid.service.IFlexgridService;
/*     */ import net.mast.demo.flexgrid.view.FlexgridView;
/*     */ import net.mast.demo.html.data.City;
/*     */ import net.mast.demo.html.data.PlaceDao;
/*     */ import net.mast.demo.html.data.Province;
/*     */ import net.mast.util.IErrorHandler;
/*     */ import net.mast.util.IMessageHandler;
/*     */ import net.mast.waf.mvc.MultiCommand;
/*     */ import net.mast.waf.mvc.ViewHelper;
/*     */ 
/*     */ public class FlexgridCmd extends MultiCommand
/*     */ {
/*  29 */   private static Log log = LogFactory.getLog(FlexgridCmd.class);
/*  30 */   private IFlexgridService flexgridService = null;
/*  31 */   PlaceDao placeDao = new PlaceDao();
/*  32 */   FlexPlaceDao flexplaceDao = new FlexPlaceDao();
/*     */ 
/*     */   public String getProvinces(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/*  49 */     String countryId = req.getParameter("countryId");
/*     */ 
/*  51 */     String defaut = req.getParameter("default");
/*     */ 
/*  53 */     List list = this.placeDao.getProvinceByCountryId(countryId);
/*  54 */     PrintWriter out = null;
/*     */ 
/*  56 */     StringBuffer sb = new StringBuffer();
/*  57 */     if (list != null) {
/*  58 */       for (int i = 0; i < list.size(); ++i) {
/*  59 */         Province province = (Province)list.get(i);
/*  60 */         if (province.getId().equals(defaut))
/*     */         {
/*  62 */           sb.append("<option value=" + province.getId() + " selected>" + province.getName() + "</option>");
/*     */         }
/*     */         else sb.append("<option value=" + province.getId() + ">" + province.getName() + "</option>");
/*     */       }
/*     */     }
/*     */ 
/*     */     try
/*     */     {
/*  70 */       out = rep.getWriter();
/*  71 */       out.print(sb.toString());
/*     */     }
/*     */     catch (IOException e) {
/*  74 */       e.printStackTrace();
/*     */     }
/*  76 */     return null;
/*     */   }
/*     */ 
/*     */   public String getCitys(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/*  84 */     String provinceId = req.getParameter("provinceId");
/*     */ 
/*  86 */     String defaut = req.getParameter("default");
/*     */ 
/*  88 */     List list = new ArrayList();
/*  89 */     list = getPlaceDao().getCityByProvinceId(provinceId);
/*  90 */     PrintWriter out = null;
/*     */ 
/*  92 */     StringBuffer sb = new StringBuffer();
/*  93 */     for (int i = 0; i < list.size(); ++i) {
/*  94 */       City city = (City)list.get(i);
/*  95 */       if (city.getId().equals(defaut))
/*     */       {
/*  97 */         sb.append("<option value=" + city.getId() + "  selected>" + city.getName() + "</option>");
/*     */       }
/*     */       else sb.append("<option value=" + city.getId() + ">" + city.getName() + "</option>");
/*     */     }
/*     */ 
/*     */     try
/*     */     {
/* 104 */       out = rep.getWriter();
/* 105 */       out.print(sb.toString());
/*     */     } catch (IOException e) {
/* 107 */       e.printStackTrace();
/*     */     }
/* 109 */     return null;
/*     */   }
/*     */ 
/*     */   public String forinsert(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 117 */     FlexgridView vi = new FlexgridView();
/* 118 */     viewHelper.setView(vi);
/*     */ 
/* 121 */     req.setAttribute("COUNTRYS", this.placeDao.getAllCountry());
/*     */ 
/* 123 */     return "flexgridView.forinsert";
/*     */   }
/*     */ 
/*     */   public String forupdate(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 140 */     req.setAttribute("COUNTRYS", this.placeDao.getAllCountry());
/* 141 */     String pkargs = req.getParameter("primaryKey");
/* 142 */     viewHelper.setView(getFlexgridService().getFlexgridView(pkargs));
/* 143 */     req.setAttribute("view", getFlexgridService().getFlexgridView(pkargs));
/*     */ 
/* 149 */     return "flexgridView.forupdate";
/*     */   }
/*     */ 
/*     */   public String detail(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 166 */     String pkargs = req.getParameter("primaryKey");
/* 167 */     req.setAttribute("primaryKey", pkargs);
/* 168 */     viewHelper.setView(getFlexgridService().getFlexgridView(pkargs));
/*     */ 
/* 171 */     req.setAttribute("COUNTRYS", this.flexplaceDao.getAllCountry());
/* 172 */     req.setAttribute("PROVINCES", this.flexplaceDao.getAllProvince());
/* 173 */     req.setAttribute("CITYS", this.flexplaceDao.getAllCity());
/*     */ 
/* 175 */     return "flexgridView.detail";
/*     */   }
/*     */ 
/*     */   public String insert(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 192 */     String pkargs = req.getParameter("primaryKey");
/* 193 */     req.setAttribute("primaryKey", pkargs);
/* 194 */     FlexgridView viewin = (FlexgridView)viewHelper.getView();
/* 195 */     viewHelper.setView(getFlexgridService().insertFlexgrid(viewin));
/*     */ 
/* 198 */     req.setAttribute("COUNTRYS", this.flexplaceDao.getAllCountry());
/* 199 */     req.setAttribute("PROVINCES", this.flexplaceDao.getAllProvince());
/* 200 */     req.setAttribute("CITYS", this.flexplaceDao.getAllCity());
/*     */ 
/* 202 */     return "flexgridView.detail";
/*     */   }
/*     */ 
/*     */   public String insertContinue(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 219 */     FlexgridView viewin = (FlexgridView)viewHelper.getView();
/*     */ 
/* 221 */     getFlexgridService().insertFlexgrid(viewin);
/* 222 */     FlexgridView vi = new FlexgridView();
/* 223 */     req.setAttribute("COUNTRYS", this.placeDao.getAllCountry());
/* 224 */     viewHelper.setView(vi);
/* 225 */     return "flexgridView.forinsert";
/*     */   }
/*     */ 
/*     */   public String update(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 242 */     getFlexgridService().updateFlexgrid((FlexgridView)viewHelper.getView());
/* 243 */     String pkargs = req.getParameter("flexId");
/*     */ 
/* 245 */     req.setAttribute("primaryKey", pkargs);
/*     */ 
/* 247 */     viewHelper.setView(getFlexgridService().getFlexgridView(pkargs));
/*     */ 
/* 249 */     req.setAttribute("COUNTRYS", this.flexplaceDao.getAllCountry());
/* 250 */     req.setAttribute("PROVINCES", this.flexplaceDao.getAllProvince());
/* 251 */     req.setAttribute("CITYS", this.flexplaceDao.getAllCity());
/*     */ 
/* 255 */     return "flexgridView.detail";
/*     */   }
/*     */ 
/*     */   public String delete(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler, IMessageHandler messageHandler, ViewHelper viewHelper)
/*     */   {
/* 272 */     String[] delPK = req.getParameterValues("primaryKey");
/* 273 */     for (int i = 0; i < delPK.length; ++i) {
/* 274 */       getFlexgridService().deleteFlexgrid(delPK[i]);
/*     */     }
/* 276 */     return "flexgridViewChain.success";
/*     */   }
/*     */ 
/*     */   public void afterPropertiesSet()
/*     */     throws Exception
/*     */   {
/* 283 */     super.afterPropertiesSet();
/* 284 */     if (getFlexgridService() == null)
/* 285 */       throw new RuntimeException("FlexgridCmd" + DP.getString("Demo.Common.ConfigureError") + "FlexgridService" + DP.getString("Demo.Common.Notbenull"));
/*     */   }
/*     */ 
/*     */   public IFlexgridService getFlexgridService()
/*     */   {
/* 293 */     return this.flexgridService;
/*     */   }
/*     */ 
/*     */   public void setFlexgridService(IFlexgridService service)
/*     */   {
/* 300 */     this.flexgridService = service; }
/*     */ 
/*     */   public PlaceDao getPlaceDao() {
/* 303 */     return this.placeDao; }
/*     */ 
/*     */   public void setPlaceDao(PlaceDao placeDao) {
/* 306 */     this.placeDao = placeDao;
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.flexgrid.cmd.FlexgridCmd
 * JD-Core Version:    0.5.3
 */