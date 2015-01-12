/*     */package net.mast.demo.example.dao.jdbc;

/*     */
/*     */import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import net.mast.commons.id.UUIDHexGenerator;
import net.mast.commons.jdbc.core.SqlParameter;
import net.mast.commons.jdbc.object.MappingSqlQuery;
import net.mast.commons.jdbc.object.SqlLobUpdate;
import net.mast.commons.jdbc.object.SqlUpdate;
import net.mast.demo.example.dao.IMainblobDao;
import net.mast.demo.example.data.Blobitem;
import net.mast.demo.example.data.Mainblob;
import net.mast.util.Page;
import net.mast.util.RowSelection;
import net.mast.util.domain.BaseJdbcDao;
import net.mast.web.upload.util.ByteArrayProxy;
import net.mast.web.upload.util.ByteArrayProxyFactory;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/*     */
/*     */public class MainblobJdbcDao extends BaseJdbcDao
/*     */implements IMainblobDao
/*     */{
	/*  33 */private static Log log = LogFactory.getLog(MainblobJdbcDao.class);
	/*     */
	/*  35 */private static final String insertMainblobSql = getMainblobInsertSql();
	/*     */
	/*  37 */private static final String deleteMainblobSql = getMainblobDeleteSql();
	/*     */
	/*  39 */private static final String detailMainblobSql = getMainblobDetailSql();
	/*     */
	/*  41 */private static final String updateMainblobSql = getMainblobUpdateSql();
	/*     */
	/*  43 */private static final String insertBlobitemSql = getBlobitemInsertSql();
	/*     */
	/*  45 */private static final String deleteBlobitemSql = getBlobitemDeleteSql();
	/*     */
	/*  47 */private static final String deleteBlobitemAllSql = getBlobitemDeleteAllSql();
	/*     */
	/*  49 */private static final String updateBlobitemSql = getBlobitemUpdateSql();
	/*     */
	/*  51 */private static final String detailBlobitemSql = getBlobitemDetailSql();
	/*     */private static final String detailBlobItemSqlNoStream = "select MAIN_ID,FILE_ID, FILE_NAME,FILE_TYPE from BLOBITEM where FILE_ID=?";
	/*  55 */private static final String querySql = getQuerySql();
	/*     */
	/* 456 */private MainblobDelete deleter = null;
	/* 457 */private MainblobInsert inserter = null;
	/* 458 */private MainblobDetail finder = null;
	/* 459 */private MainblobUpdate updater = null;
	/*     */
	/* 461 */private BlobitemInsert lineinserter = null;
	/* 462 */private BlobitemDeleteAll linedeletealler = null;
	/* 463 */private BlobitemDelete linedeleter = null;
	/* 464 */private BlobitemUpdate lineupdater = null;
	/* 465 */private BlobitemDetail linefinder = null;
	/*     */
	/* 467 */private BlobItemDetailSqlNoStream linedetailno = null;

	/*     */
	/*     */public static String getMainblobInsertSql()
	/*     */{
		/*  63 */StringBuffer sb = new StringBuffer();
		/*  64 */sb.append("INSERT INTO MAINBLOB (");
		/*  65 */sb.append("MAIN_ID");
		/*  66 */sb.append(",");
		/*  67 */sb.append("MAIN_OPERATORCODE");
		/*  68 */sb.append(",");
		/*  69 */sb.append("MAIN_OPERATEDATE");
		/*  70 */sb.append(") VALUES(");
		/*  71 */sb.append("?");
		/*  72 */sb.append(",");
		/*  73 */sb.append("?");
		/*  74 */sb.append(",");
		/*  75 */sb.append("?");
		/*  76 */sb.append(")");
		/*  77 */return sb.toString();
		/*     */}

	/*     */
	/*     */public static String getMainblobUpdateSql()
	/*     */{
		/*  83 */StringBuffer sb = new StringBuffer();
		/*  84 */sb.append("UPDATE MAINBLOB SET ");
		/*  85 */sb.append("MAIN_OPERATORCODE=?");
		/*  86 */sb.append(" , ");
		/*  87 */sb.append("MAIN_OPERATEDATE=?");
		/*  88 */sb.append(" WHERE ");
		/*  89 */sb.append("MAIN_ID=?");
		/*  90 */return sb.toString();
		/*     */}

	/*     */
	/*     */public static String getMainblobDeleteSql()
	/*     */{
		/*  96 */StringBuffer sb = new StringBuffer();
		/*  97 */sb.append("DELETE FROM MAINBLOB WHERE ");
		/*  98 */sb.append("MAIN_ID=?");
		/*  99 */return sb.toString();
		/*     */}

	/*     */
	/*     */public static String getMainblobDetailSql()
	/*     */{
		/* 105 */StringBuffer sb = new StringBuffer();
		/* 106 */sb.append("SELECT ");
		/* 107 */sb.append("MAIN_ID");
		/* 108 */sb.append(",");
		/* 109 */sb.append("MAIN_OPERATORCODE");
		/* 110 */sb.append(",");
		/* 111 */sb.append("MAIN_OPERATEDATE");
		/* 112 */sb.append(" FROM MAINBLOB WHERE ");
		/* 113 */sb.append("MAIN_ID=?");
		/* 114 */return sb.toString();
		/*     */}

	/*     */
	/*     */public static String getBlobitemInsertSql()
	/*     */{
		/* 121 */StringBuffer sb = new StringBuffer();
		/*     */
		/* 123 */sb.append("INSERT INTO BLOBITEM (");
		/* 124 */sb.append("MAIN_ID");
		/* 125 */sb.append(",");
		/* 126 */sb.append("FILE_ID");
		/* 127 */sb.append(",");
		/* 128 */sb.append("FILE_TYPE");
		/* 129 */sb.append(",");
		/* 130 */sb.append("FILE_NAME");
		/* 131 */sb.append(",");
		/* 132 */sb.append("FILE_CONTENT");
		/* 133 */sb.append(") VALUES(");
		/* 134 */sb.append("?");
		/* 135 */sb.append(",");
		/* 136 */sb.append("?");
		/* 137 */sb.append(",");
		/* 138 */sb.append("?");
		/* 139 */sb.append(",");
		/* 140 */sb.append("?");
		/* 141 */sb.append(",");
		/* 142 */sb.append("?");
		/* 143 */sb.append(")");
		/*     */
		/* 145 */return sb.toString();
		/*     */}

	/*     */
	/*     */public static String getBlobitemDeleteSql() {
		/* 149 */StringBuffer sb = new StringBuffer();
		/*     */
		/* 151 */sb.append("DELETE FROM BLOBITEM WHERE ");
		/* 152 */sb.append("MAIN_ID=? ");
		/* 153 */sb.append("AND FILE_ID=?");
		/*     */
		/* 155 */return sb.toString();
		/*     */}

	/*     */
	/*     */public static String getBlobitemDeleteAllSql() {
		/* 159 */StringBuffer sb = new StringBuffer();
		/*     */
		/* 161 */sb.append("DELETE FROM BLOBITEM WHERE ");
		/* 162 */sb.append("MAIN_ID=?");
		/*     */
		/* 164 */return sb.toString();
		/*     */}

	/*     */
	/*     */public static String getBlobitemUpdateSql()
	/*     */{
		/* 170 */StringBuffer sb = new StringBuffer();
		/*     */
		/* 172 */sb.append("UPDATE BLOBITEM SET ");
		/* 173 */sb.append("FILE_TYPE=?");
		/* 174 */sb.append(",");
		/* 175 */sb.append("FILE_NAME=?");
		/* 176 */sb.append(",");
		/* 177 */sb.append("FILE_CONTENT=? ");
		/* 178 */sb.append("WHERE ");
		/* 179 */sb.append("MAIN_ID=? ");
		/* 180 */sb.append("AND ");
		/* 181 */sb.append("FILE_ID=?");
		/*     */
		/* 183 */return sb.toString();
		/*     */}

	/*     */
	/*     */public static String getBlobitemDetailSql()
	/*     */{
		/* 189 */StringBuffer sb = new StringBuffer();
		/*     */
		/* 191 */sb.append("SELECT ");
		/* 192 */sb.append("MAIN_ID");
		/* 193 */sb.append(",");
		/* 194 */sb.append("FILE_ID");
		/* 195 */sb.append(",");
		/* 196 */sb.append("FILE_TYPE");
		/* 197 */sb.append(",");
		/* 198 */sb.append("FILE_NAME");
		/* 199 */sb.append(",");
		/* 200 */sb.append("FILE_CONTENT");
		/* 201 */sb.append(" FROM BLOBITEM WHERE ");
		/* 202 */sb.append("MAIN_ID=?");
		/*     */
		/* 204 */return sb.toString();
		/*     */}

	/*     */
	/*     */public static String getQuerySql()
	/*     */{
		/* 210 */StringBuffer sb = new StringBuffer();
		/*     */
		/* 212 */sb.append("SELECT ");
		/* 213 */sb.append("MAIN_ID");
		/* 214 */sb.append(",");
		/* 215 */sb.append("MAIN_OPERATORCODE");
		/* 216 */sb.append(",");
		/* 217 */sb.append("MAIN_OPERATEDATE");
		/* 218 */sb.append(" FROM MAINBLOB");
		/*     */
		/* 220 */return sb.toString();
		/*     */}

	/*     */
	/*     */protected void initDao()
	/*     */{
		/* 472 */if (this.inserter == null) {
			/* 473 */this.inserter = new MainblobInsert(getDataSource());
			/* 474 */this.inserter.compile();
			/*     */}
		/* 476 */if (this.deleter == null) {
			/* 477 */this.deleter = new MainblobDelete(getDataSource());
			/* 478 */this.deleter.compile();
			/*     */}
		/* 480 */if (this.updater == null) {
			/* 481 */this.updater = new MainblobUpdate(getDataSource());
			/* 482 */this.updater.compile();
			/*     */}
		/* 484 */if (this.finder == null) {
			/* 485 */this.finder = new MainblobDetail(getDataSource());
			/* 486 */this.finder.compile();
			/*     */}
		/*     */
		/* 489 */if (this.lineinserter == null) {
			/* 490 */this.lineinserter = new BlobitemInsert(getDataSource());
			/* 491 */this.lineinserter.compile();
			/*     */}
		/* 493 */if (this.linedeletealler == null) {
			/* 494 */this.linedeletealler = new BlobitemDeleteAll(getDataSource());
			/* 495 */this.linedeletealler.compile();
			/*     */}
		/* 497 */if (this.linedeleter == null) {
			/* 498 */this.linedeleter = new BlobitemDelete(getDataSource());
			/* 499 */this.linedeleter.compile();
			/*     */}
		/* 501 */if (this.lineupdater == null) {
			/* 502 */this.lineupdater = new BlobitemUpdate(getDataSource());
			/* 503 */this.lineupdater.compile();
			/*     */}
		/* 505 */if (this.linefinder == null) {
			/* 506 */this.linefinder = new BlobitemDetail(getDataSource());
			/* 507 */this.linefinder.compile();
			/*     */}
		/* 509 */if (this.linedetailno == null)
			/* 510 */this.linedetailno = new BlobItemDetailSqlNoStream(getDataSource());
		/*     */}

	/*     */
	/*     */public void deleteMainblob(String mainId)
	/*     */{
		/* 518 */this.linedeletealler.delete(mainId);
		/* 519 */this.deleter.delete(mainId);
		/*     */}

	/*     */
	/*     */public Mainblob getMainblob(String mainId)
	/*     */{
		/* 526 */Mainblob head = this.finder.load(mainId);
		/* 527 */List linelist = this.linefinder.getBlobitem(mainId);
		/* 528 */head.setListBlobitem(linelist);
		/*     */
		/* 530 */return head;
		/*     */}

	/*     */
	/*     */public Mainblob insertMainblob(Mainblob mainblob)
	/*     */{
		/* 536 */String mainId = mainblob.getMainId();
		/* 537 */this.inserter.insert(mainblob);
		/*     */
		/* 539 */List list = mainblob.getListBlobitem();
		/* 540 */for (int i = 0; i < list.size(); ++i)
		/*     */{
			/* 542 */Blobitem blobItem = (Blobitem) list.get(i);
			/*     */
			/* 544 */if (blobItem.getFileContent() == null) {
				/*     */continue;
				/*     */}
			/*     */
			/* 548 */UUIDHexGenerator uuidHexGenerator = new UUIDHexGenerator();
			/* 549 */String UUID32 = String.valueOf(uuidHexGenerator.generate());
			/*     */
			/* 551 */String UUID30 = UUID32.substring(2);
			/* 552 */blobItem.setFileId(UUID30);
			/*     */
			/* 554 */this.lineinserter.insert(blobItem, mainId);
			/*     */}
		/*     */
		/* 557 */return getMainblob(mainId);
		/*     */}

	/*     */
	/*     */public Mainblob updateMainblob(Mainblob mainblob)
	/*     */{
		/* 564 */String mainId = mainblob.getMainId();
		/*     */
		/* 566 */this.updater.update(mainblob);
		/*     */
		/* 568 */List list = mainblob.getListBlobitem();
		/* 569 */String flag = "";
		/*     */
		/* 571 */for (int i = 0; i < list.size(); ++i)
		/*     */{
			/* 573 */Blobitem blobItem = (Blobitem) list.get(i);
			/* 574 */String fileId = blobItem.getFileId();
			/* 575 */flag = blobItem.getIsDelete();
			/*     */
			/* 577 */if (flag.equals("1"))
			/*     */{
				/* 579 */this.linedeleter.delete(mainId, fileId);
				/*     */}
			/*     */else
			/*     */{
				/* 583 */ByteArrayProxy fileContent = blobItem.getFileContent();
				/*     */
				/* 585 */if (fileContent == null)
				/*     */{
					/*     */continue;
					/*     */}
				/*     */
				/* 591 */if ((fileId.equals("")) || (fileId == null))
				/*     */{
					/* 593 */UUIDHexGenerator uuidHexGenerator = new UUIDHexGenerator();
					/* 594 */String UUID32 = String.valueOf(uuidHexGenerator.generate());
					/*     */
					/* 596 */String UUID30 = UUID32.substring(2);
					/* 597 */blobItem.setFileId(UUID30);
					/*     */
					/* 599 */this.lineinserter.insert(blobItem, mainId);
					/*     */}
				/*     */else
				/*     */{
					/* 603 */this.lineupdater.update(blobItem, mainId);
					/*     */}
				/*     */}
			/*     */
			/*     */}
		/*     */
		/* 609 */return getMainblob(mainId);
		/*     */}

	/*     */
	/*     */public Page getAllMainblob(RowSelection rowSelection, Map map)
	/*     */{
		/* 615 */MainblobQuery queryer = new MainblobQuery(getDataSource());
		/* 616 */StringBuffer sb = new StringBuffer(queryer.getSql());
		/* 617 */String[] searchId = new String[3];
		/* 618 */String[] sa0 = (String[]) map.get("main_idSearch");
		/* 619 */if (sa0 != null) {
			/* 620 */searchId[0] = sa0[0];
			/*     */}
		/* 622 */String[] sa1 = (String[]) map.get("main_operatorcodeSearch");
		/* 623 */if (sa1 != null) {
			/* 624 */searchId[1] = sa1[0];
			/*     */}
		/* 626 */String[] sa2 = (String[]) map.get("main_operatedateSearch");
		/* 627 */if (sa2 != null) {
			/* 628 */searchId[2] = sa2[0];
			/*     */}
		/* 630 */boolean whFlag = false;
		/* 631 */for (int i = 0; i < searchId.length; ++i) {
			/* 632 */if ((searchId[i] == null) ||
			/* 633 */(searchId[i].equalsIgnoreCase("")))
				continue;
			/* 634 */whFlag = true;
			/*     */}
		/*     */
		/* 638 */if (whFlag) {
			/* 639 */sb.append(" WHERE ");
			/*     */}
		/* 641 */boolean andFlag = false;
		/* 642 */if ((searchId[0] != null) &&
		/* 643 */(!(searchId[0].equalsIgnoreCase("")))) {
			/* 644 */if (andFlag) {
				/* 645 */sb.append(" AND ");
				/*     */}
			/* 647 */sb.append("MAINBLOB.MAIN_ID like '%").append(searchId[0]).append("%'");
			/* 648 */andFlag = true;
			/*     */}
		/*     */
		/* 651 */if ((searchId[1] != null) &&
		/* 652 */(!(searchId[1].equalsIgnoreCase("")))) {
			/* 653 */if (andFlag) {
				/* 654 */sb.append(" AND ");
				/*     */}
			/* 656 */sb.append("MAINBLOB.MAIN_OPERATORCODE like '%").append(searchId[1]).append("%'");
			/* 657 */andFlag = true;
			/*     */}
		/*     */
		/* 660 */if ((searchId[2] != null) &&
		/* 661 */(!(searchId[2].equalsIgnoreCase("")))) {
			/* 662 */if (andFlag) {
				/* 663 */sb.append(" AND ");
				/*     */}
			/* 665 */sb.append("MAINBLOB.MAIN_OPERATEDATE like '%").append(searchId[2]).append("%'");
			/*     */}
		/*     */
		/* 668 */queryer.setSql(sb.toString());
		/* 669 */queryer.setPageAble(true);
		/* 670 */queryer.compile();
		/* 671 */return queryer.executePage(rowSelection);
		/*     */}

	/*     */
	/*     */public List getAllMainblobNoPage(Map map)
	/*     */{
		/* 680 */MainblobQuery queryer = new MainblobQuery(getDataSource());
		/* 681 */StringBuffer sb = new StringBuffer(queryer.getSql());
		/* 682 */String[] searchId = new String[3];
		/* 683 */String[] sa0 = (String[]) map.get("main_idSearch");
		/* 684 */if (sa0 != null) {
			/* 685 */searchId[0] = sa0[0];
			/*     */}
		/* 687 */String[] sa1 = (String[]) map.get("main_operatorcodeSearch");
		/* 688 */if (sa1 != null) {
			/* 689 */searchId[1] = sa1[0];
			/*     */}
		/* 691 */String[] sa2 = (String[]) map.get("main_operatedateSearch");
		/* 692 */if (sa2 != null) {
			/* 693 */searchId[2] = sa2[0];
			/*     */}
		/* 695 */boolean whFlag = false;
		/* 696 */for (int i = 0; i < searchId.length; ++i) {
			/* 697 */if ((searchId[i] == null) ||
			/* 698 */(searchId[i].equalsIgnoreCase("")))
				continue;
			/* 699 */whFlag = true;
			/*     */}
		/*     */
		/* 703 */if (whFlag) {
			/* 704 */sb.append(" WHERE ");
			/*     */}
		/* 706 */boolean andFlag = false;
		/* 707 */if ((searchId[0] != null) &&
		/* 708 */(!(searchId[0].equalsIgnoreCase("")))) {
			/* 709 */if (andFlag) {
				/* 710 */sb.append(" AND ");
				/*     */}
			/* 712 */sb.append("MAINBLOB.MAIN_ID like '%").append(searchId[0]).append("%'");
			/* 713 */andFlag = true;
			/*     */}
		/*     */
		/* 716 */if ((searchId[1] != null) &&
		/* 717 */(!(searchId[1].equalsIgnoreCase("")))) {
			/* 718 */if (andFlag) {
				/* 719 */sb.append(" AND ");
				/*     */}
			/* 721 */sb.append("MAINBLOB.MAIN_OPERATORCODE like '%").append(searchId[1]).append("%'");
			/* 722 */andFlag = true;
			/*     */}
		/*     */
		/* 725 */if ((searchId[2] != null) &&
		/* 726 */(!(searchId[2].equalsIgnoreCase("")))) {
			/* 727 */if (andFlag) {
				/* 728 */sb.append(" AND ");
				/*     */}
			/* 730 */sb.append("MAINBLOB.MAIN_OPERATEDATE like '%").append(searchId[2]).append("%'");
			/*     */}
		/*     */
		/* 733 */queryer.setSql(sb.toString());
		/* 734 */queryer.setPageAble(true);
		/* 735 */queryer.compile();
		/* 736 */return queryer.execute();
		/*     */}

	/*     */
	/*     */protected static class BlobItemDetailSqlNoStream extends MappingSqlQuery
	/*     */{
		/*     */protected BlobItemDetailSqlNoStream(DataSource ds)
		/*     */{
			/* 423 */super(ds, "select MAIN_ID,FILE_ID, FILE_NAME,FILE_TYPE from BLOBITEM where FILE_ID=?");
			/* 424 */declareParameter(new SqlParameter(12));
		}

		/*     */
		/*     */protected Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			/* 427 */Blobitem file = new Blobitem();
			/* 428 */file.setMainId(rs.getString("MAIN_ID"));
			/* 429 */file.setFileId(rs.getString("FILE_ID"));
			/* 430 */file.setFileType(rs.getString("FILE_TYPE"));
			/* 431 */file.setFileName(rs.getString("FILE_NAME"));
			/* 432 */return file;
		}

		/*     */
		/*     */public List getBlob(String mainId) {
			/* 435 */return execute(new Object[] { mainId });
			/*     */}
		/*     */
	}

	/*     */
	/*     */protected static class BlobitemDelete extends SqlUpdate
	/*     */{
		/*     */protected BlobitemDelete(DataSource ds)
		/*     */{
			/* 338 */super(ds, MainblobJdbcDao.deleteBlobitemSql);
			/*     */
			/* 340 */declareParameter(new SqlParameter(12));
			/* 341 */declareParameter(new SqlParameter(12));
			/*     */}

		/*     */
		/*     */public int delete(String mainId, String fileId) {
			/* 345 */Object[] objs = { mainId, fileId };
			/* 346 */return update(objs);
			/*     */}
		/*     */
	}

	/*     */
	/*     */protected static class BlobitemDeleteAll extends SqlLobUpdate
	/*     */{
		/*     */protected BlobitemDeleteAll(DataSource ds)
		/*     */{
			/* 356 */super(ds, MainblobJdbcDao.deleteBlobitemAllSql);
			/*     */
			/* 358 */declareParameter(new SqlParameter(12));
			/*     */}

		/*     */
		/*     */public int delete(String mainId) {
			/* 362 */Object[] objs = { mainId };
			/* 363 */return update(objs);
			/*     */}
		/*     */
	}

	/*     */
	/*     */protected static class BlobitemDetail extends MappingSqlQuery
	/*     */{
		/*     */protected BlobitemDetail(DataSource ds)
		/*     */{
			/* 399 */super(ds, MainblobJdbcDao.detailBlobitemSql);
			/*     */
			/* 401 */declareParameter(new SqlParameter(12));
		}

		/*     */
		/*     */protected Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			/* 404 */Blobitem blobitem = new Blobitem();
			/* 405 */blobitem.setMainId(rs.getString("MAIN_ID"));
			/* 406 */blobitem.setFileId(rs.getString("FILE_ID"));
			/* 407 */blobitem.setFileType(rs.getString("FILE_TYPE"));
			/* 408 */blobitem.setFileName(rs.getString("FILE_NAME"));
			/* 409 */ByteArrayProxy proxy = ByteArrayProxyFactory.getInstance().getProxy(
					rs.getBinaryStream("FILE_CONTENT"));
			/* 410 */blobitem.setFileContent(proxy);
			/*     */
			/* 412 */return blobitem;
		}

		/*     */
		/*     */public List getBlobitem(String mainId) {
			/* 415 */return execute(new Object[] { mainId });
			/*     */}
		/*     */
	}

	/*     */
	/*     */protected static class BlobitemInsert extends SqlLobUpdate
	/*     */{
		/*     */protected BlobitemInsert(DataSource ds)
		/*     */{
			/* 310 */super(ds, MainblobJdbcDao.insertBlobitemSql);
			/*     */
			/* 312 */declareParameter(new SqlParameter(12));
			/* 313 */declareParameter(new SqlParameter(12));
			/* 314 */declareParameter(new SqlParameter(12));
			/* 315 */declareParameter(new SqlParameter(12));
			/* 316 */declareParameter(new SqlParameter(2004));
			/*     */}

		/*     */
		/*     */public int insert(Blobitem blobitem, String mainId)
		/*     */{
			/* 321 */Object[] objs =
			/* 322 */{
			/* 323 */mainId,
			/* 324 */blobitem.getFileId(),
			/* 325 */blobitem.getFileType(),
			/* 326 */blobitem.getFileName(),
			/* 327 */blobitem.getFileContent().getInputStream() };
			/*     */
			/* 330 */return update(objs);
			/*     */}
		/*     */
	}

	/*     */
	/*     */protected static class BlobitemUpdate extends SqlLobUpdate
	/*     */{
		/*     */protected BlobitemUpdate(DataSource ds)
		/*     */{
			/* 371 */super(ds, MainblobJdbcDao.updateBlobitemSql);
			/*     */
			/* 373 */declareParameter(new SqlParameter(12));
			/* 374 */declareParameter(new SqlParameter(12));
			/* 375 */declareParameter(new SqlParameter(2004));
			/* 376 */declareParameter(new SqlParameter(12));
			/* 377 */declareParameter(new SqlParameter(12));
			/*     */}

		/*     */
		/*     */public int update(Blobitem blobitem, String mainId)
		/*     */{
			/* 382 */Object[] objs =
			/* 383 */{
			/* 384 */blobitem.getFileType(),
			/* 385 */blobitem.getFileName(),
			/* 386 */blobitem.getFileContent().getInputStream(),
			/* 387 */mainId,
			/* 388 */blobitem.getFileId() };
			/*     */
			/* 391 */return update(objs);
			/*     */}
		/*     */
	}

	/*     */
	/*     */protected static class MainblobDelete extends SqlUpdate
	/*     */{
		/*     */protected MainblobDelete(DataSource ds)
		/*     */{
			/* 272 */super(ds, MainblobJdbcDao.deleteMainblobSql);
			/*     */
			/* 274 */declareParameter(new SqlParameter(12));
			/*     */}

		/*     */
		/*     */public int delete(String mainId) {
			/* 278 */Object[] objs = { mainId };
			/* 279 */return update(objs);
			/*     */}
		/*     */
	}

	/*     */
	/*     */protected static class MainblobDetail extends MappingSqlQuery
	/*     */{
		/*     */protected MainblobDetail(DataSource ds)
		/*     */{
			/* 228 */super(ds, MainblobJdbcDao.detailMainblobSql);
			/*     */
			/* 230 */declareParameter(new SqlParameter(12));
		}

		/*     */
		/*     */protected Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			/* 233 */Mainblob mainblob = new Mainblob();
			/* 234 */mainblob.setMainId(rs.getString("MAIN_ID"));
			/* 235 */mainblob.setMainOperatorcode(rs.getString("MAIN_OPERATORCODE"));
			/* 236 */mainblob.setMainOperatedate(rs.getString("MAIN_OPERATEDATE"));
			/* 237 */return mainblob;
			/*     */}

		/*     */
		/*     */public Mainblob load(String mainId) {
			/* 241 */return ((Mainblob) findObject(new Object[] { mainId }));
			/*     */}
		/*     */
	}

	/*     */
	/*     */protected static class MainblobInsert extends SqlUpdate
	/*     */{
		/*     */protected MainblobInsert(DataSource ds)
		/*     */{
			/* 249 */super(ds, MainblobJdbcDao.insertMainblobSql);
			/*     */
			/* 251 */declareParameter(new SqlParameter(12));
			/* 252 */declareParameter(new SqlParameter(12));
			/* 253 */declareParameter(new SqlParameter(12));
			/*     */}

		/*     */
		/*     */public int insert(Mainblob mainblob) {
			/* 257 */Object[] objs =
			/* 258 */{
			/* 259 */mainblob.getMainId(),
			/* 260 */mainblob.getMainOperatorcode(),
			/* 261 */mainblob.getMainOperatedate() };
			/*     */
			/* 263 */return update(objs);
			/*     */}
		/*     */
	}

	/*     */
	/*     */protected static class MainblobQuery extends MappingSqlQuery
	/*     */{
		/*     */protected MainblobQuery(DataSource ds)
		/*     */{
			/* 444 */super(ds, MainblobJdbcDao.querySql);
		}

		/*     */
		/*     */protected Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			/* 447 */Mainblob mainblob = new Mainblob();
			/* 448 */mainblob.setMainId(rs.getString("MAIN_ID"));
			/* 449 */mainblob.setMainOperatorcode(rs.getString("MAIN_OPERATORCODE"));
			/* 450 */mainblob.setMainOperatedate(rs.getString("MAIN_OPERATEDATE"));
			/* 451 */return mainblob;
			/*     */}
		/*     */
	}

	/*     */
	/*     */protected static class MainblobUpdate extends SqlUpdate
	/*     */{
		/*     */protected MainblobUpdate(DataSource ds)
		/*     */{
			/* 287 */super(ds, MainblobJdbcDao.updateMainblobSql);
			/*     */
			/* 289 */declareParameter(new SqlParameter(12));
			/* 290 */declareParameter(new SqlParameter(12));
			/* 291 */declareParameter(new SqlParameter(12));
			/*     */}

		/*     */
		/*     */public int update(Mainblob mainblob) {
			/* 295 */Object[] objs =
			/* 296 */{
			/* 297 */mainblob.getMainOperatorcode(),
			/* 298 */mainblob.getMainOperatedate(),
			/* 299 */mainblob.getMainId() };
			/*     */
			/* 301 */return update(objs);
			/*     */}
		/*     */
	}
	/*     */
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.example.dao.jdbc.MainblobJdbcDao
 * JD-Core Version:    0.5.3
 */