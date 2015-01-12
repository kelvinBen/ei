/*     */ package net.mast.demo.tree.dao.jdbc;
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
/*     */ import net.mast.demo.tree.dao.IOrganStruDao;
/*     */ import net.mast.demo.tree.data.OrganStru;
/*     */ import net.mast.util.Page;
/*     */ import net.mast.util.RowSelection;
/*     */ import net.mast.util.domain.BaseJdbcDao;
/*     */ 
/*     */ public class OrganStruJdbcDao extends BaseJdbcDao
/*     */   implements IOrganStruDao
/*     */ {
/*  29 */   private static Log log = LogFactory.getLog(OrganStruJdbcDao.class);
/*     */ 
/*  31 */   private static final String insertSql = getInsertSql();
/*     */ 
/*  33 */   private static final String deleteSql = getDeleteSql();
/*     */ 
/*  35 */   private static final String detailSql = getDetailSql();
/*     */ 
/*  37 */   private static final String updateSql = getUpdateSql();
/*     */ 
/*  39 */   private static final String querySql = getQuerySql();
/*     */ 
/* 344 */   private OrganStruDelete deleter = null;
/* 345 */   private OrganStruInsert inserter = null;
/* 346 */   private OrganStruDetail finder = null;
/* 347 */   private OrganStruUpdate updater = null;
/*     */ 
/*     */   public static String getInsertSql()
/*     */   {
/*  46 */     StringBuffer sb = new StringBuffer();
/*  47 */     sb.append("INSERT INTO ORGAN_STRU (");
/*  48 */     sb.append("ORGAN_ID");
/*  49 */     sb.append(",");
/*  50 */     sb.append("ORGAN_ALIAS");
/*  51 */     sb.append(",");
/*  52 */     sb.append("ORGAN_TYPE");
/*  53 */     sb.append(",");
/*  54 */     sb.append("PARENT_ID");
/*  55 */     sb.append(",");
/*  56 */     sb.append("PRINCIPAL_ID");
/*  57 */     sb.append(",");
/*  58 */     sb.append("STRU_PATH");
/*  59 */     sb.append(",");
/*  60 */     sb.append("ORGAN_ORDER");
/*  61 */     sb.append(",");
/*  62 */     sb.append("BEGIN_DATE");
/*  63 */     sb.append(",");
/*  64 */     sb.append("END_DATE");
/*  65 */     sb.append(",");
/*  66 */     sb.append("IS_LEAF");
/*  67 */     sb.append(") VALUES(");
/*  68 */     sb.append("?");
/*  69 */     sb.append(",");
/*  70 */     sb.append("?");
/*  71 */     sb.append(",");
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
/*  87 */     sb.append(")");
/*  88 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getUpdateSql()
/*     */   {
/*  95 */     StringBuffer sb = new StringBuffer();
/*  96 */     sb.append("UPDATE ORGAN_STRU SET ");
/*  97 */     sb.append("ORGAN_ALIAS=?");
/*  98 */     sb.append(" , ");
/*  99 */     sb.append("ORGAN_TYPE=?");
/* 100 */     sb.append(" , ");
/* 101 */     sb.append("PARENT_ID=?");
/* 102 */     sb.append(" , ");
/* 103 */     sb.append("PRINCIPAL_ID=?");
/* 104 */     sb.append(" , ");
/* 105 */     sb.append("STRU_PATH=?");
/* 106 */     sb.append(" , ");
/* 107 */     sb.append("ORGAN_ORDER=?");
/* 108 */     sb.append(" , ");
/* 109 */     sb.append("BEGIN_DATE=?");
/* 110 */     sb.append(" , ");
/* 111 */     sb.append("END_DATE=?");
/* 112 */     sb.append(" , ");
/* 113 */     sb.append("IS_LEAF=?");
/* 114 */     sb.append(" WHERE ");
/* 115 */     sb.append("ORGAN_ID=?");
/* 116 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getDeleteSql()
/*     */   {
/* 123 */     StringBuffer sb = new StringBuffer();
/* 124 */     sb.append("DELETE FROM ORGAN_STRU WHERE ");
/* 125 */     sb.append("ORGAN_ID=?");
/* 126 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getDetailSql()
/*     */   {
/* 133 */     StringBuffer sb = new StringBuffer();
/* 134 */     sb.append("SELECT ");
/* 135 */     sb.append("ORGAN_ID");
/* 136 */     sb.append(",");
/* 137 */     sb.append("ORGAN_ALIAS");
/* 138 */     sb.append(",");
/* 139 */     sb.append("ORGAN_TYPE");
/* 140 */     sb.append(",");
/* 141 */     sb.append("PARENT_ID");
/* 142 */     sb.append(",");
/* 143 */     sb.append("PRINCIPAL_ID");
/* 144 */     sb.append(",");
/* 145 */     sb.append("STRU_PATH");
/* 146 */     sb.append(",");
/* 147 */     sb.append("ORGAN_ORDER");
/* 148 */     sb.append(",");
/* 149 */     sb.append("BEGIN_DATE");
/* 150 */     sb.append(",");
/* 151 */     sb.append("END_DATE");
/* 152 */     sb.append(",");
/* 153 */     sb.append("IS_LEAF");
/* 154 */     sb.append(" FROM ORGAN_STRU WHERE ");
/* 155 */     sb.append("ORGAN_ID=?");
/* 156 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getQuerySql()
/*     */   {
/* 163 */     StringBuffer sb = new StringBuffer();
/* 164 */     sb.append("SELECT ");
/* 165 */     sb.append("ORGAN_ID");
/* 166 */     sb.append(",");
/* 167 */     sb.append("ORGAN_ALIAS");
/* 168 */     sb.append(",");
/* 169 */     sb.append("ORGAN_TYPE");
/* 170 */     sb.append(",");
/* 171 */     sb.append("PARENT_ID");
/* 172 */     sb.append(",");
/* 173 */     sb.append("PRINCIPAL_ID");
/* 174 */     sb.append(",");
/* 175 */     sb.append("STRU_PATH");
/* 176 */     sb.append(",");
/* 177 */     sb.append("ORGAN_ORDER");
/* 178 */     sb.append(",");
/* 179 */     sb.append("BEGIN_DATE");
/* 180 */     sb.append(",");
/* 181 */     sb.append("END_DATE");
/* 182 */     sb.append(",");
/* 183 */     sb.append("IS_LEAF");
/* 184 */     sb.append(" FROM ORGAN_STRU");
/* 185 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   protected void initDao()
/*     */   {
/* 349 */     if (this.deleter == null) {
/* 350 */       this.deleter = new OrganStruDelete(getDataSource());
/* 351 */       this.deleter.compile();
/*     */     }
/* 353 */     if (this.inserter == null) {
/* 354 */       this.inserter = new OrganStruInsert(getDataSource());
/* 355 */       this.inserter.compile();
/*     */     }
/* 357 */     if (this.finder == null) {
/* 358 */       this.finder = new OrganStruDetail(getDataSource());
/* 359 */       this.finder.compile();
/*     */     }
/* 361 */     if (this.updater == null) {
/* 362 */       this.updater = new OrganStruUpdate(getDataSource());
/* 363 */       this.updater.compile();
/*     */     }
/*     */   }
/*     */ 
/*     */   public void deleteOrganStru(String organId)
/*     */   {
/* 371 */     this.deleter.delete(organId);
/*     */   }
/*     */ 
/*     */   public OrganStru getOrganStru(String organId)
/*     */   {
/* 379 */     return this.finder.load(organId);
/*     */   }
/*     */ 
/*     */   public OrganStru insertOrganStru(OrganStru organStru)
/*     */   {
/* 387 */     this.inserter.insert(organStru);
/* 388 */     return organStru;
/*     */   }
/*     */ 
/*     */   public OrganStru updateOrganStru(OrganStru organStru)
/*     */   {
/* 396 */     this.updater.update(organStru);
/* 397 */     return organStru;
/*     */   }
/*     */ 
/*     */   public Page getAllOrganStru(RowSelection rowSelection, Map map)
/*     */   {
/* 407 */     OrganStruQuery queryer = new OrganStruQuery(getDataSource());
/* 408 */     StringBuffer sb = new StringBuffer(queryer.getSql());
/* 409 */     String[] searchId = new String[10];
/* 410 */     String[] sa0 = (String[])map.get("organ_idSearch");
/* 411 */     if (sa0 != null) {
/* 412 */       searchId[0] = sa0[0];
/*     */     }
/* 414 */     String[] sa1 = (String[])map.get("organ_aliasSearch");
/* 415 */     if (sa1 != null) {
/* 416 */       searchId[1] = sa1[0];
/*     */     }
/* 418 */     String[] sa2 = (String[])map.get("organ_typeSearch");
/* 419 */     if (sa2 != null) {
/* 420 */       searchId[2] = sa2[0];
/*     */     }
/* 422 */     String[] sa3 = (String[])map.get("parent_idSearch");
/* 423 */     if (sa3 != null) {
/* 424 */       searchId[3] = sa3[0];
/*     */     }
/* 426 */     String[] sa4 = (String[])map.get("principal_idSearch");
/* 427 */     if (sa4 != null) {
/* 428 */       searchId[4] = sa4[0];
/*     */     }
/* 430 */     String[] sa5 = (String[])map.get("stru_pathSearch");
/* 431 */     if (sa5 != null) {
/* 432 */       searchId[5] = sa5[0];
/*     */     }
/* 434 */     String[] sa6 = (String[])map.get("organ_orderSearch");
/* 435 */     if (sa6 != null) {
/* 436 */       searchId[6] = sa6[0];
/*     */     }
/* 438 */     String[] sa7 = (String[])map.get("begin_dateSearch");
/* 439 */     if (sa7 != null) {
/* 440 */       searchId[7] = sa7[0];
/*     */     }
/* 442 */     String[] sa8 = (String[])map.get("end_dateSearch");
/* 443 */     if (sa8 != null) {
/* 444 */       searchId[8] = sa8[0];
/*     */     }
/* 446 */     String[] sa9 = (String[])map.get("is_leafSearch");
/* 447 */     if (sa9 != null) {
/* 448 */       searchId[9] = sa9[0];
/*     */     }
/* 450 */     boolean whFlag = false;
/* 451 */     for (int i = 0; i < searchId.length; ++i) {
/* 452 */       if ((searchId[i] == null) || 
/* 453 */         (searchId[i].equalsIgnoreCase(""))) continue;
/* 454 */       whFlag = true;
/*     */     }
/*     */ 
/* 458 */     if (whFlag) {
/* 459 */       sb.append(" WHERE ");
/*     */     }
/* 461 */     boolean andFlag = false;
/* 462 */     if ((searchId[0] != null) && 
/* 463 */       (!(searchId[0].equalsIgnoreCase("")))) {
/* 464 */       if (andFlag) {
/* 465 */         sb.append(" AND ");
/*     */       }
/* 467 */       sb.append("ORGAN_STRU.ORGAN_ID like '%").append(searchId[0]).append("%'");
/* 468 */       andFlag = true;
/*     */     }
/*     */ 
/* 471 */     if ((searchId[1] != null) && 
/* 472 */       (!(searchId[1].equalsIgnoreCase("")))) {
/* 473 */       if (andFlag) {
/* 474 */         sb.append(" AND ");
/*     */       }
/* 476 */       sb.append("ORGAN_STRU.ORGAN_ALIAS like '%").append(searchId[1]).append("%'");
/* 477 */       andFlag = true;
/*     */     }
/*     */ 
/* 480 */     if ((searchId[2] != null) && 
/* 481 */       (!(searchId[2].equalsIgnoreCase("")))) {
/* 482 */       if (andFlag) {
/* 483 */         sb.append(" AND ");
/*     */       }
/* 485 */       sb.append("ORGAN_STRU.ORGAN_TYPE like '%").append(searchId[2]).append("%'");
/* 486 */       andFlag = true;
/*     */     }
/*     */ 
/* 489 */     if ((searchId[3] != null) && 
/* 490 */       (!(searchId[3].equalsIgnoreCase("")))) {
/* 491 */       if (andFlag) {
/* 492 */         sb.append(" AND ");
/*     */       }
/* 494 */       sb.append("ORGAN_STRU.PARENT_ID like '%").append(searchId[3]).append("%'");
/* 495 */       andFlag = true;
/*     */     }
/*     */ 
/* 498 */     if ((searchId[4] != null) && 
/* 499 */       (!(searchId[4].equalsIgnoreCase("")))) {
/* 500 */       if (andFlag) {
/* 501 */         sb.append(" AND ");
/*     */       }
/* 503 */       sb.append("ORGAN_STRU.PRINCIPAL_ID like '%").append(searchId[4]).append("%'");
/* 504 */       andFlag = true;
/*     */     }
/*     */ 
/* 507 */     if ((searchId[5] != null) && 
/* 508 */       (!(searchId[5].equalsIgnoreCase("")))) {
/* 509 */       if (andFlag) {
/* 510 */         sb.append(" AND ");
/*     */       }
/* 512 */       sb.append("ORGAN_STRU.STRU_PATH like '%").append(searchId[5]).append("%'");
/* 513 */       andFlag = true;
/*     */     }
/*     */ 
/* 516 */     if ((searchId[6] != null) && 
/* 517 */       (!(searchId[6].equalsIgnoreCase("")))) {
/* 518 */       if (andFlag) {
/* 519 */         sb.append(" AND ");
/*     */       }
/* 521 */       sb.append("ORGAN_STRU.ORGAN_ORDER =").append(searchId[6]);
/* 522 */       andFlag = true;
/*     */     }
/*     */ 
/* 525 */     if ((searchId[7] != null) && 
/* 526 */       (!(searchId[7].equalsIgnoreCase("")))) {
/* 527 */       if (andFlag) {
/* 528 */         sb.append(" AND ");
/*     */       }
/* 530 */       sb.append("ORGAN_STRU.BEGIN_DATE like '%").append(searchId[7]).append("%'");
/* 531 */       andFlag = true;
/*     */     }
/*     */ 
/* 534 */     if ((searchId[8] != null) && 
/* 535 */       (!(searchId[8].equalsIgnoreCase("")))) {
/* 536 */       if (andFlag) {
/* 537 */         sb.append(" AND ");
/*     */       }
/* 539 */       sb.append("ORGAN_STRU.END_DATE like '%").append(searchId[8]).append("%'");
/* 540 */       andFlag = true;
/*     */     }
/*     */ 
/* 543 */     if ((searchId[9] != null) && 
/* 544 */       (!(searchId[9].equalsIgnoreCase("")))) {
/* 545 */       if (andFlag) {
/* 546 */         sb.append(" AND ");
/*     */       }
/* 548 */       sb.append("ORGAN_STRU.IS_LEAF like '%").append(searchId[9]).append("%'");
/*     */     }
/*     */ 
/* 551 */     queryer.setSql(sb.toString());
/* 552 */     queryer.setPageAble(true);
/* 553 */     queryer.compile();
/* 554 */     return queryer.executePage(rowSelection);
/*     */   }
/*     */ 
/*     */   public List getAllOrganStruNoPage(Map map)
/*     */   {
/* 563 */     OrganStruQuery queryer = new OrganStruQuery(getDataSource());
/* 564 */     StringBuffer sb = new StringBuffer(queryer.getSql());
/* 565 */     String[] searchId = new String[10];
/* 566 */     String[] sa0 = (String[])map.get("organ_idSearch");
/* 567 */     if (sa0 != null) {
/* 568 */       searchId[0] = sa0[0];
/*     */     }
/* 570 */     String[] sa1 = (String[])map.get("organ_aliasSearch");
/* 571 */     if (sa1 != null) {
/* 572 */       searchId[1] = sa1[0];
/*     */     }
/* 574 */     String[] sa2 = (String[])map.get("organ_typeSearch");
/* 575 */     if (sa2 != null) {
/* 576 */       searchId[2] = sa2[0];
/*     */     }
/* 578 */     String[] sa3 = (String[])map.get("parent_idSearch");
/* 579 */     if (sa3 != null) {
/* 580 */       searchId[3] = sa3[0];
/*     */     }
/* 582 */     String[] sa4 = (String[])map.get("principal_idSearch");
/* 583 */     if (sa4 != null) {
/* 584 */       searchId[4] = sa4[0];
/*     */     }
/* 586 */     String[] sa5 = (String[])map.get("stru_pathSearch");
/* 587 */     if (sa5 != null) {
/* 588 */       searchId[5] = sa5[0];
/*     */     }
/* 590 */     String[] sa6 = (String[])map.get("organ_orderSearch");
/* 591 */     if (sa6 != null) {
/* 592 */       searchId[6] = sa6[0];
/*     */     }
/* 594 */     String[] sa7 = (String[])map.get("begin_dateSearch");
/* 595 */     if (sa7 != null) {
/* 596 */       searchId[7] = sa7[0];
/*     */     }
/* 598 */     String[] sa8 = (String[])map.get("end_dateSearch");
/* 599 */     if (sa8 != null) {
/* 600 */       searchId[8] = sa8[0];
/*     */     }
/* 602 */     String[] sa9 = (String[])map.get("is_leafSearch");
/* 603 */     if (sa9 != null) {
/* 604 */       searchId[9] = sa9[0];
/*     */     }
/* 606 */     boolean whFlag = false;
/* 607 */     for (int i = 0; i < searchId.length; ++i) {
/* 608 */       if ((searchId[i] == null) || 
/* 609 */         (searchId[i].equalsIgnoreCase(""))) continue;
/* 610 */       whFlag = true;
/*     */     }
/*     */ 
/* 614 */     if (whFlag) {
/* 615 */       sb.append(" WHERE ");
/*     */     }
/* 617 */     boolean andFlag = false;
/* 618 */     if ((searchId[0] != null) && 
/* 619 */       (!(searchId[0].equalsIgnoreCase("")))) {
/* 620 */       if (andFlag) {
/* 621 */         sb.append(" AND ");
/*     */       }
/* 623 */       sb.append("ORGAN_STRU.ORGAN_ID like '%").append(searchId[0]).append("%'");
/* 624 */       andFlag = true;
/*     */     }
/*     */ 
/* 627 */     if ((searchId[1] != null) && 
/* 628 */       (!(searchId[1].equalsIgnoreCase("")))) {
/* 629 */       if (andFlag) {
/* 630 */         sb.append(" AND ");
/*     */       }
/* 632 */       sb.append("ORGAN_STRU.ORGAN_ALIAS like '%").append(searchId[1]).append("%'");
/* 633 */       andFlag = true;
/*     */     }
/*     */ 
/* 636 */     if ((searchId[2] != null) && 
/* 637 */       (!(searchId[2].equalsIgnoreCase("")))) {
/* 638 */       if (andFlag) {
/* 639 */         sb.append(" AND ");
/*     */       }
/* 641 */       sb.append("ORGAN_STRU.ORGAN_TYPE like '%").append(searchId[2]).append("%'");
/* 642 */       andFlag = true;
/*     */     }
/*     */ 
/* 645 */     if ((searchId[3] != null) && 
/* 646 */       (!(searchId[3].equalsIgnoreCase("")))) {
/* 647 */       if (andFlag) {
/* 648 */         sb.append(" AND ");
/*     */       }
/* 650 */       sb.append("ORGAN_STRU.PARENT_ID like '%").append(searchId[3]).append("%'");
/* 651 */       andFlag = true;
/*     */     }
/*     */ 
/* 654 */     if ((searchId[4] != null) && 
/* 655 */       (!(searchId[4].equalsIgnoreCase("")))) {
/* 656 */       if (andFlag) {
/* 657 */         sb.append(" AND ");
/*     */       }
/* 659 */       sb.append("ORGAN_STRU.PRINCIPAL_ID like '%").append(searchId[4]).append("%'");
/* 660 */       andFlag = true;
/*     */     }
/*     */ 
/* 663 */     if ((searchId[5] != null) && 
/* 664 */       (!(searchId[5].equalsIgnoreCase("")))) {
/* 665 */       if (andFlag) {
/* 666 */         sb.append(" AND ");
/*     */       }
/* 668 */       sb.append("ORGAN_STRU.STRU_PATH like '%").append(searchId[5]).append("%'");
/* 669 */       andFlag = true;
/*     */     }
/*     */ 
/* 672 */     if ((searchId[6] != null) && 
/* 673 */       (!(searchId[6].equalsIgnoreCase("")))) {
/* 674 */       if (andFlag) {
/* 675 */         sb.append(" AND ");
/*     */       }
/* 677 */       sb.append("ORGAN_STRU.ORGAN_ORDER =").append(searchId[6]);
/* 678 */       andFlag = true;
/*     */     }
/*     */ 
/* 681 */     if ((searchId[7] != null) && 
/* 682 */       (!(searchId[7].equalsIgnoreCase("")))) {
/* 683 */       if (andFlag) {
/* 684 */         sb.append(" AND ");
/*     */       }
/* 686 */       sb.append("ORGAN_STRU.BEGIN_DATE like '%").append(searchId[7]).append("%'");
/* 687 */       andFlag = true;
/*     */     }
/*     */ 
/* 690 */     if ((searchId[8] != null) && 
/* 691 */       (!(searchId[8].equalsIgnoreCase("")))) {
/* 692 */       if (andFlag) {
/* 693 */         sb.append(" AND ");
/*     */       }
/* 695 */       sb.append("ORGAN_STRU.END_DATE like '%").append(searchId[8]).append("%'");
/* 696 */       andFlag = true;
/*     */     }
/*     */ 
/* 699 */     if ((searchId[9] != null) && 
/* 700 */       (!(searchId[9].equalsIgnoreCase("")))) {
/* 701 */       if (andFlag) {
/* 702 */         sb.append(" AND ");
/*     */       }
/* 704 */       sb.append("ORGAN_STRU.IS_LEAF like '%").append(searchId[9]).append("%'");
/*     */     }
/*     */ 
/* 707 */     queryer.setSql(sb.toString());
/* 708 */     queryer.setPageAble(true);
/* 709 */     queryer.compile();
/* 710 */     return queryer.execute(); }
/*     */ 
/*     */   public List getStruPath(String organAlias) {
/* 713 */     OrganStruQuery organStru = new OrganStruQuery(getDataSource());
/* 714 */     StringBuffer sb = new StringBuffer(organStru.getSql());
/* 715 */     sb.append(" WHERE ORGAN_ALIAS = '").append(organAlias).append("'");
/* 716 */     organStru.setSql(sb.toString());
/* 717 */     organStru.setPageAble(true);
/* 718 */     organStru.compile();
/* 719 */     return organStru.execute(); }
/*     */ 
/*     */   public List getChildren(String code) {
/* 722 */     OrganStruQuery organStru = new OrganStruQuery(getDataSource());
/* 723 */     StringBuffer sb = new StringBuffer(organStru.getSql());
/* 724 */     sb.append(" WHERE ORGAN_STRU.PARENT_ID = '").append(code).append("'");
/* 725 */     sb.append(" ORDER BY ORGAN_ORDER DESC");
/* 726 */     organStru.setSql(sb.toString());
/* 727 */     organStru.setPageAble(true);
/* 728 */     organStru.compile();
/* 729 */     return organStru.execute();
/*     */   }
/*     */ 
/*     */   protected static class OrganStruDelete extends SqlUpdate
/*     */   {
/*     */     protected OrganStruDelete(DataSource ds)
/*     */     {
/* 303 */       super(ds, OrganStruJdbcDao.deleteSql);
/*     */ 
/* 305 */       declareParameter(new SqlParameter(12));
/*     */     }
/*     */ 
/*     */     public int delete(String organId)
/*     */     {
/* 312 */       Object[] objs = { organId };
/* 313 */       return update(objs);
/*     */     }
/*     */   }
/*     */ 
/*     */   protected static class OrganStruDetail extends MappingSqlQuery
/*     */   {
/*     */     protected OrganStruDetail(DataSource ds)
/*     */     {
/* 190 */       super(ds, OrganStruJdbcDao.detailSql);
/*     */ 
/* 192 */       declareParameter(new SqlParameter(12));
/*     */     }
/*     */ 
/*     */     protected Object mapRow(ResultSet rs, int rowNum)
/*     */       throws SQLException
/*     */     {
/* 202 */       OrganStru organStru = new OrganStru();
/* 203 */       organStru.setOrganId(rs.getString("ORGAN_ID"));
/* 204 */       organStru.setOrganAlias(rs.getString("ORGAN_ALIAS"));
/* 205 */       organStru.setOrganType(rs.getString("ORGAN_TYPE"));
/* 206 */       organStru.setParentId(rs.getString("PARENT_ID"));
/* 207 */       organStru.setPrincipalId(rs.getString("PRINCIPAL_ID"));
/* 208 */       organStru.setStruPath(rs.getString("STRU_PATH"));
/* 209 */       organStru.setOrganOrder(rs.getInt("ORGAN_ORDER"));
/* 210 */       organStru.setBeginDate(rs.getString("BEGIN_DATE"));
/* 211 */       organStru.setEndDate(rs.getString("END_DATE"));
/* 212 */       organStru.setIsLeaf(rs.getString("IS_LEAF"));
/* 213 */       return organStru;
/*     */     }
/*     */ 
/*     */     public OrganStru load(String organId)
/*     */     {
/* 220 */       return ((OrganStru)findObject(new Object[] { organId }));
/*     */     }
/*     */   }
/*     */ 
/*     */   protected static class OrganStruInsert extends SqlUpdate
/*     */   {
/*     */     protected OrganStruInsert(DataSource ds) {
/* 227 */       super(ds, OrganStruJdbcDao.insertSql);
/*     */ 
/* 229 */       declareParameter(new SqlParameter(12));
/* 230 */       declareParameter(new SqlParameter(12));
/* 231 */       declareParameter(new SqlParameter(12));
/* 232 */       declareParameter(new SqlParameter(12));
/* 233 */       declareParameter(new SqlParameter(12));
/* 234 */       declareParameter(new SqlParameter(12));
/* 235 */       declareParameter(new SqlParameter(4));
/* 236 */       declareParameter(new SqlParameter(1));
/* 237 */       declareParameter(new SqlParameter(1));
/* 238 */       declareParameter(new SqlParameter(1));
/*     */     }
/*     */ 
/*     */     public int insert(OrganStru organStru)
/*     */     {
/* 245 */       Object[] objs = 
/* 246 */         { 
/* 247 */         organStru.getOrganId(), 
/* 248 */         organStru.getOrganAlias(), 
/* 249 */         organStru.getOrganType(), 
/* 250 */         organStru.getParentId(), 
/* 251 */         organStru.getPrincipalId(), 
/* 252 */         organStru.getStruPath(), 
/* 253 */         new Integer(organStru.getOrganOrder()), 
/* 254 */         organStru.getBeginDate(), 
/* 255 */         organStru.getEndDate(), 
/* 256 */         organStru.getIsLeaf() };
/*     */ 
/* 258 */       return update(objs);
/*     */     }
/*     */   }
/*     */ 
/*     */   protected static class OrganStruQuery extends MappingSqlQuery
/*     */   {
/*     */     protected OrganStruQuery(DataSource ds)
/*     */     {
/* 320 */       super(ds, OrganStruJdbcDao.querySql);
/*     */     }
/*     */ 
/*     */     protected Object mapRow(ResultSet rs, int rowNum)
/*     */       throws SQLException
/*     */     {
/* 329 */       OrganStru organStru = new OrganStru();
/* 330 */       organStru.setOrganAlias(rs.getString("ORGAN_ALIAS"));
/* 331 */       organStru.setOrganType(rs.getString("ORGAN_TYPE"));
/* 332 */       organStru.setParentId(rs.getString("PARENT_ID"));
/* 333 */       organStru.setPrincipalId(rs.getString("PRINCIPAL_ID"));
/* 334 */       organStru.setStruPath(rs.getString("STRU_PATH"));
/* 335 */       organStru.setOrganOrder(rs.getInt("ORGAN_ORDER"));
/* 336 */       organStru.setBeginDate(rs.getString("BEGIN_DATE"));
/* 337 */       organStru.setEndDate(rs.getString("END_DATE"));
/* 338 */       organStru.setIsLeaf(rs.getString("IS_LEAF"));
/* 339 */       organStru.setOrganId(rs.getString("ORGAN_ID"));
/* 340 */       return organStru;
/*     */     }
/*     */   }
/*     */ 
/*     */   protected static class OrganStruUpdate extends SqlUpdate
/*     */   {
/*     */     protected OrganStruUpdate(DataSource ds)
/*     */     {
/* 265 */       super(ds, OrganStruJdbcDao.updateSql);
/*     */ 
/* 267 */       declareParameter(new SqlParameter(12));
/* 268 */       declareParameter(new SqlParameter(12));
/* 269 */       declareParameter(new SqlParameter(12));
/* 270 */       declareParameter(new SqlParameter(12));
/* 271 */       declareParameter(new SqlParameter(12));
/* 272 */       declareParameter(new SqlParameter(4));
/* 273 */       declareParameter(new SqlParameter(1));
/* 274 */       declareParameter(new SqlParameter(1));
/* 275 */       declareParameter(new SqlParameter(1));
/* 276 */       declareParameter(new SqlParameter(12));
/*     */     }
/*     */ 
/*     */     public int update(OrganStru organStru)
/*     */     {
/* 283 */       Object[] objs = 
/* 284 */         { 
/* 285 */         organStru.getOrganAlias(), 
/* 286 */         organStru.getOrganType(), 
/* 287 */         organStru.getParentId(), 
/* 288 */         organStru.getPrincipalId(), 
/* 289 */         organStru.getStruPath(), 
/* 290 */         new Integer(organStru.getOrganOrder()), 
/* 291 */         organStru.getBeginDate(), 
/* 292 */         organStru.getEndDate(), 
/* 293 */         organStru.getIsLeaf(), 
/* 294 */         organStru.getOrganId() };
/*     */ 
/* 296 */       return update(objs);
/*     */     }
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.tree.dao.jdbc.OrganStruJdbcDao
 * JD-Core Version:    0.5.3
 */