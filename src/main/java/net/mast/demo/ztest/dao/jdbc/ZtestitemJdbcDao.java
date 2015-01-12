/*
 * @(#)IZtestitemJdbcDao.java 
 *
 * Copyright (C) 2002-2008 The DiHua Software Foundation. All rights reserved.
 *
 * 程序生成时间：[Fri Jul 23 15:56:29 CST 2010] 生成
 */
package net.mast.demo.ztest.dao.jdbc;
//导入java类
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import net.mast.commons.jdbc.core.SqlParameter;
import net.mast.commons.jdbc.object.MappingSqlQuery;
import net.mast.commons.jdbc.object.SqlUpdate;
import net.mast.util.Page;
import net.mast.util.RowSelection;
import net.mast.util.domain.BaseJdbcDao;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import net.mast.demo.ztest.dao.IZtestitemDao;
import net.mast.demo.ztest.data.Ztestitem;

/**
 * 功能:本类为测试行项目的Dao实现类ZtestitemJdbcDao
 *
 * @author  sp
 * @date    [Fri Jul 23 15:56:29 CST 2010]
 *
 * $Id$
 */
   @SuppressWarnings({"unused","unchecked"})
public class ZtestitemJdbcDao extends BaseJdbcDao implements IZtestitemDao {
    private static Log log = LogFactory.getLog(ZtestitemJdbcDao.class);
    //  插入sql
    private final static String insertSql = getInsertSql();
    //  删除sql
    private final static String deleteSql = getDeleteSql();
    //  明细sql
    private final static String detailSql = getDetailSql();
    //	更新sql
    private final static String updateSql = getUpdateSql();
    //  查询
    private final static String querySql = getQuerySql();
	
	/**
	 *  @return
	 */
    public static String getInsertSql()
    {
        StringBuffer sb = new StringBuffer();
        sb.append("INSERT INTO ZTESTITEM (");
    	sb.append("CODENUM"); //主键
    	sb.append(",");
    	sb.append("ISLOCKSTATUSSYS"); //是否被锁定
    	sb.append(",");
    	sb.append("CURRENTUSERSYS"); //当前用户
    	sb.append(",");
    	sb.append("CURRENTROLESYS"); //当前角色
    	sb.append(",");
    	sb.append("CURRENTUSERGORUPSYS"); //用户组
    	sb.append(",");
    	sb.append("CURRENTDEPARTMENTSYS"); //当前部门
    	sb.append(",");
    	sb.append("ISSTARTRECYCLE"); //是否启用回收站
    	sb.append(",");
    	sb.append("SHAREROLESYS"); //共享角色
    	sb.append(",");
    	sb.append("SHAREUSERSYS"); //共享用户
    	sb.append(",");
    	sb.append("SHAREDEPARTMENTSYS"); //共享部门
    	sb.append(",");
    	sb.append("SHAREUSERGROUP"); //共享用户组
    	sb.append(",");
    	sb.append("SALES_ORG"); //销售组织
    	sb.append(",");
    	sb.append("DISTR_CHAN"); //分销渠道
    	sb.append(",");
    	sb.append("DIVISION"); //产品组
    	sb.append(",");
    	sb.append("SALES_OFFICE"); //销售部门（销售办公室）
    	sb.append(",");
    	sb.append("SALES_GROUP"); //销售组
    	sb.append(",");
    	sb.append("SALES_AREA"); //销售地区
    	sb.append(",");
    	sb.append("IS_DELETESYS"); //逻辑删除标识
    	sb.append(",");
    	sb.append("UPDATE_DATESYS"); //逻辑删除恢复时间
    	sb.append(",");
    	sb.append("PO_ITEM"); //行项目
    	sb.append(",");
    	sb.append("VALUE"); //值
    	sb.append(",");
    	sb.append("HCODENUM"); //表头编号
    	sb.append(") VALUES(");
    	sb.append("?");  //主键
    	sb.append(",");
    	sb.append("?");  //是否被锁定
    	sb.append(",");
    	sb.append("?");  //当前用户
    	sb.append(",");
    	sb.append("?");  //当前角色
    	sb.append(",");
    	sb.append("?");  //用户组
    	sb.append(",");
    	sb.append("?");  //当前部门
    	sb.append(",");
    	sb.append("?");  //是否启用回收站
    	sb.append(",");
    	sb.append("?");  //共享角色
    	sb.append(",");
    	sb.append("?");  //共享用户
    	sb.append(",");
    	sb.append("?");  //共享部门
    	sb.append(",");
    	sb.append("?");  //共享用户组
    	sb.append(",");
    	sb.append("?");  //销售组织
    	sb.append(",");
    	sb.append("?");  //分销渠道
    	sb.append(",");
    	sb.append("?");  //产品组
    	sb.append(",");
    	sb.append("?");  //销售部门（销售办公室）
    	sb.append(",");
    	sb.append("?");  //销售组
    	sb.append(",");
    	sb.append("?");  //销售地区
    	sb.append(",");
    	sb.append("?");  //逻辑删除标识
    	sb.append(",");
    	sb.append("?");  //逻辑删除恢复时间
    	sb.append(",");
    	sb.append("?");  //行项目
    	sb.append(",");
    	sb.append("?");  //值
    	sb.append(",");
    	sb.append("?");  //表头编号
    	sb.append(")");
    	return sb.toString();
    }

