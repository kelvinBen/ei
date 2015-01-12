/*     */ package net.mast.demo.combo.combobox.data;
/*     */ 
/*     */ import java.io.Serializable;
/*     */ 
/*     */ public class ComboboxTest
/*     */   implements Serializable
/*     */ {
/*     */   private String comboBoxId;
/*     */   private String comboBoxName;
/*     */   private String comboBoxSex;
/*     */   private String comboBoxNation;
/*     */   private String comboBoxAddress;
/*     */ 
/*     */   public String getComboBoxId()
/*     */   {
/*  45 */     return this.comboBoxId;
/*     */   }
/*     */ 
/*     */   public void setComboBoxId(String comboBoxId)
/*     */   {
/*  50 */     this.comboBoxId = comboBoxId;
/*     */   }
/*     */ 
/*     */   public String getComboBoxName()
/*     */   {
/*  55 */     return this.comboBoxName;
/*     */   }
/*     */ 
/*     */   public void setComboBoxName(String comboBoxName)
/*     */   {
/*  60 */     this.comboBoxName = comboBoxName;
/*     */   }
/*     */ 
/*     */   public String getComboBoxSex()
/*     */   {
/*  66 */     return this.comboBoxSex;
/*     */   }
/*     */ 
/*     */   public void setComboBoxSex(String comboBoxSex)
/*     */   {
/*  72 */     this.comboBoxSex = comboBoxSex;
/*     */   }
/*     */ 
/*     */   public String getComboBoxNation()
/*     */   {
/*  78 */     return this.comboBoxNation;
/*     */   }
/*     */ 
/*     */   public void setComboBoxNation(String comboBoxNation)
/*     */   {
/*  84 */     this.comboBoxNation = comboBoxNation;
/*     */   }
/*     */ 
/*     */   public String getComboBoxAddress()
/*     */   {
/*  90 */     return this.comboBoxAddress;
/*     */   }
/*     */ 
/*     */   public void setComboBoxAddress(String comboBoxAddress)
/*     */   {
/*  96 */     this.comboBoxAddress = comboBoxAddress;
/*     */   }
/*     */ 
/*     */   public String toString()
/*     */   {
/* 103 */     StringBuffer sb = new StringBuffer();
/*     */ 
/* 105 */     sb.append(" [ comboBoxId=" + this.comboBoxId);
/*     */ 
/* 107 */     sb.append(", comboBoxName=" + this.comboBoxName);
/*     */ 
/* 109 */     sb.append(", comboBoxSex=" + this.comboBoxSex);
/*     */ 
/* 111 */     sb.append(", comboBoxNation=" + this.comboBoxNation);
/*     */ 
/* 113 */     sb.append(", comboBoxAddress=" + this.comboBoxAddress);
/* 114 */     sb.append("]");
/*     */ 
/* 116 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getVERInfo()
/*     */   {
/* 124 */     return "$Date$,$Author$,$Revision$";
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.combo.combobox.data.ComboboxTest
 * JD-Core Version:    0.5.3
 */