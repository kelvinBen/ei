/*     */ package net.mast.demo.grid.dao.jdbc;
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
/*     */ import net.mast.demo.grid.dao.IProductDao;
/*     */ import net.mast.demo.grid.data.Product;
/*     */ import net.mast.util.Page;
/*     */ import net.mast.util.RowSelection;
/*     */ import net.mast.util.domain.BaseJdbcDao;
/*     */ 
/*     */ public class ProductJdbcDao extends BaseJdbcDao
/*     */   implements IProductDao
/*     */ {
/*  28 */   private static Log log = LogFactory.getLog(ProductJdbcDao.class);
/*     */ 
/*  30 */   private static final String insertSql = getInsertSql();
/*     */ 
/*  32 */   private static final String deleteSql = getDeleteSql();
/*     */ 
/*  34 */   private static final String detailSql = getDetailSql();
/*     */ 
/*  36 */   private static final String updateSql = getUpdateSql();
/*     */ 
/*  38 */   private static final String querySql = getQuerySql();
/*     */ 
/* 271 */   private ProductDelete deleter = null;
/* 272 */   private ProductInsert inserter = null;
/* 273 */   private ProductDetail finder = null;
/* 274 */   private ProductUpdate updater = null;
/*     */ 
/*     */   public static String getInsertSql()
/*     */   {
/*  44 */     StringBuffer sb = new StringBuffer();
/*  45 */     sb.append("INSERT INTO PRODUCT (");
/*  46 */     sb.append("ITEM_PRODUCTID");
/*  47 */     sb.append(",");
/*  48 */     sb.append("ITEM_PRODUCTNAME");
/*  49 */     sb.append(",");
/*  50 */     sb.append("ITEM_UNITPRICE");
/*  51 */     sb.append(",");
/*  52 */     sb.append("ITEM_QUANTITY");
/*  53 */     sb.append(",");
/*  54 */     sb.append("ITEM_AMOUNT");
/*  55 */     sb.append(",");
/*  56 */     sb.append("ITEM_LEVEL");
/*  57 */     sb.append(") VALUES(");
/*  58 */     sb.append("?");
/*  59 */     sb.append(",");
/*  60 */     sb.append("?");
/*  61 */     sb.append(",");
/*  62 */     sb.append("?");
/*  63 */     sb.append(",");
/*  64 */     sb.append("?");
/*  65 */     sb.append(",");
/*  66 */     sb.append("?");
/*  67 */     sb.append(",");
/*  68 */     sb.append("?");
/*  69 */     sb.append(")");
/*  70 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getUpdateSql()
/*     */   {
/*  77 */     StringBuffer sb = new StringBuffer();
/*  78 */     sb.append("UPDATE PRODUCT SET ");
/*  79 */     sb.append("ITEM_PRODUCTNAME=?");
/*  80 */     sb.append(" , ");
/*  81 */     sb.append("ITEM_UNITPRICE=?");
/*  82 */     sb.append(" , ");
/*  83 */     sb.append("ITEM_QUANTITY=?");
/*  84 */     sb.append(" , ");
/*  85 */     sb.append("ITEM_AMOUNT=?");
/*  86 */     sb.append(" , ");
/*  87 */     sb.append("ITEM_LEVEL=?");
/*  88 */     sb.append(" WHERE ");
/*     */ 
/*  90 */     sb.append("ITEM_PRODUCTID=?");
/*  91 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getDeleteSql()
/*     */   {
/*  98 */     StringBuffer sb = new StringBuffer();
/*  99 */     sb.append("DELETE FROM PRODUCT WHERE ");
/* 100 */     sb.append("ITEM_PRODUCTID=?");
/* 101 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getDetailSql()
/*     */   {
/* 108 */     StringBuffer sb = new StringBuffer();
/* 109 */     sb.append("SELECT ");
/* 110 */     sb.append("ITEM_PRODUCTID");
/* 111 */     sb.append(",");
/* 112 */     sb.append("ITEM_PRODUCTNAME");
/* 113 */     sb.append(",");
/* 114 */     sb.append("ITEM_UNITPRICE");
/* 115 */     sb.append(",");
/* 116 */     sb.append("ITEM_QUANTITY");
/* 117 */     sb.append(",");
/* 118 */     sb.append("ITEM_AMOUNT");
/* 119 */     sb.append(",");
/* 120 */     sb.append("ITEM_LEVEL");
/* 121 */     sb.append(" FROM PRODUCT WHERE ");
/* 122 */     sb.append("ITEM_PRODUCTID=?");
/* 123 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getQuerySql()
/*     */   {
/* 130 */     StringBuffer sb = new StringBuffer();
/* 131 */     sb.append("SELECT ");
/* 132 */     sb.append("ITEM_PRODUCTID");
/* 133 */     sb.append(",");
/* 134 */     sb.append("ITEM_PRODUCTNAME");
/* 135 */     sb.append(",");
/* 136 */     sb.append("ITEM_UNITPRICE");
/* 137 */     sb.append(",");
/* 138 */     sb.append("ITEM_QUANTITY");
/* 139 */     sb.append(",");
/* 140 */     sb.append("ITEM_AMOUNT");
/* 141 */     sb.append(",");
/* 142 */     sb.append("ITEM_LEVEL");
/* 143 */     sb.append(" FROM PRODUCT");
/* 144 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   protected void initDao()
/*     */   {
/* 277 */     if (this.deleter == null) {
/* 278 */       this.deleter = new ProductDelete(getDataSource());
/* 279 */       this.deleter.compile();
/*     */     }
/* 281 */     if (this.inserter == null) {
/* 282 */       this.inserter = new ProductInsert(getDataSource());
/* 283 */       this.inserter.compile();
/*     */     }
/* 285 */     if (this.finder == null) {
/* 286 */       this.finder = new ProductDetail(getDataSource());
/* 287 */       this.finder.compile();
/*     */     }
/* 289 */     if (this.updater == null) {
/* 290 */       this.updater = new ProductUpdate(getDataSource());
/* 291 */       this.updater.compile();
/*     */     }
/*     */   }
/*     */ 
/*     */   public void deleteProduct(String itemProductid)
/*     */   {
/* 299 */     this.deleter.delete(itemProductid);
/*     */   }
/*     */ 
/*     */   public Product getProduct(String itemProductid)
/*     */   {
/* 307 */     return this.finder.load(itemProductid);
/*     */   }
/*     */ 
/*     */   public Product insertProduct(Product product)
/*     */   {
/* 315 */     this.inserter.insert(product);
/* 316 */     return product;
/*     */   }
/*     */ 
/*     */   public Product updateProduct(Product product)
/*     */   {
/* 324 */     this.updater.update(product);
/* 325 */     return product;
/*     */   }
/*     */ 
/*     */   public Page getAllProduct(RowSelection rowSelection, Map map)
/*     */   {
/* 336 */     ProductQuery queryer = new ProductQuery(getDataSource());
/* 337 */     StringBuffer sb = new StringBuffer(queryer.getSql());
/* 338 */     String[] searchId = new String[6];
/* 339 */     String[] sa0 = (String[])map.get("item_productidSearch");
/* 340 */     if (sa0 != null) {
/* 341 */       searchId[0] = sa0[0];
/*     */     }
/* 343 */     String[] sa1 = (String[])map.get("item_productnameSearch");
/* 344 */     if (sa1 != null) {
/* 345 */       searchId[1] = sa1[0];
/*     */     }
/* 347 */     String[] sa2 = (String[])map.get("item_unitpriceSearch");
/* 348 */     if (sa2 != null) {
/* 349 */       searchId[2] = sa2[0];
/*     */     }
/* 351 */     String[] sa3 = (String[])map.get("item_quantitySearch");
/* 352 */     if (sa3 != null) {
/* 353 */       searchId[3] = sa3[0];
/*     */     }
/* 355 */     String[] sa4 = (String[])map.get("item_amountSearch");
/* 356 */     if (sa4 != null) {
/* 357 */       searchId[4] = sa4[0];
/*     */     }
/* 359 */     String[] sa5 = (String[])map.get("item_levelSearch");
/* 360 */     if (sa5 != null) {
/* 361 */       searchId[5] = sa5[0];
/*     */     }
/* 363 */     boolean whFlag = false;
/* 364 */     for (int i = 0; i < searchId.length; ++i) {
/* 365 */       if ((searchId[i] == null) || 
/* 366 */         (searchId[i].equalsIgnoreCase(""))) continue;
/* 367 */       whFlag = true;
/*     */     }
/*     */ 
/* 371 */     if (whFlag) {
/* 372 */       sb.append(" WHERE ");
/*     */     }
/* 374 */     boolean andFlag = false;
/* 375 */     if ((searchId[0] != null) && 
/* 376 */       (!(searchId[0].equalsIgnoreCase("")))) {
/* 377 */       if (andFlag) {
/* 378 */         sb.append(" AND ");
/*     */       }
/* 380 */       sb.append("PRODUCT.ITEM_PRODUCTID like '%").append(searchId[0])
/* 381 */         .append("%'");
/* 382 */       andFlag = true;
/*     */     }
/*     */ 
/* 385 */     if ((searchId[1] != null) && 
/* 386 */       (!(searchId[1].equalsIgnoreCase("")))) {
/* 387 */       if (andFlag) {
/* 388 */         sb.append(" AND ");
/*     */       }
/* 390 */       sb.append("PRODUCT.ITEM_PRODUCTNAME like '%").append(
/* 391 */         searchId[1]).append("%'");
/* 392 */       andFlag = true;
/*     */     }
/*     */ 
/* 395 */     if ((searchId[2] != null) && 
/* 396 */       (!(searchId[2].equalsIgnoreCase("")))) {
/* 397 */       if (andFlag) {
/* 398 */         sb.append(" AND ");
/*     */       }
/* 400 */       sb.append("PRODUCT.ITEM_UNITPRICE = ").append(searchId[2]);
/* 401 */       andFlag = true;
/*     */     }
/*     */ 
/* 404 */     if ((searchId[3] != null) && 
/* 405 */       (!(searchId[3].equalsIgnoreCase("")))) {
/* 406 */       if (andFlag) {
/* 407 */         sb.append(" AND ");
/*     */       }
/* 409 */       sb.append("PRODUCT.ITEM_QUANTITY = ").append(searchId[3]);
/* 410 */       andFlag = true;
/*     */     }
/*     */ 
/* 413 */     if ((searchId[4] != null) && 
/* 414 */       (!(searchId[4].equalsIgnoreCase("")))) {
/* 415 */       if (andFlag) {
/* 416 */         sb.append(" AND ");
/*     */       }
/* 418 */       sb.append("PRODUCT.ITEM_AMOUNT = ").append(searchId[4]);
/* 419 */       andFlag = true;
/*     */     }
/*     */ 
/* 422 */     if ((searchId[5] != null) && 
/* 423 */       (!(searchId[5].equalsIgnoreCase("")))) {
/* 424 */       if (andFlag) {
/* 425 */         sb.append(" AND ");
/*     */       }
/* 427 */       sb.append("PRODUCT.ITEM_LEVEL like '%").append(searchId[5])
/* 428 */         .append("%'");
/*     */     }
/*     */ 
/* 431 */     queryer.setSql(sb.toString());
/* 432 */     queryer.setPageAble(true);
/* 433 */     queryer.compile();
/* 434 */     return queryer.executePage(rowSelection);
/*     */   }
/*     */ 
/*     */   public List getAllProductNoPage(Map map)
/*     */   {
/* 444 */     ProductQuery queryer = new ProductQuery(getDataSource());
/* 445 */     StringBuffer sb = new StringBuffer(queryer.getSql());
/* 446 */     String[] searchId = new String[6];
/* 447 */     String[] sa0 = (String[])map.get("item_productidSearch");
/* 448 */     if (sa0 != null) {
/* 449 */       searchId[0] = sa0[0];
/*     */     }
/* 451 */     String[] sa1 = (String[])map.get("item_productnameSearch");
/* 452 */     if (sa1 != null) {
/* 453 */       searchId[1] = sa1[0];
/*     */     }
/* 455 */     String[] sa2 = (String[])map.get("item_unitpriceSearch");
/* 456 */     if (sa2 != null) {
/* 457 */       searchId[2] = sa2[0];
/*     */     }
/* 459 */     String[] sa3 = (String[])map.get("item_quantitySearch");
/* 460 */     if (sa3 != null) {
/* 461 */       searchId[3] = sa3[0];
/*     */     }
/* 463 */     String[] sa4 = (String[])map.get("item_amountSearch");
/* 464 */     if (sa4 != null) {
/* 465 */       searchId[4] = sa4[0];
/*     */     }
/* 467 */     String[] sa5 = (String[])map.get("item_levelSearch");
/* 468 */     if (sa5 != null) {
/* 469 */       searchId[5] = sa5[0];
/*     */     }
/* 471 */     boolean whFlag = false;
/* 472 */     for (int i = 0; i < searchId.length; ++i) {
/* 473 */       if ((searchId[i] == null) || 
/* 474 */         (searchId[i].equalsIgnoreCase(""))) continue;
/* 475 */       whFlag = true;
/*     */     }
/*     */ 
/* 479 */     if (whFlag) {
/* 480 */       sb.append(" WHERE ");
/*     */     }
/* 482 */     boolean andFlag = false;
/* 483 */     if ((searchId[0] != null) && 
/* 484 */       (!(searchId[0].equalsIgnoreCase("")))) {
/* 485 */       if (andFlag) {
/* 486 */         sb.append(" AND ");
/*     */       }
/* 488 */       sb.append("PRODUCT.ITEM_PRODUCTID like '%").append(searchId[0])
/* 489 */         .append("%'");
/* 490 */       andFlag = true;
/*     */     }
/*     */ 
/* 493 */     if ((searchId[1] != null) && 
/* 494 */       (!(searchId[1].equalsIgnoreCase("")))) {
/* 495 */       if (andFlag) {
/* 496 */         sb.append(" AND ");
/*     */       }
/* 498 */       sb.append("PRODUCT.ITEM_PRODUCTNAME like '%").append(
/* 499 */         searchId[1]).append("%'");
/* 500 */       andFlag = true;
/*     */     }
/*     */ 
/* 503 */     if ((searchId[2] != null) && 
/* 504 */       (!(searchId[2].equalsIgnoreCase("")))) {
/* 505 */       if (andFlag) {
/* 506 */         sb.append(" AND ");
/*     */       }
/* 508 */       sb.append("PRODUCT.ITEM_UNITPRICE =").append(searchId[2]);
/* 509 */       andFlag = true;
/*     */     }
/*     */ 
/* 512 */     if ((searchId[3] != null) && 
/* 513 */       (!(searchId[3].equalsIgnoreCase("")))) {
/* 514 */       if (andFlag) {
/* 515 */         sb.append(" AND ");
/*     */       }
/* 517 */       sb.append("PRODUCT.ITEM_QUANTITY =").append(searchId[3]);
/* 518 */       andFlag = true;
/*     */     }
/*     */ 
/* 521 */     if ((searchId[4] != null) && 
/* 522 */       (!(searchId[4].equalsIgnoreCase("")))) {
/* 523 */       if (andFlag) {
/* 524 */         sb.append(" AND ");
/*     */       }
/* 526 */       sb.append("PRODUCT.ITEM_AMOUNT =").append(searchId[4]);
/* 527 */       andFlag = true;
/*     */     }
/*     */ 
/* 530 */     if ((searchId[5] != null) && 
/* 531 */       (!(searchId[5].equalsIgnoreCase("")))) {
/* 532 */       if (andFlag) {
/* 533 */         sb.append(" AND ");
/*     */       }
/* 535 */       sb.append("PRODUCT.ITEM_LEVEL like '%").append(searchId[5])
/* 536 */         .append("%'");
/*     */     }
/*     */ 
/* 539 */     queryer.setSql(sb.toString());
/* 540 */     queryer.setPageAble(true);
/* 541 */     queryer.compile();
/* 542 */     return queryer.execute();
/*     */   }
/*     */ 
/*     */   protected static class ProductDelete extends SqlUpdate
/*     */   {
/*     */     protected ProductDelete(DataSource ds)
/*     */     {
/* 233 */       super(ds, ProductJdbcDao.deleteSql);
/* 234 */       declareParameter(new SqlParameter(12));
/*     */     }
/*     */ 
/*     */     public int delete(String itemProductid)
/*     */     {
/* 242 */       Object[] objs = { itemProductid };
/* 243 */       return update(objs);
/*     */     }
/*     */   }
/*     */ 
/*     */   protected static class ProductDetail extends MappingSqlQuery
/*     */   {
/*     */     protected ProductDetail(DataSource ds)
/*     */     {
/* 150 */       super(ds, ProductJdbcDao.detailSql);
/* 151 */       declareParameter(new SqlParameter(12));
/*     */     }
/*     */ 
/*     */     protected Object mapRow(ResultSet rs, int rowNum)
/*     */       throws SQLException
/*     */     {
/* 161 */       Product product = new Product();
/* 162 */       product.setItemProductid(rs.getString("ITEM_PRODUCTID"));
/* 163 */       product.setItemProductname(rs.getString("ITEM_PRODUCTNAME"));
/* 164 */       product.setItemUnitprice(rs.getBigDecimal("ITEM_UNITPRICE"));
/* 165 */       product.setItemQuantity(rs.getBigDecimal("ITEM_QUANTITY"));
/* 166 */       product.setItemAmount(rs.getBigDecimal("ITEM_AMOUNT"));
/* 167 */       product.setItemLevel(rs.getString("ITEM_LEVEL"));
/* 168 */       return product;
/*     */     }
/*     */ 
/*     */     public Product load(String itemProductid)
/*     */     {
/* 176 */       return ((Product)findObject(new Object[] { itemProductid }));
/*     */     }
/*     */   }
/*     */ 
/*     */   protected static class ProductInsert extends SqlUpdate
/*     */   {
/*     */     protected ProductInsert(DataSource ds) {
/* 183 */       super(ds, ProductJdbcDao.insertSql);
/* 184 */       declareParameter(new SqlParameter(12));
/* 185 */       declareParameter(new SqlParameter(12));
/* 186 */       declareParameter(new SqlParameter(2));
/* 187 */       declareParameter(new SqlParameter(2));
/* 188 */       declareParameter(new SqlParameter(2));
/* 189 */       declareParameter(new SqlParameter(1));
/*     */     }
/*     */ 
/*     */     public int insert(Product product)
/*     */     {
/* 197 */       Object[] objs = { product.getItemProductid(), 
/* 198 */         product.getItemProductname(), product.getItemUnitprice(), 
/* 199 */         product.getItemQuantity(), product.getItemAmount(), 
/* 200 */         product.getItemLevel() };
/* 201 */       return update(objs);
/*     */     }
/*     */   }
/*     */ 
/*     */   protected static class ProductQuery extends MappingSqlQuery
/*     */   {
/*     */     protected ProductQuery(DataSource ds)
/*     */     {
/* 250 */       super(ds, ProductJdbcDao.querySql);
/*     */     }
/*     */ 
/*     */     protected Object mapRow(ResultSet rs, int rowNum)
/*     */       throws SQLException
/*     */     {
/* 260 */       Product product = new Product();
/* 261 */       product.setItemProductid(rs.getString("ITEM_PRODUCTID"));
/* 262 */       product.setItemProductname(rs.getString("ITEM_PRODUCTNAME"));
/* 263 */       product.setItemUnitprice(rs.getBigDecimal("ITEM_UNITPRICE"));
/* 264 */       product.setItemQuantity(rs.getBigDecimal("ITEM_QUANTITY"));
/* 265 */       product.setItemAmount(rs.getBigDecimal("ITEM_AMOUNT"));
/* 266 */       product.setItemLevel(rs.getString("ITEM_LEVEL"));
/* 267 */       return product;
/*     */     }
/*     */   }
/*     */ 
/*     */   protected static class ProductUpdate extends SqlUpdate
/*     */   {
/*     */     protected ProductUpdate(DataSource ds)
/*     */     {
/* 208 */       super(ds, ProductJdbcDao.updateSql);
/* 209 */       declareParameter(new SqlParameter(12));
/* 210 */       declareParameter(new SqlParameter(2));
/* 211 */       declareParameter(new SqlParameter(2));
/* 212 */       declareParameter(new SqlParameter(2));
/* 213 */       declareParameter(new SqlParameter(1));
/* 214 */       declareParameter(new SqlParameter(12));
/*     */     }
/*     */ 
/*     */     public int update(Product product)
/*     */     {
/* 222 */       Object[] objs = { product.getItemProductname(), 
/* 223 */         product.getItemUnitprice(), product.getItemQuantity(), 
/* 224 */         product.getItemAmount(), product.getItemLevel(), 
/* 225 */         product.getItemProductid() };
/* 226 */       return update(objs);
/*     */     }
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.grid.dao.jdbc.ProductJdbcDao
 * JD-Core Version:    0.5.3
 */