/*    */ package net.mast.demo.flexgrid.data;
/*    */ 
/*    */ import java.util.ArrayList;
/*    */ import java.util.List;
/*    */ import net.mast.demo.DP;
/*    */ 
/*    */ public class FlexPlaceDao
/*    */ {
/*  9 */   private static ArrayList countrys = new ArrayList();
/* 10 */   private static ArrayList provinces = new ArrayList();
/* 11 */   private static ArrayList citys = new ArrayList();
/*    */ 
/*    */   static { countrys.add(new Country("cn", DP.getString("Demo.Common.China")));
/* 14 */     countrys.add(new Country("us", DP.getString("Demo.Common.America")));
/* 15 */     countrys.add(new Country("es", DP.getString("Demo.Common.England")));
/* 16 */     provinces.add(new Province("", DP.getString("Demo.Common.Pleasechoose"), ""));
/* 17 */     provinces.add(new Province("sh", DP.getString("Demo.Common.Shandong"), "cn"));
/* 18 */     provinces.add(new Province("an", DP.getString("Demo.Common.Anhui"), "cn"));
/* 19 */     provinces.add(new Province("3", DP.getString("Demo.Common.Shanxi"), "cn"));
/* 20 */     provinces.add(new Province("h", DP.getString("Demo.Common.Washington"), "us"));
/* 21 */     provinces.add(new Province("n", DP.getString("Demo.Common.Newyork"), "us"));
/* 22 */     provinces.add(new Province("l", DP.getString("Demo.Common.London"), "es"));
/* 23 */     citys.add(new City("", DP.getString("Demo.Common.Pleasechoose"), ""));
/* 24 */     citys.add(new City("j", DP.getString("Demo.Common.Jinan"), "sh"));
/* 25 */     citys.add(new City("t", DP.getString("Demo.Common.Taian"), "sh"));
/* 26 */     citys.add(new City("h", DP.getString("Demo.Common.Hefei"), "an"));
/* 27 */     citys.add(new City("b", DP.getString("Demo.Common.Bozhou"), "an"));
/* 28 */     citys.add(new City("x", DP.getString("Demo.Common.XiAn"), "3"));
/* 29 */     citys.add(new City("1", DP.getString("Demo.Common.Washington"), "h"));
/* 30 */     citys.add(new City("2", DP.getString("Demo.Common.Newyork"), "n"));
/* 31 */     citys.add(new City("3", DP.getString("Demo.Common.London"), "l")); }
/*    */ 
/*    */   public List getAllCountry() {
/* 34 */     return countrys; }
/*    */ 
/*    */   public List getAllProvince() {
/* 37 */     return provinces; }
/*    */ 
/*    */   public List getAllCity() {
/* 40 */     return citys; }
/*    */ 
/*    */   public List getProvinceByCountryId(String countryId) {
/* 43 */     List list = new ArrayList();
/* 44 */     if (countryId == "") return null;
/* 45 */     int i = 0;
/* 46 */     for (i = 0; i < provinces.size(); ++i) {
/* 47 */       Province province = (Province)provinces.get(i);
/* 48 */       if (province.countryId.equals(countryId)) {
/* 49 */         list.add(province);
/*    */       }
/*    */     }
/* 52 */     return list; }
/*    */ 
/*    */   public List getCityByProvinceId(String provinceId) {
/* 55 */     List list = new ArrayList();
/* 56 */     if (provinceId == "") return null;
/* 57 */     int i = 0;
/* 58 */     for (i = 0; i < citys.size(); ++i) {
/* 59 */       City city = (City)citys.get(i);
/* 60 */       if (city.provinceId.equals(provinceId)) {
/* 61 */         list.add(city);
/*    */       }
/*    */     }
/* 64 */     return list;
/*    */   }
/*    */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.flexgrid.data.FlexPlaceDao
 * JD-Core Version:    0.5.3
 */