/*     */package net.mast.demo.goods.dao.support;

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
import net.mast.demo.goods.dao.IGoodsDao;
import net.mast.demo.goods.domain.Goods;
import net.mast.util.Page;
import net.mast.util.RowSelection;
import net.mast.util.domain.BaseJdbcDao;

/*     */
/*     */public class GoodsJdbcDao extends BaseJdbcDao
/*     */implements IGoodsDao
/*     */{
	/*  27 */private static UUIDHexGenerator uuidHexGenerator = null;
	/*     */private static final String insertSql = "insert into GOODS ( GOODS_ID , GOODS_NAME , GOODS_PRICE )  values  ( ? , ? , ? ) ";
	/*     */private static final String deleteSql = "delete from GOODS where GOODS_ID = ? ";
	/*     */private static final String detailSql = "select GOODS_ID , GOODS_NAME , GOODS_PRICE from GOODS where GOODS_ID = ?";
	/*     */private static final String updateSql = "update GOODS set GOODS_NAME = ?  , GOODS_PRICE = ?  where GOODS_ID = ? ";
	/*     */private static final String querySql = "select GOODS_ID , GOODS_NAME , GOODS_PRICE from GOODS";
	/*  52 */private SqlUpdate deleter = null;
	/*  53 */private SqlUpdate inserter = null;
	/*  54 */private SqlUpdate updater = null;
	/*  55 */private GoodsQuery finder = null;

	/*     */
	/*     */protected void initDao() {
		/*  58 */if (this.deleter == null) {
			/*  59 */this.deleter = new SqlUpdate(getDataSource(), "delete from GOODS where GOODS_ID = ? ");
			/*  60 */this.deleter.declareParameter(new SqlParameter(12));
			/*  61 */this.deleter.compile();
			/*     */}
		/*  63 */if (this.inserter == null) {
			/*  64 */this.inserter = new SqlUpdate(getDataSource(),
					"insert into GOODS ( GOODS_ID , GOODS_NAME , GOODS_PRICE )  values  ( ? , ? , ? ) ");
			/*  65 */this.inserter.declareParameter(new SqlParameter(12));
			/*  66 */this.inserter.declareParameter(new SqlParameter(12));
			/*  67 */this.inserter.declareParameter(new SqlParameter(12));
			/*  68 */this.inserter.compile();
			/*     */}
		/*  70 */if (this.updater == null) {
			/*  71 */this.updater = new SqlUpdate(getDataSource(),
					"update GOODS set GOODS_NAME = ?  , GOODS_PRICE = ?  where GOODS_ID = ? ");
			/*  72 */this.updater.declareParameter(new SqlParameter(12));
			/*  73 */this.updater.declareParameter(new SqlParameter(12));
			/*  74 */this.updater.declareParameter(new SqlParameter(12));
			/*  75 */this.updater.compile();
			/*     */}
		/*  77 */if (this.finder == null) {
			/*  78 */this.finder = new GoodsQuery(getDataSource(),
					"select GOODS_ID , GOODS_NAME , GOODS_PRICE from GOODS where GOODS_ID = ?");
			/*  79 */this.finder.declareParameter(new SqlParameter(12));
			/*  80 */this.finder.compile();
			/*     */}
		/*     */}

	/*     */
	/*     */public int delete(String goodsId)
	/*     */{
		/*  90 */Object[] args = { goodsId };
		/*  91 */return this.deleter.update(args);
		/*     */}

	/*     */
	/*     */public Goods get(String goodsId)
	/*     */{
		/* 100 */Object[] args = { goodsId };
		/* 101 */return ((Goods) this.finder.findObject(args));
		/*     */}

	/*     */
	/*     */public Goods insert(Goods goods)
	/*     */{
		/* 110 */String GOODS_ID = goods.getGoodsId();
		/* 111 */if (GOODS_ID.equals("")) {
			/* 112 */GOODS_ID = getUUID(32);
			/* 113 */goods.setGoodsId(GOODS_ID);
			/*     */}
		/*     */
		/* 116 */Object[] args = { GOODS_ID, goods.getGoodsName(), goods.getGoodsPrice() };
		/* 117 */this.inserter.update(args);
		/* 118 */return goods;
		/*     */}

	/*     */
	/*     */public void batchInsert(final List goodsList)
	/*     */{
		/* 127 */if ((goodsList == null) || (goodsList.size() <= 0)) {
			/* 128 */return;
			/*     */}
		/* 130 */BatchUpdateData bud = new BatchUpdateData() {
			/*     */public Object[] getRow(int index) {
				/* 132 */Goods goods = (Goods) goodsList.get(index);
				/* 133 */String GOODS_ID = goods.getGoodsId();
				/* 134 */if (GOODS_ID.equals("")) {
					/* 135 */GOODS_ID = GoodsJdbcDao.this.getUUID(32);
					/* 136 */goods.setGoodsId(GOODS_ID);
					/*     */}
				/*     */
				/* 139 */Object[] args = { GOODS_ID, goods.getGoodsName(), goods.getGoodsPrice() };
				/* 140 */return args;
			}

			/*     */
			/*     */public int getRowNum() {
				/* 143 */return goodsList.size();
				/*     */}
			/*     */
		};
		/* 146 */this.inserter.batchUpdate(bud);
		/*     */}

	/*     */
	/*     */public Goods update(Goods goods)
	/*     */{
		/* 155 */Object[] args = { goods.getGoodsName(), goods.getGoodsPrice(), goods.getGoodsId() };
		/* 156 */this.updater.update(args);
		/* 157 */return goods;
		/*     */}

	/*     */
	/*     */public void batchUpdate(final List goodsList)
	/*     */{
		/* 166 */if ((goodsList == null) || (goodsList.size() <= 0)) {
			/* 167 */return;
			/*     */}
		/* 169 */BatchUpdateData bud = new BatchUpdateData() {
			/*     */public Object[] getRow(int index) {
				/* 171 */Goods goods = (Goods) goodsList.get(index);
				/* 172 */Object[] args = { goods.getGoodsName(), goods.getGoodsPrice(), goods.getGoodsId() };
				/* 173 */return args;
			}

			/*     */
			/*     */public int getRowNum() {
				/* 176 */return goodsList.size();
				/*     */}
			/*     */
		};
		/* 179 */this.updater.batchUpdate(bud);
		/*     */}

	/*     */
	/*     */public Page query(RowSelection rowSelection, Map map)
	/*     */{
		/* 188 */StringBuffer sb = new StringBuffer("select GOODS_ID , GOODS_NAME , GOODS_PRICE from GOODS");
		/*     */
		/* 190 */StringBuffer wherestring = new StringBuffer();
		/* 191 */Iterator paramnames = map.keySet().iterator();
		/* 192 */while (paramnames.hasNext()) {
			/* 193 */String paramname = (String) paramnames.next();
			/* 194 */int pos = paramname.indexOf("_SEARCH");
			/* 195 */if (pos <= 0) {
				/*     */continue;
				/*     */}
			/* 198 */String value = null;
			/* 199 */Object o = map.get(paramname);
			/* 200 */if (o instanceof String[]) {
				/* 201 */String[] os = (String[]) o;
				/* 202 */if (os.length > 0)
					/* 203 */value = os[0];
				/*     */}
			/*     */else {
				/* 206 */value = (String) o;
				/*     */}
			/* 208 */if ((value != null) && (!(value.equals("")))) {
				/* 209 */String fieldname = paramname.substring(0, pos);
				/* 210 */if (wherestring.length() == 0)
					/* 211 */wherestring.append(" where ");
				/*     */else {
					/* 213 */wherestring.append(" and ");
					/*     */}
				/* 215 */wherestring.append(fieldname).append(" like '%").append(value).append("%' ");
				/*     */}
			/*     */}
		/* 218 */StringBuffer orderstring = new StringBuffer();
		/* 219 */String sortname = (String) map.get("sortName");
		/* 220 */String sorttype = (String) map.get("sortType");
		/* 221 */if ((sortname != null) && (!(sortname.equals("")))) {
			/* 222 */orderstring.append(" order by ").append(sortname);
			/*     */}
		/* 224 */if (sorttype != null) {
			/* 225 */orderstring.append(" " + sorttype);
			/*     */}
		/* 227 */sb.append(wherestring).append(orderstring);
		/*     */
		/* 229 */GoodsQuery queryer = new GoodsQuery(getDataSource(), sb.toString());
		/* 230 */queryer.setPageAble(true);
		/* 231 */queryer.compile();
		/* 232 */return queryer.executePage(rowSelection);
		/*     */}

	/*     */
	/*     */public List queryNoPage(Map map)
	/*     */{
		/* 241 */StringBuffer sb = new StringBuffer("select GOODS_ID , GOODS_NAME , GOODS_PRICE from GOODS");
		/*     */
		/* 243 */StringBuffer wherestring = new StringBuffer();
		/* 244 */Iterator paramnames = map.keySet().iterator();
		/* 245 */while (paramnames.hasNext()) {
			/* 246 */String paramname = (String) paramnames.next();
			/* 247 */int pos = paramname.indexOf("_SEARCH");
			/* 248 */if (pos <= 0) {
				/*     */continue;
				/*     */}
			/* 251 */String value = null;
			/* 252 */Object o = map.get(paramname);
			/* 253 */if (o instanceof String[]) {
				/* 254 */String[] os = (String[]) o;
				/* 255 */if (os.length > 0)
					/* 256 */value = os[0];
				/*     */}
			/*     */else {
				/* 259 */value = (String) o;
				/*     */}
			/* 261 */if ((value != null) && (!(value.equals("")))) {
				/* 262 */String fieldname = paramname.substring(0, pos);
				/* 263 */if (wherestring.length() == 0)
					/* 264 */wherestring.append(" where ");
				/*     */else {
					/* 266 */wherestring.append(" and ");
					/*     */}
				/* 268 */wherestring.append(fieldname).append(" like '%").append(value).append("%' ");
				/*     */}
			/*     */}
		/* 271 */StringBuffer orderstring = new StringBuffer();
		/* 272 */String sortname = (String) map.get("sortName");
		/* 273 */String sorttype = (String) map.get("sortType");
		/* 274 */if ((sortname != null) && (!(sortname.equals("")))) {
			/* 275 */orderstring.append(" order by ").append(sortname);
			/*     */}
		/* 277 */if (sorttype != null) {
			/* 278 */orderstring.append(" " + sorttype);
			/*     */}
		/* 280 */sb.append(wherestring).append(orderstring);
		/*     */
		/* 282 */GoodsQuery queryer = new GoodsQuery(getDataSource(), sb.toString());
		/* 283 */queryer.setPageAble(true);
		/* 284 */queryer.compile();
		/* 285 */return queryer.execute();
		/*     */}

	/*     */
	/*     */private String getUUID(int len)
	/*     */{
		/* 290 */if (uuidHexGenerator == null) {
			/* 291 */uuidHexGenerator = new UUIDHexGenerator();
			/*     */}
		/* 293 */String id = String.valueOf(uuidHexGenerator.generate());
		/* 294 */if (id.length() > len) {
			/* 295 */return id.substring(id.length() - len);
			/*     */}
		/* 297 */return id;
		/*     */}

	/*     */
	/*     */protected static class GoodsQuery extends MappingSqlQuery
	/*     */{
		/*     */public GoodsQuery(DataSource ds, String sql)
		/*     */{
			/*  41 */super(ds, sql);
		}

		/*     */
		/*     */protected Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			/*  44 */Goods goods = new Goods();
			/*  45 */goods.setGoodsId(rs.getString("GOODS_ID"));
			/*  46 */goods.setGoodsName(rs.getString("GOODS_NAME"));
			/*  47 */goods.setGoodsPrice(rs.getString("GOODS_PRICE"));
			/*  48 */return goods;
			/*     */}
		/*     */
	}
	/*     */
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.goods.dao.support.GoodsJdbcDao
 * JD-Core Version:    0.5.3
 */