	/**
	 *  @return
	 */
    public static String getUpdateSql() {
        StringBuffer sb = new StringBuffer();
        sb.append("UPDATE ZTESTITEM SET ");
		sb.append("CODENUM=?");  //主键
		sb.append(" , ");
		sb.append("ISLOCKSTATUSSYS=?");  //是否被锁定
		sb.append(" , ");
		sb.append("CURRENTUSERSYS=?");  //当前用户
		sb.append(" , ");
		sb.append("CURRENTROLESYS=?");  //当前角色
		sb.append(" , ");
		sb.append("CURRENTUSERGORUPSYS=?");  //用户组
		sb.append(" , ");
		sb.append("CURRENTDEPARTMENTSYS=?");  //当前部门
		sb.append(" , ");
		sb.append("ISSTARTRECYCLE=?");  //是否启用回收站
		sb.append(" , ");
		sb.append("SHAREROLESYS=?");  //共享角色
		sb.append(" , ");
		sb.append("SHAREUSERSYS=?");  //共享用户
		sb.append(" , ");
		sb.append("SHAREDEPARTMENTSYS=?");  //共享部门
		sb.append(" , ");
		sb.append("SHAREUSERGROUP=?");  //共享用户组
		sb.append(" , ");
		sb.append("SALES_ORG=?");  //销售组织
		sb.append(" , ");
		sb.append("DISTR_CHAN=?");  //分销渠道
		sb.append(" , ");
		sb.append("DIVISION=?");  //产品组
		sb.append(" , ");
		sb.append("SALES_OFFICE=?");  //销售部门（销售办公室）
		sb.append(" , ");
		sb.append("SALES_GROUP=?");  //销售组
		sb.append(" , ");
		sb.append("SALES_AREA=?");  //销售地区
		sb.append(" , ");
		sb.append("IS_DELETESYS=?");  //逻辑删除标识
		sb.append(" , ");
		sb.append("UPDATE_DATESYS=?");  //逻辑删除恢复时间
		sb.append(" , ");
		sb.append("PO_ITEM=?");  //行项目
		sb.append(" , ");
		sb.append("VALUE=?");  //值
		sb.append(" , ");
		sb.append("HCODENUM=?");  //表头编号
    	sb.append(" WHERE ");
    	sb.append("CODENUM=?");  //主键
        return sb.toString();
    }

    /**
	 *  @return
	 */
    public static String getDeleteSql(){
        StringBuffer sb = new StringBuffer();
        sb.append("DELETE FROM ZTESTITEM WHERE ");
    	sb.append("HCODENUM=?"); //主键
        return sb.toString();
    }

    /**
	 *  @return
	 */
 	public static String getDetailSql()	{
	    StringBuffer sb = new StringBuffer();
	    sb.append("SELECT "); 
	    
   		sb.append("CODENUM"); //主键
    	sb.append(",");
   		sb.append("ISLOCKSTATUSSYS"); //是否被锁定
    	sb.append(",");
   		sb.append("CURRENTUSERSYS"); //当前用户
    	sb.append(",");
   		sb.append("CURRENTROLESYS"); //当前角色
    	sb.append(",");
   		sb.append("CURRENTUSERGORUPSYS"); //用户组
    	sb.append(",");
   		sb.append("CURRENTDEPARTMENTSYS"); //当前部门
    	sb.append(",");
   		sb.append("ISSTARTRECYCLE"); //是否启用回收站
    	sb.append(",");
   		sb.append("SHAREROLESYS"); //共享角色
    	sb.append(",");
   		sb.append("SHAREUSERSYS"); //共享用户
    	sb.append(",");
   		sb.append("SHAREDEPARTMENTSYS"); //共享部门
    	sb.append(",");
   		sb.append("SHAREUSERGROUP"); //共享用户组
    	sb.append(",");
   		sb.append("SALES_ORG"); //销售组织
    	sb.append(",");
   		sb.append("DISTR_CHAN"); //分销渠道
    	sb.append(",");
   		sb.append("DIVISION"); //产品组
    	sb.append(",");
   		sb.append("SALES_OFFICE"); //销售部门（销售办公室）
    	sb.append(",");
   		sb.append("SALES_GROUP"); //销售组
    	sb.append(",");
   		sb.append("SALES_AREA"); //销售地区
    	sb.append(",");
   		sb.append("IS_DELETESYS"); //逻辑删除标识
    	sb.append(",");
   		sb.append("UPDATE_DATESYS"); //逻辑删除恢复时间
    	sb.append(",");
   		sb.append("PO_ITEM"); //行项目
    	sb.append(",");
   		sb.append("VALUE"); //值
    	sb.append(",");
   		sb.append("HCODENUM"); //表头编号
        sb.append(" FROM ZTESTITEM WHERE ");
    	sb.append("HCODENUM=?");
        return sb.toString();
	}

