/*     */ package net.mast.demo.flexgrid.dao.jdbc;
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
/*     */ import net.mast.demo.flexgrid.dao.IFlexgridDao;
/*     */ import net.mast.demo.flexgrid.data.Flexgrid;
/*     */ import net.mast.util.Page;
/*     */ import net.mast.util.RowSelection;
/*     */ import net.mast.util.domain.BaseJdbcDao;
/*     */ 
/*     */ public class FlexgridJdbcDao extends BaseJdbcDao
/*     */   implements IFlexgridDao
/*     */ {
/*  31 */   private static Log log = LogFactory.getLog(FlexgridJdbcDao.class);
/*     */ 
/*  33 */   private static final String insertSql = getInsertSql();
/*     */ 
/*  35 */   private static final String deleteSql = getDeleteSql();
/*     */ 
/*  37 */   private static final String detailSql = getDetailSql();
/*     */ 
/*  39 */   private static final String updateSql = getUpdateSql();
/*     */ 
/*  41 */   private static final String querySql = getQuerySql();
/*     */ 
/* 361 */   private FlexgridDelete deleter = null;
/* 362 */   private FlexgridInsert inserter = null;
/* 363 */   private FlexgridDetail finder = null;
/* 364 */   private FlexgridUpdate updater = null;
/*     */ 
/*     */   public static String getInsertSql()
/*     */   {
/*  48 */     StringBuffer sb = new StringBuffer();
/*  49 */     sb.append("INSERT INTO FLEXGRID (");
/*  50 */     sb.append("FLEX_ID");
/*  51 */     sb.append(",");
/*  52 */     sb.append("FLEX_TEXT");
/*  53 */     sb.append(",");
/*  54 */     sb.append("FLEX_CURRENCY");
/*  55 */     sb.append(",");
/*  56 */     sb.append("FLEX_DATE");
/*  57 */     sb.append(",");
/*  58 */     sb.append("FLEX_NUMERIC");
/*  59 */     sb.append(",");
/*  60 */     sb.append("FLEX_ENUM");
/*  61 */     sb.append(",");
/*  62 */     sb.append("FLEX_LISTENUM");
/*  63 */     sb.append(",");
/*  64 */     sb.append("EMPLOYEE_COUNTRY");
/*  65 */     sb.append(",");
/*  66 */     sb.append("EMPLOYEE_PROVINCE");
/*  67 */     sb.append(",");
/*  68 */     sb.append("EMPLOYEE_CITY");
/*  69 */     sb.append(",");
/*  70 */     sb.append("FLEX_SQL");
/*  71 */     sb.append(") VALUES(");
/*  72 */     sb.append("?");
/*  73 */     sb.append(",");
/*  74 */     sb.append("?");
/*  75 */     sb.append(",");
/*  76 */     sb.append("?");
/*  77 */     sb.append(",");
/*  78 */     sb.append("?");
/*  79 */     sb.append(",");
/*  80 */     sb.append("?");
/*  81 */     sb.append(",");
/*  82 */     sb.append("?");
/*  83 */     sb.append(",");
/*  84 */     sb.append("?");
/*  85 */     sb.append(",");
/*  86 */     sb.append("?");
/*  87 */     sb.append(",");
/*  88 */     sb.append("?");
/*  89 */     sb.append(",");
/*  90 */     sb.append("?");
/*  91 */     sb.append(",");
/*  92 */     sb.append("?");
/*  93 */     sb.append(")");
/*  94 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getUpdateSql()
/*     */   {
/* 101 */     StringBuffer sb = new StringBuffer();
/* 102 */     sb.append("UPDATE FLEXGRID SET ");
/* 103 */     sb.append("FLEX_TEXT=?");
/* 104 */     sb.append(" , ");
/* 105 */     sb.append("FLEX_CURRENCY=?");
/* 106 */     sb.append(" , ");
/* 107 */     sb.append("FLEX_DATE=?");
/* 108 */     sb.append(" , ");
/* 109 */     sb.append("FLEX_NUMERIC=?");
/* 110 */     sb.append(" , ");
/* 111 */     sb.append("FLEX_ENUM=?");
/* 112 */     sb.append(" , ");
/* 113 */     sb.append("FLEX_LISTENUM=?");
/* 114 */     sb.append(" , ");
/* 115 */     sb.append("EMPLOYEE_COUNTRY=?");
/* 116 */     sb.append(" , ");
/* 117 */     sb.append("EMPLOYEE_PROVINCE=?");
/* 118 */     sb.append(" , ");
/* 119 */     sb.append("EMPLOYEE_CITY=?");
/* 120 */     sb.append(" , ");
/* 121 */     sb.append("FLEX_SQL=?");
/* 122 */     sb.append(" WHERE ");
/* 123 */     sb.append("FLEX_ID=?");
/* 124 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getDeleteSql()
/*     */   {
/* 131 */     StringBuffer sb = new StringBuffer();
/* 132 */     sb.append("DELETE FROM FLEXGRID WHERE ");
/* 133 */     sb.append("FLEX_ID=?");
/* 134 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getDetailSql()
/*     */   {
/* 141 */     StringBuffer sb = new StringBuffer();
/* 142 */     sb.append("SELECT ");
/* 143 */     sb.append("FLEX_ID");
/* 144 */     sb.append(",");
/* 145 */     sb.append("FLEX_TEXT");
/* 146 */     sb.append(",");
/* 147 */     sb.append("FLEX_CURRENCY");
/* 148 */     sb.append(",");
/* 149 */     sb.append("FLEX_DATE");
/* 150 */     sb.append(",");
/* 151 */     sb.append("FLEX_NUMERIC");
/* 152 */     sb.append(",");
/* 153 */     sb.append("FLEX_ENUM");
/* 154 */     sb.append(",");
/* 155 */     sb.append("FLEX_LISTENUM");
/* 156 */     sb.append(",");
/* 157 */     sb.append("EMPLOYEE_COUNTRY");
/* 158 */     sb.append(",");
/* 159 */     sb.append("EMPLOYEE_PROVINCE");
/* 160 */     sb.append(",");
/* 161 */     sb.append("EMPLOYEE_CITY");
/* 162 */     sb.append(",");
/* 163 */     sb.append("FLEX_SQL");
/* 164 */     sb.append(" FROM FLEXGRID WHERE ");
/* 165 */     sb.append("FLEX_ID=?");
/* 166 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getQuerySql()
/*     */   {
/* 173 */     StringBuffer sb = new StringBuffer();
/* 174 */     sb.append("SELECT ");
/* 175 */     sb.append("FLEX_ID");
/* 176 */     sb.append(",");
/* 177 */     sb.append("FLEX_TEXT");
/* 178 */     sb.append(",");
/* 179 */     sb.append("FLEX_CURRENCY");
/* 180 */     sb.append(",");
/* 181 */     sb.append("FLEX_DATE");
/* 182 */     sb.append(",");
/* 183 */     sb.append("FLEX_NUMERIC");
/* 184 */     sb.append(",");
/* 185 */     sb.append("FLEX_ENUM");
/* 186 */     sb.append(",");
/* 187 */     sb.append("FLEX_LISTENUM");
/* 188 */     sb.append(",");
/* 189 */     sb.append("EMPLOYEE_COUNTRY");
/* 190 */     sb.append(",");
/* 191 */     sb.append("EMPLOYEE_PROVINCE");
/* 192 */     sb.append(",");
/* 193 */     sb.append("EMPLOYEE_CITY");
/* 194 */     sb.append(",");
/* 195 */     sb.append("FLEX_SQL");
/* 196 */     sb.append(" FROM FLEXGRID");
/* 197 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   protected void initDao()
/*     */   {
/* 366 */     if (this.deleter == null) {
/* 367 */       this.deleter = new FlexgridDelete(getDataSource());
/* 368 */       this.deleter.compile();
/*     */     }
/* 370 */     if (this.inserter == null) {
/* 371 */       this.inserter = new FlexgridInsert(getDataSource());
/* 372 */       this.inserter.compile();
/*     */     }
/* 374 */     if (this.finder == null) {
/* 375 */       this.finder = new FlexgridDetail(getDataSource());
/* 376 */       this.finder.compile();
/*     */     }
/* 378 */     if (this.updater == null) {
/* 379 */       this.updater = new FlexgridUpdate(getDataSource());
/* 380 */       this.updater.compile();
/*     */     }
/*     */   }
/*     */ 
/*     */   public void deleteFlexgrid(String flexId)
/*     */   {
/* 388 */     this.deleter.delete(flexId);
/*     */   }
/*     */ 
/*     */   public Flexgrid getFlexgrid(String flexId)
/*     */   {
/* 396 */     return this.finder.load(flexId);
/*     */   }
/*     */ 
/*     */   public Flexgrid insertFlexgrid(Flexgrid flexgrid)
/*     */   {
/* 411 */     this.inserter.insert(flexgrid);
/* 412 */     return flexgrid;
/*     */   }
/*     */ 
/*     */   public Flexgrid updateFlexgrid(Flexgrid flexgrid)
/*     */   {
/* 420 */     this.updater.update(flexgrid);
/* 421 */     return flexgrid;
/*     */   }
/*     */ 
/*     */   public Page getAllFlexgrid(RowSelection rowSelection, Map map)
/*     */   {
/* 438 */     FlexgridQuery queryer = new FlexgridQuery(getDataSource());
/* 439 */     StringBuffer sb = new StringBuffer(queryer.getSql());
/* 440 */     String[] searchId = new String[9];
/* 441 */     String[] sa0 = (String[])map.get("flex_idSearch");
/* 442 */     if (sa0 != null) {
/* 443 */       searchId[0] = sa0[0];
/*     */     }
/* 445 */     String[] sa1 = (String[])map.get("flex_textSearch");
/* 446 */     if (sa1 != null) {
/* 447 */       searchId[1] = sa1[0];
/*     */     }
/* 449 */     String[] sa2 = (String[])map.get("flex_numericSearch");
/* 450 */     if (sa2 != null) {
/* 451 */       searchId[2] = sa2[0];
/*     */     }
/* 453 */     String[] sa3 = (String[])map.get("flex_enumSearch");
/* 454 */     if (sa3 != null) {
/* 455 */       searchId[3] = sa3[0];
/*     */     }
/* 457 */     String[] sa4 = (String[])map.get("flex_listenumSearch");
/* 458 */     if (sa4 != null) {
/* 459 */       searchId[4] = sa4[0];
/*     */     }
/* 461 */     String[] sa5 = (String[])map.get("flex_dateSearch");
/* 462 */     if (sa5 != null) {
/* 463 */       searchId[5] = sa5[0];
/*     */     }
/* 465 */     String[] sa6 = (String[])map.get("flex_countrySearch");
/* 466 */     if (sa6 != null) {
/* 467 */       searchId[6] = sa6[0];
/*     */     }
/* 469 */     String[] sa7 = (String[])map.get("flex_provinceSearch");
/* 470 */     if (sa7 != null) {
/* 471 */       searchId[7] = sa7[0];
/*     */     }
/* 473 */     String[] sa8 = (String[])map.get("flex_citySearch");
/* 474 */     if (sa8 != null) {
/* 475 */       searchId[8] = sa8[0];
/*     */     }
/* 477 */     boolean whFlag = false;
/* 478 */     for (int i = 0; i < searchId.length; ++i) {
/* 479 */       if ((searchId[i] == null) || 
/* 480 */         (searchId[i].equalsIgnoreCase(""))) continue;
/* 481 */       whFlag = true;
/*     */     }
/*     */ 
/* 485 */     if (whFlag) {
/* 486 */       sb.append(" WHERE ");
/*     */     }
/* 488 */     boolean andFlag = false;
/* 489 */     if ((searchId[0] != null) && 
/* 490 */       (!(searchId[0].equalsIgnoreCase("")))) {
/* 491 */       if (andFlag) {
/* 492 */         sb.append(" AND ");
/*     */       }
/* 494 */       sb.append("FLEXGRID.FLEX_ID like '%").append(searchId[0]).append("%'");
/* 495 */       andFlag = true;
/*     */     }
/*     */ 
/* 498 */     if ((searchId[1] != null) && 
/* 499 */       (!(searchId[1].equalsIgnoreCase("")))) {
/* 500 */       if (andFlag) {
/* 501 */         sb.append(" AND ");
/*     */       }
/* 503 */       sb.append("FLEXGRID.FLEX_TEXT like '%").append(searchId[1]).append("%'");
/* 504 */       andFlag = true;
/*     */     }
/*     */ 
/* 507 */     if ((searchId[2] != null) && 
/* 508 */       (!(searchId[2].equalsIgnoreCase("")))) {
/* 509 */       if (andFlag) {
/* 510 */         sb.append(" AND ");
/*     */       }
/* 512 */       sb.append("FLEXGRID.FLEX_NUMERIC like '%").append(searchId[2]).append("%'");
/* 513 */       andFlag = true;
/*     */     }
/*     */ 
/* 516 */     if ((searchId[3] != null) && 
/* 517 */       (!(searchId[3].equalsIgnoreCase("")))) {
/* 518 */       if (andFlag) {
/* 519 */         sb.append(" AND ");
/*     */       }
/* 521 */       sb.append("FLEXGRID.FLEX_ENUM like '%").append(searchId[3]).append("%'");
/* 522 */       andFlag = true;
/*     */     }
/*     */ 
/* 525 */     if ((searchId[4] != null) && 
/* 526 */       (!(searchId[4].equalsIgnoreCase("")))) {
/* 527 */       if (andFlag) {
/* 528 */         sb.append(" AND ");
/*     */       }
/* 530 */       sb.append("FLEXGRID.FLEX_LISTENUM like '%").append(searchId[4]).append("%'");
/* 531 */       andFlag = true;
/*     */     }
/*     */ 
/* 534 */     if ((searchId[5] != null) && 
/* 535 */       (!(searchId[5].equalsIgnoreCase("")))) {
/* 536 */       if (andFlag) {
/* 537 */         sb.append(" AND ");
/*     */       }
/* 539 */       sb.append("FLEXGRID.FLEX_DATE like '%").append(searchId[5]).append("%'");
/* 540 */       andFlag = true;
/*     */     }
/*     */ 
/* 543 */     if ((searchId[6] != null) && 
/* 544 */       (!(searchId[6].equalsIgnoreCase("")))) {
/* 545 */       if (andFlag) {
/* 546 */         sb.append(" AND ");
/*     */       }
/* 548 */       sb.append("FLEXGRID.EMPLOYEE_COUNTRY like '%").append(searchId[6]).append("%'");
/* 549 */       andFlag = true;
/*     */     }
/*     */ 
/* 552 */     if ((searchId[7] != null) && 
/* 553 */       (!(searchId[7].equalsIgnoreCase("")))) {
/* 554 */       if (andFlag) {
/* 555 */         sb.append(" AND ");
/*     */       }
/* 557 */       sb.append("FLEXGRID.EMPLOYEE_PROVINCE like '%").append(searchId[7]).append("%'");
/* 558 */       andFlag = true;
/*     */     }
/*     */ 
/* 561 */     if ((searchId[8] != null) && 
/* 562 */       (!(searchId[8].equalsIgnoreCase("")))) {
/* 563 */       if (andFlag) {
/* 564 */         sb.append(" AND ");
/*     */       }
/* 566 */       sb.append("FLEXGRID.EMPLOYEE_CITY like '%").append(searchId[8]).append("%'");
/*     */     }
/*     */ 
/* 569 */     queryer.setSql(sb.toString());
/* 570 */     queryer.setPageAble(true);
/* 571 */     queryer.compile();
/* 572 */     return queryer.executePage(rowSelection);
/*     */   }
/*     */ 
/*     */   public List getAllFlexgridNoPage(Map map)
/*     */   {
/* 581 */     FlexgridQuery queryer = new FlexgridQuery(getDataSource());
/* 582 */     StringBuffer sb = new StringBuffer(queryer.getSql());
/* 583 */     String[] searchId = new String[9];
/* 584 */     String[] sa0 = (String[])map.get("flex_idSearch");
/* 585 */     if (sa0 != null) {
/* 586 */       searchId[0] = sa0[0];
/*     */     }
/* 588 */     String[] sa1 = (String[])map.get("flex_textSearch");
/* 589 */     if (sa1 != null) {
/* 590 */       searchId[1] = sa1[0];
/*     */     }
/* 592 */     String[] sa2 = (String[])map.get("flex_numericSearch");
/* 593 */     if (sa2 != null) {
/* 594 */       searchId[2] = sa2[0];
/*     */     }
/* 596 */     String[] sa3 = (String[])map.get("flex_enumSearch");
/* 597 */     if (sa3 != null) {
/* 598 */       searchId[3] = sa3[0];
/*     */     }
/* 600 */     String[] sa4 = (String[])map.get("flex_listenumSearch");
/* 601 */     if (sa4 != null) {
/* 602 */       searchId[4] = sa4[0];
/*     */     }
/* 604 */     String[] sa5 = (String[])map.get("flex_listenumSearch");
/* 605 */     if (sa4 != null) {
/* 606 */       searchId[5] = sa5[0];
/*     */     }
/* 608 */     String[] sa6 = (String[])map.get("flex_countrySearch");
/* 609 */     if (sa6 != null) {
/* 610 */       searchId[6] = sa6[0];
/*     */     }
/* 612 */     String[] sa7 = (String[])map.get("flex_provinceSearch");
/* 613 */     if (sa7 != null) {
/* 614 */       searchId[7] = sa7[0];
/*     */     }
/* 616 */     String[] sa8 = (String[])map.get("flex_citySearch");
/* 617 */     if (sa8 != null) {
/* 618 */       searchId[8] = sa8[0];
/*     */     }
/* 620 */     boolean whFlag = false;
/* 621 */     for (int i = 0; i < searchId.length; ++i) {
/* 622 */       if ((searchId[i] == null) || 
/* 623 */         (searchId[i].equalsIgnoreCase(""))) continue;
/* 624 */       whFlag = true;
/*     */     }
/*     */ 
/* 628 */     if (whFlag) {
/* 629 */       sb.append(" WHERE ");
/*     */     }
/* 631 */     boolean andFlag = false;
/* 632 */     if ((searchId[0] != null) && 
/* 633 */       (!(searchId[0].equalsIgnoreCase("")))) {
/* 634 */       if (andFlag) {
/* 635 */         sb.append(" AND ");
/*     */       }
/* 637 */       sb.append("FLEXGRID.FLEX_ID like '%").append(searchId[0]).append("%'");
/* 638 */       andFlag = true;
/*     */     }
/*     */ 
/* 641 */     if ((searchId[1] != null) && 
/* 642 */       (!(searchId[1].equalsIgnoreCase("")))) {
/* 643 */       if (andFlag) {
/* 644 */         sb.append(" AND ");
/*     */       }
/* 646 */       sb.append("FLEXGRID.FLEX_TEXT like '%").append(searchId[1]).append("%'");
/* 647 */       andFlag = true;
/*     */     }
/*     */ 
/* 650 */     if ((searchId[2] != null) && 
/* 651 */       (!(searchId[2].equalsIgnoreCase("")))) {
/* 652 */       if (andFlag) {
/* 653 */         sb.append(" AND ");
/*     */       }
/* 655 */       sb.append("FLEXGRID.FLEX_NUMERIC like '%").append(searchId[2]).append("%'");
/* 656 */       andFlag = true;
/*     */     }
/*     */ 
/* 659 */     if ((searchId[3] != null) && 
/* 660 */       (!(searchId[3].equalsIgnoreCase("")))) {
/* 661 */       if (andFlag) {
/* 662 */         sb.append(" AND ");
/*     */       }
/* 664 */       sb.append("FLEXGRID.FLEX_ENUM like '%").append(searchId[3]).append("%'");
/* 665 */       andFlag = true;
/*     */     }
/*     */ 
/* 668 */     if ((searchId[4] != null) && 
/* 669 */       (!(searchId[4].equalsIgnoreCase("")))) {
/* 670 */       if (andFlag) {
/* 671 */         sb.append(" AND ");
/*     */       }
/* 673 */       sb.append("FLEXGRID.FLEX_LISTENUM like '%").append(searchId[4]).append("%'");
/* 674 */       andFlag = true;
/*     */     }
/*     */ 
/* 677 */     if ((searchId[5] != null) && 
/* 678 */       (!(searchId[5].equalsIgnoreCase("")))) {
/* 679 */       if (andFlag) {
/* 680 */         sb.append(" AND ");
/*     */       }
/* 682 */       sb.append("FLEXGRID.FLEX_DATE like '%").append(searchId[5]).append("%'");
/* 683 */       andFlag = true;
/*     */     }
/*     */ 
/* 686 */     if ((searchId[6] != null) && 
/* 687 */       (!(searchId[6].equalsIgnoreCase("")))) {
/* 688 */       if (andFlag) {
/* 689 */         sb.append(" AND ");
/*     */       }
/* 691 */       sb.append("FLEXGRID.EMPLOYEE_COUNTRY like '%").append(searchId[6]).append("%'");
/* 692 */       andFlag = true;
/*     */     }
/*     */ 
/* 695 */     if ((searchId[7] != null) && 
/* 696 */       (!(searchId[7].equalsIgnoreCase("")))) {
/* 697 */       if (andFlag) {
/* 698 */         sb.append(" AND ");
/*     */       }
/* 700 */       sb.append("FLEXGRID.EMPLOYEE_PROVINCE like '%").append(searchId[7]).append("%'");
/* 701 */       andFlag = true;
/*     */     }
/*     */ 
/* 704 */     if ((searchId[8] != null) && 
/* 705 */       (!(searchId[8].equalsIgnoreCase("")))) {
/* 706 */       if (andFlag) {
/* 707 */         sb.append(" AND ");
/*     */       }
/* 709 */       sb.append("FLEXGRID.EMPLOYEE_CITY like '%").append(searchId[8]).append("%'");
/*     */     }
/*     */ 
/* 712 */     queryer.setSql(sb.toString());
/* 713 */     queryer.setPageAble(true);
/* 714 */     queryer.compile();
/* 715 */     return queryer.execute();
/*     */   }
/*     */ 
/*     */   protected static class FlexgridDelete extends SqlUpdate
/*     */   {
/*     */     protected FlexgridDelete(DataSource ds)
/*     */     {
/* 319 */       super(ds, FlexgridJdbcDao.deleteSql);
/*     */ 
/* 321 */       declareParameter(new SqlParameter(12));
/*     */     }
/*     */ 
/*     */     public int delete(String flexId)
/*     */     {
/* 328 */       Object[] objs = { flexId };
/* 329 */       return update(objs);
/*     */     }
/*     */   }
/*     */ 
/*     */   protected static class FlexgridDetail extends MappingSqlQuery
/*     */   {
/*     */     protected FlexgridDetail(DataSource ds)
/*     */     {
/* 202 */       super(ds, FlexgridJdbcDao.detailSql);
/*     */ 
/* 204 */       declareParameter(new SqlParameter(12));
/*     */     }
/*     */ 
/*     */     protected Object mapRow(ResultSet rs, int rowNum)
/*     */       throws SQLException
/*     */     {
/* 213 */       Flexgrid flexgrid = new Flexgrid();
/* 214 */       flexgrid.setFlexId(rs.getString("FLEX_ID"));
/* 215 */       flexgrid.setFlexText(rs.getString("FLEX_TEXT"));
/* 216 */       flexgrid.setFlexCurrency(rs.getString("FLEX_CURRENCY"));
/* 217 */       flexgrid.setFlexDate(rs.getString("FLEX_DATE"));
/* 218 */       flexgrid.setFlexNumeric(rs.getString("FLEX_NUMERIC"));
/* 219 */       flexgrid.setFlexEnum(rs.getString("FLEX_ENUM"));
/* 220 */       flexgrid.setFlexListenum(rs.getString("FLEX_LISTENUM"));
/* 221 */       flexgrid.setEmployeeCountry(rs.getString("EMPLOYEE_COUNTRY"));
/* 222 */       flexgrid.setEmployeeProvince(rs.getString("EMPLOYEE_PROVINCE"));
/* 223 */       flexgrid.setEmployeeCity(rs.getString("EMPLOYEE_CITY"));
/* 224 */       flexgrid.setFlexSql(rs.getString("FLEX_SQL"));
/* 225 */       return flexgrid;
/*     */     }
/*     */ 
/*     */     public Flexgrid load(String flexId)
/*     */     {
/* 232 */       return ((Flexgrid)findObject(new Object[] { flexId }));
/*     */     }
/*     */   }
/*     */ 
/*     */   protected static class FlexgridInsert extends SqlUpdate
/*     */   {
/*     */     protected FlexgridInsert(DataSource ds) {
/* 239 */       super(ds, FlexgridJdbcDao.insertSql);
/*     */ 
/* 241 */       declareParameter(new SqlParameter(12));
/* 242 */       declareParameter(new SqlParameter(12));
/* 243 */       declareParameter(new SqlParameter(12));
/* 244 */       declareParameter(new SqlParameter(12));
/* 245 */       declareParameter(new SqlParameter(12));
/* 246 */       declareParameter(new SqlParameter(1));
/* 247 */       declareParameter(new SqlParameter(12));
/* 248 */       declareParameter(new SqlParameter(12));
/* 249 */       declareParameter(new SqlParameter(12));
/* 250 */       declareParameter(new SqlParameter(12));
/* 251 */       declareParameter(new SqlParameter(12));
/*     */     }
/*     */ 
/*     */     public int insert(Flexgrid flexgrid)
/*     */     {
/* 258 */       Object[] objs = 
/* 259 */         { 
/* 260 */         flexgrid.getFlexId(), 
/* 261 */         flexgrid.getFlexText(), 
/* 262 */         flexgrid.getFlexCurrency(), 
/* 263 */         flexgrid.getFlexDate(), 
/* 264 */         flexgrid.getFlexNumeric(), 
/* 265 */         flexgrid.getFlexEnum(), 
/* 266 */         flexgrid.getFlexListenum(), 
/* 267 */         flexgrid.getEmployeeCountry(), 
/* 268 */         flexgrid.getEmployeeProvince(), 
/* 269 */         flexgrid.getEmployeeCity(), 
/* 270 */         flexgrid.getFlexSql() };
/*     */ 
/* 272 */       return update(objs);
/*     */     }
/*     */   }
/*     */ 
/*     */   protected static class FlexgridQuery extends MappingSqlQuery
/*     */   {
/*     */     protected FlexgridQuery(DataSource ds)
/*     */     {
/* 336 */       super(ds, FlexgridJdbcDao.querySql);
/*     */     }
/*     */ 
/*     */     protected Object mapRow(ResultSet rs, int rowNum)
/*     */       throws SQLException
/*     */     {
/* 345 */       Flexgrid flexgrid = new Flexgrid();
/* 346 */       flexgrid.setFlexId(rs.getString("FLEX_ID"));
/* 347 */       flexgrid.setFlexText(rs.getString("FLEX_TEXT"));
/* 348 */       flexgrid.setFlexCurrency(rs.getString("FLEX_CURRENCY"));
/* 349 */       flexgrid.setFlexDate(rs.getString("FLEX_DATE"));
/* 350 */       flexgrid.setFlexNumeric(rs.getString("FLEX_NUMERIC"));
/* 351 */       flexgrid.setFlexEnum(rs.getString("FLEX_ENUM"));
/* 352 */       flexgrid.setFlexListenum(rs.getString("FLEX_LISTENUM"));
/* 353 */       flexgrid.setEmployeeCountry(rs.getString("EMPLOYEE_COUNTRY"));
/* 354 */       flexgrid.setEmployeeProvince(rs.getString("EMPLOYEE_PROVINCE"));
/* 355 */       flexgrid.setEmployeeCity(rs.getString("EMPLOYEE_CITY"));
/* 356 */       flexgrid.setFlexSql(rs.getString("FLEX_SQL"));
/* 357 */       return flexgrid;
/*     */     }
/*     */   }
/*     */ 
/*     */   protected static class FlexgridUpdate extends SqlUpdate
/*     */   {
/*     */     protected FlexgridUpdate(DataSource ds)
/*     */     {
/* 279 */       super(ds, FlexgridJdbcDao.updateSql);
/*     */ 
/* 281 */       declareParameter(new SqlParameter(12));
/* 282 */       declareParameter(new SqlParameter(12));
/* 283 */       declareParameter(new SqlParameter(12));
/* 284 */       declareParameter(new SqlParameter(12));
/* 285 */       declareParameter(new SqlParameter(1));
/* 286 */       declareParameter(new SqlParameter(12));
/* 287 */       declareParameter(new SqlParameter(12));
/* 288 */       declareParameter(new SqlParameter(12));
/* 289 */       declareParameter(new SqlParameter(12));
/* 290 */       declareParameter(new SqlParameter(12));
/* 291 */       declareParameter(new SqlParameter(12));
/*     */     }
/*     */ 
/*     */     public int update(Flexgrid flexgrid)
/*     */     {
/* 298 */       Object[] objs = 
/* 299 */         { 
/* 300 */         flexgrid.getFlexText(), 
/* 301 */         flexgrid.getFlexCurrency(), 
/* 302 */         flexgrid.getFlexDate(), 
/* 303 */         flexgrid.getFlexNumeric(), 
/* 304 */         flexgrid.getFlexEnum(), 
/* 305 */         flexgrid.getFlexListenum(), 
/* 306 */         flexgrid.getEmployeeCountry(), 
/* 307 */         flexgrid.getEmployeeProvince(), 
/* 308 */         flexgrid.getEmployeeCity(), 
/* 309 */         flexgrid.getFlexSql(), 
/* 310 */         flexgrid.getFlexId() };
/*     */ 
/* 312 */       return update(objs);
/*     */     }
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.flexgrid.dao.jdbc.FlexgridJdbcDao
 * JD-Core Version:    0.5.3
 */