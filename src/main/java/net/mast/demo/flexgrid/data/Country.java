/*    */ package net.mast.demo.flexgrid.data;
/*    */ 
/*    */ public class Country
/*    */ {
/*    */   String id;
/*    */   String name;
/*    */ 
/*    */   public Country(String id, String name)
/*    */   {
/*  7 */     this.id = id;
/*  8 */     this.name = name; }
/*    */ 
/*    */   public String getId() {
/* 11 */     return this.id; }
/*    */ 
/*    */   public void setId(String id) {
/* 14 */     this.id = id; }
/*    */ 
/*    */   public String getName() {
/* 17 */     return this.name; }
/*    */ 
/*    */   public void setName(String name) {
/* 20 */     this.name = name;
/*    */   }
/*    */ 
/*    */   public String toString() {
/* 24 */     StringBuffer sb = new StringBuffer();
/* 25 */     sb.append(" [ id=" + getId());
/* 26 */     sb.append(", name=" + getName());
/* 27 */     sb.append("]");
/*    */ 
/* 29 */     return sb.toString();
/*    */   }
/*    */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.flexgrid.data.Country
 * JD-Core Version:    0.5.3
 */