    /**
	 *  @return
	 */
 	public static String getQuerySql()	{
	    StringBuffer sb = new StringBuffer();
	    sb.append("SELECT "); 
   		sb.append("CODENUM"); //主键
    	sb.append(",");
   		sb.append("ISLOCKSTATUSSYS"); //是否被锁定
    	sb.append(",");
   		sb.append("CURRENTUSERSYS"); //当前用户
    	sb.append(",");
   		sb.append("CURRENTROLESYS"); //当前角色
    	sb.append(",");
   		sb.append("CURRENTUSERGORUPSYS"); //用户组
    	sb.append(",");
   		sb.append("CURRENTDEPARTMENTSYS"); //当前部门
    	sb.append(",");
   		sb.append("ISSTARTRECYCLE"); //是否启用回收站
    	sb.append(",");
   		sb.append("SHAREROLESYS"); //共享角色
    	sb.append(",");
   		sb.append("SHAREUSERSYS"); //共享用户
    	sb.append(",");
   		sb.append("SHAREDEPARTMENTSYS"); //共享部门
    	sb.append(",");
   		sb.append("SHAREUSERGROUP"); //共享用户组
    	sb.append(",");
   		sb.append("SALES_ORG"); //销售组织
    	sb.append(",");
   		sb.append("DISTR_CHAN"); //分销渠道
    	sb.append(",");
   		sb.append("DIVISION"); //产品组
    	sb.append(",");
   		sb.append("SALES_OFFICE"); //销售部门（销售办公室）
    	sb.append(",");
   		sb.append("SALES_GROUP"); //销售组
    	sb.append(",");
   		sb.append("SALES_AREA"); //销售地区
    	sb.append(",");
   		sb.append("IS_DELETESYS"); //逻辑删除标识
    	sb.append(",");
   		sb.append("UPDATE_DATESYS"); //逻辑删除恢复时间
    	sb.append(",");
   		sb.append("PO_ITEM"); //行项目
    	sb.append(",");
   		sb.append("VALUE"); //值
    	sb.append(",");
   		sb.append("HCODENUM"); //表头编号
        sb.append(" FROM ZTESTITEM");
        return sb.toString();
	}
    //记录明细内部类
    protected static class ZtestitemDetail extends MappingSqlQuery {
        protected ZtestitemDetail(DataSource ds) {
            super(ds, detailSql);
            //参数类型设定
			declareParameter(new SqlParameter(Types.VARCHAR));
        }
        /**
         * @param rs
         * @param rowNum
         * @return
         * @throws SQLException
         */
        protected Object mapRow(ResultSet rs, int rowNum) throws SQLException {
            Ztestitem ztestitem = new Ztestitem();
			ztestitem.setCODENUM(rs.getString("CODENUM"));    
			ztestitem.setISLOCKSTATUSSYS(rs.getString("ISLOCKSTATUSSYS"));    
			ztestitem.setCURRENTUSERSYS(rs.getString("CURRENTUSERSYS"));    
			ztestitem.setCURRENTROLESYS(rs.getString("CURRENTROLESYS"));    
			ztestitem.setCURRENTUSERGORUPSYS(rs.getString("CURRENTUSERGORUPSYS"));    
			ztestitem.setCURRENTDEPARTMENTSYS(rs.getString("CURRENTDEPARTMENTSYS"));    
			ztestitem.setISSTARTRECYCLE(rs.getString("ISSTARTRECYCLE"));    
			ztestitem.setSHAREROLESYS(rs.getString("SHAREROLESYS"));    
			ztestitem.setSHAREUSERSYS(rs.getString("SHAREUSERSYS"));    
			ztestitem.setSHAREDEPARTMENTSYS(rs.getString("SHAREDEPARTMENTSYS"));    
			ztestitem.setSHAREUSERGROUP(rs.getString("SHAREUSERGROUP"));    
			ztestitem.setSALES_ORG(rs.getString("SALES_ORG"));    
			ztestitem.setDISTR_CHAN(rs.getString("DISTR_CHAN"));    
			ztestitem.setDIVISION(rs.getString("DIVISION"));    
			ztestitem.setSALES_OFFICE(rs.getString("SALES_OFFICE"));    
			ztestitem.setSALES_GROUP(rs.getString("SALES_GROUP"));    
			ztestitem.setSALES_AREA(rs.getString("SALES_AREA"));    
			ztestitem.setIS_DELETESYS(rs.getString("IS_DELETESYS"));    
			ztestitem.setUPDATE_DATESYS(rs.getString("UPDATE_DATESYS"));    
			ztestitem.setPO_ITEM(rs.getString("PO_ITEM"));    
			ztestitem.setVALUE(rs.getString("VALUE"));    
			ztestitem.setHCODENUM(rs.getString("HCODENUM"));    
            return ztestitem;
        }
		/** 
		 * @param  codenum
		 * @return
		 */ 
		public List load( String codenum) {
            return execute(new Object[] {   codenum});
        }
    }

