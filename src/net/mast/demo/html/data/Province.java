/*    */ package net.mast.demo.html.data;
/*    */ 
/*    */ public class Province
/*    */ {
/*    */   String id;
/*    */   String name;
/*    */   String countryId;
/*    */ 
/*    */   public Province(String id, String name, String countryId)
/*    */   {
/*  8 */     this.id = id;
/*  9 */     this.name = name;
/* 10 */     this.countryId = countryId;
/*    */   }
/*    */ 
/*    */   public String getId() {
/* 14 */     return this.id; }
/*    */ 
/*    */   public void setId(String id) {
/* 17 */     this.id = id; }
/*    */ 
/*    */   public String getName() {
/* 20 */     return this.name; }
/*    */ 
/*    */   public void setName(String name) {
/* 23 */     this.name = name;
/*    */   }
/*    */ 
/*    */   public String toString() {
/* 27 */     StringBuffer sb = new StringBuffer();
/* 28 */     sb.append(" [ id=" + getId());
/* 29 */     sb.append(", name=" + getName());
/* 30 */     sb.append(",countryId=" + getCountryId());
/* 31 */     sb.append("]");
/*    */ 
/* 33 */     return sb.toString(); }
/*    */ 
/*    */   public String getCountryId() {
/* 36 */     return this.countryId; }
/*    */ 
/*    */   public void setCountryId(String countryId) {
/* 39 */     this.countryId = countryId;
/*    */   }
/*    */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.html.data.Province
 * JD-Core Version:    0.5.3
 */