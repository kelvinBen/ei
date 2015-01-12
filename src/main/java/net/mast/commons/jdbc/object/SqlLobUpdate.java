package net.mast.commons.jdbc.object;

import java.sql.Connection;
import java.sql.DatabaseMetaData;

import javax.sql.DataSource;

import net.mast.commons.dao.DataAccessException;
import net.mast.commons.dao.InvalidDataAccessApiUsageException;
import net.mast.commons.jdbc.core.BatchUpdateData;
import net.mast.commons.jdbc.datasource.DataSourceUtils;

public class SqlLobUpdate extends SqlOperation {
	public SqlLobUpdate() {
	}

	public SqlLobUpdate(DataSource ds, String sql) {
		this(ds, sql, null);
	}

	public SqlLobUpdate(DataSource ds, String sql, int[] types) {
		setDataSource(ds);
		setSql(sql);
		setTypes(types);
		Connection con = null;
		try {
			con = DataSourceUtils.getConnection(ds);
			if (con == null) {
			}
			DatabaseMetaData dbmd = con.getMetaData();
			if (dbmd == null) {
			}
			String dbName = dbmd.getDatabaseProductName();
			if ((dbName == null) || (!(dbName.startsWith("Oracle")))) {
			}
			String version = dbmd.getDatabaseProductVersion();
			if (version.indexOf("Oracle9i") > -1) {
				//getJdbcTemplate().setIsNativeJdbc(true);
			}
		} catch (Exception e) {
			logger.error("Get database Adapter failure", e);
		} finally {
			if (con != null)
				DataSourceUtils.releaseConnection(con, ds);
		}
	}

	public int[] batchUpdate(final Object[][] values) throws DataAccessException {
		if (values == null) {
			throw new InvalidDataAccessApiUsageException("argument can't be null");
		}
		if (values.length == 0) {
			return new int[0];
		}
		BatchUpdateData data = new BatchUpdateData() {

			public Object[] getRow(int index) {
				return values[index];
			}

			public int getRowNum() {
				return values.length;
			}
		};
		return batchUpdate(data);
	}

	public int[] batchUpdate(BatchUpdateData data) throws DataAccessException {
		if (data == null) {
			throw new InvalidDataAccessApiUsageException("argument can't be null");
		}
		validate();
		return getJdbcTemplate().update(newBatchPreparedStatementCreator(data));
	}

	public int update(Object[] args) throws InvalidDataAccessApiUsageException {
		validate();
		return getJdbcTemplate().update(newPreparedStatementCreator(args));
	}

	public int update() {
		return update(1);
	}

	public int update(int p1) {
		return update(new Object[] { new Integer(p1) });
	}

	public int update(int p1, int p2) {
		return update(new Object[] { new Integer(p1), new Integer(p2) });
	}

	public int update(String p) {
		return update(new Object[] { p });
	}

	public int update(String p1, String p2) {
		return update(new Object[] { p1, p2 });
	}
}