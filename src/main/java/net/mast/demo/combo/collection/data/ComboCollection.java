/*    */ package net.mast.demo.combo.collection.data;
/*    */ 
/*    */ import java.io.Serializable;
/*    */ 
/*    */ public class ComboCollection
/*    */   implements Serializable
/*    */ {
/*    */   private String comboId;
/*    */   private String comboName;
/*    */   private String comboHelp;
/*    */ 
/*    */   public String getComboId()
/*    */   {
/* 35 */     return this.comboId;
/*    */   }
/*    */ 
/*    */   public void setComboId(String comboId)
/*    */   {
/* 40 */     this.comboId = comboId;
/*    */   }
/*    */ 
/*    */   public String getComboName()
/*    */   {
/* 45 */     return this.comboName;
/*    */   }
/*    */ 
/*    */   public void setComboName(String comboName) {
/* 49 */     this.comboName = comboName;
/*    */   }
/*    */ 
/*    */   public String getComboHelp()
/*    */   {
/* 54 */     return this.comboHelp;
/*    */   }
/*    */ 
/*    */   public void setComboHelp(String comboHelp)
/*    */   {
/* 59 */     this.comboHelp = comboHelp;
/*    */   }
/*    */ 
/*    */   public String toString()
/*    */   {
/* 66 */     StringBuffer sb = new StringBuffer();
/*    */ 
/* 68 */     sb.append(" [ comboId=" + this.comboId);
/*    */ 
/* 70 */     sb.append(", comboName=" + this.comboName);
/*    */ 
/* 72 */     sb.append(", comboHelp=" + this.comboHelp);
/* 73 */     sb.append("]");
/*    */ 
/* 75 */     return sb.toString();
/*    */   }
/*    */ 
/*    */   public static String getVERInfo()
/*    */   {
/* 81 */     return "$Date$,$Author$,$Revision$";
/*    */   }
/*    */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.combo.collection.data.ComboCollection
 * JD-Core Version:    0.5.3
 */