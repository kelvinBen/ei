/*     */package net.mast.demo.foods.dao.support;

/*     */
/*     */import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import net.mast.commons.id.UUIDHexGenerator;
import net.mast.commons.jdbc.core.BatchUpdateData;
import net.mast.commons.jdbc.core.SqlParameter;
import net.mast.commons.jdbc.object.MappingSqlQuery;
import net.mast.commons.jdbc.object.SqlUpdate;
import net.mast.demo.foods.dao.IXubiaoDao;
import net.mast.demo.foods.domain.Xubiao;
import net.mast.util.Page;
import net.mast.util.RowSelection;
import net.mast.util.domain.BaseJdbcDao;

/*     */
/*     */public class XubiaoJdbcDao extends BaseJdbcDao
/*     */implements IXubiaoDao
/*     */{
	/*  28 */private static UUIDHexGenerator uuidHexGenerator = null;
	/*     */private static final String insertSql = "insert into XUBIAO ( XB_ID )  values  ( ? ) ";
	/*     */private static final String deleteSql = "delete from XUBIAO where XB_ID = ? ";
	/*     */private static final String detailSql = "select XB_ID from XUBIAO";
	/*     */private static final String updateSql = "update XUBIAO set  where XB_ID = ? ";
	/*     */private static final String querySql = "select XB_ID from XUBIAO";
	/*  50 */private SqlUpdate deleter = null;
	/*  51 */private SqlUpdate inserter = null;
	/*  52 */private SqlUpdate updater = null;

	/*     */
	/*     */protected void initDao() {
		/*  55 */if (this.deleter == null) {
			/*  56 */this.deleter = new SqlUpdate(getDataSource(), "delete from XUBIAO where XB_ID = ? ");
			/*  57 */this.deleter.declareParameter(new SqlParameter(12));
			/*  58 */this.deleter.compile();
			/*     */}
		/*  60 */if (this.inserter == null) {
			/*  61 */this.inserter = new SqlUpdate(getDataSource(), "insert into XUBIAO ( XB_ID )  values  ( ? ) ");
			/*  62 */this.inserter.declareParameter(new SqlParameter(12));
			/*  63 */this.inserter.compile();
			/*     */}
		/*  65 */if (this.updater == null) {
			/*  66 */this.updater = new SqlUpdate(getDataSource(), "update XUBIAO set  where XB_ID = ? ");
			/*  67 */this.updater.declareParameter(new SqlParameter(12));
			/*  68 */this.updater.compile();
			/*     */}
		/*     */}

	/*     */
	/*     */public int delete(String xbId)
	/*     */{
		/*  79 */Object[] args = { xbId };
		/*  80 */return this.deleter.update(args);
		/*     */}

	/*     */
	/*     */public Xubiao get(String xbId)
	/*     */{
		/*  89 */XubiaoQuery queryer = new XubiaoQuery(getDataSource(), "select XB_ID from XUBIAO");
		/*  90 */queryer.setPageAble(true);
		/*  91 */queryer.compile();
		/*  92 */List list = queryer.execute();
		/*  93 */Iterator iterator = list.iterator();
		/*  94 */Xubiao xubiao = null;
		/*  95 */while (iterator.hasNext()) {
			/*  96 */xubiao = (Xubiao) iterator.next();
			/*     */}
		/*  98 */return xubiao;
		/*     */}

	/*     */
	/*     */public Xubiao insert(Xubiao xubiao)
	/*     */{
		/* 108 */return xubiao;
		/*     */}

	/*     */
	/*     */public void batchInsert(final List xubiaoList)
	/*     */{
		/* 117 */if ((xubiaoList == null) || (xubiaoList.size() <= 0)) {
			/* 118 */return;
			/*     */}
		/* 120 */BatchUpdateData bud = new BatchUpdateData() {
			/*     */public Object[] getRow(int index) {
				/* 122 */Object[] args = new Object[0];
				/* 123 */return args;
			}

			/*     */
			/*     */public int getRowNum() {
				/* 126 */return xubiaoList.size();
				/*     */}
			/*     */
		};
		/* 129 */this.inserter.batchUpdate(bud);
		/*     */}

	/*     */
	/*     */public Xubiao update(Xubiao xubiao)
	/*     */{
		/* 138 */return xubiao;
		/*     */}

	/*     */
	/*     */public void batchUpdate(final List xubiaoList)
	/*     */{
		/* 147 */if ((xubiaoList == null) || (xubiaoList.size() <= 0)) {
			/* 148 */return;
			/*     */}
		/* 150 */BatchUpdateData bud = new BatchUpdateData() {
			/*     */public Object[] getRow(int index) {
				/* 152 */Object[] args = new Object[0];
				/* 153 */return args;
			}

			/*     */
			/*     */public int getRowNum() {
				/* 156 */return xubiaoList.size();
				/*     */}
			/*     */
		};
		/* 159 */this.updater.batchUpdate(bud);
		/*     */}

	/*     */
	/*     */public Page query(RowSelection rowSelection, Map map)
	/*     */{
		/* 168 */StringBuffer sb = new StringBuffer("select XB_ID from XUBIAO");
		/*     */
		/* 170 */StringBuffer wherestring = new StringBuffer();
		/* 171 */Iterator paramnames = map.keySet().iterator();
		/* 172 */while (paramnames.hasNext()) {
			/* 173 */String paramname = (String) paramnames.next();
			/* 174 */int pos = paramname.indexOf("_SEARCH");
			/* 175 */if (pos <= 0) {
				/*     */continue;
				/*     */}
			/* 178 */String value = null;
			/* 179 */Object o = map.get(paramname);
			/* 180 */if (o instanceof String[]) {
				/* 181 */String[] os = (String[]) o;
				/* 182 */if (os.length > 0)
					/* 183 */value = os[0];
				/*     */}
			/*     */else {
				/* 186 */value = (String) o;
				/*     */}
			/* 188 */if ((value != null) && (!(value.equals("")))) {
				/* 189 */String fieldname = paramname.substring(0, pos);
				/* 190 */if (wherestring.length() == 0)
					/* 191 */wherestring.append(" where ");
				/*     */else {
					/* 193 */wherestring.append(" and ");
					/*     */}
				/* 195 */wherestring.append(fieldname).append(" like '%").append(value).append("%' ");
				/*     */}
			/*     */}
		/* 198 */StringBuffer orderstring = new StringBuffer();
		/* 199 */String sortname = (String) map.get("sortName");
		/* 200 */String sorttype = (String) map.get("sortType");
		/* 201 */if ((sortname != null) && (!(sortname.equals("")))) {
			/* 202 */orderstring.append(" order by ").append(sortname);
			/*     */}
		/* 204 */if (sorttype != null) {
			/* 205 */orderstring.append(" " + sorttype);
			/*     */}
		/* 207 */sb.append(wherestring).append(orderstring);
		/*     */
		/* 209 */XubiaoQuery queryer = new XubiaoQuery(getDataSource(), sb.toString());
		/* 210 */queryer.setPageAble(true);
		/* 211 */queryer.compile();
		/* 212 */return queryer.executePage(rowSelection);
		/*     */}

	/*     */
	/*     */public List queryNoPage(Map map)
	/*     */{
		/* 221 */StringBuffer sb = new StringBuffer("select XB_ID from XUBIAO");
		/*     */
		/* 223 */StringBuffer wherestring = new StringBuffer();
		/* 224 */Iterator paramnames = map.keySet().iterator();
		/* 225 */while (paramnames.hasNext()) {
			/* 226 */String paramname = (String) paramnames.next();
			/* 227 */int pos = paramname.indexOf("_SEARCH");
			/* 228 */if (pos <= 0) {
				/*     */continue;
				/*     */}
			/* 231 */String value = null;
			/* 232 */Object o = map.get(paramname);
			/* 233 */if (o instanceof String[]) {
				/* 234 */String[] os = (String[]) o;
				/* 235 */if (os.length > 0)
					/* 236 */value = os[0];
				/*     */}
			/*     */else {
				/* 239 */value = (String) o;
				/*     */}
			/* 241 */if ((value != null) && (!(value.equals("")))) {
				/* 242 */String fieldname = paramname.substring(0, pos);
				/* 243 */if (wherestring.length() == 0)
					/* 244 */wherestring.append(" where ");
				/*     */else {
					/* 246 */wherestring.append(" and ");
					/*     */}
				/* 248 */wherestring.append(fieldname).append(" like '%").append(value).append("%' ");
				/*     */}
			/*     */}
		/* 251 */StringBuffer orderstring = new StringBuffer();
		/* 252 */String sortname = (String) map.get("sortName");
		/* 253 */String sorttype = (String) map.get("sortType");
		/* 254 */if ((sortname != null) && (!(sortname.equals("")))) {
			/* 255 */orderstring.append(" order by ").append(sortname);
			/*     */}
		/* 257 */if (sorttype != null) {
			/* 258 */orderstring.append(" " + sorttype);
			/*     */}
		/* 260 */sb.append(wherestring).append(orderstring);
		/*     */
		/* 262 */XubiaoQuery queryer = new XubiaoQuery(getDataSource(), sb.toString());
		/* 263 */queryer.setPageAble(true);
		/* 264 */queryer.compile();
		/* 265 */return queryer.execute();
		/*     */}

	/*     */
	/*     */private String getUUID(int len)
	/*     */{
		/* 270 */if (uuidHexGenerator == null) {
			/* 271 */uuidHexGenerator = new UUIDHexGenerator();
			/*     */}
		/* 273 */String id = String.valueOf(uuidHexGenerator.generate());
		/* 274 */if (id.length() > len) {
			/* 275 */return id.substring(id.length() - len);
			/*     */}
		/* 277 */return id;
		/*     */}

	/*     */
	/*     */protected static class XubiaoQuery extends MappingSqlQuery
	/*     */{
		/*     */public XubiaoQuery(DataSource ds, String sql)
		/*     */{
			/*  42 */super(ds, sql);
		}

		/*     */
		/*     */protected Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			/*  45 */Xubiao xubiao = new Xubiao();
			/*  46 */return xubiao;
			/*     */}
		/*     */
	}
	/*     */
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.foods.dao.support.XubiaoJdbcDao
 * JD-Core Version:    0.5.3
 */