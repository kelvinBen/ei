/*     */ package net.mast.demo.combo.collection.dao.jdbc;
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
/*     */ import net.mast.demo.combo.collection.dao.IComboCollectionDao;
/*     */ import net.mast.demo.combo.collection.data.ComboCollection;
/*     */ import net.mast.util.Page;
/*     */ import net.mast.util.RowSelection;
/*     */ import net.mast.util.domain.BaseJdbcDao;
/*     */ 
/*     */ public class ComboCollectionJdbcDao extends BaseJdbcDao
/*     */   implements IComboCollectionDao
/*     */ {
/*  25 */   private static Log log = LogFactory.getLog(ComboCollectionJdbcDao.class);
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
/* 228 */   private ComboCollectionDelete deleter = null;
/* 229 */   private ComboCollectionInsert inserter = null;
/* 230 */   private ComboCollectionDetail finder = null;
/* 231 */   private ComboCollectionUpdate updater = null;
/*     */ 
/*     */   public static String getInsertSql()
/*     */   {
/*  42 */     StringBuffer sb = new StringBuffer();
/*  43 */     sb.append("INSERT INTO COMBO_COLLECTION (");
/*  44 */     sb.append("COMBO_ID");
/*  45 */     sb.append(",");
/*  46 */     sb.append("COMBO_NAME");
/*  47 */     sb.append(",");
/*  48 */     sb.append("COMBO_HELP");
/*  49 */     sb.append(") VALUES(");
/*  50 */     sb.append("?");
/*  51 */     sb.append(",");
/*  52 */     sb.append("?");
/*  53 */     sb.append(",");
/*  54 */     sb.append("?");
/*  55 */     sb.append(")");
/*  56 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getUpdateSql()
/*     */   {
/*  63 */     StringBuffer sb = new StringBuffer();
/*  64 */     sb.append("UPDATE COMBO_COLLECTION SET ");
/*  65 */     sb.append("COMBO_NAME=?");
/*  66 */     sb.append(" , ");
/*  67 */     sb.append("COMBO_HELP=?");
/*  68 */     sb.append(" WHERE ");
/*     */ 
/*  70 */     sb.append("COMBO_ID=?");
/*  71 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getDeleteSql()
/*     */   {
/*  78 */     StringBuffer sb = new StringBuffer();
/*  79 */     sb.append("DELETE FROM COMBO_COLLECTION WHERE ");
/*  80 */     sb.append("COMBO_ID=?");
/*  81 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getDetailSql()
/*     */   {
/*  88 */     StringBuffer sb = new StringBuffer();
/*  89 */     sb.append("SELECT ");
/*  90 */     sb.append("COMBO_ID");
/*  91 */     sb.append(",");
/*  92 */     sb.append("COMBO_NAME");
/*  93 */     sb.append(",");
/*  94 */     sb.append("COMBO_HELP");
/*  95 */     sb.append(" FROM COMBO_COLLECTION WHERE ");
/*  96 */     sb.append("COMBO_ID=?");
/*  97 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getQuerySql()
/*     */   {
/* 104 */     StringBuffer sb = new StringBuffer();
/* 105 */     sb.append("SELECT ");
/* 106 */     sb.append("COMBO_ID");
/* 107 */     sb.append(",");
/* 108 */     sb.append("COMBO_NAME");
/* 109 */     sb.append(",");
/* 110 */     sb.append("COMBO_HELP");
/* 111 */     sb.append(" FROM COMBO_COLLECTION");
/* 112 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   protected void initDao()
/*     */   {
/* 233 */     if (this.deleter == null) {
/* 234 */       this.deleter = new ComboCollectionDelete(getDataSource());
/* 235 */       this.deleter.compile();
/*     */     }
/* 237 */     if (this.inserter == null) {
/* 238 */       this.inserter = new ComboCollectionInsert(getDataSource());
/* 239 */       this.inserter.compile();
/*     */     }
/* 241 */     if (this.finder == null) {
/* 242 */       this.finder = new ComboCollectionDetail(getDataSource());
/* 243 */       this.finder.compile();
/*     */     }
/* 245 */     if (this.updater == null) {
/* 246 */       this.updater = new ComboCollectionUpdate(getDataSource());
/* 247 */       this.updater.compile();
/*     */     }
/*     */   }
/*     */ 
/*     */   public void deleteComboCollection(String comboId)
/*     */   {
/* 255 */     this.deleter.delete(comboId);
/*     */   }
/*     */ 
/*     */   public ComboCollection getComboCollection(String comboId)
/*     */   {
/* 263 */     return this.finder.load(comboId);
/*     */   }
/*     */ 
/*     */   public ComboCollection insertComboCollection(ComboCollection comboCollection)
/*     */   {
/* 271 */     this.inserter.insert(comboCollection);
/* 272 */     return comboCollection;
/*     */   }
/*     */ 
/*     */   public ComboCollection updateComboCollection(ComboCollection comboCollection)
/*     */   {
/* 280 */     this.updater.update(comboCollection);
/* 281 */     return comboCollection;
/*     */   }
/*     */ 
/*     */   public Page getAllComboCollection(RowSelection rowSelection, Map map)
/*     */   {
/* 291 */     ComboCollectionQuery queryer = new ComboCollectionQuery(getDataSource());
/* 292 */     StringBuffer sb = new StringBuffer(queryer.getSql());
/* 293 */     String[] searchId = new String[3];
/* 294 */     String[] sa0 = (String[])map.get("combo_idSearch");
/* 295 */     if (sa0 != null) {
/* 296 */       searchId[0] = sa0[0];
/*     */     }
/* 298 */     String[] sa1 = (String[])map.get("combo_nameSearch");
/* 299 */     if (sa1 != null) {
/* 300 */       searchId[1] = sa1[0];
/*     */     }
/* 302 */     String[] sa2 = (String[])map.get("combo_helpSearch");
/* 303 */     if (sa2 != null) {
/* 304 */       searchId[2] = sa2[0];
/*     */     }
/* 306 */     boolean whFlag = false;
/* 307 */     for (int i = 0; i < searchId.length; ++i) {
/* 308 */       if ((searchId[i] == null) || 
/* 309 */         (searchId[i].equalsIgnoreCase(""))) continue;
/* 310 */       whFlag = true;
/*     */     }
/*     */ 
/* 314 */     if (whFlag) {
/* 315 */       sb.append(" WHERE ");
/*     */     }
/* 317 */     boolean andFlag = false;
/* 318 */     if ((searchId[0] != null) && 
/* 319 */       (!(searchId[0].equalsIgnoreCase("")))) {
/* 320 */       if (andFlag) {
/* 321 */         sb.append(" AND ");
/*     */       }
/* 323 */       sb.append("COMBO_COLLECTION.COMBO_ID like '%").append(searchId[0]).append("%'");
/* 324 */       andFlag = true;
/*     */     }
/*     */ 
/* 327 */     if ((searchId[1] != null) && 
/* 328 */       (!(searchId[1].equalsIgnoreCase("")))) {
/* 329 */       if (andFlag) {
/* 330 */         sb.append(" AND ");
/*     */       }
/* 332 */       sb.append("COMBO_COLLECTION.COMBO_NAME like '%").append(searchId[1]).append("%'");
/* 333 */       andFlag = true;
/*     */     }
/*     */ 
/* 336 */     if ((searchId[2] != null) && 
/* 337 */       (!(searchId[2].equalsIgnoreCase("")))) {
/* 338 */       if (andFlag) {
/* 339 */         sb.append(" AND ");
/*     */       }
/* 341 */       sb.append("COMBO_COLLECTION.COMBO_HELP like '%").append(searchId[2]).append("%'");
/*     */     }
/*     */ 
/* 344 */     queryer.setSql(sb.toString());
/* 345 */     queryer.setPageAble(true);
/* 346 */     queryer.compile();
/* 347 */     return queryer.executePage(rowSelection);
/*     */   }
/*     */ 
/*     */   public List getAllComboCollectionNoPage(Map map)
/*     */   {
/* 356 */     ComboCollectionQuery queryer = new ComboCollectionQuery(getDataSource());
/* 357 */     StringBuffer sb = new StringBuffer(queryer.getSql());
/* 358 */     String[] searchId = new String[3];
/* 359 */     String[] sa0 = (String[])map.get("combo_idSearch");
/* 360 */     if (sa0 != null) {
/* 361 */       searchId[0] = sa0[0];
/*     */     }
/* 363 */     String[] sa1 = (String[])map.get("combo_nameSearch");
/* 364 */     if (sa1 != null) {
/* 365 */       searchId[1] = sa1[0];
/*     */     }
/* 367 */     String[] sa2 = (String[])map.get("combo_helpSearch");
/* 368 */     if (sa2 != null) {
/* 369 */       searchId[2] = sa2[0];
/*     */     }
/* 371 */     boolean whFlag = false;
/* 372 */     for (int i = 0; i < searchId.length; ++i) {
/* 373 */       if ((searchId[i] == null) || 
/* 374 */         (searchId[i].equalsIgnoreCase(""))) continue;
/* 375 */       whFlag = true;
/*     */     }
/*     */ 
/* 379 */     if (whFlag) {
/* 380 */       sb.append(" WHERE ");
/*     */     }
/* 382 */     boolean andFlag = false;
/* 383 */     if ((searchId[0] != null) && 
/* 384 */       (!(searchId[0].equalsIgnoreCase("")))) {
/* 385 */       if (andFlag) {
/* 386 */         sb.append(" AND ");
/*     */       }
/* 388 */       sb.append("COMBO_COLLECTION.COMBO_ID like '%").append(searchId[0]).append("%'");
/* 389 */       andFlag = true;
/*     */     }
/*     */ 
/* 392 */     if ((searchId[1] != null) && 
/* 393 */       (!(searchId[1].equalsIgnoreCase("")))) {
/* 394 */       if (andFlag) {
/* 395 */         sb.append(" AND ");
/*     */       }
/* 397 */       sb.append("COMBO_COLLECTION.COMBO_NAME like '%").append(searchId[1]).append("%'");
/* 398 */       andFlag = true;
/*     */     }
/*     */ 
/* 401 */     if ((searchId[2] != null) && 
/* 402 */       (!(searchId[2].equalsIgnoreCase("")))) {
/* 403 */       if (andFlag) {
/* 404 */         sb.append(" AND ");
/*     */       }
/* 406 */       sb.append("COMBO_COLLECTION.COMBO_HELP like '%").append(searchId[2]).append("%'");
/*     */     }
/*     */ 
/* 409 */     queryer.setSql(sb.toString());
/* 410 */     queryer.setPageAble(true);
/* 411 */     queryer.compile();
/* 412 */     return queryer.execute();
/*     */   }
/*     */ 
/*     */   protected static class ComboCollectionDelete extends SqlUpdate
/*     */   {
/*     */     protected ComboCollectionDelete(DataSource ds)
/*     */     {
/* 194 */       super(ds, ComboCollectionJdbcDao.deleteSql);
/*     */ 
/* 196 */       declareParameter(new SqlParameter(12));
/*     */     }
/*     */ 
/*     */     public int delete(String comboId)
/*     */     {
/* 203 */       Object[] objs = { comboId };
/* 204 */       return update(objs);
/*     */     }
/*     */   }
/*     */ 
/*     */   protected static class ComboCollectionDetail extends MappingSqlQuery
/*     */   {
/*     */     protected ComboCollectionDetail(DataSource ds)
/*     */     {
/* 117 */       super(ds, ComboCollectionJdbcDao.detailSql);
/*     */ 
/* 119 */       declareParameter(new SqlParameter(12));
/*     */     }
/*     */ 
/*     */     protected Object mapRow(ResultSet rs, int rowNum)
/*     */       throws SQLException
/*     */     {
/* 128 */       ComboCollection comboCollection = new ComboCollection();
/* 129 */       comboCollection.setComboId(rs.getString("COMBO_ID"));
/* 130 */       comboCollection.setComboName(rs.getString("COMBO_NAME"));
/* 131 */       comboCollection.setComboHelp(rs.getString("COMBO_HELP"));
/* 132 */       return comboCollection;
/*     */     }
/*     */ 
/*     */     public ComboCollection load(String comboId)
/*     */     {
/* 139 */       return ((ComboCollection)findObject(new Object[] { comboId }));
/*     */     }
/*     */   }
/*     */ 
/*     */   protected static class ComboCollectionInsert extends SqlUpdate
/*     */   {
/*     */     protected ComboCollectionInsert(DataSource ds) {
/* 146 */       super(ds, ComboCollectionJdbcDao.insertSql);
/*     */ 
/* 148 */       declareParameter(new SqlParameter(12));
/* 149 */       declareParameter(new SqlParameter(12));
/* 150 */       declareParameter(new SqlParameter(12));
/*     */     }
/*     */ 
/*     */     public int insert(ComboCollection comboCollection)
/*     */     {
/* 157 */       Object[] objs = 
/* 158 */         { 
/* 159 */         comboCollection.getComboId(), 
/* 160 */         comboCollection.getComboName(), 
/* 161 */         comboCollection.getComboHelp() };
/*     */ 
/* 163 */       return update(objs);
/*     */     }
/*     */   }
/*     */ 
/*     */   protected static class ComboCollectionQuery extends MappingSqlQuery
/*     */   {
/*     */     protected ComboCollectionQuery(DataSource ds)
/*     */     {
/* 211 */       super(ds, ComboCollectionJdbcDao.querySql);
/*     */     }
/*     */ 
/*     */     protected Object mapRow(ResultSet rs, int rowNum)
/*     */       throws SQLException
/*     */     {
/* 220 */       ComboCollection comboCollection = new ComboCollection();
/* 221 */       comboCollection.setComboId(rs.getString("COMBO_ID"));
/* 222 */       comboCollection.setComboName(rs.getString("COMBO_NAME"));
/* 223 */       comboCollection.setComboHelp(rs.getString("COMBO_HELP"));
/* 224 */       return comboCollection;
/*     */     }
/*     */   }
/*     */ 
/*     */   protected static class ComboCollectionUpdate extends SqlUpdate
/*     */   {
/*     */     protected ComboCollectionUpdate(DataSource ds)
/*     */     {
/* 170 */       super(ds, ComboCollectionJdbcDao.updateSql);
/*     */ 
/* 172 */       declareParameter(new SqlParameter(12));
/* 173 */       declareParameter(new SqlParameter(12));
/* 174 */       declareParameter(new SqlParameter(12));
/*     */     }
/*     */ 
/*     */     public int update(ComboCollection comboCollection)
/*     */     {
/* 181 */       Object[] objs = 
/* 182 */         { 
/* 183 */         comboCollection.getComboName(), 
/* 184 */         comboCollection.getComboHelp(), 
/* 185 */         comboCollection.getComboId() };
/*     */ 
/* 187 */       return update(objs);
/*     */     }
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.combo.collection.dao.jdbc.ComboCollectionJdbcDao
 * JD-Core Version:    0.5.3
 */