/*    */ package net.mast.demo.combo.collection.view;
/*    */ 
/*    */ import java.io.Serializable;
/*    */ 
/*    */ public class ComboCollectionView
/*    */   implements Serializable
/*    */ {
/*    */   private String comboId;
/*    */   private String comboName;
/*    */   private String comboHelp;
/*    */ 
/*    */   public String getComboId()
/*    */   {
/* 35 */     return ((this.comboId == null) ? "" : this.comboId);
/*    */   }
/*    */ 
/*    */   public void setComboId(String comboId)
/*    */   {
/* 40 */     this.comboId = comboId;
/*    */   }
/*    */ 
/*    */   public String getComboName()
/*    */   {
/* 45 */     return ((this.comboName == null) ? "" : this.comboName);
/*    */   }
/*    */ 
/*    */   public void setComboName(String comboName)
/*    */   {
/* 50 */     this.comboName = comboName;
/*    */   }
/*    */ 
/*    */   public String getComboHelp()
/*    */   {
/* 55 */     return ((this.comboHelp == null) ? "" : this.comboHelp);
/*    */   }
/*    */ 
/*    */   public void setComboHelp(String comboHelp)
/*    */   {
/* 60 */     this.comboHelp = comboHelp;
/*    */   }
/*    */ 
/*    */   public String toString()
/*    */   {
/* 66 */     StringBuffer sb = new StringBuffer();
/* 67 */     sb.append(" [ comboId=" + getComboId());
/* 68 */     sb.append(", comboName=" + getComboName());
/* 69 */     sb.append(", comboHelp=" + getComboHelp());
/* 70 */     sb.append("]");
/*    */ 
/* 72 */     return sb.toString();
/*    */   }
/*    */ 
/*    */   public static String getVERInfo()
/*    */   {
/* 78 */     return "$Date$,$Author$,$Revision$";
/*    */   }
/*    */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.combo.collection.view.ComboCollectionView
 * JD-Core Version:    0.5.3
 */