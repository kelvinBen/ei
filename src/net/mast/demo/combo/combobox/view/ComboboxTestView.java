/*     */ package net.mast.demo.combo.combobox.view;
/*     */ 
/*     */ import java.io.Serializable;
/*     */ 
/*     */ public class ComboboxTestView
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
/*  46 */     return ((this.comboBoxId == null) ? "" : this.comboBoxId);
/*     */   }
/*     */ 
/*     */   public void setComboBoxId(String comboBoxId)
/*     */   {
/*  51 */     this.comboBoxId = comboBoxId;
/*     */   }
/*     */ 
/*     */   public String getComboBoxName()
/*     */   {
/*  56 */     return ((this.comboBoxName == null) ? "" : this.comboBoxName);
/*     */   }
/*     */ 
/*     */   public void setComboBoxName(String comboBoxName)
/*     */   {
/*  62 */     this.comboBoxName = comboBoxName;
/*     */   }
/*     */ 
/*     */   public String getComboBoxSex()
/*     */   {
/*  68 */     return ((this.comboBoxSex == null) ? "" : this.comboBoxSex);
/*     */   }
/*     */ 
/*     */   public void setComboBoxSex(String comboBoxSex)
/*     */   {
/*  73 */     this.comboBoxSex = comboBoxSex;
/*     */   }
/*     */ 
/*     */   public String getComboBoxNation()
/*     */   {
/*  79 */     return ((this.comboBoxNation == null) ? "" : this.comboBoxNation);
/*     */   }
/*     */ 
/*     */   public void setComboBoxNation(String comboBoxNation)
/*     */   {
/*  84 */     this.comboBoxNation = comboBoxNation;
/*     */   }
/*     */ 
/*     */   public String getComboBoxAddress()
/*     */   {
/*  90 */     return ((this.comboBoxAddress == null) ? "" : this.comboBoxAddress);
/*     */   }
/*     */ 
/*     */   public void setComboBoxAddress(String comboBoxAddress)
/*     */   {
/*  95 */     this.comboBoxAddress = comboBoxAddress;
/*     */   }
/*     */ 
/*     */   public String toString()
/*     */   {
/* 101 */     StringBuffer sb = new StringBuffer();
/* 102 */     sb.append(" [ comboBoxId=" + getComboBoxId());
/* 103 */     sb.append(", comboBoxName=" + getComboBoxName());
/* 104 */     sb.append(", comboBoxSex=" + getComboBoxSex());
/* 105 */     sb.append(", comboBoxNation=" + getComboBoxNation());
/* 106 */     sb.append(", comboBoxAddress=" + getComboBoxAddress());
/* 107 */     sb.append("]");
/*     */ 
/* 109 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getVERInfo()
/*     */   {
/* 115 */     return "$Date$,$Author$,$Revision$";
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.combo.combobox.view.ComboboxTestView
 * JD-Core Version:    0.5.3
 */