    //记录增加内部类
    protected static class ZtestitemInsert extends SqlUpdate {
        protected ZtestitemInsert(DataSource ds) {
            super(ds, insertSql);
            //参数类型设定
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
        }        
        /** 
         * @param ztestitem
         * @return
         */
        public int insert(Ztestitem ztestitem) {
            Object[] objs =
                new Object[] {
					ztestitem.getCODENUM(), 
					ztestitem.getISLOCKSTATUSSYS(), 
					ztestitem.getCURRENTUSERSYS(), 
					ztestitem.getCURRENTROLESYS(), 
					ztestitem.getCURRENTUSERGORUPSYS(), 
					ztestitem.getCURRENTDEPARTMENTSYS(), 
					ztestitem.getISSTARTRECYCLE(), 
					ztestitem.getSHAREROLESYS(), 
					ztestitem.getSHAREUSERSYS(), 
					ztestitem.getSHAREDEPARTMENTSYS(), 
					ztestitem.getSHAREUSERGROUP(), 
					ztestitem.getSALES_ORG(), 
					ztestitem.getDISTR_CHAN(), 
					ztestitem.getDIVISION(), 
					ztestitem.getSALES_OFFICE(), 
					ztestitem.getSALES_GROUP(), 
					ztestitem.getSALES_AREA(), 
					ztestitem.getIS_DELETESYS(), 
					ztestitem.getUPDATE_DATESYS(), 
					ztestitem.getPO_ITEM(), 
					ztestitem.getVALUE(), 
					ztestitem.getHCODENUM(), 
                    };
            return update(objs);
        }
    }

	//记录修改内部类
    protected static class ZtestitemUpdate extends SqlUpdate {
        protected ZtestitemUpdate(DataSource ds) {
            super(ds, updateSql);
            //参数类型设定  
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
			declareParameter(new SqlParameter(Types.VARCHAR)); 
        }   
        /** 
         * @param ztestitem
         * @return
         */     
        public int update(Ztestitem ztestitem) {
            Object[] objs =
                new Object[] {
					ztestitem.getCODENUM(), 
					ztestitem.getISLOCKSTATUSSYS(), 
					ztestitem.getCURRENTUSERSYS(), 
					ztestitem.getCURRENTROLESYS(), 
					ztestitem.getCURRENTUSERGORUPSYS(), 
					ztestitem.getCURRENTDEPARTMENTSYS(), 
					ztestitem.getISSTARTRECYCLE(), 
					ztestitem.getSHAREROLESYS(), 
					ztestitem.getSHAREUSERSYS(), 
					ztestitem.getSHAREDEPARTMENTSYS(), 
					ztestitem.getSHAREUSERGROUP(), 
					ztestitem.getSALES_ORG(), 
					ztestitem.getDISTR_CHAN(), 
					ztestitem.getDIVISION(), 
					ztestitem.getSALES_OFFICE(), 
					ztestitem.getSALES_GROUP(), 
					ztestitem.getSALES_AREA(), 
					ztestitem.getIS_DELETESYS(), 
					ztestitem.getUPDATE_DATESYS(), 
					ztestitem.getPO_ITEM(), 
					ztestitem.getVALUE(), 
					ztestitem.getHCODENUM(), 
                    };
            return update(objs);
        }
    }

	//记录删除内部类
    protected static class ZtestitemDelete extends SqlUpdate {
        protected ZtestitemDelete(DataSource ds) {
            super(ds, deleteSql);
            //参数类型设定
			declareParameter(new SqlParameter(Types.VARCHAR));
        }
        /**
         * @param  codenum
         * @return
         */
        public int delete( String codenum) {
            Object[] objs = new Object[] {  codenum};
            return update(objs);
        }
    }

