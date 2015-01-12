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
import net.mast.demo.goods.dao.IFactoryDao;
import net.mast.demo.goods.domain.Factory;
import net.mast.util.Page;
import net.mast.util.RowSelection;
import net.mast.util.domain.BaseJdbcDao;

/*     */
/*     */public class FactoryJdbcDao extends BaseJdbcDao
/*     */implements IFactoryDao
/*     */{
	/*  29 */private static UUIDHexGenerator uuidHexGenerator = null;
	/*     */private static final String insertSql = "insert into FACTORY ( FACTORY_ID , FACTORY_NAME , FACTORY_ADDRESS , GOODS_ID )  values  ( ? , ? , ? , ? ) ";
	/*     */private static final String deleteSql = "delete from FACTORY where FACTORY_ID = ? ";
	/*     */private static final String detailSql = "select FACTORY_ID , FACTORY_NAME , FACTORY_ADDRESS , GOODS_ID from FACTORY where FACTORY_ID = ?";
	/*     */private static final String updateSql = "update FACTORY set FACTORY_NAME = ?  , FACTORY_ADDRESS = ?  , GOODS_ID = ?  where FACTORY_ID = ? ";
	/*     */private static final String querySql = "select FACTORY_ID , FACTORY_NAME , FACTORY_ADDRESS , GOODS_ID from FACTORY";
	/*     */private static final String deleteByGoodsSql = "delete from FACTORY where GOODS_ID = ? ";
	/*     */private static final String queryByGoodsSql = "select FACTORY_ID , FACTORY_NAME , FACTORY_ADDRESS , GOODS_ID from FACTORY where GOODS_ID = ? ";
	/*  59 */private SqlUpdate deleter = null;
	/*  60 */private SqlUpdate inserter = null;
	/*  61 */private SqlUpdate updater = null;
	/*  62 */private FactoryQuery finder = null;
	/*  63 */private SqlUpdate deleteByGoodser = null;
	/*  64 */private FactoryQuery queryByGoodser = null;

	/*     */
	/*     */protected void initDao() {
		/*  67 */if (this.deleter == null) {
			/*  68 */this.deleter = new SqlUpdate(getDataSource(), "delete from FACTORY where FACTORY_ID = ? ");
			/*  69 */this.deleter.declareParameter(new SqlParameter(12));
			/*  70 */this.deleter.compile();
			/*     */}
		/*  72 */if (this.inserter == null) {
			/*  73 */this.inserter = new SqlUpdate(getDataSource(),
					"insert into FACTORY ( FACTORY_ID , FACTORY_NAME , FACTORY_ADDRESS , GOODS_ID )  values  ( ? , ? , ? , ? ) ");
			/*  74 */this.inserter.declareParameter(new SqlParameter(12));
			/*  75 */this.inserter.declareParameter(new SqlParameter(12));
			/*  76 */this.inserter.declareParameter(new SqlParameter(12));
			/*  77 */this.inserter.declareParameter(new SqlParameter(12));
			/*  78 */this.inserter.compile();
			/*     */}
		/*  80 */if (this.updater == null) {
			/*  81 */this.updater = new SqlUpdate(getDataSource(),
					"update FACTORY set FACTORY_NAME = ?  , FACTORY_ADDRESS = ?  , GOODS_ID = ?  where FACTORY_ID = ? ");
			/*  82 */this.updater.declareParameter(new SqlParameter(12));
			/*  83 */this.updater.declareParameter(new SqlParameter(12));
			/*  84 */this.updater.declareParameter(new SqlParameter(12));
			/*  85 */this.updater.declareParameter(new SqlParameter(12));
			/*  86 */this.updater.compile();
			/*     */}
		/*  88 */if (this.finder == null) {
			/*  89 */this.finder = new FactoryQuery(getDataSource(),
					"select FACTORY_ID , FACTORY_NAME , FACTORY_ADDRESS , GOODS_ID from FACTORY where FACTORY_ID = ?");
			/*  90 */this.finder.declareParameter(new SqlParameter(12));
			/*  91 */this.finder.compile();
			/*     */}
		/*  93 */if (this.deleteByGoodser == null) {
			/*  94 */this.deleteByGoodser = new SqlUpdate(getDataSource(), "delete from FACTORY where GOODS_ID = ? ");
			/*  95 */this.deleteByGoodser.declareParameter(new SqlParameter(12));
			/*  96 */this.deleteByGoodser.compile();
			/*     */}
		/*  98 */if (this.queryByGoodser == null) {
			/*  99 */this.queryByGoodser = new FactoryQuery(getDataSource(),
					"select FACTORY_ID , FACTORY_NAME , FACTORY_ADDRESS , GOODS_ID from FACTORY where GOODS_ID = ? ");
			/* 100 */this.queryByGoodser.declareParameter(new SqlParameter(12));
			/* 101 */this.queryByGoodser.compile();
			/*     */}
		/*     */}

	/*     */
	/*     */public int delete(String factoryId)
	/*     */{
		/* 112 */Object[] args = { factoryId };
		/* 113 */return this.deleter.update(args);
		/*     */}

	/*     */
	/*     */public Factory get(String factoryId)
	/*     */{
		/* 122 */Object[] args = { factoryId };
		/* 123 */return ((Factory) this.finder.findObject(args));
		/*     */}

	/*     */
	/*     */public Factory insert(Factory factory)
	/*     */{
		/* 132 */String FACTORY_ID = factory.getFactoryId();
		/* 133 */if (FACTORY_ID.equals("")) {
			/* 134 */FACTORY_ID = getUUID(32);
			/* 135 */factory.setFactoryId(FACTORY_ID);
			/*     */}
		/*     */
		/* 138 */Object[] args = { FACTORY_ID, factory.getFactoryName(), factory.getFactoryAddress(),
				factory.getGoodsId() };
		/* 139 */this.inserter.update(args);
		/* 140 */return factory;
		/*     */}

	/*     */
	/*     */public void batchInsert(final List factoryList)
	/*     */{
		/* 149 */if ((factoryList == null) || (factoryList.size() <= 0)) {
			/* 150 */return;
			/*     */}
		/* 152 */BatchUpdateData bud = new BatchUpdateData() {
			/*     */public Object[] getRow(int index) {
				/* 154 */Factory factory = (Factory) factoryList.get(index);
				/* 155 */String FACTORY_ID = factory.getFactoryId();
				/* 156 */if (FACTORY_ID.equals("")) {
					/* 157 */FACTORY_ID = FactoryJdbcDao.this.getUUID(32);
					/* 158 */factory.setFactoryId(FACTORY_ID);
					/*     */}
				/*     */
				/* 161 */Object[] args = { FACTORY_ID, factory.getFactoryName(), factory.getFactoryAddress(),
						factory.getGoodsId() };
				/* 162 */return args;
			}

			/*     */
			/*     */public int getRowNum() {
				/* 165 */return factoryList.size();
				/*     */}
			/*     */
		};
		/* 168 */this.inserter.batchUpdate(bud);
		/*     */}

	/*     */
	/*     */public Factory update(Factory factory)
	/*     */{
		/* 177 */Object[] args = { factory.getFactoryName(), factory.getFactoryAddress(), factory.getGoodsId(),
				factory.getFactoryId() };
		/* 178 */this.updater.update(args);
		/* 179 */return factory;
		/*     */}

	/*     */
	/*     */public void batchUpdate(final List factoryList)
	/*     */{
		/* 188 */if ((factoryList == null) || (factoryList.size() <= 0)) {
			/* 189 */return;
			/*     */}
		/* 191 */BatchUpdateData bud = new BatchUpdateData() {
			/*     */public Object[] getRow(int index) {
				/* 193 */Factory factory = (Factory) factoryList.get(index);
				/* 194 */Object[] args = { factory.getFactoryName(), factory.getFactoryAddress(),
						factory.getGoodsId(), factory.getFactoryId() };
				/* 195 */return args;
			}

			/*     */
			/*     */public int getRowNum() {
				/* 198 */return factoryList.size();
				/*     */}
			/*     */
		};
		/* 201 */this.updater.batchUpdate(bud);
		/*     */}

	/*     */
	/*     */public Page query(RowSelection rowSelection, Map map)
	/*     */{
		/* 210 */StringBuffer sb = new StringBuffer(
				"select FACTORY_ID , FACTORY_NAME , FACTORY_ADDRESS , GOODS_ID from FACTORY");
		/*     */
		/* 212 */StringBuffer wherestring = new StringBuffer();
		/* 213 */Iterator paramnames = map.keySet().iterator();
		/* 214 */while (paramnames.hasNext()) {
			/* 215 */String paramname = (String) paramnames.next();
			/* 216 */int pos = paramname.indexOf("_SEARCH");
			/* 217 */if (pos <= 0) {
				/*     */continue;
				/*     */}
			/* 220 */String value = null;
			/* 221 */Object o = map.get(paramname);
			/* 222 */if (o instanceof String[]) {
				/* 223 */String[] os = (String[]) o;
				/* 224 */if (os.length > 0)
					/* 225 */value = os[0];
				/*     */}
			/*     */else {
				/* 228 */value = (String) o;
				/*     */}
			/* 230 */if ((value != null) && (!(value.equals("")))) {
				/* 231 */String fieldname = paramname.substring(0, pos);
				/* 232 */if (wherestring.length() == 0)
					/* 233 */wherestring.append(" where ");
				/*     */else {
					/* 235 */wherestring.append(" and ");
					/*     */}
				/* 237 */wherestring.append(fieldname).append(" like '%").append(value).append("%' ");
				/*     */}
			/*     */}
		/* 240 */StringBuffer orderstring = new StringBuffer();
		/* 241 */String sortname = (String) map.get("sortName");
		/* 242 */String sorttype = (String) map.get("sortType");
		/* 243 */if ((sortname != null) && (!(sortname.equals("")))) {
			/* 244 */orderstring.append(" order by ").append(sortname);
			/*     */}
		/* 246 */if (sorttype != null) {
			/* 247 */orderstring.append(" " + sorttype);
			/*     */}
		/* 249 */sb.append(wherestring).append(orderstring);
		/*     */
		/* 251 */FactoryQuery queryer = new FactoryQuery(getDataSource(), sb.toString());
		/* 252 */queryer.setPageAble(true);
		/* 253 */queryer.compile();
		/* 254 */return queryer.executePage(rowSelection);
		/*     */}

	/*     */
	/*     */public List queryNoPage(Map map)
	/*     */{
		/* 263 */StringBuffer sb = new StringBuffer(
				"select FACTORY_ID , FACTORY_NAME , FACTORY_ADDRESS , GOODS_ID from FACTORY");
		/*     */
		/* 265 */StringBuffer wherestring = new StringBuffer();
		/* 266 */Iterator paramnames = map.keySet().iterator();
		/* 267 */while (paramnames.hasNext()) {
			/* 268 */String paramname = (String) paramnames.next();
			/* 269 */int pos = paramname.indexOf("_SEARCH");
			/* 270 */if (pos <= 0) {
				/*     */continue;
				/*     */}
			/* 273 */String value = null;
			/* 274 */Object o = map.get(paramname);
			/* 275 */if (o instanceof String[]) {
				/* 276 */String[] os = (String[]) o;
				/* 277 */if (os.length > 0)
					/* 278 */value = os[0];
				/*     */}
			/*     */else {
				/* 281 */value = (String) o;
				/*     */}
			/* 283 */if ((value != null) && (!(value.equals("")))) {
				/* 284 */String fieldname = paramname.substring(0, pos);
				/* 285 */if (wherestring.length() == 0)
					/* 286 */wherestring.append(" where ");
				/*     */else {
					/* 288 */wherestring.append(" and ");
					/*     */}
				/* 290 */wherestring.append(fieldname).append(" like '%").append(value).append("%' ");
				/*     */}
			/*     */}
		/* 293 */StringBuffer orderstring = new StringBuffer();
		/* 294 */String sortname = (String) map.get("sortName");
		/* 295 */String sorttype = (String) map.get("sortType");
		/* 296 */if ((sortname != null) && (!(sortname.equals("")))) {
			/* 297 */orderstring.append(" order by ").append(sortname);
			/*     */}
		/* 299 */if (sorttype != null) {
			/* 300 */orderstring.append(" " + sorttype);
			/*     */}
		/* 302 */sb.append(wherestring).append(orderstring);
		/*     */
		/* 304 */FactoryQuery queryer = new FactoryQuery(getDataSource(), sb.toString());
		/* 305 */queryer.setPageAble(true);
		/* 306 */queryer.compile();
		/* 307 */return queryer.execute();
		/*     */}

	/*     */
	/*     */public int deleteByGoods(String goodsId)
	/*     */{
		/* 317 */Object[] args = { goodsId };
		/* 318 */return this.deleteByGoodser.update(args);
		/*     */}

	/*     */
	/*     */public List queryByGoods(String goodsId)
	/*     */{
		/* 327 */Object[] args = { goodsId };
		/* 328 */return this.queryByGoodser.execute(args);
		/*     */}

	/*     */
	/*     */private String getUUID(int len) {
		/* 332 */if (uuidHexGenerator == null) {
			/* 333 */uuidHexGenerator = new UUIDHexGenerator();
			/*     */}
		/* 335 */String id = String.valueOf(uuidHexGenerator.generate());
		/* 336 */if (id.length() > len) {
			/* 337 */return id.substring(id.length() - len);
			/*     */}
		/* 339 */return id;
		/*     */}

	/*     */
	/*     */protected static class FactoryQuery extends MappingSqlQuery
	/*     */{
		/*     */public FactoryQuery(DataSource ds, String sql)
		/*     */{
			/*  47 */super(ds, sql);
		}

		/*     */
		/*     */protected Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			/*  50 */Factory factory = new Factory();
			/*  51 */factory.setFactoryId(rs.getString("FACTORY_ID"));
			/*  52 */factory.setFactoryName(rs.getString("FACTORY_NAME"));
			/*  53 */factory.setFactoryAddress(rs.getString("FACTORY_ADDRESS"));
			/*  54 */factory.setGoodsId(rs.getString("GOODS_ID"));
			/*  55 */return factory;
			/*     */}
		/*     */
	}
	/*     */
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.goods.dao.support.FactoryJdbcDao
 * JD-Core Version:    0.5.3
 */