/*     */ package net.mast.demo.flexgrid.view;
/*     */ 
/*     */ import java.io.Serializable;
/*     */ 
/*     */ public class FlexgridView
/*     */   implements Serializable
/*     */ {
/*     */   private String employeeCountry;
/*     */   private String employeeProvince;
/*     */   private String employeeCity;
/*     */   private String flexId;
/*     */   private String flexText;
/*     */   private String flexCurrency;
/*     */   private String flexDate;
/*     */   private String flexNumeric;
/*     */   private String flexEnum;
/*     */   private String[] flexListenum;
/*     */   private String flexSql;
/*     */ 
/*     */   public String getFlexId()
/*     */   {
/*  77 */     return ((this.flexId == null) ? "" : this.flexId);
/*     */   }
/*     */ 
/*     */   public void setFlexId(String flexId)
/*     */   {
/*  82 */     this.flexId = flexId;
/*     */   }
/*     */ 
/*     */   public String getFlexText()
/*     */   {
/*  88 */     return ((this.flexText == null) ? "" : this.flexText);
/*     */   }
/*     */ 
/*     */   public void setFlexText(String flexText)
/*     */   {
/*  94 */     this.flexText = flexText;
/*     */   }
/*     */ 
/*     */   public String getFlexCurrency()
/*     */   {
/* 100 */     return ((this.flexCurrency == null) ? "" : this.flexCurrency);
/*     */   }
/*     */ 
/*     */   public void setFlexCurrency(String flexCurrency)
/*     */   {
/* 106 */     this.flexCurrency = flexCurrency;
/*     */   }
/*     */ 
/*     */   public String getFlexDate()
/*     */   {
/* 112 */     return ((this.flexDate == null) ? "" : this.flexDate);
/*     */   }
/*     */ 
/*     */   public void setFlexDate(String flexDate)
/*     */   {
/* 117 */     this.flexDate = flexDate;
/*     */   }
/*     */ 
/*     */   public String getFlexNumeric()
/*     */   {
/* 123 */     return ((this.flexNumeric == null) ? "" : this.flexNumeric);
/*     */   }
/*     */ 
/*     */   public void setFlexNumeric(String flexNumeric)
/*     */   {
/* 129 */     this.flexNumeric = flexNumeric;
/*     */   }
/*     */ 
/*     */   public String getFlexEnum()
/*     */   {
/* 135 */     return ((this.flexEnum == null) ? "" : this.flexEnum);
/*     */   }
/*     */ 
/*     */   public void setFlexEnum(String flexEnum)
/*     */   {
/* 140 */     this.flexEnum = flexEnum; }
/*     */ 
/*     */   public String[] getFlexListenum() {
/* 143 */     return this.flexListenum;
/*     */   }
/*     */ 
/*     */   public void setFlexListenum(String[] flexListenum)
/*     */   {
/* 148 */     this.flexListenum = flexListenum;
/*     */   }
/*     */ 
/*     */   public String getFlexSql()
/*     */   {
/* 154 */     return ((this.flexSql == null) ? "" : this.flexSql);
/*     */   }
/*     */ 
/*     */   public void setFlexSql(String flexSql)
/*     */   {
/* 159 */     this.flexSql = flexSql;
/*     */   }
/*     */ 
/*     */   public String toString()
/*     */   {
/* 165 */     StringBuffer sb = new StringBuffer();
/* 166 */     sb.append(" [ flexId=" + getFlexId());
/* 167 */     sb.append(", flexText=" + getFlexText());
/* 168 */     sb.append(", flexCurrency=" + getFlexCurrency());
/* 169 */     sb.append(", flexDate=" + getFlexDate());
/* 170 */     sb.append(", flexNumeric=" + getFlexNumeric());
/* 171 */     sb.append(", flexEnum=" + getFlexEnum());
/* 172 */     sb.append(", flexListenum=" + getFlexListenum());
/* 173 */     sb.append(", flexSql=" + getFlexSql());
/* 174 */     sb.append("]");
/*     */ 
/* 176 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getVERInfo()
/*     */   {
/* 182 */     return "$Date$,$Author$,$Revision$";
/*     */   }
/*     */ 
/*     */   public String getEmployeeCity()
/*     */   {
/* 187 */     return this.employeeCity;
/*     */   }
/*     */ 
/*     */   public void setEmployeeCity(String employeeCity)
/*     */   {
/* 192 */     this.employeeCity = employeeCity;
/*     */   }
/*     */ 
/*     */   public String getEmployeeCountry()
/*     */   {
/* 197 */     return this.employeeCountry;
/*     */   }
/*     */ 
/*     */   public void setEmployeeCountry(String employeeCountry)
/*     */   {
/* 202 */     this.employeeCountry = employeeCountry;
/*     */   }
/*     */ 
/*     */   public String getEmployeeProvince()
/*     */   {
/* 207 */     return this.employeeProvince;
/*     */   }
/*     */ 
/*     */   public void setEmployeeProvince(String employeeProvince)
/*     */   {
/* 212 */     this.employeeProvince = employeeProvince;
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.flexgrid.view.FlexgridView
 * JD-Core Version:    0.5.3
 */