    //特殊查询内部类
    protected static class ZtestitemQuery extends MappingSqlQuery {
        protected ZtestitemQuery(DataSource ds) {
            super(ds, querySql);
        }
        /**
         * @param rs
         * @param rowNum
         * @return
         * @throws SQLException
         */
        protected Object mapRow(ResultSet rs, int rowNum) throws SQLException {
            Ztestitem ztestitem = new Ztestitem();
			ztestitem.setCODENUM(rs.getString("CODENUM"));    
			ztestitem.setISLOCKSTATUSSYS(rs.getString("ISLOCKSTATUSSYS"));    
			ztestitem.setCURRENTUSERSYS(rs.getString("CURRENTUSERSYS"));    
			ztestitem.setCURRENTROLESYS(rs.getString("CURRENTROLESYS"));    
			ztestitem.setCURRENTUSERGORUPSYS(rs.getString("CURRENTUSERGORUPSYS"));    
			ztestitem.setCURRENTDEPARTMENTSYS(rs.getString("CURRENTDEPARTMENTSYS"));    
			ztestitem.setISSTARTRECYCLE(rs.getString("ISSTARTRECYCLE"));    
			ztestitem.setSHAREROLESYS(rs.getString("SHAREROLESYS"));    
			ztestitem.setSHAREUSERSYS(rs.getString("SHAREUSERSYS"));    
			ztestitem.setSHAREDEPARTMENTSYS(rs.getString("SHAREDEPARTMENTSYS"));    
			ztestitem.setSHAREUSERGROUP(rs.getString("SHAREUSERGROUP"));    
			ztestitem.setSALES_ORG(rs.getString("SALES_ORG"));    
			ztestitem.setDISTR_CHAN(rs.getString("DISTR_CHAN"));    
			ztestitem.setDIVISION(rs.getString("DIVISION"));    
			ztestitem.setSALES_OFFICE(rs.getString("SALES_OFFICE"));    
			ztestitem.setSALES_GROUP(rs.getString("SALES_GROUP"));    
			ztestitem.setSALES_AREA(rs.getString("SALES_AREA"));    
			ztestitem.setIS_DELETESYS(rs.getString("IS_DELETESYS"));    
			ztestitem.setUPDATE_DATESYS(rs.getString("UPDATE_DATESYS"));    
			ztestitem.setPO_ITEM(rs.getString("PO_ITEM"));    
			ztestitem.setVALUE(rs.getString("VALUE"));    
			ztestitem.setHCODENUM(rs.getString("HCODENUM"));    
            return ztestitem;
        }
    }

    private ZtestitemDelete deleter = null;
    private ZtestitemInsert inserter = null;
    private ZtestitemDetail finder = null;
    private ZtestitemUpdate updater = null;
    protected void initDao() {
        if (deleter == null) {
            deleter = new ZtestitemDelete(getDataSource());
            deleter.compile();
        }
        if (inserter == null) {
            inserter = new ZtestitemInsert(getDataSource());
            inserter.compile();
        }
        if (finder == null) {
            finder = new ZtestitemDetail(getDataSource());
            finder.compile();
        }
        if (updater == null) {
            updater = new ZtestitemUpdate(getDataSource());
            updater.compile();
        }
    }

    /**
     * @param  codenum     
     */
    public void deleteZtestitem( String codenum) {
        deleter.delete( codenum);
    }

    /**
     * @param  codenum     
     * @return
     */
    public List getZtestitem( String codenum) {
        return finder.load( codenum);
    }

    /**
     * @param ztestitem
     * @return
     */
    public Ztestitem insertZtestitem(Ztestitem ztestitem) {
        inserter.insert(ztestitem);
        return ztestitem;
    }

    /**
     * @param ztestitem
     * @return
     */
    public Ztestitem updateZtestitem(Ztestitem ztestitem) {
        updater.update(ztestitem);
        return ztestitem;
    }

