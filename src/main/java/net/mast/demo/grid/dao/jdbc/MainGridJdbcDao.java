/*     */ package net.mast.demo.grid.dao.jdbc;
/*     */ 
/*     */ import java.sql.ResultSet;
/*     */ import java.sql.SQLException;
/*     */ import java.util.ArrayList;
/*     */ import java.util.Iterator;
/*     */ import java.util.List;
/*     */ import java.util.Map;
/*     */ import javax.sql.DataSource;
/*     */ import org.apache.commons.logging.Log;
/*     */ import org.apache.commons.logging.LogFactory;
/*     */ import net.mast.commons.jdbc.core.SqlParameter;
/*     */ import net.mast.commons.jdbc.object.MappingSqlQuery;
/*     */ import net.mast.commons.jdbc.object.SqlUpdate;
/*     */ import net.mast.demo.grid.dao.IMainGridDao;
/*     */ import net.mast.demo.grid.data.GridItem;
/*     */ import net.mast.demo.grid.data.MainGrid;
/*     */ import net.mast.util.Page;
/*     */ import net.mast.util.RowSelection;
/*     */ import net.mast.util.domain.BaseJdbcDao;
/*     */ 
/*     */ public class MainGridJdbcDao extends BaseJdbcDao
/*     */   implements IMainGridDao
/*     */ {
/*  30 */   long orderId = 0L;
/*  31 */   private static Log log = LogFactory.getLog(MainGridJdbcDao.class);
/*     */ 
/*  33 */   private static final String insertMainGridSql = getMainGridInsertSql();
/*     */ 
/*  35 */   private static final String deleteMainGridSql = getMainGridDeleteSql();
/*     */ 
/*  37 */   private static final String detailMainGridSql = getMainGridDetailSql();
/*     */ 
/*  39 */   private static final String updateMainGridSql = getMainGridUpdateSql();
/*     */ 
/*  41 */   private static final String insertGridItemSql = getGridItemInsertSql();
/*     */ 
/*  43 */   private static final String deleteGridItemAllSql = getGridItemDeleteAllSql();
/*     */ 
/*  45 */   private static final String detailGridItemSql = getGridItemDetailSql();
/*     */ 
/*  47 */   private static final String querySql = getQuerySql();
/*     */ 
/* 507 */   private MainGridDelete deleter = null;
/* 508 */   private MainGridInsert inserter = null;
/* 509 */   private MainGridDetail finder = null;
/* 510 */   private MainGridUpdate updater = null;
/* 511 */   private GridItemDeleteAll linedeletealler = null;
/* 512 */   private GridItemInsert lineinserter = null;
/* 513 */   private GridItemDetail linefinder = null;
/*     */ 
/*     */   public static String getMainGridInsertSql()
/*     */   {
/*  53 */     StringBuffer sb = new StringBuffer();
/*  54 */     sb.append("INSERT INTO MAIN_GRID (");
/*  55 */     sb.append("MAIN_GRID_ID");
/*  56 */     sb.append(",");
/*  57 */     sb.append("OPERATOR_CODE");
/*  58 */     sb.append(",");
/*  59 */     sb.append("OPERATE_NAME");
/*  60 */     sb.append(",");
/*  61 */     sb.append("OPERATE_COOPERATE");
/*  62 */     sb.append(",");
/*  63 */     sb.append("OPERATE_DEPT");
/*  64 */     sb.append(",");
/*  65 */     sb.append("OPERATE_DATE");
/*  66 */     sb.append(",");
/*  67 */     sb.append("OPERATE_EFFDATE");
/*  68 */     sb.append(",");
/*  69 */     sb.append("OPERATOR_STATUS");
/*  70 */     sb.append(",");
/*  71 */     sb.append("OPERATOR_DEPOT");
/*  72 */     sb.append(") VALUES(");
/*  73 */     sb.append("?");
/*  74 */     sb.append(",");
/*  75 */     sb.append("?");
/*  76 */     sb.append(",");
/*  77 */     sb.append("?");
/*  78 */     sb.append(",");
/*  79 */     sb.append("?");
/*  80 */     sb.append(",");
/*  81 */     sb.append("?");
/*  82 */     sb.append(",");
/*  83 */     sb.append("?");
/*  84 */     sb.append(",");
/*  85 */     sb.append("?");
/*  86 */     sb.append(",");
/*  87 */     sb.append("?");
/*  88 */     sb.append(",");
/*  89 */     sb.append("?");
/*  90 */     sb.append(")");
/*  91 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getMainGridUpdateSql()
/*     */   {
/*  98 */     StringBuffer sb = new StringBuffer();
/*  99 */     sb.append("UPDATE MAIN_GRID SET ");
/* 100 */     sb.append("OPERATOR_CODE=?");
/* 101 */     sb.append(" , ");
/* 102 */     sb.append("OPERATE_NAME=?");
/* 103 */     sb.append(" , ");
/* 104 */     sb.append("OPERATE_COOPERATE=?");
/* 105 */     sb.append(" , ");
/* 106 */     sb.append("OPERATE_DEPT=?");
/* 107 */     sb.append(" , ");
/* 108 */     sb.append("OPERATE_DATE=?");
/* 109 */     sb.append(" , ");
/* 110 */     sb.append("OPERATE_EFFDATE=?");
/* 111 */     sb.append(" , ");
/* 112 */     sb.append("OPERATOR_STATUS=?");
/* 113 */     sb.append(" , ");
/* 114 */     sb.append("OPERATOR_DEPOT=?");
/* 115 */     sb.append(" WHERE ");
/* 116 */     sb.append("MAIN_GRID_ID=?");
/* 117 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getMainGridDeleteSql()
/*     */   {
/* 124 */     StringBuffer sb = new StringBuffer();
/* 125 */     sb.append("DELETE FROM MAIN_GRID WHERE ");
/* 126 */     sb.append("MAIN_GRID_ID=?");
/* 127 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getMainGridDetailSql()
/*     */   {
/* 134 */     StringBuffer sb = new StringBuffer();
/* 135 */     sb.append("SELECT ");
/* 136 */     sb.append("MAIN_GRID_ID");
/* 137 */     sb.append(",");
/* 138 */     sb.append("OPERATOR_CODE");
/* 139 */     sb.append(",");
/* 140 */     sb.append("OPERATE_NAME");
/* 141 */     sb.append(",");
/* 142 */     sb.append("OPERATE_COOPERATE");
/* 143 */     sb.append(",");
/* 144 */     sb.append("OPERATE_DEPT");
/* 145 */     sb.append(",");
/* 146 */     sb.append("OPERATE_DATE");
/* 147 */     sb.append(",");
/* 148 */     sb.append("OPERATE_EFFDATE");
/* 149 */     sb.append(",");
/* 150 */     sb.append("OPERATOR_STATUS");
/* 151 */     sb.append(",");
/* 152 */     sb.append("OPERATOR_DEPOT");
/* 153 */     sb.append(" FROM MAIN_GRID WHERE ");
/* 154 */     sb.append("MAIN_GRID_ID=?");
/* 155 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getGridItemInsertSql()
/*     */   {
/* 162 */     StringBuffer sb = new StringBuffer();
/* 163 */     sb.append("INSERT INTO GRID_ITEM (");
/* 164 */     sb.append("MAIN_GRID_ID");
/* 165 */     sb.append(",");
/* 166 */     sb.append("ITEM_DETAILID");
/* 167 */     sb.append(",");
/* 168 */     sb.append("ITEM_PRODUCTID");
/* 169 */     sb.append(",");
/* 170 */     sb.append("ITEM_UNITPRICE");
/* 171 */     sb.append(",");
/* 172 */     sb.append("ITEM_DISCOUNT");
/* 173 */     sb.append(",");
/* 174 */     sb.append("ITEM_QUANTITY");
/* 175 */     sb.append(",");
/* 176 */     sb.append("ITEM_AMOUNT");
/* 177 */     sb.append(",");
/* 178 */     sb.append("ITEM_DATE");
/* 179 */     sb.append(",");
/* 180 */     sb.append("ITEM_DATETIME");
/* 181 */     sb.append(",");
/* 182 */     sb.append("ITEM_LEVEL");
/* 183 */     sb.append(",");
/* 184 */     sb.append("ITEM_NOTE");
/* 185 */     sb.append(") VALUES(");
/* 186 */     sb.append("?");
/* 187 */     sb.append(",");
/* 188 */     sb.append("?");
/* 189 */     sb.append(",");
/* 190 */     sb.append("?");
/* 191 */     sb.append(",");
/* 192 */     sb.append("?");
/* 193 */     sb.append(",");
/* 194 */     sb.append("?");
/* 195 */     sb.append(",");
/* 196 */     sb.append("?");
/* 197 */     sb.append(",");
/* 198 */     sb.append("?");
/* 199 */     sb.append(",");
/* 200 */     sb.append("?");
/* 201 */     sb.append(",");
/* 202 */     sb.append("?");
/* 203 */     sb.append(",");
/* 204 */     sb.append("?");
/* 205 */     sb.append(",");
/* 206 */     sb.append("?");
/* 207 */     sb.append(")");
/* 208 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getGridItemDeleteAllSql()
/*     */   {
/* 215 */     StringBuffer sb = new StringBuffer();
/* 216 */     sb.append("DELETE FROM GRID_ITEM WHERE ");
/* 217 */     sb.append("MAIN_GRID_ID=?");
/* 218 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getGridItemDetailSql()
/*     */   {
/* 225 */     StringBuffer sb = new StringBuffer();
/* 226 */     sb.append("SELECT ");
/* 227 */     sb.append("MAIN_GRID_ID");
/* 228 */     sb.append(",");
/* 229 */     sb.append("ITEM_DETAILID");
/* 230 */     sb.append(",");
/* 231 */     sb.append("ITEM_PRODUCTID");
/* 232 */     sb.append(",");
/* 233 */     sb.append("ITEM_UNITPRICE");
/* 234 */     sb.append(",");
/* 235 */     sb.append("ITEM_DISCOUNT");
/* 236 */     sb.append(",");
/* 237 */     sb.append("ITEM_QUANTITY");
/* 238 */     sb.append(",");
/* 239 */     sb.append("ITEM_AMOUNT");
/* 240 */     sb.append(",");
/* 241 */     sb.append("ITEM_DATE");
/* 242 */     sb.append(",");
/* 243 */     sb.append("ITEM_DATETIME");
/* 244 */     sb.append(",");
/* 245 */     sb.append("ITEM_LEVEL");
/* 246 */     sb.append(",");
/* 247 */     sb.append("ITEM_NOTE");
/* 248 */     sb.append(" FROM GRID_ITEM WHERE ");
/* 249 */     sb.append("MAIN_GRID_ID=?");
/* 250 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String getQuerySql()
/*     */   {
/* 257 */     StringBuffer sb = new StringBuffer();
/* 258 */     sb.append("SELECT ");
/* 259 */     sb.append("MAIN_GRID_ID");
/* 260 */     sb.append(",");
/* 261 */     sb.append("OPERATOR_CODE");
/* 262 */     sb.append(",");
/* 263 */     sb.append("OPERATE_NAME");
/* 264 */     sb.append(",");
/* 265 */     sb.append("OPERATE_COOPERATE");
/* 266 */     sb.append(",");
/* 267 */     sb.append("OPERATE_DEPT");
/* 268 */     sb.append(",");
/* 269 */     sb.append("OPERATE_DATE");
/* 270 */     sb.append(",");
/* 271 */     sb.append("OPERATE_EFFDATE");
/* 272 */     sb.append(",");
/* 273 */     sb.append("OPERATOR_STATUS");
/* 274 */     sb.append(",");
/* 275 */     sb.append("OPERATOR_DEPOT");
/* 276 */     sb.append(" FROM MAIN_GRID");
/* 277 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   protected void initDao()
/*     */   {
/* 516 */     if (this.deleter == null) {
/* 517 */       this.deleter = new MainGridDelete(getDataSource());
/* 518 */       this.deleter.compile();
/*     */     }
/* 520 */     if (this.inserter == null) {
/* 521 */       this.inserter = new MainGridInsert(getDataSource());
/* 522 */       this.inserter.compile();
/*     */     }
/* 524 */     if (this.finder == null) {
/* 525 */       this.finder = new MainGridDetail(getDataSource());
/* 526 */       this.finder.compile();
/*     */     }
/* 528 */     if (this.updater == null) {
/* 529 */       this.updater = new MainGridUpdate(getDataSource());
/* 530 */       this.updater.compile();
/*     */     }
/* 532 */     if (this.linedeletealler == null) {
/* 533 */       this.linedeletealler = new GridItemDeleteAll(getDataSource());
/* 534 */       this.linedeletealler.compile();
/*     */     }
/* 536 */     if (this.lineinserter == null) {
/* 537 */       this.lineinserter = new GridItemInsert(getDataSource());
/* 538 */       this.lineinserter.compile();
/*     */     }
/* 540 */     if (this.linefinder == null) {
/* 541 */       this.linefinder = new GridItemDetail(getDataSource());
/* 542 */       this.linefinder.compile();
/*     */     }
/*     */   }
/*     */ 
/*     */   public void deleteMainGrid(String mainGridId)
/*     */   {
/* 552 */     this.linedeletealler.delete(mainGridId);
/* 553 */     this.deleter.delete(mainGridId);
/*     */   }
/*     */ 
/*     */   public MainGrid getMainGrid(String mainGridId)
/*     */   {
/* 563 */     MainGrid head = this.finder.load(mainGridId);
/* 564 */     Iterator lines = this.linefinder.getGridItem(mainGridId).iterator();
/* 565 */     List linelist = new ArrayList();
/* 566 */     while (lines.hasNext()) {
/* 567 */       GridItem line = (GridItem)lines.next();
/* 568 */       linelist.add(line);
/*     */     }
/* 570 */     head.setListGridItem(linelist);
/* 571 */     return head;
/*     */   }
/*     */ 
/*     */   public MainGrid insertMainGrid(MainGrid mainGrid)
/*     */   {
/* 581 */     this.inserter.insert(mainGrid);
/* 582 */     Iterator lines = mainGrid.getListGridItem().iterator();
/* 583 */     while (lines.hasNext()) {
/* 584 */       GridItem line = (GridItem)lines.next();
/* 585 */       line.setItemDetailid(String.valueOf(this.orderId++));
/* 586 */       this.lineinserter.insert(line, mainGrid.getMainGridId());
/*     */     }
/* 588 */     return mainGrid;
/*     */   }
/*     */ 
/*     */   public MainGrid updateMainGrid(MainGrid mainGrid)
/*     */   {
/* 598 */     this.updater.update(mainGrid);
/* 599 */     this.linedeletealler.delete(mainGrid.getMainGridId());
/* 600 */     Iterator lines = mainGrid.getListGridItem().iterator();
/* 601 */     String delFlag = null;
/* 602 */     while (lines.hasNext()) {
/* 603 */       GridItem line = (GridItem)lines.next();
/* 604 */       delFlag = line.getIsDelete();
/* 605 */       if (!(delFlag.equals("1"))) {
/* 606 */         line.setItemDetailid(String.valueOf(this.orderId++));
/* 607 */         this.lineinserter.insert(line, mainGrid.getMainGridId());
/*     */       }
/*     */     }
/* 610 */     return mainGrid;
/*     */   }
/*     */ 
/*     */   public Page getAllMainGrid(RowSelection rowSelection, Map map)
/*     */   {
/* 621 */     MainGridQuery queryer = new MainGridQuery(getDataSource());
/* 622 */     StringBuffer sb = new StringBuffer(queryer.getSql());
/* 623 */     String[] searchId = new String[9];
/* 624 */     String[] sa0 = (String[])map.get("main_grid_idSearch");
/* 625 */     if (sa0 != null) {
/* 626 */       searchId[0] = sa0[0];
/*     */     }
/* 628 */     String[] sa1 = (String[])map.get("operator_codeSearch");
/* 629 */     if (sa1 != null) {
/* 630 */       searchId[1] = sa1[0];
/*     */     }
/* 632 */     String[] sa2 = (String[])map.get("operate_nameSearch");
/* 633 */     if (sa2 != null) {
/* 634 */       searchId[2] = sa2[0];
/*     */     }
/* 636 */     String[] sa3 = (String[])map.get("operate_cooperateSearch");
/* 637 */     if (sa3 != null) {
/* 638 */       searchId[3] = sa3[0];
/*     */     }
/* 640 */     String[] sa4 = (String[])map.get("operate_deptSearch");
/* 641 */     if (sa4 != null) {
/* 642 */       searchId[4] = sa4[0];
/*     */     }
/* 644 */     String[] sa5 = (String[])map.get("operate_dateSearch");
/* 645 */     if (sa5 != null) {
/* 646 */       searchId[5] = sa5[0];
/*     */     }
/* 648 */     String[] sa6 = (String[])map.get("operate_effdateSearch");
/* 649 */     if (sa6 != null) {
/* 650 */       searchId[6] = sa6[0];
/*     */     }
/* 652 */     String[] sa7 = (String[])map.get("operator_statusSearch");
/* 653 */     if (sa7 != null) {
/* 654 */       searchId[7] = sa7[0];
/*     */     }
/* 656 */     String[] sa8 = (String[])map.get("operator_depotSearch");
/* 657 */     if (sa8 != null) {
/* 658 */       searchId[8] = sa8[0];
/*     */     }
/* 660 */     boolean whFlag = false;
/* 661 */     for (int i = 0; i < searchId.length; ++i) {
/* 662 */       if ((searchId[i] == null) || 
/* 663 */         (searchId[i].equalsIgnoreCase(""))) continue;
/* 664 */       whFlag = true;
/*     */     }
/*     */ 
/* 668 */     if (whFlag) {
/* 669 */       sb.append(" WHERE ");
/*     */     }
/* 671 */     boolean andFlag = false;
/* 672 */     if ((searchId[0] != null) && 
/* 673 */       (!(searchId[0].equalsIgnoreCase("")))) {
/* 674 */       if (andFlag) {
/* 675 */         sb.append(" AND ");
/*     */       }
/* 677 */       sb.append("MAIN_GRID.MAIN_GRID_ID like '%").append(searchId[0])
/* 678 */         .append("%'");
/* 679 */       andFlag = true;
/*     */     }
/*     */ 
/* 682 */     if ((searchId[1] != null) && 
/* 683 */       (!(searchId[1].equalsIgnoreCase("")))) {
/* 684 */       if (andFlag) {
/* 685 */         sb.append(" AND ");
/*     */       }
/* 687 */       sb.append("MAIN_GRID.OPERATOR_CODE like '%")
/* 688 */         .append(searchId[1]).append("%'");
/* 689 */       andFlag = true;
/*     */     }
/*     */ 
/* 692 */     if ((searchId[2] != null) && 
/* 693 */       (!(searchId[2].equalsIgnoreCase("")))) {
/* 694 */       if (andFlag) {
/* 695 */         sb.append(" AND ");
/*     */       }
/* 697 */       sb.append("MAIN_GRID.OPERATE_NAME like '%").append(searchId[2])
/* 698 */         .append("%'");
/* 699 */       andFlag = true;
/*     */     }
/*     */ 
/* 702 */     if ((searchId[3] != null) && 
/* 703 */       (!(searchId[3].equalsIgnoreCase("")))) {
/* 704 */       if (andFlag) {
/* 705 */         sb.append(" AND ");
/*     */       }
/* 707 */       sb.append("MAIN_GRID.OPERATE_COOPERATE like '%").append(
/* 708 */         searchId[3]).append("%'");
/* 709 */       andFlag = true;
/*     */     }
/*     */ 
/* 712 */     if ((searchId[4] != null) && 
/* 713 */       (!(searchId[4].equalsIgnoreCase("")))) {
/* 714 */       if (andFlag) {
/* 715 */         sb.append(" AND ");
/*     */       }
/* 717 */       sb.append("MAIN_GRID.OPERATE_DEPT like '%").append(searchId[4])
/* 718 */         .append("%'");
/* 719 */       andFlag = true;
/*     */     }
/*     */ 
/* 722 */     if ((searchId[5] != null) && 
/* 723 */       (!(searchId[5].equalsIgnoreCase("")))) {
/* 724 */       if (andFlag) {
/* 725 */         sb.append(" AND ");
/*     */       }
/* 727 */       sb.append("MAIN_GRID.OPERATE_DATE like '%").append(searchId[5])
/* 728 */         .append("%'");
/* 729 */       andFlag = true;
/*     */     }
/*     */ 
/* 732 */     if ((searchId[6] != null) && 
/* 733 */       (!(searchId[6].equalsIgnoreCase("")))) {
/* 734 */       if (andFlag) {
/* 735 */         sb.append(" AND ");
/*     */       }
/* 737 */       sb.append("MAIN_GRID.OPERATE_EFFDATE like '%").append(
/* 738 */         searchId[6]).append("%'");
/* 739 */       andFlag = true;
/*     */     }
/*     */ 
/* 742 */     if ((searchId[7] != null) && 
/* 743 */       (!(searchId[7].equalsIgnoreCase("")))) {
/* 744 */       if (andFlag) {
/* 745 */         sb.append(" AND ");
/*     */       }
/* 747 */       sb.append("MAIN_GRID.OPERATOR_STATUS like '%").append(
/* 748 */         searchId[7]).append("%'");
/* 749 */       andFlag = true;
/*     */     }
/*     */ 
/* 752 */     if ((searchId[8] != null) && 
/* 753 */       (!(searchId[8].equalsIgnoreCase("")))) {
/* 754 */       if (andFlag) {
/* 755 */         sb.append(" AND ");
/*     */       }
/* 757 */       sb.append("MAIN_GRID.OPERATOR_DEPOT like '%").append(
/* 758 */         searchId[8]).append("%'");
/*     */     }
/*     */ 
/* 761 */     queryer.setSql(sb.toString());
/* 762 */     queryer.setPageAble(true);
/* 763 */     queryer.compile();
/* 764 */     return queryer.executePage(rowSelection);
/*     */   }
/*     */ 
/*     */   public List getAllMainGridNoPage(Map map)
/*     */   {
/* 774 */     MainGridQuery queryer = new MainGridQuery(getDataSource());
/* 775 */     StringBuffer sb = new StringBuffer(queryer.getSql());
/* 776 */     String[] searchId = new String[9];
/* 777 */     String[] sa0 = (String[])map.get("main_grid_idSearch");
/* 778 */     if (sa0 != null) {
/* 779 */       searchId[0] = sa0[0];
/*     */     }
/* 781 */     String[] sa1 = (String[])map.get("operator_codeSearch");
/* 782 */     if (sa1 != null) {
/* 783 */       searchId[1] = sa1[0];
/*     */     }
/* 785 */     String[] sa2 = (String[])map.get("operate_nameSearch");
/* 786 */     if (sa2 != null) {
/* 787 */       searchId[2] = sa2[0];
/*     */     }
/* 789 */     String[] sa3 = (String[])map.get("operate_cooperateSearch");
/* 790 */     if (sa3 != null) {
/* 791 */       searchId[3] = sa3[0];
/*     */     }
/* 793 */     String[] sa4 = (String[])map.get("operate_deptSearch");
/* 794 */     if (sa4 != null) {
/* 795 */       searchId[4] = sa4[0];
/*     */     }
/* 797 */     String[] sa5 = (String[])map.get("operate_dateSearch");
/* 798 */     if (sa5 != null) {
/* 799 */       searchId[5] = sa5[0];
/*     */     }
/* 801 */     String[] sa6 = (String[])map.get("operate_effdateSearch");
/* 802 */     if (sa6 != null) {
/* 803 */       searchId[6] = sa6[0];
/*     */     }
/* 805 */     String[] sa7 = (String[])map.get("operator_statusSearch");
/* 806 */     if (sa7 != null) {
/* 807 */       searchId[7] = sa7[0];
/*     */     }
/* 809 */     String[] sa8 = (String[])map.get("operator_depotSearch");
/* 810 */     if (sa8 != null) {
/* 811 */       searchId[8] = sa8[0];
/*     */     }
/* 813 */     boolean whFlag = false;
/* 814 */     for (int i = 0; i < searchId.length; ++i) {
/* 815 */       if ((searchId[i] == null) || 
/* 816 */         (searchId[i].equalsIgnoreCase(""))) continue;
/* 817 */       whFlag = true;
/*     */     }
/*     */ 
/* 821 */     if (whFlag) {
/* 822 */       sb.append(" WHERE ");
/*     */     }
/* 824 */     boolean andFlag = false;
/* 825 */     if ((searchId[0] != null) && 
/* 826 */       (!(searchId[0].equalsIgnoreCase("")))) {
/* 827 */       if (andFlag) {
/* 828 */         sb.append(" AND ");
/*     */       }
/* 830 */       sb.append("MAIN_GRID.MAIN_GRID_ID like '%").append(searchId[0])
/* 831 */         .append("%'");
/* 832 */       andFlag = true;
/*     */     }
/*     */ 
/* 835 */     if ((searchId[1] != null) && 
/* 836 */       (!(searchId[1].equalsIgnoreCase("")))) {
/* 837 */       if (andFlag) {
/* 838 */         sb.append(" AND ");
/*     */       }
/* 840 */       sb.append("MAIN_GRID.OPERATOR_CODE like '%")
/* 841 */         .append(searchId[1]).append("%'");
/* 842 */       andFlag = true;
/*     */     }
/*     */ 
/* 845 */     if ((searchId[2] != null) && 
/* 846 */       (!(searchId[2].equalsIgnoreCase("")))) {
/* 847 */       if (andFlag) {
/* 848 */         sb.append(" AND ");
/*     */       }
/* 850 */       sb.append("MAIN_GRID.OPERATE_NAME like '%").append(searchId[2])
/* 851 */         .append("%'");
/* 852 */       andFlag = true;
/*     */     }
/*     */ 
/* 855 */     if ((searchId[3] != null) && 
/* 856 */       (!(searchId[3].equalsIgnoreCase("")))) {
/* 857 */       if (andFlag) {
/* 858 */         sb.append(" AND ");
/*     */       }
/* 860 */       sb.append("MAIN_GRID.OPERATE_COOPERATE like '%").append(
/* 861 */         searchId[3]).append("%'");
/* 862 */       andFlag = true;
/*     */     }
/*     */ 
/* 865 */     if ((searchId[4] != null) && 
/* 866 */       (!(searchId[4].equalsIgnoreCase("")))) {
/* 867 */       if (andFlag) {
/* 868 */         sb.append(" AND ");
/*     */       }
/* 870 */       sb.append("MAIN_GRID.OPERATE_DEPT like '%").append(searchId[4])
/* 871 */         .append("%'");
/* 872 */       andFlag = true;
/*     */     }
/*     */ 
/* 875 */     if ((searchId[5] != null) && 
/* 876 */       (!(searchId[5].equalsIgnoreCase("")))) {
/* 877 */       if (andFlag) {
/* 878 */         sb.append(" AND ");
/*     */       }
/* 880 */       sb.append("MAIN_GRID.OPERATE_DATE like '%").append(searchId[5])
/* 881 */         .append("%'");
/* 882 */       andFlag = true;
/*     */     }
/*     */ 
/* 885 */     if ((searchId[6] != null) && 
/* 886 */       (!(searchId[6].equalsIgnoreCase("")))) {
/* 887 */       if (andFlag) {
/* 888 */         sb.append(" AND ");
/*     */       }
/* 890 */       sb.append("MAIN_GRID.OPERATE_EFFDATE like '%").append(
/* 891 */         searchId[6]).append("%'");
/* 892 */       andFlag = true;
/*     */     }
/*     */ 
/* 895 */     if ((searchId[7] != null) && 
/* 896 */       (!(searchId[7].equalsIgnoreCase("")))) {
/* 897 */       if (andFlag) {
/* 898 */         sb.append(" AND ");
/*     */       }
/* 900 */       sb.append("MAIN_GRID.OPERATOR_STATUS like '%").append(
/* 901 */         searchId[7]).append("%'");
/* 902 */       andFlag = true;
/*     */     }
/*     */ 
/* 905 */     if ((searchId[8] != null) && 
/* 906 */       (!(searchId[8].equalsIgnoreCase("")))) {
/* 907 */       if (andFlag) {
/* 908 */         sb.append(" AND ");
/*     */       }
/* 910 */       sb.append("MAIN_GRID.OPERATOR_DEPOT like '%").append(
/* 911 */         searchId[8]).append("%'");
/*     */     }
/*     */ 
/* 914 */     queryer.setSql(sb.toString());
/* 915 */     queryer.setPageAble(true);
/* 916 */     queryer.compile();
/* 917 */     return queryer.execute();
/*     */   }
/*     */ 
/*     */   protected static class GridItemDeleteAll extends SqlUpdate
/*     */   {
/*     */     protected GridItemDeleteAll(DataSource ds)
/*     */     {
/* 466 */       super(ds, MainGridJdbcDao.deleteGridItemAllSql);
/* 467 */       declareParameter(new SqlParameter(12));
/*     */     }
/*     */ 
/*     */     public int delete(String mainGridId)
/*     */     {
/* 475 */       Object[] objs = { mainGridId };
/* 476 */       return update(objs);
/*     */     }
/*     */   }
/*     */ 
/*     */   protected static class GridItemDetail extends MappingSqlQuery
/*     */   {
/*     */     protected GridItemDetail(DataSource ds)
/*     */     {
/* 395 */       super(ds, MainGridJdbcDao.detailGridItemSql);
/* 396 */       declareParameter(new SqlParameter(12));
/*     */     }
/*     */ 
/*     */     protected Object mapRow(ResultSet rs, int rowNum)
/*     */       throws SQLException
/*     */     {
/* 406 */       GridItem griditem = new GridItem();
/* 407 */       griditem.setMainGridId(rs.getString("MAIN_GRID_ID"));
/* 408 */       griditem.setItemDetailid(rs.getString("ITEM_DETAILID"));
/* 409 */       griditem.setItemProductid(rs.getString("ITEM_PRODUCTID"));
/* 410 */       griditem.setItemUnitprice(rs.getBigDecimal("ITEM_UNITPRICE"));
/* 411 */       griditem.setItemDiscount(rs.getString("ITEM_DISCOUNT"));
/* 412 */       griditem.setItemQuantity(rs.getBigDecimal("ITEM_QUANTITY"));
/* 413 */       griditem.setItemAmount(rs.getBigDecimal("ITEM_AMOUNT"));
/* 414 */       griditem.setItemDate(rs.getString("ITEM_DATE"));
/* 415 */       griditem.setItemDatetime(rs.getString("ITEM_DATETIME"));
/* 416 */       griditem.setItemLevel(rs.getString("ITEM_LEVEL"));
/* 417 */       griditem.setItemNote(rs.getString("ITEM_NOTE"));
/* 418 */       return griditem;
/*     */     }
/*     */ 
/*     */     public List getGridItem(String mainGridId)
/*     */     {
/* 426 */       return execute(new Object[] { mainGridId });
/*     */     }
/*     */   }
/*     */ 
/*     */   protected static class GridItemInsert extends SqlUpdate
/*     */   {
/*     */     protected GridItemInsert(DataSource ds) {
/* 433 */       super(ds, MainGridJdbcDao.insertGridItemSql);
/* 434 */       declareParameter(new SqlParameter(12));
/* 435 */       declareParameter(new SqlParameter(12));
/* 436 */       declareParameter(new SqlParameter(12));
/* 437 */       declareParameter(new SqlParameter(2));
/* 438 */       declareParameter(new SqlParameter(1));
/* 439 */       declareParameter(new SqlParameter(2));
/* 440 */       declareParameter(new SqlParameter(2));
/* 441 */       declareParameter(new SqlParameter(12));
/* 442 */       declareParameter(new SqlParameter(12));
/* 443 */       declareParameter(new SqlParameter(1));
/* 444 */       declareParameter(new SqlParameter(12));
/*     */     }
/*     */ 
/*     */     public int insert(GridItem griditem, String mainGridId)
/*     */     {
/* 453 */       Object[] objs = { mainGridId, 
/* 454 */         griditem.getItemDetailid(), griditem.getItemProductid(), 
/* 455 */         griditem.getItemUnitprice(), griditem.getItemDiscount(), 
/* 456 */         griditem.getItemQuantity(), griditem.getItemAmount(), 
/* 457 */         griditem.getItemDate(), griditem.getItemDatetime(), 
/* 458 */         griditem.getItemLevel(), griditem.getItemNote() };
/* 459 */       return update(objs);
/*     */     }
/*     */   }
/*     */ 
/*     */   protected static class MainGridDelete extends SqlUpdate
/*     */   {
/*     */     protected MainGridDelete(DataSource ds)
/*     */     {
/* 377 */       super(ds, MainGridJdbcDao.deleteMainGridSql);
/* 378 */       declareParameter(new SqlParameter(12));
/*     */     }
/*     */ 
/*     */     public int delete(String mainGridId)
/*     */     {
/* 387 */       Object[] objs = { mainGridId };
/* 388 */       return update(objs);
/*     */     }
/*     */   }
/*     */ 
/*     */   protected static class MainGridDetail extends MappingSqlQuery
/*     */   {
/*     */     protected MainGridDetail(DataSource ds)
/*     */     {
/* 283 */       super(ds, MainGridJdbcDao.detailMainGridSql);
/* 284 */       declareParameter(new SqlParameter(12));
/*     */     }
/*     */ 
/*     */     protected Object mapRow(ResultSet rs, int rowNum)
/*     */       throws SQLException
/*     */     {
/* 294 */       MainGrid mainGrid = new MainGrid();
/* 295 */       mainGrid.setMainGridId(rs.getString("MAIN_GRID_ID"));
/* 296 */       mainGrid.setOperatorCode(rs.getString("OPERATOR_CODE"));
/* 297 */       mainGrid.setOperateName(rs.getString("OPERATE_NAME"));
/* 298 */       mainGrid.setOperateCooperate(rs.getString("OPERATE_COOPERATE"));
/* 299 */       mainGrid.setOperateDept(rs.getString("OPERATE_DEPT"));
/* 300 */       mainGrid.setOperateDate(rs.getString("OPERATE_DATE"));
/* 301 */       mainGrid.setOperateEffdate(rs.getString("OPERATE_EFFDATE"));
/* 302 */       mainGrid.setOperatorStatus(rs.getString("OPERATOR_STATUS"));
/* 303 */       mainGrid.setOperatorDepot(rs.getString("OPERATOR_DEPOT"));
/* 304 */       return mainGrid;
/*     */     }
/*     */ 
/*     */     public MainGrid load(String mainGridId)
/*     */     {
/* 312 */       return ((MainGrid)findObject(new Object[] { mainGridId }));
/*     */     }
/*     */   }
/*     */ 
/*     */   protected static class MainGridInsert extends SqlUpdate
/*     */   {
/*     */     protected MainGridInsert(DataSource ds) {
/* 319 */       super(ds, MainGridJdbcDao.insertMainGridSql);
/* 320 */       declareParameter(new SqlParameter(12));
/* 321 */       declareParameter(new SqlParameter(12));
/* 322 */       declareParameter(new SqlParameter(12));
/* 323 */       declareParameter(new SqlParameter(12));
/* 324 */       declareParameter(new SqlParameter(12));
/* 325 */       declareParameter(new SqlParameter(1));
/* 326 */       declareParameter(new SqlParameter(1));
/* 327 */       declareParameter(new SqlParameter(1));
/* 328 */       declareParameter(new SqlParameter(1));
/*     */     }
/*     */ 
/*     */     public int insert(MainGrid mainGrid)
/*     */     {
/* 336 */       Object[] objs = { mainGrid.getMainGridId(), 
/* 337 */         mainGrid.getOperatorCode(), mainGrid.getOperateName(), 
/* 338 */         mainGrid.getOperateCooperate(), mainGrid.getOperateDept(), 
/* 339 */         mainGrid.getOperateDate(), mainGrid.getOperateEffdate(), 
/* 340 */         mainGrid.getOperatorStatus(), mainGrid.getOperatorDepot() };
/* 341 */       return update(objs);
/*     */     }
/*     */   }
/*     */ 
/*     */   protected static class MainGridQuery extends MappingSqlQuery
/*     */   {
/*     */     protected MainGridQuery(DataSource ds)
/*     */     {
/* 483 */       super(ds, MainGridJdbcDao.querySql);
/*     */     }
/*     */ 
/*     */     protected Object mapRow(ResultSet rs, int rowNum)
/*     */       throws SQLException
/*     */     {
/* 493 */       MainGrid maingrid = new MainGrid();
/* 494 */       maingrid.setMainGridId(rs.getString("MAIN_GRID_ID"));
/* 495 */       maingrid.setOperatorCode(rs.getString("OPERATOR_CODE"));
/* 496 */       maingrid.setOperateName(rs.getString("OPERATE_NAME"));
/* 497 */       maingrid.setOperateCooperate(rs.getString("OPERATE_COOPERATE"));
/* 498 */       maingrid.setOperateDept(rs.getString("OPERATE_DEPT"));
/* 499 */       maingrid.setOperateDate(rs.getString("OPERATE_DATE"));
/* 500 */       maingrid.setOperateEffdate(rs.getString("OPERATE_EFFDATE"));
/* 501 */       maingrid.setOperatorStatus(rs.getString("OPERATOR_STATUS"));
/* 502 */       maingrid.setOperatorDepot(rs.getString("OPERATOR_DEPOT"));
/* 503 */       return maingrid;
/*     */     }
/*     */   }
/*     */ 
/*     */   protected static class MainGridUpdate extends SqlUpdate
/*     */   {
/*     */     protected MainGridUpdate(DataSource ds)
/*     */     {
/* 348 */       super(ds, MainGridJdbcDao.updateMainGridSql);
/* 349 */       declareParameter(new SqlParameter(12));
/* 350 */       declareParameter(new SqlParameter(12));
/* 351 */       declareParameter(new SqlParameter(12));
/* 352 */       declareParameter(new SqlParameter(12));
/* 353 */       declareParameter(new SqlParameter(1));
/* 354 */       declareParameter(new SqlParameter(1));
/* 355 */       declareParameter(new SqlParameter(1));
/* 356 */       declareParameter(new SqlParameter(1));
/* 357 */       declareParameter(new SqlParameter(12));
/*     */     }
/*     */ 
/*     */     public int update(MainGrid mainGrid)
/*     */     {
/* 365 */       Object[] objs = { mainGrid.getOperatorCode(), 
/* 366 */         mainGrid.getOperateName(), mainGrid.getOperateCooperate(), 
/* 367 */         mainGrid.getOperateDept(), mainGrid.getOperateDate(), 
/* 368 */         mainGrid.getOperateEffdate(), mainGrid.getOperatorStatus(), 
/* 369 */         mainGrid.getOperatorDepot(), mainGrid.getMainGridId() };
/* 370 */       return update(objs);
/*     */     }
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.grid.dao.jdbc.MainGridJdbcDao
 * JD-Core Version:    0.5.3
 */