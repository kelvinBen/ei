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
import net.mast.demo.foods.dao.IFoodDao;
import net.mast.demo.foods.domain.Food;
import net.mast.util.Page;
import net.mast.util.RowSelection;
import net.mast.util.domain.BaseJdbcDao;

/*     */
/*     */public class FoodJdbcDao extends BaseJdbcDao
/*     */implements IFoodDao
/*     */{
	/*  28 */private static UUIDHexGenerator uuidHexGenerator = null;
	/*     */private static final String insertSql = "insert into FOOD ( FOOD_ID , FOOD_NAME , FOOD_ORIGIN , FOOD_NUM , FOOD_PRICE , XB_ID )  values  ( ? , ? , ? , ? , ? , ? ) ";
	/*     */private static final String deleteSql = "delete from FOOD where FOOD_ID = ? ";
	/*     */private static final String detailSql = "select FOOD_ID , FOOD_NAME , FOOD_ORIGIN , FOOD_NUM , FOOD_PRICE , XB_ID from FOOD where FOOD_ID = ?";
	/*     */private static final String updateSql = "update FOOD set FOOD_NAME = ?  , FOOD_ORIGIN = ?  , FOOD_NUM = ?  , FOOD_PRICE = ?  , XB_ID = ?  where FOOD_ID = ? ";
	/*     */private static final String querySql = "select FOOD_ID , FOOD_NAME , FOOD_ORIGIN , FOOD_NUM , FOOD_PRICE , XB_ID from FOOD";
	/*     */private static final String deleteByXubiaoSql = "delete from food where XB_ID = ? ";
	/*     */private static final String queryByXubiaoSql = "select FOOD_ID , FOOD_NAME , FOOD_ORIGIN , FOOD_NUM , FOOD_PRICE , XB_ID from FOOD where XB_ID = ?";
	/*  68 */private SqlUpdate deleter = null;
	/*     */
	/*  70 */private SqlUpdate inserter = null;
	/*     */
	/*  72 */private SqlUpdate updater = null;
	/*     */
	/*  74 */private FoodQuery finder = null;
	/*     */
	/*  76 */private SqlUpdate deleteByXubiaoser = null;
	/*     */
	/*  78 */private FoodQuery queryByXubiaoser = null;

	/*     */
	/*     */protected void initDao() {
		/*  81 */if (this.deleter == null) {
			/*  82 */this.deleter = new SqlUpdate(getDataSource(), "delete from FOOD where FOOD_ID = ? ");
			/*  83 */this.deleter.declareParameter(new SqlParameter(12));
			/*  84 */this.deleter.compile();
			/*     */}
		/*  86 */if (this.inserter == null) {
			/*  87 */this.inserter = new SqlUpdate(
					getDataSource(),
					"insert into FOOD ( FOOD_ID , FOOD_NAME , FOOD_ORIGIN , FOOD_NUM , FOOD_PRICE , XB_ID )  values  ( ? , ? , ? , ? , ? , ? ) ");
			/*  88 */this.inserter.declareParameter(new SqlParameter(12));
			/*  89 */this.inserter.declareParameter(new SqlParameter(12));
			/*  90 */this.inserter.declareParameter(new SqlParameter(12));
			/*  91 */this.inserter.declareParameter(new SqlParameter(12));
			/*  92 */this.inserter.declareParameter(new SqlParameter(12));
			/*  93 */this.inserter.declareParameter(new SqlParameter(12));
			/*  94 */this.inserter.compile();
			/*     */}
		/*  96 */if (this.updater == null) {
			/*  97 */this.updater = new SqlUpdate(getDataSource(),
					"update FOOD set FOOD_NAME = ?  , FOOD_ORIGIN = ?  , FOOD_NUM = ?  , FOOD_PRICE = ?  , XB_ID = ?  where FOOD_ID = ? ");
			/*  98 */this.updater.declareParameter(new SqlParameter(12));
			/*  99 */this.updater.declareParameter(new SqlParameter(12));
			/* 100 */this.updater.declareParameter(new SqlParameter(12));
			/* 101 */this.updater.declareParameter(new SqlParameter(12));
			/* 102 */this.updater.declareParameter(new SqlParameter(12));
			/* 103 */this.updater.declareParameter(new SqlParameter(12));
			/* 104 */this.updater.compile();
			/*     */}
		/* 106 */if (this.finder == null) {
			/* 107 */this.finder = new FoodQuery(getDataSource(),
					"select FOOD_ID , FOOD_NAME , FOOD_ORIGIN , FOOD_NUM , FOOD_PRICE , XB_ID from FOOD where FOOD_ID = ?");
			/* 108 */this.finder.declareParameter(new SqlParameter(12));
			/* 109 */this.finder.compile();
			/*     */}
		/* 111 */if (this.deleteByXubiaoser == null) {
			/* 112 */this.deleteByXubiaoser =
			/* 113 */new SqlUpdate(getDataSource(),
			/* 113 */"delete from food where XB_ID = ? ");
			/* 114 */this.deleteByXubiaoser.declareParameter(new SqlParameter(12));
			/* 115 */this.deleteByXubiaoser.compile();
			/*     */}
		/* 117 */if (this.queryByXubiaoser == null) {
			/* 118 */this.queryByXubiaoser = new FoodQuery(getDataSource(),
					"select FOOD_ID , FOOD_NAME , FOOD_ORIGIN , FOOD_NUM , FOOD_PRICE , XB_ID from FOOD where XB_ID = ?");
			/* 119 */this.queryByXubiaoser.declareParameter(new SqlParameter(12));
			/* 120 */this.queryByXubiaoser.compile();
			/*     */}
		/*     */}

	/*     */
	/*     */public int delete(String foodId)
	/*     */{
		/* 130 */Object[] args = { foodId };
		/* 131 */return this.deleter.update(args);
		/*     */}

	/*     */
	/*     */public Food get(String foodId)
	/*     */{
		/* 140 */Object[] args = { foodId };
		/* 141 */return ((Food) this.finder.findObject(args));
		/*     */}

	/*     */
	/*     */public Food insert(Food food)
	/*     */{
		/* 150 */String FOOD_ID = food.getFoodId();
		/* 151 */if (FOOD_ID.equals("")) {
			/* 152 */FOOD_ID = getUUID(32);
			/* 153 */food.setFoodId(FOOD_ID);
			/*     */}
		/*     */
		/* 156 */Object[] args = { FOOD_ID, food.getFoodName(),
		/* 157 */food.getFoodOrigin(), food.getFoodNum(), food.getFoodPrice(),
		/* 158 */food.getXbId() };
		/* 159 */this.inserter.update(args);
		/* 160 */return food;
		/*     */}

	/*     */
	/*     */public void batchInsert(final List foodList)
	/*     */{
		/* 169 */if ((foodList == null) || (foodList.size() <= 0)) {
			/* 170 */return;
			/*     */}
		/* 172 */BatchUpdateData bud = new BatchUpdateData() {
			/*     */public Object[] getRow(int index) {
				/* 174 */Food food = (Food) foodList.get(index);
				/* 175 */String FOOD_ID = food.getFoodId();
				/* 176 */if (FOOD_ID.equals("")) {
					/* 177 */FOOD_ID = FoodJdbcDao.this.getUUID(32);
					/* 178 */food.setFoodId(FOOD_ID);
					/*     */}
				/*     */
				/* 181 */Object[] args = { FOOD_ID, food.getFoodName(),
				/* 182 */food.getFoodOrigin(), food.getFoodNum(),
				/* 183 */food.getFoodPrice(), food.getXbId() };
				/*     */
				/* 185 */return args;
				/*     */}

			/*     */
			/*     */public int getRowNum() {
				/* 189 */return foodList.size();
				/*     */}
			/*     */
		};
		/* 192 */this.inserter.batchUpdate(bud);
		/*     */}

	/*     */
	/*     */public Food update(Food food)
	/*     */{
		/* 201 */Object[] args = { food.getFoodName(),
		/* 202 */food.getFoodOrigin(), food.getFoodNum(), food.getFoodPrice(),
		/* 203 */food.getXbId(), food.getFoodId() };
		/* 204 */this.updater.update(args);
		/* 205 */return food;
		/*     */}

	/*     */
	/*     */public void batchUpdate(final List foodList)
	/*     */{
		/* 214 */if ((foodList == null) || (foodList.size() <= 0)) {
			/* 215 */return;
			/*     */}
		/* 217 */BatchUpdateData bud = new BatchUpdateData() {
			/*     */public Object[] getRow(int index) {
				/* 219 */Food food = (Food) foodList.get(index);
				/* 220 */Object[] args = { food.getFoodName(),
				/* 221 */food.getFoodOrigin(), food.getFoodNum(),
				/* 222 */food.getFoodPrice(), food.getXbId(), food.getFoodId() };
				/*     */
				/* 224 */return args;
				/*     */}

			/*     */
			/*     */public int getRowNum() {
				/* 228 */return foodList.size();
				/*     */}
			/*     */
		};
		/* 231 */this.updater.batchUpdate(bud);
		/*     */}

	/*     */
	/*     */public Page query(RowSelection rowSelection, Map map)
	/*     */{
		/* 240 */StringBuffer sb = new StringBuffer(
				"select FOOD_ID , FOOD_NAME , FOOD_ORIGIN , FOOD_NUM , FOOD_PRICE , XB_ID from FOOD");
		/*     */
		/* 242 */StringBuffer wherestring = new StringBuffer();
		/* 243 */Iterator paramnames = map.keySet().iterator();
		/* 244 */while (paramnames.hasNext()) {
			/* 245 */String paramname = (String) paramnames.next();
			/* 246 */if (paramname != null) {
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
					/* 268 */wherestring.append(fieldname).append(" like '%").append(
					/* 269 */value).append("%' ");
					/*     */}
				/*     */}
			/*     */}
		/*     */
		/* 274 */StringBuffer orderstring = new StringBuffer();
		/* 275 */String sortname = (String) map.get("sortName");
		/* 276 */String sorttype = (String) map.get("sortType");
		/* 277 */if ((sortname != null) && (!(sortname.equals("")))) {
			/* 278 */orderstring.append(" order by ").append(sortname);
			/*     */}
		/* 280 */if (sorttype != null) {
			/* 281 */orderstring.append(" " + sorttype);
			/*     */}
		/* 283 */sb.append(wherestring).append(orderstring);
		/*     */
		/* 285 */FoodQuery queryer = new FoodQuery(getDataSource(), sb.toString());
		/* 286 */queryer.setPageAble(true);
		/* 287 */queryer.compile();
		/* 288 */return queryer.executePage(rowSelection);
		/*     */}

	/*     */
	/*     */public List queryNoPage(Map map)
	/*     */{
		/* 297 */StringBuffer sb = new StringBuffer(
				"select FOOD_ID , FOOD_NAME , FOOD_ORIGIN , FOOD_NUM , FOOD_PRICE , XB_ID from FOOD");
		/*     */
		/* 299 */StringBuffer wherestring = new StringBuffer();
		/* 300 */Iterator paramnames = map.keySet().iterator();
		/* 301 */while (paramnames.hasNext()) {
			/* 302 */String paramname = (String) paramnames.next();
			/* 303 */int pos = paramname.indexOf("_SEARCH");
			/* 304 */if (pos <= 0) {
				/*     */continue;
				/*     */}
			/* 307 */String value = null;
			/* 308 */Object o = map.get(paramname);
			/* 309 */if (o instanceof String[]) {
				/* 310 */String[] os = (String[]) o;
				/* 311 */if (os.length > 0)
					/* 312 */value = os[0];
				/*     */}
			/*     */else {
				/* 315 */value = (String) o;
				/*     */}
			/* 317 */if ((value != null) && (!(value.equals("")))) {
				/* 318 */String fieldname = paramname.substring(0, pos);
				/* 319 */if (wherestring.length() == 0)
					/* 320 */wherestring.append(" where ");
				/*     */else {
					/* 322 */wherestring.append(" and ");
					/*     */}
				/* 324 */wherestring.append(fieldname).append(" like '%").append(value)
				/* 325 */.append("%' ");
				/*     */}
			/*     */}
		/* 328 */StringBuffer orderstring = new StringBuffer();
		/* 329 */String sortname = (String) map.get("sortName");
		/* 330 */String sorttype = (String) map.get("sortType");
		/* 331 */if ((sortname != null) && (!(sortname.equals("")))) {
			/* 332 */orderstring.append(" order by ").append(sortname);
			/*     */}
		/* 334 */if (sorttype != null) {
			/* 335 */orderstring.append(" " + sorttype);
			/*     */}
		/* 337 */sb.append(wherestring).append(orderstring);
		/*     */
		/* 339 */FoodQuery queryer = new FoodQuery(getDataSource(), sb.toString());
		/* 340 */queryer.setPageAble(true);
		/* 341 */queryer.compile();
		/* 342 */return queryer.execute();
		/*     */}

	/*     */
	/*     */private String getUUID(int len) {
		/* 346 */if (uuidHexGenerator == null) {
			/* 347 */uuidHexGenerator = new UUIDHexGenerator();
			/*     */}
		/* 349 */String id = String.valueOf(uuidHexGenerator.generate());
		/* 350 */if (id.length() > len) {
			/* 351 */return id.substring(id.length() - len);
			/*     */}
		/* 353 */return id;
		/*     */}

	/*     */
	/*     */public List queryByXubiao(String xbId) {
		/* 357 */Object[] args = { xbId };
		/* 358 */return this.queryByXubiaoser.execute(args);
		/*     */}

	/*     */
	/*     */public int deleteByXubiao(String xbId)
	/*     */{
		/* 367 */Object[] args = { xbId };
		/* 368 */return this.deleteByXubiaoser.update(args);
		/*     */}

	/*     */
	/*     */protected static class FoodQuery extends MappingSqlQuery
	/*     */{
		/*     */public FoodQuery(DataSource ds, String sql)
		/*     */{
			/*  53 */super(ds, sql);
			/*     */}

		/*     */
		/*     */protected Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			/*  57 */Food food = new Food();
			/*  58 */food.setFoodId(rs.getString("FOOD_ID"));
			/*  59 */food.setFoodName(rs.getString("FOOD_NAME"));
			/*  60 */food.setFoodOrigin(rs.getString("FOOD_ORIGIN"));
			/*  61 */food.setFoodNum(rs.getString("FOOD_NUM"));
			/*  62 */food.setFoodPrice(rs.getString("FOOD_PRICE"));
			/*  63 */food.setXbId(rs.getString("XB_ID"));
			/*  64 */return food;
			/*     */}
		/*     */
	}
	/*     */
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.foods.dao.support.FoodJdbcDao
 * JD-Core Version:    0.5.3
 */