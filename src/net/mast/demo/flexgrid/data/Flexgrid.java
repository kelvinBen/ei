/*     */ package net.mast.demo.flexgrid.data;
/*     */ 
/*     */ import java.io.Serializable;
/*     */ 
/*     */ public class Flexgrid
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
/*     */   private String flexListenum;
/*     */   private String flexSql;
/*     */ 
/*     */   public String getFlexId()
/*     */   {
/*  78 */     return this.flexId;
/*     */   }
/*     */ 
/*     */   public void setFlexId(String flexId)
/*     */   {
/*  84 */     this.flexId = flexId;
/*     */   }
/*     */ 
/*     */   public String getFlexText()
/*     */   {
/*  90 */     return this.flexText;
/*     */   }
/*     */ 
/*     */   public void setFlexText(String flexText)
/*     */   {
/*  95 */     this.flexText = flexText;
/*     */   }
/*     */ 
/*     */   public String getFlexCurrency()
/*     */   {
/* 101 */     return this.flexCurrency;
/*     */   }
/*     */ 
/*     */   public void setFlexCurrency(String flexCurrency)
/*     */   {
/* 106 */     this.flexCurrency = flexCurrency;
/*     */   }
/*     */ 
/*     */   public String getFlexDate()
/*     */   {
/* 112 */     return this.flexDate;
/*     */   }
/*     */ 
/*     */   public void setFlexDate(String flexDate)
/*     */   {
/* 117 */     this.flexDate = flexDate;
/*     */   }
/*     */ 
/*     */   public String getFlexNumeric()
/*     */   {
/* 123 */     return this.flexNumeric;
/*     */   }
/*     */ 
/*     */   public void setFlexNumeric(String flexNumeric)
/*     */   {
/* 128 */     this.flexNumeric = flexNumeric;
/*     */   }
/*     */ 
/*     */   public String getFlexEnum()
/*     */   {
/* 134 */     return this.flexEnum;
/*     */   }
/*     */ 
/*     */   public void setFlexEnum(String flexEnum)
/*     */   {
/* 140 */     this.flexEnum = flexEnum;
/*     */   }
/*     */ 
/*     */   public String getFlexListenum()
/*     */   {
/* 146 */     return this.flexListenum;
/*     */   }
/*     */ 
/*     */   public void setFlexListenum(String flexListenum)
/*     */   {
/* 151 */     this.flexListenum = flexListenum;
/*     */   }
/*     */ 
/*     */   public String getFlexSql()
/*     */   {
/* 157 */     return this.flexSql;
/*     */   }
/*     */ 
/*     */   public void setFlexSql(String flexSql)
/*     */   {
/* 162 */     this.flexSql = flexSql;
/*     */   }
/*     */ 
/*     */   public String toString()
/*     */   {
/* 169 */     StringBuffer sb = new StringBuffer();
/*     */ 
/* 171 */     sb.append(" [ flexId=" + this.flexId);
/*     */ 
/* 173 */     sb.append(", flexText=" + this.flexText);
/*     */ 
/* 175 */     sb.append(", flexCurrency=" + this.flexCurrency);
/*     */ 
/* 177 */     sb.append(", flexDate=" + this.flexDate);
/*     */ 
/* 179 */     sb.append(", flexNumeric=" + this.flexNumeric);
/*     */ 
/* 181 */     sb.append(", flexEnum=" + this.flexEnum);
/*     */ 
/* 183 */     sb.append(", flexListenum=" + this.flexListenum);
/*     */ 
/* 185 */     sb.append(", flexSql=" + this.flexSql);
/* 186 */     sb.append("]");
/*     */ 
/* 188 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getVERInfo()
/*     */   {
/* 196 */     return "$Date$,$Author$,$Revision$";
/*     */   }
/*     */ 
/*     */   public String getEmployeeCity()
/*     */   {
/* 202 */     return this.employeeCity;
/*     */   }
/*     */ 
/*     */   public void setEmployeeCity(String employeeCity)
/*     */   {
/* 208 */     this.employeeCity = employeeCity;
/*     */   }
/*     */ 
/*     */   public String getEmployeeCountry()
/*     */   {
/* 214 */     return this.employeeCountry;
/*     */   }
/*     */ 
/*     */   public void setEmployeeCountry(String employeeCountry)
/*     */   {
/* 220 */     this.employeeCountry = employeeCountry;
/*     */   }
/*     */ 
/*     */   public String getEmployeeProvince()
/*     */   {
/* 226 */     return this.employeeProvince;
/*     */   }
/*     */ 
/*     */   public void setEmployeeProvince(String employeeProvince)
/*     */   {
/* 232 */     this.employeeProvince = employeeProvince;
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.flexgrid.data.Flexgrid
 * JD-Core Version:    0.5.3
 */