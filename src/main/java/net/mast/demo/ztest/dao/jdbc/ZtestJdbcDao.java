/*
 * @(#)IZtestJdbcDao.java 
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

import net.mast.demo.ztest.dao.IZtestDao;
import net.mast.demo.ztest.data.Ztest;

/**
 * 功能:本类为测试行的Dao实现类ZtestJdbcDao
 *
 * @author  sp
 * @date    [Fri Jul 23 15:56:29 CST 2010]
 *
 * $Id$
 */
   @SuppressWarnings({"unused","unchecked"})
public class ZtestJdbcDao extends BaseJdbcDao implements IZtestDao {
    private static Log log = LogFactory.getLog(ZtestJdbcDao.class);
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
        sb.append("INSERT INTO ZTEST (");
    	sb.append("CODENUM"); //主键
    	sb.append(",");
    	sb.append("SALES_AREA"); //销售地区
    	sb.append(",");
    	sb.append("IS_DELETESYS"); //逻辑删除标识
    	sb.append(",");
    	sb.append("UPDATE_DATESYS"); //逻辑删除恢复时间
    	sb.append(",");
    	sb.append("ISSTARTRECYCLE"); //是否启用回收站
    	sb.append(",");
    	sb.append("SHAREROLESYS"); //共享角色
    	sb.append(",");
    	sb.append("ID"); //键
    	sb.append(",");
    	sb.append("VALUE"); //键值
    	sb.append(",");
    	sb.append("ISLOCKSTATUSSYS"); //是否被锁定
    	sb.append(",");
    	sb.append("CURRENTUSERSYS"); //当前用户
    	sb.append(",");
    	sb.append("CURRENTROLESYS"); //当前角色
    	sb.append(",");
    	sb.append("CURRENTUSERGORUPSYS"); //用户组
    	sb.append(",");
    	sb.append("DIVISION"); //产品组
    	sb.append(",");
    	sb.append("SALES_OFFICE"); //销售部门（销售办公室）
    	sb.append(",");
    	sb.append("SALES_GROUP"); //销售组
    	sb.append(",");
    	sb.append("SHAREDEPARTMENTSYS"); //共享部门
    	sb.append(",");
    	sb.append("SHAREUSERGROUP"); //共享用户组
    	sb.append(",");
    	sb.append("CURRENTDEPARTMENTSYS"); //当前部门
    	sb.append(",");
    	sb.append("SALES_ORG"); //销售组织
    	sb.append(",");
    	sb.append("DISTR_CHAN"); //分销渠道
    	sb.append(",");
    	sb.append("SHAREUSERSYS"); //共享用户
    	sb.append(") VALUES(");
    	sb.append("?");  //主键
    	sb.append(",");
    	sb.append("?");  //销售地区
    	sb.append(",");
    	sb.append("?");  //逻辑删除标识
    	sb.append(",");
    	sb.append("?");  //逻辑删除恢复时间
    	sb.append(",");
    	sb.append("?");  //是否启用回收站
    	sb.append(",");
    	sb.append("?");  //共享角色
    	sb.append(",");
    	sb.append("?");  //键
    	sb.append(",");
    	sb.append("?");  //键值
    	sb.append(",");
    	sb.append("?");  //是否被锁定
    	sb.append(",");
    	sb.append("?");  //当前用户
    	sb.append(",");
    	sb.append("?");  //当前角色
    	sb.append(",");
    	sb.append("?");  //用户组
    	sb.append(",");
    	sb.append("?");  //产品组
    	sb.append(",");
    	sb.append("?");  //销售部门（销售办公室）
    	sb.append(",");
    	sb.append("?");  //销售组
    	sb.append(",");
    	sb.append("?");  //共享部门
    	sb.append(",");
    	sb.append("?");  //共享用户组
    	sb.append(",");
    	sb.append("?");  //当前部门
    	sb.append(",");
    	sb.append("?");  //销售组织
    	sb.append(",");
    	sb.append("?");  //分销渠道
    	sb.append(",");
    	sb.append("?");  //共享用户
    	sb.append(")");
    	return sb.toString();
    }

	/**
	 *  @return
	 */
    public static String getUpdateSql() {
        StringBuffer sb = new StringBuffer();
        sb.append("UPDATE ZTEST SET ");
		sb.append("SALES_AREA=?");  //销售地区
		sb.append(" , ");
		sb.append("IS_DELETESYS=?");  //逻辑删除标识
		sb.append(" , ");
		sb.append("UPDATE_DATESYS=?");  //逻辑删除恢复时间
		sb.append(" , ");
		sb.append("ISSTARTRECYCLE=?");  //是否启用回收站
		sb.append(" , ");
		sb.append("SHAREROLESYS=?");  //共享角色
		sb.append(" , ");
		sb.append("ID=?");  //键
		sb.append(" , ");
		sb.append("VALUE=?");  //键值
		sb.append(" , ");
		sb.append("ISLOCKSTATUSSYS=?");  //是否被锁定
		sb.append(" , ");
		sb.append("CURRENTUSERSYS=?");  //当前用户
		sb.append(" , ");
		sb.append("CURRENTROLESYS=?");  //当前角色
		sb.append(" , ");
		sb.append("CURRENTUSERGORUPSYS=?");  //用户组
		sb.append(" , ");
		sb.append("DIVISION=?");  //产品组
		sb.append(" , ");
		sb.append("SALES_OFFICE=?");  //销售部门（销售办公室）
		sb.append(" , ");
		sb.append("SALES_GROUP=?");  //销售组
		sb.append(" , ");
		sb.append("SHAREDEPARTMENTSYS=?");  //共享部门
		sb.append(" , ");
		sb.append("SHAREUSERGROUP=?");  //共享用户组
		sb.append(" , ");
		sb.append("CURRENTDEPARTMENTSYS=?");  //当前部门
		sb.append(" , ");
		sb.append("SALES_ORG=?");  //销售组织
		sb.append(" , ");
		sb.append("DISTR_CHAN=?");  //分销渠道
		sb.append(" , ");
		sb.append("SHAREUSERSYS=?");  //共享用户
    	sb.append(" WHERE ");

    	sb.append("CODENUM=?");  //主键
        return sb.toString();
    }

    /**
	 *  @return
	 */
    public static String getDeleteSql(){
        StringBuffer sb = new StringBuffer();
        sb.append("DELETE FROM ZTEST WHERE ");
    	sb.append("CODENUM=?"); //主键
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
   		sb.append("SALES_AREA"); //销售地区
    	sb.append(",");
   		sb.append("IS_DELETESYS"); //逻辑删除标识
    	sb.append(",");
   		sb.append("UPDATE_DATESYS"); //逻辑删除恢复时间
    	sb.append(",");
   		sb.append("ISSTARTRECYCLE"); //是否启用回收站
    	sb.append(",");
   		sb.append("SHAREROLESYS"); //共享角色
    	sb.append(",");
   		sb.append("ID"); //键
    	sb.append(",");
   		sb.append("VALUE"); //键值
    	sb.append(",");
   		sb.append("ISLOCKSTATUSSYS"); //是否被锁定
    	sb.append(",");
   		sb.append("CURRENTUSERSYS"); //当前用户
    	sb.append(",");
   		sb.append("CURRENTROLESYS"); //当前角色
    	sb.append(",");
   		sb.append("CURRENTUSERGORUPSYS"); //用户组
    	sb.append(",");
   		sb.append("DIVISION"); //产品组
    	sb.append(",");
   		sb.append("SALES_OFFICE"); //销售部门（销售办公室）
    	sb.append(",");
   		sb.append("SALES_GROUP"); //销售组
    	sb.append(",");
   		sb.append("SHAREDEPARTMENTSYS"); //共享部门
    	sb.append(",");
   		sb.append("SHAREUSERGROUP"); //共享用户组
    	sb.append(",");
   		sb.append("CURRENTDEPARTMENTSYS"); //当前部门
    	sb.append(",");
   		sb.append("SALES_ORG"); //销售组织
    	sb.append(",");
   		sb.append("DISTR_CHAN"); //分销渠道
    	sb.append(",");
   		sb.append("SHAREUSERSYS"); //共享用户
        sb.append(" FROM ZTEST WHERE ");
    	sb.append("codenum=?");
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
   		sb.append("SALES_AREA"); //销售地区
    	sb.append(",");
   		sb.append("IS_DELETESYS"); //逻辑删除标识
    	sb.append(",");
   		sb.append("UPDATE_DATESYS"); //逻辑删除恢复时间
    	sb.append(",");
   		sb.append("ISSTARTRECYCLE"); //是否启用回收站
    	sb.append(",");
   		sb.append("SHAREROLESYS"); //共享角色
    	sb.append(",");
   		sb.append("ID"); //键
    	sb.append(",");
   		sb.append("VALUE"); //键值
    	sb.append(",");
   		sb.append("ISLOCKSTATUSSYS"); //是否被锁定
    	sb.append(",");
   		sb.append("CURRENTUSERSYS"); //当前用户
    	sb.append(",");
   		sb.append("CURRENTROLESYS"); //当前角色
    	sb.append(",");
   		sb.append("CURRENTUSERGORUPSYS"); //用户组
    	sb.append(",");
   		sb.append("DIVISION"); //产品组
    	sb.append(",");
   		sb.append("SALES_OFFICE"); //销售部门（销售办公室）
    	sb.append(",");
   		sb.append("SALES_GROUP"); //销售组
    	sb.append(",");
   		sb.append("SHAREDEPARTMENTSYS"); //共享部门
    	sb.append(",");
   		sb.append("SHAREUSERGROUP"); //共享用户组
    	sb.append(",");
   		sb.append("CURRENTDEPARTMENTSYS"); //当前部门
    	sb.append(",");
   		sb.append("SALES_ORG"); //销售组织
    	sb.append(",");
   		sb.append("DISTR_CHAN"); //分销渠道
    	sb.append(",");
   		sb.append("SHAREUSERSYS"); //共享用户
        sb.append(" FROM ZTEST");
        return sb.toString();
	}
    //记录明细内部类
    protected static class ZtestDetail extends MappingSqlQuery {
        protected ZtestDetail(DataSource ds) {
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
            Ztest ztest = new Ztest();
			ztest.setCODENUM(rs.getString("CODENUM"));    
			ztest.setSALES_AREA(rs.getString("SALES_AREA"));    
			ztest.setIS_DELETESYS(rs.getString("IS_DELETESYS"));    
			ztest.setUPDATE_DATESYS(rs.getString("UPDATE_DATESYS"));    
			ztest.setISSTARTRECYCLE(rs.getString("ISSTARTRECYCLE"));    
			ztest.setSHAREROLESYS(rs.getString("SHAREROLESYS"));    
			ztest.setID(rs.getString("ID"));    
			ztest.setVALUE(rs.getString("VALUE"));    
			ztest.setISLOCKSTATUSSYS(rs.getString("ISLOCKSTATUSSYS"));    
			ztest.setCURRENTUSERSYS(rs.getString("CURRENTUSERSYS"));    
			ztest.setCURRENTROLESYS(rs.getString("CURRENTROLESYS"));    
			ztest.setCURRENTUSERGORUPSYS(rs.getString("CURRENTUSERGORUPSYS"));    
			ztest.setDIVISION(rs.getString("DIVISION"));    
			ztest.setSALES_OFFICE(rs.getString("SALES_OFFICE"));    
			ztest.setSALES_GROUP(rs.getString("SALES_GROUP"));    
			ztest.setSHAREDEPARTMENTSYS(rs.getString("SHAREDEPARTMENTSYS"));    
			ztest.setSHAREUSERGROUP(rs.getString("SHAREUSERGROUP"));    
			ztest.setCURRENTDEPARTMENTSYS(rs.getString("CURRENTDEPARTMENTSYS"));    
			ztest.setSALES_ORG(rs.getString("SALES_ORG"));    
			ztest.setDISTR_CHAN(rs.getString("DISTR_CHAN"));    
			ztest.setSHAREUSERSYS(rs.getString("SHAREUSERSYS"));    
            return ztest;
        }
		/** 
		 * @param  codenum
		 * @return
		 */          
        public Ztest load( String codenum) {
            return (Ztest) findObject(new Object[] {   codenum});
        }
    }

    //记录增加内部类
    protected static class ZtestInsert extends SqlUpdate {
        protected ZtestInsert(DataSource ds) {
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
        }        
        /** 
         * @param ztest
         * @return
         */
        public int insert(Ztest ztest) {
            Object[] objs =
                new Object[] {
					ztest.getCODENUM(), 
					ztest.getSALES_AREA(), 
					ztest.getIS_DELETESYS(), 
					ztest.getUPDATE_DATESYS(), 
					ztest.getISSTARTRECYCLE(), 
					ztest.getSHAREROLESYS(), 
					ztest.getID(), 
					ztest.getVALUE(), 
					ztest.getISLOCKSTATUSSYS(), 
					ztest.getCURRENTUSERSYS(), 
					ztest.getCURRENTROLESYS(), 
					ztest.getCURRENTUSERGORUPSYS(), 
					ztest.getDIVISION(), 
					ztest.getSALES_OFFICE(), 
					ztest.getSALES_GROUP(), 
					ztest.getSHAREDEPARTMENTSYS(), 
					ztest.getSHAREUSERGROUP(), 
					ztest.getCURRENTDEPARTMENTSYS(), 
					ztest.getSALES_ORG(), 
					ztest.getDISTR_CHAN(), 
					ztest.getSHAREUSERSYS(), 
                    };
            return update(objs);
        }
    }

	//记录修改内部类
    protected static class ZtestUpdate extends SqlUpdate {
        protected ZtestUpdate(DataSource ds) {
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
        }   
        /** 
         * @param ztest
         * @return
         */     
        public int update(Ztest ztest) {
            Object[] objs =
                new Object[] {
					ztest.getSALES_AREA(), 
					ztest.getIS_DELETESYS(), 
					ztest.getUPDATE_DATESYS(), 
					ztest.getISSTARTRECYCLE(), 
					ztest.getSHAREROLESYS(), 
					ztest.getID(), 
					ztest.getVALUE(), 
					ztest.getISLOCKSTATUSSYS(), 
					ztest.getCURRENTUSERSYS(), 
					ztest.getCURRENTROLESYS(), 
					ztest.getCURRENTUSERGORUPSYS(), 
					ztest.getDIVISION(), 
					ztest.getSALES_OFFICE(), 
					ztest.getSALES_GROUP(), 
					ztest.getSHAREDEPARTMENTSYS(), 
					ztest.getSHAREUSERGROUP(), 
					ztest.getCURRENTDEPARTMENTSYS(), 
					ztest.getSALES_ORG(), 
					ztest.getDISTR_CHAN(), 
					ztest.getSHAREUSERSYS(), 
					ztest.getCODENUM(), 
                    };
            return update(objs);
        }
    }

	//记录删除内部类
    protected static class ZtestDelete extends SqlUpdate {
        protected ZtestDelete(DataSource ds) {
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
    protected static class ZtestQuery extends MappingSqlQuery {
        protected ZtestQuery(DataSource ds) {
            super(ds, querySql);
        }
        /**
         * @param rs
         * @param rowNum
         * @return
         * @throws SQLException
         */
        protected Object mapRow(ResultSet rs, int rowNum) throws SQLException {
            Ztest ztest = new Ztest();
			ztest.setCODENUM(rs.getString("CODENUM"));    
			ztest.setSALES_AREA(rs.getString("SALES_AREA"));    
			ztest.setIS_DELETESYS(rs.getString("IS_DELETESYS"));    
			ztest.setUPDATE_DATESYS(rs.getString("UPDATE_DATESYS"));    
			ztest.setISSTARTRECYCLE(rs.getString("ISSTARTRECYCLE"));    
			ztest.setSHAREROLESYS(rs.getString("SHAREROLESYS"));    
			ztest.setID(rs.getString("ID"));    
			ztest.setVALUE(rs.getString("VALUE"));    
			ztest.setISLOCKSTATUSSYS(rs.getString("ISLOCKSTATUSSYS"));    
			ztest.setCURRENTUSERSYS(rs.getString("CURRENTUSERSYS"));    
			ztest.setCURRENTROLESYS(rs.getString("CURRENTROLESYS"));    
			ztest.setCURRENTUSERGORUPSYS(rs.getString("CURRENTUSERGORUPSYS"));    
			ztest.setDIVISION(rs.getString("DIVISION"));    
			ztest.setSALES_OFFICE(rs.getString("SALES_OFFICE"));    
			ztest.setSALES_GROUP(rs.getString("SALES_GROUP"));    
			ztest.setSHAREDEPARTMENTSYS(rs.getString("SHAREDEPARTMENTSYS"));    
			ztest.setSHAREUSERGROUP(rs.getString("SHAREUSERGROUP"));    
			ztest.setCURRENTDEPARTMENTSYS(rs.getString("CURRENTDEPARTMENTSYS"));    
			ztest.setSALES_ORG(rs.getString("SALES_ORG"));    
			ztest.setDISTR_CHAN(rs.getString("DISTR_CHAN"));    
			ztest.setSHAREUSERSYS(rs.getString("SHAREUSERSYS"));    
            return ztest;
        }
    }

    private ZtestDelete deleter = null;
    private ZtestInsert inserter = null;
    private ZtestDetail finder = null;
    private ZtestUpdate updater = null;
    protected void initDao() {
        if (deleter == null) {
            deleter = new ZtestDelete(getDataSource());
            deleter.compile();
        }
        if (inserter == null) {
            inserter = new ZtestInsert(getDataSource());
            inserter.compile();
        }
        if (finder == null) {
            finder = new ZtestDetail(getDataSource());
            finder.compile();
        }
        if (updater == null) {
            updater = new ZtestUpdate(getDataSource());
            updater.compile();
        }
    }

    /**
     * @param  codenum     
     */
    public void deleteZtest( String codenum) {
        deleter.delete( codenum);
    }

    /**
     * @param  codenum     
     * @return
     */
    public Ztest getZtest( String codenum) {
        return finder.load( codenum);
    }

    /**
     * @param ztest
     * @return
     */
    public Ztest insertZtest(Ztest ztest) {
        inserter.insert(ztest);
        return ztest;
    }

    /**
     * @param ztest
     * @return
     */
    public Ztest updateZtest(Ztest ztest) {
        updater.update(ztest);
        return ztest;
    }

    /**
     * 查询	测试行	一页记录
     * @param rowSelection
     * @param map
     * @return
     */
    public Page getAllZtest(RowSelection rowSelection,Map map){
        ZtestQuery queryer = new ZtestQuery(getDataSource());
        StringBuffer sb = new StringBuffer(queryer.getSql());
        String [] searchId=new String[21];
		String [] sa0=(String [])map.get("codenumSearch");
        if(sa0!=null){
			searchId[0]=sa0[0];
        }
		String [] sa1=(String [])map.get("sales_areaSearch");
        if(sa1!=null){
			searchId[1]=sa1[0];
        }
		String [] sa2=(String [])map.get("is_deletesysSearch");
        if(sa2!=null){
			searchId[2]=sa2[0];
        }
		String [] sa3=(String [])map.get("update_datesysSearch");
        if(sa3!=null){
			searchId[3]=sa3[0];
        }
		String [] sa4=(String [])map.get("isstartrecycleSearch");
        if(sa4!=null){
			searchId[4]=sa4[0];
        }
		String [] sa5=(String [])map.get("sharerolesysSearch");
        if(sa5!=null){
			searchId[5]=sa5[0];
        }
		String [] sa6=(String [])map.get("idSearch");
        if(sa6!=null){
			searchId[6]=sa6[0];
        }
		String [] sa7=(String [])map.get("valueSearch");
        if(sa7!=null){
			searchId[7]=sa7[0];
        }
		String [] sa8=(String [])map.get("islockstatussysSearch");
        if(sa8!=null){
			searchId[8]=sa8[0];
        }
		String [] sa9=(String [])map.get("currentusersysSearch");
        if(sa9!=null){
			searchId[9]=sa9[0];
        }
		String [] sa10=(String [])map.get("currentrolesysSearch");
        if(sa10!=null){
			searchId[10]=sa10[0];
        }
		String [] sa11=(String [])map.get("currentusergorupsysSearch");
        if(sa11!=null){
			searchId[11]=sa11[0];
        }
		String [] sa12=(String [])map.get("divisionSearch");
        if(sa12!=null){
			searchId[12]=sa12[0];
        }
		String [] sa13=(String [])map.get("sales_officeSearch");
        if(sa13!=null){
			searchId[13]=sa13[0];
        }
		String [] sa14=(String [])map.get("sales_groupSearch");
        if(sa14!=null){
			searchId[14]=sa14[0];
        }
		String [] sa15=(String [])map.get("sharedepartmentsysSearch");
        if(sa15!=null){
			searchId[15]=sa15[0];
        }
		String [] sa16=(String [])map.get("shareusergroupSearch");
        if(sa16!=null){
			searchId[16]=sa16[0];
        }
		String [] sa17=(String [])map.get("currentdepartmentsysSearch");
        if(sa17!=null){
			searchId[17]=sa17[0];
        }
		String [] sa18=(String [])map.get("sales_orgSearch");
        if(sa18!=null){
			searchId[18]=sa18[0];
        }
		String [] sa19=(String [])map.get("distr_chanSearch");
        if(sa19!=null){
			searchId[19]=sa19[0];
        }
		String [] sa20=(String [])map.get("shareusersysSearch");
        if(sa20!=null){
			searchId[20]=sa20[0];
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
      		        sb.append("ZTEST.CODENUM like '%").append(searchId[0]).append("%'");
      				andFlag=true;

            }
        }
        if (searchId[1] != null) {
            if ((!searchId[1].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTEST.SALES_AREA like '%").append(searchId[1]).append("%'");
      				andFlag=true;

            }
        }
        if (searchId[2] != null) {
            if ((!searchId[2].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTEST.IS_DELETESYS like '%").append(searchId[2]).append("%'");
      				andFlag=true;

            }
        }
        if (searchId[3] != null) {
            if ((!searchId[3].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTEST.UPDATE_DATESYS like '%").append(searchId[3]).append("%'");
      				andFlag=true;

            }
        }
        if (searchId[4] != null) {
            if ((!searchId[4].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTEST.ISSTARTRECYCLE like '%").append(searchId[4]).append("%'");
      				andFlag=true;

            }
        }
        if (searchId[5] != null) {
            if ((!searchId[5].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTEST.SHAREROLESYS like '%").append(searchId[5]).append("%'");
      				andFlag=true;

            }
        }
        if (searchId[6] != null) {
            if ((!searchId[6].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTEST.ID like '%").append(searchId[6]).append("%'");
      				andFlag=true;

            }
        }
        if (searchId[7] != null) {
            if ((!searchId[7].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTEST.VALUE like '%").append(searchId[7]).append("%'");
      				andFlag=true;

            }
        }
        if (searchId[8] != null) {
            if ((!searchId[8].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTEST.ISLOCKSTATUSSYS like '%").append(searchId[8]).append("%'");
      				andFlag=true;

            }
        }
        if (searchId[9] != null) {
            if ((!searchId[9].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTEST.CURRENTUSERSYS like '%").append(searchId[9]).append("%'");
      				andFlag=true;

            }
        }
        if (searchId[10] != null) {
            if ((!searchId[10].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTEST.CURRENTROLESYS like '%").append(searchId[10]).append("%'");
      				andFlag=true;

            }
        }
        if (searchId[11] != null) {
            if ((!searchId[11].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTEST.CURRENTUSERGORUPSYS like '%").append(searchId[11]).append("%'");
      				andFlag=true;

            }
        }
        if (searchId[12] != null) {
            if ((!searchId[12].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTEST.DIVISION like '%").append(searchId[12]).append("%'");
      				andFlag=true;

            }
        }
        if (searchId[13] != null) {
            if ((!searchId[13].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTEST.SALES_OFFICE like '%").append(searchId[13]).append("%'");
      				andFlag=true;

            }
        }
        if (searchId[14] != null) {
            if ((!searchId[14].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTEST.SALES_GROUP like '%").append(searchId[14]).append("%'");
      				andFlag=true;

            }
        }
        if (searchId[15] != null) {
            if ((!searchId[15].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTEST.SHAREDEPARTMENTSYS like '%").append(searchId[15]).append("%'");
      				andFlag=true;

            }
        }
        if (searchId[16] != null) {
            if ((!searchId[16].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTEST.SHAREUSERGROUP like '%").append(searchId[16]).append("%'");
      				andFlag=true;

            }
        }
        if (searchId[17] != null) {
            if ((!searchId[17].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTEST.CURRENTDEPARTMENTSYS like '%").append(searchId[17]).append("%'");
      				andFlag=true;

            }
        }
        if (searchId[18] != null) {
            if ((!searchId[18].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTEST.SALES_ORG like '%").append(searchId[18]).append("%'");
      				andFlag=true;

            }
        }
        if (searchId[19] != null) {
            if ((!searchId[19].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTEST.DISTR_CHAN like '%").append(searchId[19]).append("%'");
      				andFlag=true;

            }
        }
        if (searchId[20] != null) {
            if ((!searchId[20].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
      		        sb.append("ZTEST.SHAREUSERSYS like '%").append(searchId[20]).append("%'");
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
        		sb.append(" ZTEST.CURRENTUSERSYS IN").append(user[0]) ;
        		sb.append(" OR ");
        		sb.append(" ZTEST.CURRENTDEPARTMENTSYS IN ").append(dep[0]);
        	}
        	else{
        		String  sb_kz = sb.toString();
        	    int spliti = sb_kz.indexOf("WHERE");
        	    if(spliti>0){sb_kz = sb_kz.substring(spliti+6);}
        		sb.append(" AND ");
        		sb.append(" ZTEST.CURRENTUSERSYS IN").append(user[0]) ;
        		sb.append(" OR ");
        		sb.append( sb_kz);
        		sb.append(" AND ");
        		sb.append(" ZTEST.CURRENTDEPARTMENTSYS IN ").append(dep[0]); 
        	} 
        }
        else{
        	if(!dep_str.equalsIgnoreCase("")){
        		if(!whFlag){ sb.append(" WHERE ");  }//无其他条件
        		else{ sb.append(" AND "); }
        		sb.append(" ZTEST.CURRENTDEPARTMENTSYS IN ").append(dep[0]); 
        	}
        	else if(!user_str.equalsIgnoreCase("")){
        		if(!whFlag){ sb.append(" WHERE ");  }//无其他条件
        		else{ sb.append(" AND "); }
        		sb.append(" ZTEST.CURRENTUSERSYS IN").append(user[0]) ;
        	}
        }
        /****************************权限条件组装结束***********************************/


        queryer.setSql(sb.toString());
        queryer.setPageAble(true);
        queryer.compile();
        return queryer.executePage(rowSelection);
	}

    /**
     * 查询	测试行	全部记录
     * @param map
     * @return
     */
	public List getAllZtestNoPage(Map map){
        ZtestQuery queryer = new ZtestQuery(getDataSource());
        StringBuffer sb = new StringBuffer(queryer.getSql());
        String [] searchId=new String[21];
		String [] sa0=(String [])map.get("codenumSearch");
        if(sa0!=null){
			searchId[0]=sa0[0];
        }
		String [] sa1=(String [])map.get("sales_areaSearch");
        if(sa1!=null){
			searchId[1]=sa1[0];
        }
		String [] sa2=(String [])map.get("is_deletesysSearch");
        if(sa2!=null){
			searchId[2]=sa2[0];
        }
		String [] sa3=(String [])map.get("update_datesysSearch");
        if(sa3!=null){
			searchId[3]=sa3[0];
        }
		String [] sa4=(String [])map.get("isstartrecycleSearch");
        if(sa4!=null){
			searchId[4]=sa4[0];
        }
		String [] sa5=(String [])map.get("sharerolesysSearch");
        if(sa5!=null){
			searchId[5]=sa5[0];
        }
		String [] sa6=(String [])map.get("idSearch");
        if(sa6!=null){
			searchId[6]=sa6[0];
        }
		String [] sa7=(String [])map.get("valueSearch");
        if(sa7!=null){
			searchId[7]=sa7[0];
        }
		String [] sa8=(String [])map.get("islockstatussysSearch");
        if(sa8!=null){
			searchId[8]=sa8[0];
        }
		String [] sa9=(String [])map.get("currentusersysSearch");
        if(sa9!=null){
			searchId[9]=sa9[0];
        }
		String [] sa10=(String [])map.get("currentrolesysSearch");
        if(sa10!=null){
			searchId[10]=sa10[0];
        }
		String [] sa11=(String [])map.get("currentusergorupsysSearch");
        if(sa11!=null){
			searchId[11]=sa11[0];
        }
		String [] sa12=(String [])map.get("divisionSearch");
        if(sa12!=null){
			searchId[12]=sa12[0];
        }
		String [] sa13=(String [])map.get("sales_officeSearch");
        if(sa13!=null){
			searchId[13]=sa13[0];
        }
		String [] sa14=(String [])map.get("sales_groupSearch");
        if(sa14!=null){
			searchId[14]=sa14[0];
        }
		String [] sa15=(String [])map.get("sharedepartmentsysSearch");
        if(sa15!=null){
			searchId[15]=sa15[0];
        }
		String [] sa16=(String [])map.get("shareusergroupSearch");
        if(sa16!=null){
			searchId[16]=sa16[0];
        }
		String [] sa17=(String [])map.get("currentdepartmentsysSearch");
        if(sa17!=null){
			searchId[17]=sa17[0];
        }
		String [] sa18=(String [])map.get("sales_orgSearch");
        if(sa18!=null){
			searchId[18]=sa18[0];
        }
		String [] sa19=(String [])map.get("distr_chanSearch");
        if(sa19!=null){
			searchId[19]=sa19[0];
        }
		String [] sa20=(String [])map.get("shareusersysSearch");
        if(sa20!=null){
			searchId[20]=sa20[0];
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
			        sb.append("ZTEST.CODENUM like '%").append(searchId[0]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[1] != null) {
            if ((!searchId[1].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTEST.SALES_AREA like '%").append(searchId[1]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[2] != null) {
            if ((!searchId[2].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTEST.IS_DELETESYS like '%").append(searchId[2]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[3] != null) {
            if ((!searchId[3].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTEST.UPDATE_DATESYS like '%").append(searchId[3]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[4] != null) {
            if ((!searchId[4].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTEST.ISSTARTRECYCLE like '%").append(searchId[4]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[5] != null) {
            if ((!searchId[5].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTEST.SHAREROLESYS like '%").append(searchId[5]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[6] != null) {
            if ((!searchId[6].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTEST.ID like '%").append(searchId[6]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[7] != null) {
            if ((!searchId[7].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTEST.VALUE like '%").append(searchId[7]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[8] != null) {
            if ((!searchId[8].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTEST.ISLOCKSTATUSSYS like '%").append(searchId[8]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[9] != null) {
            if ((!searchId[9].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTEST.CURRENTUSERSYS like '%").append(searchId[9]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[10] != null) {
            if ((!searchId[10].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTEST.CURRENTROLESYS like '%").append(searchId[10]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[11] != null) {
            if ((!searchId[11].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTEST.CURRENTUSERGORUPSYS like '%").append(searchId[11]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[12] != null) {
            if ((!searchId[12].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTEST.DIVISION like '%").append(searchId[12]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[13] != null) {
            if ((!searchId[13].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTEST.SALES_OFFICE like '%").append(searchId[13]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[14] != null) {
            if ((!searchId[14].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTEST.SALES_GROUP like '%").append(searchId[14]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[15] != null) {
            if ((!searchId[15].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTEST.SHAREDEPARTMENTSYS like '%").append(searchId[15]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[16] != null) {
            if ((!searchId[16].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTEST.SHAREUSERGROUP like '%").append(searchId[16]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[17] != null) {
            if ((!searchId[17].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTEST.CURRENTDEPARTMENTSYS like '%").append(searchId[17]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[18] != null) {
            if ((!searchId[18].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTEST.SALES_ORG like '%").append(searchId[18]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[19] != null) {
            if ((!searchId[19].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTEST.DISTR_CHAN like '%").append(searchId[19]).append("%'");
    				andFlag=true;
            }
        }
        if (searchId[20] != null) {
            if ((!searchId[20].equalsIgnoreCase(""))) {
		        if(andFlag==true){
		            sb.append(" AND ");
		        }
			        sb.append("ZTEST.SHAREUSERSYS like '%").append(searchId[20]).append("%'");
                }
        }
        queryer.setSql(sb.toString());
        queryer.setPageAble(true);
        queryer.compile();
        return queryer.execute();
	}
}
