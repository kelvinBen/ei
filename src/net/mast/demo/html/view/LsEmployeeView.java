/*     */ package net.mast.demo.html.view;
/*     */ 
/*     */ import java.io.Serializable;
/*     */ import net.mast.web.upload.UploadFile;
/*     */ import net.mast.web.upload.util.ByteArrayProxy;
/*     */ 
/*     */ public class LsEmployeeView
/*     */   implements Serializable
/*     */ {
/*     */   private ByteArrayProxy imageContent;
/*     */   private UploadFile uploadFile;
/*     */   private String employeeCode;
/*     */   private String employeeSex;
/*     */   private String employeeName;
/*     */   private int employeeAge;
/*     */   private String employeeMarry;
/*     */   private String employeeBirth;
/*     */   private String employeeEnterDate;
/*     */   private String employeeCompany;
/*     */   private String employeeDegree;
/*     */   private String employeeFax;
/*     */   private String employeeCountry;
/*     */   private String employeeProvince;
/*     */   private String employeeCity;
/*     */   private String employeePhone;
/*     */   private String employeeDept;
/*     */   private String employeePost;
/*     */   private String[] employeePreference;
/*     */   private String employeeNote;
/*     */ 
/*     */   public String getEmployeeCode()
/*     */   {
/* 121 */     return ((this.employeeCode == null) ? "" : this.employeeCode);
/*     */   }
/*     */ 
/*     */   public void setEmployeeCode(String employeeCode)
/*     */   {
/* 126 */     this.employeeCode = employeeCode;
/*     */   }
/*     */ 
/*     */   public String getEmployeeSex()
/*     */   {
/* 131 */     return ((this.employeeSex == null) ? "" : this.employeeSex);
/*     */   }
/*     */ 
/*     */   public void setEmployeeSex(String employeeSex)
/*     */   {
/* 136 */     this.employeeSex = employeeSex;
/*     */   }
/*     */ 
/*     */   public String getEmployeeName()
/*     */   {
/* 141 */     return ((this.employeeName == null) ? "" : this.employeeName);
/*     */   }
/*     */ 
/*     */   public void setEmployeeName(String employeeName)
/*     */   {
/* 146 */     this.employeeName = employeeName;
/*     */   }
/*     */ 
/*     */   public int getEmployeeAge()
/*     */   {
/* 151 */     return this.employeeAge;
/*     */   }
/*     */ 
/*     */   public void setEmployeeAge(int employeeAge)
/*     */   {
/* 156 */     this.employeeAge = employeeAge;
/*     */   }
/*     */ 
/*     */   public String getEmployeeMarry()
/*     */   {
/* 162 */     return ((this.employeeMarry == null) ? "" : this.employeeMarry);
/*     */   }
/*     */ 
/*     */   public void setEmployeeMarry(String employeeMarry)
/*     */   {
/* 167 */     this.employeeMarry = employeeMarry;
/*     */   }
/*     */ 
/*     */   public String getEmployeeBirth()
/*     */   {
/* 172 */     return ((this.employeeBirth == null) ? "" : this.employeeBirth);
/*     */   }
/*     */ 
/*     */   public void setEmployeeBirth(String employeeBirth)
/*     */   {
/* 177 */     this.employeeBirth = employeeBirth;
/*     */   }
/*     */ 
/*     */   public String getEmployeeEnterDate()
/*     */   {
/* 183 */     return ((this.employeeEnterDate == null) ? "" : this.employeeEnterDate);
/*     */   }
/*     */ 
/*     */   public void setEmployeeEnterDate(String employeeEnterDate)
/*     */   {
/* 188 */     this.employeeEnterDate = employeeEnterDate;
/*     */   }
/*     */ 
/*     */   public String getEmployeeCompany()
/*     */   {
/* 193 */     return ((this.employeeCompany == null) ? "" : this.employeeCompany);
/*     */   }
/*     */ 
/*     */   public void setEmployeeCompany(String employeeCompany)
/*     */   {
/* 198 */     this.employeeCompany = employeeCompany;
/*     */   }
/*     */ 
/*     */   public String getEmployeeDegree()
/*     */   {
/* 203 */     return ((this.employeeDegree == null) ? "" : this.employeeDegree);
/*     */   }
/*     */ 
/*     */   public void setEmployeeDegree(String employeeDegree)
/*     */   {
/* 208 */     this.employeeDegree = employeeDegree;
/*     */   }
/*     */ 
/*     */   public String getEmployeeFax()
/*     */   {
/* 214 */     return ((this.employeeFax == null) ? "" : this.employeeFax);
/*     */   }
/*     */ 
/*     */   public void setEmployeeFax(String employeeFax)
/*     */   {
/* 219 */     this.employeeFax = employeeFax;
/*     */   }
/*     */ 
/*     */   public String getEmployeeCountry()
/*     */   {
/* 225 */     return ((this.employeeCountry == null) ? "" : this.employeeCountry);
/*     */   }
/*     */ 
/*     */   public void setEmployeeCountry(String employeeCountry)
/*     */   {
/* 231 */     this.employeeCountry = employeeCountry;
/*     */   }
/*     */ 
/*     */   public String getEmployeeCity()
/*     */   {
/* 237 */     return ((this.employeeCity == null) ? "" : this.employeeCity);
/*     */   }
/*     */ 
/*     */   public void setEmployeeCity(String employeeCity)
/*     */   {
/* 243 */     this.employeeCity = employeeCity;
/*     */   }
/*     */ 
/*     */   public String getEmployeePhone()
/*     */   {
/* 249 */     return ((this.employeePhone == null) ? "" : this.employeePhone);
/*     */   }
/*     */ 
/*     */   public void setEmployeePhone(String employeePhone)
/*     */   {
/* 254 */     this.employeePhone = employeePhone;
/*     */   }
/*     */ 
/*     */   public String getEmployeeDept()
/*     */   {
/* 260 */     return ((this.employeeDept == null) ? "" : this.employeeDept);
/*     */   }
/*     */ 
/*     */   public void setEmployeeDept(String employeeDept)
/*     */   {
/* 265 */     this.employeeDept = employeeDept;
/*     */   }
/*     */ 
/*     */   public String getEmployeePost()
/*     */   {
/* 271 */     return ((this.employeePost == null) ? "" : this.employeePost);
/*     */   }
/*     */ 
/*     */   public void setEmployeePost(String employeePost)
/*     */   {
/* 276 */     this.employeePost = employeePost;
/*     */   }
/*     */ 
/*     */   public String getEmployeeNote()
/*     */   {
/* 282 */     return ((this.employeeNote == null) ? "" : this.employeeNote);
/*     */   }
/*     */ 
/*     */   public void setEmployeeNote(String employeeNote)
/*     */   {
/* 288 */     this.employeeNote = employeeNote;
/*     */   }
/*     */ 
/*     */   public String toString()
/*     */   {
/* 294 */     StringBuffer sb = new StringBuffer();
/* 295 */     sb.append(" [ employeeCode=" + getEmployeeCode());
/* 296 */     sb.append(", employeeSex=" + getEmployeeSex());
/* 297 */     sb.append(", employeeName=" + getEmployeeName());
/* 298 */     sb.append(", employeeAge=" + getEmployeeAge());
/* 299 */     sb.append(", employeeMarry=" + getEmployeeMarry());
/* 300 */     sb.append(", employeeBirth=" + getEmployeeBirth());
/* 301 */     sb.append(", employeeEnterDate=" + getEmployeeEnterDate());
/* 302 */     sb.append(", employeeCompany=" + getEmployeeCompany());
/* 303 */     sb.append(", employeeDegree=" + getEmployeeDegree());
/* 304 */     sb.append(", employeeFax=" + getEmployeeFax());
/* 305 */     sb.append(", employeeCountry=" + getEmployeeCountry());
/* 306 */     sb.append(", employeeProvince=" + getEmployeeProvince());
/* 307 */     sb.append(", employeeCity=" + getEmployeeCity());
/* 308 */     sb.append(", employeePhone=" + getEmployeePhone());
/* 309 */     sb.append(", employeeDept=" + getEmployeeDept());
/* 310 */     sb.append(", employeePost=" + getEmployeePost());
/* 311 */     sb.append(", employeePreference=" + getEmployeePreference());
/* 312 */     sb.append(", employeeNote=" + getEmployeeNote());
/* 313 */     sb.append(", imageContent=" + getImageContent());
/* 314 */     sb.append("]");
/*     */ 
/* 316 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getVERInfo()
/*     */   {
/* 322 */     return "$Date$,$Author$,$Revision$";
/*     */   }
/*     */ 
/*     */   public String[] getEmployeePreference()
/*     */   {
/* 327 */     return this.employeePreference;
/*     */   }
/*     */ 
/*     */   public void setEmployeePreference(String[] employeePreference)
/*     */   {
/* 332 */     this.employeePreference = employeePreference;
/*     */   }
/*     */ 
/*     */   public String getEmployeeProvince()
/*     */   {
/* 337 */     return this.employeeProvince;
/*     */   }
/*     */ 
/*     */   public void setEmployeeProvince(String employeeProvince)
/*     */   {
/* 342 */     this.employeeProvince = employeeProvince;
/*     */   }
/*     */ 
/*     */   public UploadFile getUploadFile()
/*     */   {
/* 348 */     return this.uploadFile;
/*     */   }
/*     */ 
/*     */   public void setUploadFile(UploadFile uploadFile)
/*     */   {
/* 353 */     this.uploadFile = uploadFile;
/*     */   }
/*     */ 
/*     */   public ByteArrayProxy getImageContent()
/*     */   {
/* 358 */     return this.imageContent;
/*     */   }
/*     */ 
/*     */   public void setImageContent(ByteArrayProxy imageContent)
/*     */   {
/* 363 */     this.imageContent = imageContent;
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.html.view.LsEmployeeView
 * JD-Core Version:    0.5.3
 */