    /**
     * 查询	测试行项目	一页记录
     * @param rowSelection
     * @param map
     * @return
     */
    public Page getAllZtestitem(RowSelection rowSelection,Map map){
        ZtestitemQuery queryer = new ZtestitemQuery(getDataSource());
        StringBuffer sb = new StringBuffer(queryer.getSql());
        String [] searchId=new String[22];
		String [] sa0=(String [])map.get("codenumSearch");
        if(sa0!=null){
			searchId[0]=sa0[0];
        }
		String [] sa1=(String [])map.get("islockstatussysSearch");
        if(sa1!=null){
			searchId[1]=sa1[0];
        }
		String [] sa2=(String [])map.get("currentusersysSearch");
        if(sa2!=null){
			searchId[2]=sa2[0];
        }
		String [] sa3=(String [])map.get("currentrolesysSearch");
        if(sa3!=null){
			searchId[3]=sa3[0];
        }
		String [] sa4=(String [])map.get("currentusergorupsysSearch");
        if(sa4!=null){
			searchId[4]=sa4[0];
        }
		String [] sa5=(String [])map.get("currentdepartmentsysSearch");
        if(sa5!=null){
			searchId[5]=sa5[0];
        }
		String [] sa6=(String [])map.get("isstartrecycleSearch");
        if(sa6!=null){
			searchId[6]=sa6[0];
        }
		String [] sa7=(String [])map.get("sharerolesysSearch");
        if(sa7!=null){
			searchId[7]=sa7[0];
        }
		String [] sa8=(String [])map.get("shareusersysSearch");
        if(sa8!=null){
			searchId[8]=sa8[0];
        }
		String [] sa9=(String [])map.get("sharedepartmentsysSearch");
        if(sa9!=null){
			searchId[9]=sa9[0];
        }
		String [] sa10=(String [])map.get("shareusergroupSearch");
        if(sa10!=null){
			searchId[10]=sa10[0];
        }
		String [] sa11=(String [])map.get("sales_orgSearch");
        if(sa11!=null){
			searchId[11]=sa11[0];
        }
		String [] sa12=(String [])map.get("distr_chanSearch");
        if(sa12!=null){
			searchId[12]=sa12[0];
        }
		String [] sa13=(String [])map.get("divisionSearch");
        if(sa13!=null){
			searchId[13]=sa13[0];
        }
		String [] sa14=(String [])map.get("sales_officeSearch");
        if(sa14!=null){
			searchId[14]=sa14[0];
        }
		String [] sa15=(String [])map.get("sales_groupSearch");
        if(sa15!=null){
			searchId[15]=sa15[0];
        }
		String [] sa16=(String [])map.get("sales_areaSearch");
        if(sa16!=null){
			searchId[16]=sa16[0];
        }
		String [] sa17=(String [])map.get("is_deletesysSearch");
        if(sa17!=null){
			searchId[17]=sa17[0];
        }
		String [] sa18=(String [])map.get("update_datesysSearch");
        if(sa18!=null){
			searchId[18]=sa18[0];
        }
		String [] sa19=(String [])map.get("po_itemSearch");
        if(sa19!=null){
			searchId[19]=sa19[0];
        }
		String [] sa20=(String [])map.get("valueSearch");
        if(sa20!=null){
			searchId[20]=sa20[0];
        }
		String [] sa21=(String [])map.get("hcodenumSearch");
        if(sa21!=null){
			searchId[21]=sa21[0];
        }
        boolean whFlag=false;
        for(int i=0;i<searchId.length;i++){
            if(searchId[i]!=null){
                if(!searchId[i].equalsIgnoreCase("")){
                    whFlag=true;
                }
            }
        }
        if(whFlag==true){
            sb.append(" WHERE ");
        }
        boolean andFlag=false;
        if (searchId[0] != null) {
            if ((!searchId[0].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTESTITEM.CODENUM like '%").append(searchId[0]).append("%'");
      				andFlag=true;
            }
        }
        if (searchId[1] != null) {
            if ((!searchId[1].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTESTITEM.ISLOCKSTATUSSYS like '%").append(searchId[1]).append("%'");
      				andFlag=true;
            }
        }
        if (searchId[2] != null) {
            if ((!searchId[2].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTESTITEM.CURRENTUSERSYS like '%").append(searchId[2]).append("%'");
      				andFlag=true;
            }
        }
        if (searchId[3] != null) {
            if ((!searchId[3].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTESTITEM.CURRENTROLESYS like '%").append(searchId[3]).append("%'");
      				andFlag=true;
            }
        }
        if (searchId[4] != null) {
            if ((!searchId[4].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTESTITEM.CURRENTUSERGORUPSYS like '%").append(searchId[4]).append("%'");
      				andFlag=true;
            }
        }
        if (searchId[5] != null) {
            if ((!searchId[5].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTESTITEM.CURRENTDEPARTMENTSYS like '%").append(searchId[5]).append("%'");
      				andFlag=true;
            }
        }
        if (searchId[6] != null) {
            if ((!searchId[6].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTESTITEM.ISSTARTRECYCLE like '%").append(searchId[6]).append("%'");
      				andFlag=true;
            }
        }
        if (searchId[7] != null) {
            if ((!searchId[7].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTESTITEM.SHAREROLESYS like '%").append(searchId[7]).append("%'");
      				andFlag=true;
            }
        }
        if (searchId[8] != null) {
            if ((!searchId[8].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTESTITEM.SHAREUSERSYS like '%").append(searchId[8]).append("%'");
      				andFlag=true;
            }
        }
        if (searchId[9] != null) {
            if ((!searchId[9].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTESTITEM.SHAREDEPARTMENTSYS like '%").append(searchId[9]).append("%'");
      				andFlag=true;
            }
        }
        if (searchId[10] != null) {
            if ((!searchId[10].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTESTITEM.SHAREUSERGROUP like '%").append(searchId[10]).append("%'");
      				andFlag=true;
            }
        }
        if (searchId[11] != null) {
            if ((!searchId[11].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTESTITEM.SALES_ORG like '%").append(searchId[11]).append("%'");
      				andFlag=true;
            }
        }
        if (searchId[12] != null) {
            if ((!searchId[12].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTESTITEM.DISTR_CHAN like '%").append(searchId[12]).append("%'");
      				andFlag=true;
            }
        }
        if (searchId[13] != null) {
            if ((!searchId[13].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTESTITEM.DIVISION like '%").append(searchId[13]).append("%'");
      				andFlag=true;
            }
        }
        if (searchId[14] != null) {
            if ((!searchId[14].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTESTITEM.SALES_OFFICE like '%").append(searchId[14]).append("%'");
      				andFlag=true;
            }
        }
        if (searchId[15] != null) {
            if ((!searchId[15].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTESTITEM.SALES_GROUP like '%").append(searchId[15]).append("%'");
      				andFlag=true;
            }
        }
        if (searchId[16] != null) {
            if ((!searchId[16].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTESTITEM.SALES_AREA like '%").append(searchId[16]).append("%'");
      				andFlag=true;
            }
        }
        if (searchId[17] != null) {
            if ((!searchId[17].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTESTITEM.IS_DELETESYS like '%").append(searchId[17]).append("%'");
      				andFlag=true;
            }
        }
        if (searchId[18] != null) {
            if ((!searchId[18].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTESTITEM.UPDATE_DATESYS like '%").append(searchId[18]).append("%'");
      				andFlag=true;
            }
        }
        if (searchId[19] != null) {
            if ((!searchId[19].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTESTITEM.PO_ITEM like '%").append(searchId[19]).append("%'");
      				andFlag=true;
            }
        }
        if (searchId[20] != null) {
            if ((!searchId[20].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTESTITEM.VALUE like '%").append(searchId[20]).append("%'");
      				andFlag=true;
            }
        }
        if (searchId[21] != null) {
            if ((!searchId[21].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTESTITEM.HCODENUM like '%").append(searchId[21]).append("%'");
      				andFlag=true;
            }
        }
        /****************************权限条件组装开始***********************************/
        String[] dep=(String [])map.get("departSearch_kz");//部门 
        String[] user=(String [])map.get("userSearch_kz"); //用户 
        String dep_str=(dep==null)?"":dep[0];
        String user_str=(user==null)?"":user[0];
       
        if((!dep_str.equalsIgnoreCase(""))&&(!user_str.equalsIgnoreCase(""))){
        	if(!whFlag){//无其他查询条件
        		sb.append(" WHERE ");
        		sb.append(" ZTESTITEM.CURRENTUSERSYS IN").append(user[0]) ;
        		sb.append(" OR ");
        		sb.append(" ZTESTITEM.CURRENTDEPARTMENTSYS IN ").append(dep[0]);
        	}
        	else{
        		String  sb_kz = sb.toString();
        	    int spliti = sb_kz.indexOf("WHERE");
        	    if(spliti>0){sb_kz = sb_kz.substring(spliti+6);}
        		sb.append(" AND ");
        		sb.append(" ZTESTITEM.CURRENTUSERSYS IN").append(user[0]) ;
        		sb.append(" OR ");
        		sb.append( sb_kz);
        		sb.append(" AND ");
        		sb.append(" ZTESTITEM.CURRENTDEPARTMENTSYS IN ").append(dep[0]); 
        	} 
        }
        else{
        	if(!dep_str.equalsIgnoreCase("")){
        		if(!whFlag){ sb.append(" WHERE ");  }//无其他条件
        		else{ sb.append(" AND "); }
        		sb.append(" ZTESTITEM.CURRENTDEPARTMENTSYS IN ").append(dep[0]); 
        	}
        	else if(!user_str.equalsIgnoreCase("")){
        		if(!whFlag){ sb.append(" WHERE ");  }//无其他条件
        		else{ sb.append(" AND "); }
        		sb.append(" ZTESTITEM.CURRENTUSERSYS IN").append(user[0]) ;
        	}
        }
        /****************************权限条件组装结束***********************************/
        queryer.setSql(sb.toString());
        queryer.setPageAble(true);
        queryer.compile();
        return queryer.executePage(rowSelection);
	}

    /**
     * 查询	测试行项目	全部记录
     * @param map
     * @return
     */
	public List getAllZtestitemNoPage(Map map){
        ZtestitemQuery queryer = new ZtestitemQuery(getDataSource());
        StringBuffer sb = new StringBuffer(queryer.getSql());
        String [] searchId=new String[22];
		String [] sa0=(String [])map.get("codenumSearch");
        if(sa0!=null){
			searchId[0]=sa0[0];
        }
		String [] sa1=(String [])map.get("islockstatussysSearch");
        if(sa1!=null){
			searchId[1]=sa1[0];
        }
		String [] sa2=(String [])map.get("currentusersysSearch");
        if(sa2!=null){
			searchId[2]=sa2[0];
        }
		String [] sa3=(String [])map.get("currentrolesysSearch");
        if(sa3!=null){
			searchId[3]=sa3[0];
        }
		String [] sa4=(String [])map.get("currentusergorupsysSearch");
        if(sa4!=null){
			searchId[4]=sa4[0];
        }
		String [] sa5=(String [])map.get("currentdepartmentsysSearch");
        if(sa5!=null){
			searchId[5]=sa5[0];
        }
		String [] sa6=(String [])map.get("isstartrecycleSearch");
        if(sa6!=null){
			searchId[6]=sa6[0];
        }
		String [] sa7=(String [])map.get("sharerolesysSearch");
        if(sa7!=null){
			searchId[7]=sa7[0];
        }
		String [] sa8=(String [])map.get("shareusersysSearch");
        if(sa8!=null){
			searchId[8]=sa8[0];
        }
		String [] sa9=(String [])map.get("sharedepartmentsysSearch");
        if(sa9!=null){
			searchId[9]=sa9[0];
        }
		String [] sa10=(String [])map.get("shareusergroupSearch");
        if(sa10!=null){
			searchId[10]=sa10[0];
        }
		String [] sa11=(String [])map.get("sales_orgSearch");
        if(sa11!=null){
			searchId[11]=sa11[0];
        }
		String [] sa12=(String [])map.get("distr_chanSearch");
        if(sa12!=null){
			searchId[12]=sa12[0];
        }
		String [] sa13=(String [])map.get("divisionSearch");
        if(sa13!=null){
			searchId[13]=sa13[0];
        }
		String [] sa14=(String [])map.get("sales_officeSearch");
        if(sa14!=null){
			searchId[14]=sa14[0];
        }
		String [] sa15=(String [])map.get("sales_groupSearch");
        if(sa15!=null){
			searchId[15]=sa15[0];
        }
		String [] sa16=(String [])map.get("sales_areaSearch");
        if(sa16!=null){
			searchId[16]=sa16[0];
        }
		String [] sa17=(String [])map.get("is_deletesysSearch");
        if(sa17!=null){
			searchId[17]=sa17[0];
        }
		String [] sa18=(String [])map.get("update_datesysSearch");
        if(sa18!=null){
			searchId[18]=sa18[0];
        }
		String [] sa19=(String [])map.get("po_itemSearch");
        if(sa19!=null){
			searchId[19]=sa19[0];
        }
		String [] sa20=(String [])map.get("valueSearch");
        if(sa20!=null){
			searchId[20]=sa20[0];
        }
		String [] sa21=(String [])map.get("hcodenumSearch");
        if(sa21!=null){
			searchId[21]=sa21[0];
        }
        boolean whFlag=false;
        for(int i=0;i<searchId.length;i++){
            if(searchId[i]!=null){
                if(!searchId[i].equalsIgnoreCase("")){
                    whFlag=true;
                }
            }
        }
        if(whFlag==true){
            sb.append(" WHERE ");
        }
        boolean andFlag=false;
        if (searchId[0] != null) {
            if ((!searchId[0].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTESTITEM.CODENUM like '%").append(searchId[0]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[1] != null) {
            if ((!searchId[1].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTESTITEM.ISLOCKSTATUSSYS like '%").append(searchId[1]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[2] != null) {
            if ((!searchId[2].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTESTITEM.CURRENTUSERSYS like '%").append(searchId[2]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[3] != null) {
            if ((!searchId[3].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTESTITEM.CURRENTROLESYS like '%").append(searchId[3]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[4] != null) {
            if ((!searchId[4].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTESTITEM.CURRENTUSERGORUPSYS like '%").append(searchId[4]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[5] != null) {
            if ((!searchId[5].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTESTITEM.CURRENTDEPARTMENTSYS like '%").append(searchId[5]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[6] != null) {
            if ((!searchId[6].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTESTITEM.ISSTARTRECYCLE like '%").append(searchId[6]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[7] != null) {
            if ((!searchId[7].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTESTITEM.SHAREROLESYS like '%").append(searchId[7]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[8] != null) {
            if ((!searchId[8].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTESTITEM.SHAREUSERSYS like '%").append(searchId[8]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[9] != null) {
            if ((!searchId[9].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTESTITEM.SHAREDEPARTMENTSYS like '%").append(searchId[9]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[10] != null) {
            if ((!searchId[10].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTESTITEM.SHAREUSERGROUP like '%").append(searchId[10]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[11] != null) {
            if ((!searchId[11].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTESTITEM.SALES_ORG like '%").append(searchId[11]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[12] != null) {
            if ((!searchId[12].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTESTITEM.DISTR_CHAN like '%").append(searchId[12]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[13] != null) {
            if ((!searchId[13].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTESTITEM.DIVISION like '%").append(searchId[13]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[14] != null) {
            if ((!searchId[14].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTESTITEM.SALES_OFFICE like '%").append(searchId[14]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[15] != null) {
            if ((!searchId[15].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTESTITEM.SALES_GROUP like '%").append(searchId[15]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[16] != null) {
            if ((!searchId[16].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTESTITEM.SALES_AREA like '%").append(searchId[16]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[17] != null) {
            if ((!searchId[17].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTESTITEM.IS_DELETESYS like '%").append(searchId[17]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[18] != null) {
            if ((!searchId[18].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTESTITEM.UPDATE_DATESYS like '%").append(searchId[18]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[19] != null) {
            if ((!searchId[19].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTESTITEM.PO_ITEM like '%").append(searchId[19]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[20] != null) {
            if ((!searchId[20].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTESTITEM.VALUE like '%").append(searchId[20]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[21] != null) {
            if ((!searchId[21].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTESTITEM.HCODENUM like '%").append(searchId[21]).append("%'");
                }
        }
        queryer.setSql(sb.toString());
        queryer.setPageAble(true);
        queryer.compile();
        return queryer.execute();
	}
}
