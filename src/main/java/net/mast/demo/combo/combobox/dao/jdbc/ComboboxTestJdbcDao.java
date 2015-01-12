/*     */ package net.mast.demo.combo.combobox.dao.jdbc;
/*     */ 
/*     */ import java.sql.ResultSet;
/*     */ import java.sql.SQLException;
/*     */ import java.util.List;
/*     */ import java.util.Map;
/*     */ import javax.sql.DataSource;
/*     */ import org.apache.commons.logging.Log;
/*     */ import org.apache.commons.logging.LogFactory;
/*     */ import net.mast.commons.jdbc.core.SqlParameter;
/*     */ import net.mast.commons.jdbc.object.MappingSqlQuery;
/*     */ import net.mast.commons.jdbc.object.SqlUpdate;
/*     */ import net.mast.demo.combo.combobox.dao.IComboboxTestDao;
/*     */ import net.mast.demo.combo.combobox.data.ComboboxTest;
/*     */ import net.mast.util.Page;
/*     */ import net.mast.util.RowSelection;
/*     */ import net.mast.util.domain.BaseJdbcDao;
/*     */ 
/*     */ public class ComboboxTestJdbcDao extends BaseJdbcDao
/*     */   implements IComboboxTestDao
/*     */ {
/*  25 */   private static Log log = LogFactory.getLog(ComboboxTestJdbcDao.class);
/*     */ 
/*  27 */   private static final String insertSql = getInsertSql();
/*     */ 
/*  29 */   private static final String deleteSql = getDeleteSql();
/*     */ 
/*  31 */   private static final String detailSql = getDetailSql();
/*     */ 
/*  33 */   private static final String updateSql = getUpdateSql();
/*     */ 
/*  35 */   private static final String querySql = getQuerySql();
/*     */ 
/* 260 */   private ComboboxTestDelete deleter = null;
/* 261 */   private ComboboxTestInsert inserter = null;
/* 262 */   private ComboboxTestDetail finder = null;
/* 263 */   private ComboboxTestUpdate updater = null;
/*     */ 
/*     */   public static String getInsertSql()
/*     */   {
/*  42 */     StringBuffer sb = new StringBuffer();
/*  43 */     sb.append("INSERT INTO COMBOBOX_TEST (");
/*  44 */     sb.append("COMBOBOX_ID");
/*  45 */     sb.append(",");
/*  46 */     sb.append("COMBOBOX_NAME");
/*  47 */     sb.append(",");
/*  48 */     sb.append("COMBOBOX_SEX");
/*  49 */     sb.append(",");
/*  50 */     sb.append("COMBOBOX_NATION");
/*  51 */     sb.append(",");
/*  52 */     sb.append("COMBOBOX_ADDRESS");
/*  53 */     sb.append(") VALUES(");
/*  54 */     sb.append("?");
/*  55 */     sb.append(",");
/*  56 */     sb.append("?");
/*  57 */     sb.append(",");
/*  58 */     sb.append("?");
/*  59 */     sb.append(",");
/*  60 */     sb.append("?");
/*  61 */     sb.append(",");
/*  62 */     sb.append("?");
/*  63 */     sb.append(")");
/*  64 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getUpdateSql()
/*     */   {
/*  71 */     StringBuffer sb = new StringBuffer();
/*  72 */     sb.append("UPDATE COMBOBOX_TEST SET ");
/*  73 */     sb.append("COMBOBOX_NAME=?");
/*  74 */     sb.append(" , ");
/*  75 */     sb.append("COMBOBOX_SEX=?");
/*  76 */     sb.append(" , ");
/*  77 */     sb.append("COMBOBOX_NATION=?");
/*  78 */     sb.append(" , ");
/*  79 */     sb.append("COMBOBOX_ADDRESS=?");
/*  80 */     sb.append(" WHERE ");
/*     */ 
/*  82 */     sb.append("COMBOBOX_ID=?");
/*  83 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getDeleteSql()
/*     */   {
/*  90 */     StringBuffer sb = new StringBuffer();
/*  91 */     sb.append("DELETE FROM COMBOBOX_TEST WHERE ");
/*  92 */     sb.append("COMBOBOX_ID=?");
/*  93 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getDetailSql()
/*     */   {
/* 100 */     StringBuffer sb = new StringBuffer();
/* 101 */     sb.append("SELECT ");
/* 102 */     sb.append("COMBOBOX_ID");
/* 103 */     sb.append(",");
/* 104 */     sb.append("COMBOBOX_NAME");
/* 105 */     sb.append(",");
/* 106 */     sb.append("COMBOBOX_SEX");
/* 107 */     sb.append(",");
/* 108 */     sb.append("COMBOBOX_NATION");
/* 109 */     sb.append(",");
/* 110 */     sb.append("COMBOBOX_ADDRESS");
/* 111 */     sb.append(" FROM COMBOBOX_TEST WHERE ");
/* 112 */     sb.append("COMBOBOX_ID=?");
/* 113 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getQuerySql()
/*     */   {
/* 120 */     StringBuffer sb = new StringBuffer();
/* 121 */     sb.append("SELECT ");
/* 122 */     sb.append("COMBOBOX_ID");
/* 123 */     sb.append(",");
/* 124 */     sb.append("COMBOBOX_NAME");
/* 125 */     sb.append(",");
/* 126 */     sb.append("COMBOBOX_SEX");
/* 127 */     sb.append(",");
/* 128 */     sb.append("COMBOBOX_NATION");
/* 129 */     sb.append(",");
/* 130 */     sb.append("COMBOBOX_ADDRESS");
/* 131 */     sb.append(" FROM COMBOBOX_TEST");
/* 132 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   protected void initDao()
/*     */   {
/* 265 */     if (this.deleter == null) {
/* 266 */       this.deleter = new ComboboxTestDelete(getDataSource());
/* 267 */       this.deleter.compile();
/*     */     }
/* 269 */     if (this.inserter == null) {
/* 270 */       this.inserter = new ComboboxTestInsert(getDataSource());
/* 271 */       this.inserter.compile();
/*     */     }
/* 273 */     if (this.finder == null) {
/* 274 */       this.finder = new ComboboxTestDetail(getDataSource());
/* 275 */       this.finder.compile();
/*     */     }
/* 277 */     if (this.updater == null) {
/* 278 */       this.updater = new ComboboxTestUpdate(getDataSource());
/* 279 */       this.updater.compile();
/*     */     }
/*     */   }
/*     */ 
/*     */   public void deleteComboboxTest(String comboBoxId)
/*     */   {
/* 287 */     this.deleter.delete(comboBoxId);
/*     */   }
/*     */ 
/*     */   public ComboboxTest getComboboxTest(String comboBoxId)
/*     */   {
/* 295 */     return this.finder.load(comboBoxId);
/*     */   }
/*     */ 
/*     */   public ComboboxTest insertComboboxTest(ComboboxTest comboboxTest)
/*     */   {
/* 303 */     this.inserter.insert(comboboxTest);
/* 304 */     return comboboxTest;
/*     */   }
/*     */ 
/*     */   public ComboboxTest updateComboboxTest(ComboboxTest comboboxTest)
/*     */   {
/* 312 */     this.updater.update(comboboxTest);
/* 313 */     return comboboxTest;
/*     */   }
/*     */ 
/*     */   public Page getAllComboboxTest(RowSelection rowSelection, Map map)
/*     */   {
/* 323 */     ComboboxTestQuery queryer = new ComboboxTestQuery(getDataSource());
/* 324 */     StringBuffer sb = new StringBuffer(queryer.getSql());
/* 325 */     String[] searchId = new String[2];
/* 326 */     String[] sa0 = (String[])map.get("combobox_idSearch");
/* 327 */     if (sa0 != null) {
/* 328 */       searchId[0] = sa0[0];
/*     */     }
/* 330 */     String[] sa1 = (String[])map.get("combobox_nameSearch");
/* 331 */     if (sa1 != null) {
/* 332 */       searchId[1] = sa1[0];
/*     */     }
/* 334 */     boolean whFlag = false;
/* 335 */     for (int i = 0; i < searchId.length; ++i) {
/* 336 */       if ((searchId[i] == null) || 
/* 337 */         (searchId[i].equalsIgnoreCase(""))) continue;
/* 338 */       whFlag = true;
/*     */     }
/*     */ 
/* 342 */     if (whFlag) {
/* 343 */       sb.append(" WHERE ");
/*     */     }
/* 345 */     boolean andFlag = false;
/* 346 */     if ((searchId[0] != null) && 
/* 347 */       (!(searchId[0].equalsIgnoreCase("")))) {
/* 348 */       if (andFlag) {
/* 349 */         sb.append(" AND ");
/*     */       }
/* 351 */       sb.append("COMBOBOX_TEST.COMBOBOX_ID like '%").append(searchId[0]).append("%'");
/* 352 */       andFlag = true;
/*     */     }
/*     */ 
/* 355 */     if ((searchId[1] != null) && 
/* 356 */       (!(searchId[1].equalsIgnoreCase("")))) {
/* 357 */       if (andFlag) {
/* 358 */         sb.append(" AND ");
/*     */       }
/* 360 */       sb.append("COMBOBOX_TEST.COMBOBOX_NAME like '%").append(searchId[1]).append("%'");
/*     */     }
/*     */ 
/* 363 */     queryer.setSql(sb.toString());
/* 364 */     queryer.setPageAble(true);
/* 365 */     queryer.compile();
/* 366 */     return queryer.executePage(rowSelection);
/*     */   }
/*     */ 
/*     */   public List getAllComboboxTestNoPage(Map map)
/*     */   {
/* 375 */     ComboboxTestQuery queryer = new ComboboxTestQuery(getDataSource());
/* 376 */     StringBuffer sb = new StringBuffer(queryer.getSql());
/* 377 */     String[] searchId = new String[2];
/* 378 */     String[] sa0 = (String[])map.get("combobox_idSearch");
/* 379 */     if (sa0 != null) {
/* 380 */       searchId[0] = sa0[0];
/*     */     }
/* 382 */     String[] sa1 = (String[])map.get("combobox_nameSearch");
/* 383 */     if (sa1 != null) {
/* 384 */       searchId[1] = sa1[0];
/*     */     }
/* 386 */     boolean whFlag = false;
/* 387 */     for (int i = 0; i < searchId.length; ++i) {
/* 388 */       if ((searchId[i] == null) || 
/* 389 */         (searchId[i].equalsIgnoreCase(""))) continue;
/* 390 */       whFlag = true;
/*     */     }
/*     */ 
/* 394 */     if (whFlag) {
/* 395 */       sb.append(" WHERE ");
/*     */     }
/* 397 */     boolean andFlag = false;
/* 398 */     if ((searchId[0] != null) && 
/* 399 */       (!(searchId[0].equalsIgnoreCase("")))) {
/* 400 */       if (andFlag) {
/* 401 */         sb.append(" AND ");
/*     */       }
/* 403 */       sb.append("COMBOBOX_TEST.COMBOBOX_ID like '%").append(searchId[0]).append("%'");
/* 404 */       andFlag = true;
/*     */     }
/*     */ 
/* 407 */     if ((searchId[1] != null) && 
/* 408 */       (!(searchId[1].equalsIgnoreCase("")))) {
/* 409 */       if (andFlag) {
/* 410 */         sb.append(" AND ");
/*     */       }
/* 412 */       sb.append("COMBOBOX_TEST.COMBOBOX_NAME like '%").append(searchId[1]).append("%'");
/*     */     }
/*     */ 
/* 415 */     queryer.setSql(sb.toString());
/* 416 */     queryer.setPageAble(true);
/* 417 */     queryer.compile();
/* 418 */     return queryer.execute();
/*     */   }
/*     */ 
/*     */   protected static class ComboboxTestDelete extends SqlUpdate
/*     */   {
/*     */     protected ComboboxTestDelete(DataSource ds)
/*     */     {
/* 224 */       super(ds, ComboboxTestJdbcDao.deleteSql);
/*     */ 
/* 226 */       declareParameter(new SqlParameter(12));
/*     */     }
/*     */ 
/*     */     public int delete(String comboBoxId)
/*     */     {
/* 233 */       Object[] objs = { comboBoxId };
/* 234 */       return update(objs);
/*     */     }
/*     */   }
/*     */ 
/*     */   protected static class ComboboxTestDetail extends MappingSqlQuery
/*     */   {
/*     */     protected ComboboxTestDetail(DataSource ds)
/*     */     {
/* 137 */       super(ds, ComboboxTestJdbcDao.detailSql);
/*     */ 
/* 139 */       declareParameter(new SqlParameter(12));
/*     */     }
/*     */ 
/*     */     protected Object mapRow(ResultSet rs, int rowNum)
/*     */       throws SQLException
/*     */     {
/* 148 */       ComboboxTest comboboxTest = new ComboboxTest();
/* 149 */       comboboxTest.setComboBoxId(rs.getString("COMBOBOX_ID"));
/* 150 */       comboboxTest.setComboBoxName(rs.getString("COMBOBOX_NAME"));
/* 151 */       comboboxTest.setComboBoxSex(rs.getString("COMBOBOX_SEX"));
/* 152 */       comboboxTest.setComboBoxNation(rs.getString("COMBOBOX_NATION"));
/* 153 */       comboboxTest.setComboBoxAddress(rs.getString("COMBOBOX_ADDRESS"));
/* 154 */       return comboboxTest;
/*     */     }
/*     */ 
/*     */     public ComboboxTest load(String comboBoxId)
/*     */     {
/* 161 */       return ((ComboboxTest)findObject(new Object[] { comboBoxId }));
/*     */     }
/*     */   }
/*     */ 
/*     */   protected static class ComboboxTestInsert extends SqlUpdate
/*     */   {
/*     */     protected ComboboxTestInsert(DataSource ds) {
/* 168 */       super(ds, ComboboxTestJdbcDao.insertSql);
/*     */ 
/* 170 */       declareParameter(new SqlParameter(12));
/* 171 */       declareParameter(new SqlParameter(12));
/* 172 */       declareParameter(new SqlParameter(1));
/* 173 */       declareParameter(new SqlParameter(1));
/* 174 */       declareParameter(new SqlParameter(12));
/*     */     }
/*     */ 
/*     */     public int insert(ComboboxTest comboboxTest)
/*     */     {
/* 181 */       Object[] objs = 
/* 182 */         { 
/* 183 */         comboboxTest.getComboBoxId(), 
/* 184 */         comboboxTest.getComboBoxName(), 
/* 185 */         comboboxTest.getComboBoxSex(), 
/* 186 */         comboboxTest.getComboBoxNation(), 
/* 187 */         comboboxTest.getComboBoxAddress() };
/*     */ 
/* 189 */       return update(objs);
/*     */     }
/*     */   }
/*     */ 
/*     */   protected static class ComboboxTestQuery extends MappingSqlQuery
/*     */   {
/*     */     protected ComboboxTestQuery(DataSource ds)
/*     */     {
/* 241 */       super(ds, ComboboxTestJdbcDao.querySql);
/*     */     }
/*     */ 
/*     */     protected Object mapRow(ResultSet rs, int rowNum)
/*     */       throws SQLException
/*     */     {
/* 250 */       ComboboxTest comboboxTest = new ComboboxTest();
/* 251 */       comboboxTest.setComboBoxId(rs.getString("COMBOBOX_ID"));
/* 252 */       comboboxTest.setComboBoxName(rs.getString("COMBOBOX_NAME"));
/* 253 */       comboboxTest.setComboBoxSex(rs.getString("COMBOBOX_SEX"));
/* 254 */       comboboxTest.setComboBoxNation(rs.getString("COMBOBOX_NATION"));
/* 255 */       comboboxTest.setComboBoxAddress(rs.getString("COMBOBOX_ADDRESS"));
/* 256 */       return comboboxTest;
/*     */     }
/*     */   }
/*     */ 
/*     */   protected static class ComboboxTestUpdate extends SqlUpdate
/*     */   {
/*     */     protected ComboboxTestUpdate(DataSource ds)
/*     */     {
/* 196 */       super(ds, ComboboxTestJdbcDao.updateSql);
/*     */ 
/* 198 */       declareParameter(new SqlParameter(12));
/* 199 */       declareParameter(new SqlParameter(1));
/* 200 */       declareParameter(new SqlParameter(1));
/* 201 */       declareParameter(new SqlParameter(12));
/* 202 */       declareParameter(new SqlParameter(12));
/*     */     }
/*     */ 
/*     */     public int update(ComboboxTest comboboxTest)
/*     */     {
/* 209 */       Object[] objs = 
/* 210 */         { 
/* 211 */         comboboxTest.getComboBoxName(), 
/* 212 */         comboboxTest.getComboBoxSex(), 
/* 213 */         comboboxTest.getComboBoxNation(), 
/* 214 */         comboboxTest.getComboBoxAddress(), 
/* 215 */         comboboxTest.getComboBoxId() };
/*     */ 
/* 217 */       return update(objs);
/*     */     }
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.combo.combobox.dao.jdbc.ComboboxTestJdbcDao
 * JD-Core Version:    0.5.3
 */