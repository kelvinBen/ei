/*    */ package net.mast.demo.html.data;
/*    */ 
/*    */ public class City
/*    */ {
/*    */   String id;
/*    */   String name;
/*    */   String provinceId;
/*    */ 
/*    */   public City(String id, String name, String provinceId)
/*    */   {
/*  8 */     this.id = id;
/*  9 */     this.name = name;
/* 10 */     this.provinceId = provinceId; }
/*    */ 
/*    */   public String getId() {
/* 13 */     return this.id; }
/*    */ 
/*    */   public void setId(String id) {
/* 16 */     this.id = id; }
/*    */ 
/*    */   public String getName() {
/* 19 */     return this.name; }
/*    */ 
/*    */   public void setName(String name) {
/* 22 */     this.name = name;
/*    */   }
/*    */ 
/*    */   public String toString() {
/* 26 */     StringBuffer sb = new StringBuffer();
/* 27 */     sb.append(" [ id=" + getId());
/* 28 */     sb.append(", name=" + getName());
/* 29 */     sb.append(", provinceId=" + getProvinceId());
/* 30 */     sb.append("]");
/*    */ 
/* 32 */     return sb.toString(); }
/*    */ 
/*    */   public String getProvinceId() {
/* 35 */     return this.provinceId; }
/*    */ 
/*    */   public void setProvinceId(String provinceId) {
/* 38 */     this.provinceId = provinceId;
/*    */   }
/*    */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.html.data.City
 * JD-Core Version:    0.5.3
 */