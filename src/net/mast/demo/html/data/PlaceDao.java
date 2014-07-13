/*    */ package net.mast.demo.html.data;
/*    */ 
/*    */ import java.util.ArrayList;
/*    */ import java.util.List;
/*    */ import net.mast.demo.DP;
/*    */ 
/*    */ public class PlaceDao
/*    */ {
/*  7 */   private static ArrayList countrys = new ArrayList();
/*  8 */   private static ArrayList provinces = new ArrayList();
/*  9 */   private static ArrayList citys = new ArrayList();
/*    */ 
/*    */   static { countrys.add(new Country("cn", DP.getString("Demo.Common.China")));
/* 12 */     countrys.add(new Country("us", DP.getString("Demo.Common.America")));
/* 13 */     countrys.add(new Country("es", DP.getString("Demo.Common.England")));
/* 14 */     provinces.add(new Province("sh", DP.getString("Demo.Common.Shandong"), "cn"));
/* 15 */     provinces.add(new Province("an", DP.getString("Demo.Common.Anhui"), "cn"));
/* 16 */     provinces.add(new Province("3", DP.getString("Demo.Common.Shanxi"), "cn"));
/* 17 */     provinces.add(new Province("h", DP.getString("Demo.Common.Washington"), "us"));
/* 18 */     provinces.add(new Province("n", DP.getString("Demo.Common.Newyork"), "us"));
/* 19 */     provinces.add(new Province("l", DP.getString("Demo.Common.London"), "es"));
/* 20 */     citys.add(new City("j", DP.getString("Demo.Common.Jinan"), "sh"));
/* 21 */     citys.add(new City("t", DP.getString("Demo.Common.Taian"), "sh"));
/* 22 */     citys.add(new City("h", DP.getString("Demo.Common.Hefei"), "an"));
/* 23 */     citys.add(new City("b", DP.getString("Demo.Common.Bozhou"), "an"));
/* 24 */     citys.add(new City("x", DP.getString("Demo.Common.XiAn"), "3"));
/* 25 */     citys.add(new City("1", DP.getString("Demo.Common.Washington"), "h"));
/* 26 */     citys.add(new City("2", DP.getString("Demo.Common.Newyork"), "n"));
/* 27 */     citys.add(new City("3", DP.getString("Demo.Common.London"), "l")); }
/*    */ 
/*    */   public List getAllCountry() {
/* 30 */     return countrys; }
/*    */ 
/*    */   public List getProvinceByCountryId(String countryId) {
/* 33 */     List list = new ArrayList();
/* 34 */     if (countryId == "") return null;
/* 35 */     int i = 0;
/* 36 */     for (i = 0; i < provinces.size(); ++i) {
/* 37 */       Province province = (Province)provinces.get(i);
/* 38 */       if (province.getCountryId().equals(countryId)) {
/* 39 */         list.add(province);
/*    */       }
/*    */     }
/* 42 */     return list; }
/*    */ 
/*    */   public List getCityByProvinceId(String provinceId) {
/* 45 */     List list = new ArrayList();
/* 46 */     if (provinceId == "") return null;
/* 47 */     int i = 0;
/* 48 */     for (i = 0; i < citys.size(); ++i) {
/* 49 */       City city = (City)citys.get(i);
/* 50 */       if (city.getProvinceId().equals(provinceId)) {
/* 51 */         list.add(city);
/*    */       }
/*    */     }
/* 54 */     return list;
/*    */   }
/*    */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.html.data.PlaceDao
 * JD-Core Version:    0.5.3
 */