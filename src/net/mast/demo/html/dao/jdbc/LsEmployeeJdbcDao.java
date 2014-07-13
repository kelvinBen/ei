/*      */package net.mast.demo.html.dao.jdbc;

/*      */
/*      */import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import net.mast.commons.jdbc.core.SqlParameter;
import net.mast.commons.jdbc.object.MappingSqlQuery;
import net.mast.demo.html.dao.ILsEmployeeDao;
import net.mast.demo.html.data.LsEmployee;
import net.mast.util.Page;
import net.mast.util.RowSelection;
import net.mast.util.domain.BaseJdbcDao;
import net.mast.web.upload.util.ByteArrayProxy;
import net.mast.web.upload.util.ByteArrayProxyFactory;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/*      */
/*      */public class LsEmployeeJdbcDao extends BaseJdbcDao
/*      */implements ILsEmployeeDao
/*      */{
	/*   34 */private static Log log = LogFactory.getLog(LsEmployeeJdbcDao.class);
	/*      */
	/*   36 */private static final String insertSql = getInsertSql();
	/*      */
	/*   38 */private static final String deleteSql = getDeleteSql();
	/*      */
	/*   40 */private static final String detailSql = getDetailSql();
	/*      */
	/*   42 */private static final String updateSql = getUpdateSql();
	/*      */
	/*   44 */private static final String updateNoImgSql = getUpdateNoImgSql();
	/*      */
	/*   46 */private static final String querySql = getQuerySql();
	/*      */
	/*  597 */private LsEmployeeDelete deleter = null;
	/*  598 */private LsEmployeeInsert inserter = null;
	/*  599 */private LsEmployeeDetail finder = null;
	/*  600 */private LsEmployeeUpdate updater = null;
	/*  601 */private LsEmployeeUpdateNoImg updaternoimg = null;

	/*      */
	/*      */public static String getInsertSql()
	/*      */{
		/*   53 */StringBuffer sb = new StringBuffer();
		/*   54 */sb.append("INSERT INTO LS_EMPLOYEE (");
		/*   55 */sb.append("EMPLOYEE_CODE");
		/*   56 */sb.append(",");
		/*   57 */sb.append("EMPLOYEE_SEX");
		/*   58 */sb.append(",");
		/*   59 */sb.append("EMPLOYEE_NAME");
		/*   60 */sb.append(",");
		/*   61 */sb.append("EMPLOYEE_AGE");
		/*   62 */sb.append(",");
		/*   63 */sb.append("EMPLOYEE_MARRY");
		/*   64 */sb.append(",");
		/*   65 */sb.append("EMPLOYEE_BIRTH");
		/*   66 */sb.append(",");
		/*   67 */sb.append("EMPLOYEE_ENTER_DATE");
		/*   68 */sb.append(",");
		/*   69 */sb.append("EMPLOYEE_COMPANY");
		/*   70 */sb.append(",");
		/*   71 */sb.append("EMPLOYEE_DEGREE");
		/*   72 */sb.append(",");
		/*   73 */sb.append("EMPLOYEE_FAX");
		/*   74 */sb.append(",");
		/*   75 */sb.append("EMPLOYEE_COUNTRY");
		/*   76 */sb.append(",");
		/*   77 */sb.append("EMPLOYEE_PROVINCE");
		/*   78 */sb.append(",");
		/*   79 */sb.append("EMPLOYEE_CITY");
		/*   80 */sb.append(",");
		/*   81 */sb.append("EMPLOYEE_PHONE");
		/*   82 */sb.append(",");
		/*   83 */sb.append("EMPLOYEE_DEPT");
		/*   84 */sb.append(",");
		/*   85 */sb.append("EMPLOYEE_POST");
		/*   86 */sb.append(",");
		/*   87 */sb.append("EMPLOYEE_PREFERENCE");
		/*   88 */sb.append(",");
		/*   89 */sb.append("EMPLOYEE_IMAGECONTENT");
		/*   90 */sb.append(",");
		/*   91 */sb.append("EMPLOYEE_NOTE");
		/*   92 */sb.append(") VALUES(");
		/*   93 */sb.append("?");
		/*   94 */sb.append(",");
		/*   95 */sb.append("?");
		/*   96 */sb.append(",");
		/*   97 */sb.append("?");
		/*   98 */sb.append(",");
		/*   99 */sb.append("?");
		/*  100 */sb.append(",");
		/*  101 */sb.append("?");
		/*  102 */sb.append(",");
		/*  103 */sb.append("?");
		/*  104 */sb.append(",");
		/*  105 */sb.append("?");
		/*  106 */sb.append(",");
		/*  107 */sb.append("?");
		/*  108 */sb.append(",");
		/*  109 */sb.append("?");
		/*  110 */sb.append(",");
		/*  111 */sb.append("?");
		/*  112 */sb.append(",");
		/*  113 */sb.append("?");
		/*  114 */sb.append(",");
		/*  115 */sb.append("?");
		/*  116 */sb.append(",");
		/*  117 */sb.append("?");
		/*  118 */sb.append(",");
		/*  119 */sb.append("?");
		/*  120 */sb.append(",");
		/*  121 */sb.append("?");
		/*  122 */sb.append(",");
		/*  123 */sb.append("?");
		/*  124 */sb.append(",");
		/*  125 */sb.append("?");
		/*  126 */sb.append(",");
		/*  127 */sb.append("?");
		/*  128 */sb.append(",");
		/*  129 */sb.append("?");
		/*  130 */sb.append(")");
		/*  131 */return sb.toString();
		/*      */}

	/*      */
	/*      */public static String getUpdateSql()
	/*      */{
		/*  138 */StringBuffer sb = new StringBuffer();
		/*  139 */sb.append("UPDATE LS_EMPLOYEE SET ");
		/*  140 */sb.append("EMPLOYEE_SEX=?");
		/*  141 */sb.append(" , ");
		/*  142 */sb.append("EMPLOYEE_NAME=?");
		/*  143 */sb.append(" , ");
		/*  144 */sb.append("EMPLOYEE_AGE=?");
		/*  145 */sb.append(" , ");
		/*  146 */sb.append("EMPLOYEE_MARRY=?");
		/*  147 */sb.append(" , ");
		/*  148 */sb.append("EMPLOYEE_BIRTH=?");
		/*  149 */sb.append(" , ");
		/*  150 */sb.append("EMPLOYEE_ENTER_DATE=?");
		/*  151 */sb.append(" , ");
		/*  152 */sb.append("EMPLOYEE_COMPANY=?");
		/*  153 */sb.append(" , ");
		/*  154 */sb.append("EMPLOYEE_DEGREE=?");
		/*  155 */sb.append(" , ");
		/*  156 */sb.append("EMPLOYEE_FAX=?");
		/*  157 */sb.append(" , ");
		/*  158 */sb.append("EMPLOYEE_COUNTRY=?");
		/*  159 */sb.append(" , ");
		/*  160 */sb.append("EMPLOYEE_PROVINCE=?");
		/*  161 */sb.append(" , ");
		/*  162 */sb.append("EMPLOYEE_CITY=?");
		/*  163 */sb.append(" , ");
		/*  164 */sb.append("EMPLOYEE_PHONE=?");
		/*  165 */sb.append(" , ");
		/*  166 */sb.append("EMPLOYEE_DEPT=?");
		/*  167 */sb.append(" , ");
		/*  168 */sb.append("EMPLOYEE_POST=?");
		/*  169 */sb.append(" , ");
		/*  170 */sb.append("EMPLOYEE_PREFERENCE=?");
		/*  171 */sb.append(" , ");
		/*  172 */sb.append("EMPLOYEE_IMAGECONTENT=?");
		/*  173 */sb.append(" , ");
		/*  174 */sb.append("EMPLOYEE_NOTE=?");
		/*  175 */sb.append(" WHERE ");
		/*  176 */sb.append("EMPLOYEE_CODE=?");
		/*  177 */return sb.toString();
		/*      */}

	/*      */
	/*      */public static String getUpdateNoImgSql() {
		/*  181 */StringBuffer sb = new StringBuffer();
		/*  182 */sb.append("UPDATE LS_EMPLOYEE SET ");
		/*  183 */sb.append("EMPLOYEE_SEX=?");
		/*  184 */sb.append(" , ");
		/*  185 */sb.append("EMPLOYEE_NAME=?");
		/*  186 */sb.append(" , ");
		/*  187 */sb.append("EMPLOYEE_AGE=?");
		/*  188 */sb.append(" , ");
		/*  189 */sb.append("EMPLOYEE_MARRY=?");
		/*  190 */sb.append(" , ");
		/*  191 */sb.append("EMPLOYEE_BIRTH=?");
		/*  192 */sb.append(" , ");
		/*  193 */sb.append("EMPLOYEE_ENTER_DATE=?");
		/*  194 */sb.append(" , ");
		/*  195 */sb.append("EMPLOYEE_COMPANY=?");
		/*  196 */sb.append(" , ");
		/*  197 */sb.append("EMPLOYEE_DEGREE=?");
		/*  198 */sb.append(" , ");
		/*  199 */sb.append("EMPLOYEE_FAX=?");
		/*  200 */sb.append(" , ");
		/*  201 */sb.append("EMPLOYEE_COUNTRY=?");
		/*  202 */sb.append(" , ");
		/*  203 */sb.append("EMPLOYEE_PROVINCE=?");
		/*  204 */sb.append(" , ");
		/*  205 */sb.append("EMPLOYEE_CITY=?");
		/*  206 */sb.append(" , ");
		/*  207 */sb.append("EMPLOYEE_PHONE=?");
		/*  208 */sb.append(" , ");
		/*  209 */sb.append("EMPLOYEE_DEPT=?");
		/*  210 */sb.append(" , ");
		/*  211 */sb.append("EMPLOYEE_POST=?");
		/*  212 */sb.append(" , ");
		/*  213 */sb.append("EMPLOYEE_PREFERENCE=?");
		/*  214 */sb.append(" , ");
		/*  215 */sb.append("EMPLOYEE_NOTE=?");
		/*  216 */sb.append(" WHERE ");
		/*  217 */sb.append("EMPLOYEE_CODE=?");
		/*  218 */return sb.toString();
		/*      */}

	/*      */
	/*      */public static String getDeleteSql()
	/*      */{
		/*  224 */StringBuffer sb = new StringBuffer();
		/*  225 */sb.append("DELETE FROM LS_EMPLOYEE WHERE ");
		/*  226 */sb.append("EMPLOYEE_CODE=?");
		/*  227 */return sb.toString();
		/*      */}

	/*      */
	/*      */public static String getDetailSql()
	/*      */{
		/*  234 */StringBuffer sb = new StringBuffer();
		/*  235 */sb.append("SELECT ");
		/*  236 */sb.append("EMPLOYEE_CODE");
		/*  237 */sb.append(",");
		/*  238 */sb.append("EMPLOYEE_SEX");
		/*  239 */sb.append(",");
		/*  240 */sb.append("EMPLOYEE_NAME");
		/*  241 */sb.append(",");
		/*  242 */sb.append("EMPLOYEE_AGE");
		/*  243 */sb.append(",");
		/*  244 */sb.append("EMPLOYEE_MARRY");
		/*  245 */sb.append(",");
		/*  246 */sb.append("EMPLOYEE_BIRTH");
		/*  247 */sb.append(",");
		/*  248 */sb.append("EMPLOYEE_ENTER_DATE");
		/*  249 */sb.append(",");
		/*  250 */sb.append("EMPLOYEE_COMPANY");
		/*  251 */sb.append(",");
		/*  252 */sb.append("EMPLOYEE_DEGREE");
		/*  253 */sb.append(",");
		/*  254 */sb.append("EMPLOYEE_FAX");
		/*  255 */sb.append(",");
		/*  256 */sb.append("EMPLOYEE_COUNTRY");
		/*  257 */sb.append(",");
		/*  258 */sb.append("EMPLOYEE_PROVINCE");
		/*  259 */sb.append(",");
		/*  260 */sb.append("EMPLOYEE_CITY");
		/*  261 */sb.append(",");
		/*  262 */sb.append("EMPLOYEE_PHONE");
		/*  263 */sb.append(",");
		/*  264 */sb.append("EMPLOYEE_DEPT");
		/*  265 */sb.append(",");
		/*  266 */sb.append("EMPLOYEE_POST");
		/*  267 */sb.append(",");
		/*  268 */sb.append("EMPLOYEE_PREFERENCE");
		/*  269 */sb.append(",");
		/*  270 */sb.append("EMPLOYEE_IMAGECONTENT");
		/*  271 */sb.append(",");
		/*  272 */sb.append("EMPLOYEE_NOTE");
		/*  273 */sb.append(" FROM LS_EMPLOYEE WHERE ");
		/*  274 */sb.append("EMPLOYEE_CODE=?");
		/*  275 */return sb.toString();
		/*      */}

	/*      */
	/*      */public static String getQuerySql()
	/*      */{
		/*  282 */StringBuffer sb = new StringBuffer();
		/*  283 */sb.append("SELECT ");
		/*  284 */sb.append("EMPLOYEE_CODE");
		/*  285 */sb.append(",");
		/*  286 */sb.append("EMPLOYEE_SEX");
		/*  287 */sb.append(",");
		/*  288 */sb.append("EMPLOYEE_NAME");
		/*  289 */sb.append(",");
		/*  290 */sb.append("EMPLOYEE_AGE");
		/*  291 */sb.append(",");
		/*  292 */sb.append("EMPLOYEE_MARRY");
		/*  293 */sb.append(",");
		/*  294 */sb.append("EMPLOYEE_BIRTH");
		/*  295 */sb.append(",");
		/*  296 */sb.append("EMPLOYEE_ENTER_DATE");
		/*  297 */sb.append(",");
		/*  298 */sb.append("EMPLOYEE_COMPANY");
		/*  299 */sb.append(",");
		/*  300 */sb.append("EMPLOYEE_DEGREE");
		/*  301 */sb.append(",");
		/*  302 */sb.append("EMPLOYEE_FAX");
		/*  303 */sb.append(",");
		/*  304 */sb.append("EMPLOYEE_COUNTRY");
		/*  305 */sb.append(",");
		/*  306 */sb.append("EMPLOYEE_PROVINCE");
		/*  307 */sb.append(",");
		/*  308 */sb.append("EMPLOYEE_CITY");
		/*  309 */sb.append(",");
		/*  310 */sb.append("EMPLOYEE_PHONE");
		/*  311 */sb.append(",");
		/*  312 */sb.append("EMPLOYEE_DEPT");
		/*  313 */sb.append(",");
		/*  314 */sb.append("EMPLOYEE_POST");
		/*  315 */sb.append(",");
		/*  316 */sb.append("EMPLOYEE_PREFERENCE");
		/*  317 */sb.append(",");
		/*  318 */sb.append("EMPLOYEE_IMAGECONTENT");
		/*  319 */sb.append(",");
		/*  320 */sb.append("EMPLOYEE_NOTE");
		/*  321 */sb.append(" FROM LS_EMPLOYEE");
		/*  322 */return sb.toString();
		/*      */}

	/*      */
	/*      */protected void initDao()
	/*      */{
		/*  603 */if (this.deleter == null) {
			/*  604 */this.deleter = new LsEmployeeDelete(getDataSource());
			//			/*  605 */this.deleter.compile();
			/*      */}
		/*  607 */if (this.inserter == null) {
			/*  608 */this.inserter = new LsEmployeeInsert(getDataSource());
			//			/*  609 */this.inserter.compile();
			/*      */}
		/*  611 */if (this.finder == null) {
			/*  612 */this.finder = new LsEmployeeDetail(getDataSource());
			/*  613 */this.finder.compile();
			/*      */}
		/*  615 */if (this.updater == null) {
			/*  616 */this.updater = new LsEmployeeUpdate(getDataSource());
			//			/*  617 */this.updater.compile();
			/*      */}
		/*  619 */if (this.updaternoimg == null) {
			/*  620 */this.updaternoimg = new LsEmployeeUpdateNoImg(getDataSource());
			//			/*  621 */this.updaternoimg.compile();
			/*      */}
		/*      */}

	/*      */
	/*      */public void deleteLsEmployee(String employeeCode)
	/*      */{
		/*  629 */this.deleter.delete(employeeCode);
		/*      */}

	/*      */
	/*      */public LsEmployee getLsEmployee(String employeeCode)
	/*      */{
		/*  637 */return this.finder.load(employeeCode);
		/*      */}

	/*      */
	/*      */public LsEmployee insertLsEmployee(LsEmployee lsEmployee)
	/*      */{
		/*  645 */this.inserter.insert(lsEmployee);
		/*  646 */return lsEmployee;
		/*      */}

	/*      */
	/*      */public LsEmployee updateLsEmployee(LsEmployee lsEmployee)
	/*      */{
		/*  654 */this.updater.update(lsEmployee);
		/*  655 */return lsEmployee;
	}

	/*      */
	/*      */public LsEmployee updateLsEmployeeNoImg(LsEmployee lsEmployee) {
		/*  658 */this.updaternoimg.update(lsEmployee);
		/*  659 */return lsEmployee;
		/*      */}

	/*      */
	/*      */public Page getAllLsEmployee(RowSelection rowSelection, Map map)
	/*      */{
		/*  669 */LsEmployeeQuery queryer = new LsEmployeeQuery(getDataSource());
		/*  670 */StringBuffer sb = new StringBuffer(queryer.getSql());
		/*  671 */String[] searchId = new String[13];
		/*  672 */String[] sa0 = (String[]) map.get("employee_codeSearch");
		/*  673 */if (sa0 != null) {
			/*  674 */searchId[0] = sa0[0];
			/*      */}
		/*  676 */String[] sa1 = (String[]) map.get("employee_nameSearch");
		/*  677 */if (sa1 != null) {
			/*  678 */searchId[1] = sa1[0];
			/*      */}
		/*  680 */String[] sa2 = (String[]) map.get("employee_marrySearch");
		/*  681 */if (sa2 != null) {
			/*  682 */searchId[2] = sa2[0];
			/*      */}
		/*  684 */String[] sa3 = (String[]) map.get("employee_companySearch");
		/*  685 */if (sa3 != null) {
			/*  686 */searchId[3] = sa3[0];
			/*      */}
		/*  688 */String[] sa4 = (String[]) map.get("employee_degreeSearch");
		/*  689 */if (sa4 != null) {
			/*  690 */searchId[4] = sa4[0];
			/*      */}
		/*  692 */String[] sa5 = (String[]) map.get("employee_faxSearch");
		/*  693 */if (sa5 != null) {
			/*  694 */searchId[5] = sa5[0];
			/*      */}
		/*  696 */String[] sa6 = (String[]) map.get("employee_countrySearch");
		/*  697 */if (sa6 != null) {
			/*  698 */searchId[6] = sa6[0];
			/*      */}
		/*  700 */String[] sa7 = (String[]) map.get("employee_provinceSearch");
		/*  701 */if (sa7 != null) {
			/*  702 */searchId[7] = sa7[0];
			/*      */}
		/*  704 */String[] sa8 = (String[]) map.get("employee_phoneSearch");
		/*  705 */if (sa8 != null) {
			/*  706 */searchId[8] = sa8[0];
			/*      */}
		/*  708 */String[] sa9 = (String[]) map.get("employee_deptSearch");
		/*  709 */if (sa9 != null) {
			/*  710 */searchId[9] = sa9[0];
			/*      */}
		/*  712 */String[] sa10 = (String[]) map.get("employee_postSearch");
		/*  713 */if (sa10 != null) {
			/*  714 */searchId[10] = sa10[0];
			/*      */}
		/*  716 */String[] sa11 = (String[]) map.get("employee_preferenceSearch");
		/*  717 */if (sa11 != null) {
			/*  718 */searchId[11] = sa11[0];
			/*      */}
		/*  720 */String[] sa12 = (String[]) map.get("employee_noteSearch");
		/*  721 */if (sa12 != null) {
			/*  722 */searchId[12] = sa12[0];
			/*      */}
		/*  724 */boolean whFlag = false;
		/*  725 */for (int i = 0; i < searchId.length; ++i) {
			/*  726 */if ((searchId[i] == null) ||
			/*  727 */(searchId[i].equalsIgnoreCase("")))
				continue;
			/*  728 */whFlag = true;
			/*      */}
		/*      */
		/*  732 */if (whFlag) {
			/*  733 */sb.append(" WHERE ");
			/*      */}
		/*  735 */boolean andFlag = false;
		/*  736 */if ((searchId[0] != null) &&
		/*  737 */(!(searchId[0].equalsIgnoreCase("")))) {
			/*  738 */if (andFlag) {
				/*  739 */sb.append(" AND ");
				/*      */}
			/*  741 */sb.append("LS_EMPLOYEE.EMPLOYEE_CODE like '%").append(searchId[0]).append("%'");
			/*  742 */andFlag = true;
			/*      */}
		/*      */
		/*  745 */if ((searchId[1] != null) &&
		/*  746 */(!(searchId[1].equalsIgnoreCase("")))) {
			/*  747 */if (andFlag) {
				/*  748 */sb.append(" AND ");
				/*      */}
			/*  750 */sb.append("LS_EMPLOYEE.EMPLOYEE_NAME like '%").append(searchId[1]).append("%'");
			/*  751 */andFlag = true;
			/*      */}
		/*      */
		/*  754 */if ((searchId[2] != null) &&
		/*  755 */(!(searchId[2].equalsIgnoreCase("")))) {
			/*  756 */if (andFlag) {
				/*  757 */sb.append(" AND ");
				/*      */}
			/*  759 */sb.append("LS_EMPLOYEE.EMPLOYEE_MARRY like '%").append(searchId[2]).append("%'");
			/*  760 */andFlag = true;
			/*      */}
		/*      */
		/*  763 */if ((searchId[3] != null) &&
		/*  764 */(!(searchId[3].equalsIgnoreCase("")))) {
			/*  765 */if (andFlag) {
				/*  766 */sb.append(" AND ");
				/*      */}
			/*  768 */sb.append("LS_EMPLOYEE.EMPLOYEE_COMPANY like '%").append(searchId[3]).append("%'");
			/*  769 */andFlag = true;
			/*      */}
		/*      */
		/*  772 */if ((searchId[4] != null) &&
		/*  773 */(!(searchId[4].equalsIgnoreCase("")))) {
			/*  774 */if (andFlag) {
				/*  775 */sb.append(" AND ");
				/*      */}
			/*  777 */sb.append("LS_EMPLOYEE.EMPLOYEE_DEGREE like '%").append(searchId[4]).append("%'");
			/*  778 */andFlag = true;
			/*      */}
		/*      */
		/*  781 */if ((searchId[5] != null) &&
		/*  782 */(!(searchId[5].equalsIgnoreCase("")))) {
			/*  783 */if (andFlag) {
				/*  784 */sb.append(" AND ");
				/*      */}
			/*  786 */sb.append("LS_EMPLOYEE.EMPLOYEE_FAX like '%").append(searchId[5]).append("%'");
			/*  787 */andFlag = true;
			/*      */}
		/*      */
		/*  790 */if ((searchId[6] != null) &&
		/*  791 */(!(searchId[6].equalsIgnoreCase("")))) {
			/*  792 */if (andFlag) {
				/*  793 */sb.append(" AND ");
				/*      */}
			/*  795 */sb.append("LS_EMPLOYEE.EMPLOYEE_COUNTRY like '%").append(searchId[6]).append("%'");
			/*  796 */andFlag = true;
			/*      */}
		/*      */
		/*  799 */if ((searchId[7] != null) &&
		/*  800 */(!(searchId[7].equalsIgnoreCase("")))) {
			/*  801 */if (andFlag) {
				/*  802 */sb.append(" AND ");
				/*      */}
			/*  804 */sb.append("LS_EMPLOYEE.EMPLOYEE_PROVINCE like '%").append(searchId[7]).append("%'");
			/*  805 */andFlag = true;
			/*      */}
		/*      */
		/*  808 */if ((searchId[8] != null) &&
		/*  809 */(!(searchId[8].equalsIgnoreCase("")))) {
			/*  810 */if (andFlag) {
				/*  811 */sb.append(" AND ");
				/*      */}
			/*  813 */sb.append("LS_EMPLOYEE.EMPLOYEE_PHONE like '%").append(searchId[8]).append("%'");
			/*  814 */andFlag = true;
			/*      */}
		/*      */
		/*  817 */if ((searchId[9] != null) &&
		/*  818 */(!(searchId[9].equalsIgnoreCase("")))) {
			/*  819 */if (andFlag) {
				/*  820 */sb.append(" AND ");
				/*      */}
			/*  822 */sb.append("LS_EMPLOYEE.EMPLOYEE_DEPT like '%").append(searchId[9]).append("%'");
			/*  823 */andFlag = true;
			/*      */}
		/*      */
		/*  826 */if ((searchId[10] != null) &&
		/*  827 */(!(searchId[10].equalsIgnoreCase("")))) {
			/*  828 */if (andFlag) {
				/*  829 */sb.append(" AND ");
				/*      */}
			/*  831 */sb.append("LS_EMPLOYEE.EMPLOYEE_POST like '%").append(searchId[10]).append("%'");
			/*  832 */andFlag = true;
			/*      */}
		/*      */
		/*  835 */if ((searchId[11] != null) &&
		/*  836 */(!(searchId[11].equalsIgnoreCase("")))) {
			/*  837 */if (andFlag) {
				/*  838 */sb.append(" AND ");
				/*      */}
			/*  840 */sb.append("LS_EMPLOYEE.EMPLOYEE_PREFERENCE like '%").append(searchId[11]).append("%'");
			/*  841 */andFlag = true;
			/*      */}
		/*      */
		/*  844 */if ((searchId[12] != null) &&
		/*  845 */(!(searchId[12].equalsIgnoreCase("")))) {
			/*  846 */if (andFlag) {
				/*  847 */sb.append(" AND ");
				/*      */}
			/*  849 */sb.append("LS_EMPLOYEE.EMPLOYEE_NOTE like '%").append(searchId[12]).append("%'");
			/*      */}
		/*      */
		/*  852 */queryer.setSql(sb.toString());
		/*  853 */queryer.setPageAble(true);
		/*  854 */queryer.compile();
		/*  855 */return queryer.executePage(rowSelection);
		/*      */}

	/*      */
	/*      */public List getAllLsEmployeeNoPage(Map map)
	/*      */{
		/*  864 */LsEmployeeQuery queryer = new LsEmployeeQuery(getDataSource());
		/*  865 */StringBuffer sb = new StringBuffer(queryer.getSql());
		/*  866 */String[] searchId = new String[13];
		/*  867 */String[] sa0 = (String[]) map.get("employee_codeSearch");
		/*  868 */if (sa0 != null) {
			/*  869 */searchId[0] = sa0[0];
			/*      */}
		/*  871 */String[] sa1 = (String[]) map.get("employee_nameSearch");
		/*  872 */if (sa1 != null) {
			/*  873 */searchId[1] = sa1[0];
			/*      */}
		/*  875 */String[] sa2 = (String[]) map.get("employee_marrySearch");
		/*  876 */if (sa2 != null) {
			/*  877 */searchId[2] = sa2[0];
			/*      */}
		/*  879 */String[] sa3 = (String[]) map.get("employee_companySearch");
		/*  880 */if (sa3 != null) {
			/*  881 */searchId[3] = sa3[0];
			/*      */}
		/*  883 */String[] sa4 = (String[]) map.get("employee_degreeSearch");
		/*  884 */if (sa4 != null) {
			/*  885 */searchId[4] = sa4[0];
			/*      */}
		/*  887 */String[] sa5 = (String[]) map.get("employee_faxSearch");
		/*  888 */if (sa5 != null) {
			/*  889 */searchId[5] = sa5[0];
			/*      */}
		/*  891 */String[] sa6 = (String[]) map.get("employee_countrySearch");
		/*  892 */if (sa6 != null) {
			/*  893 */searchId[6] = sa6[0];
			/*      */}
		/*  895 */String[] sa7 = (String[]) map.get("employee_provinceSearch");
		/*  896 */if (sa7 != null) {
			/*  897 */searchId[7] = sa7[0];
			/*      */}
		/*  899 */String[] sa8 = (String[]) map.get("employee_phoneSearch");
		/*  900 */if (sa8 != null) {
			/*  901 */searchId[8] = sa8[0];
			/*      */}
		/*  903 */String[] sa9 = (String[]) map.get("employee_deptSearch");
		/*  904 */if (sa9 != null) {
			/*  905 */searchId[9] = sa9[0];
			/*      */}
		/*  907 */String[] sa10 = (String[]) map.get("employee_postSearch");
		/*  908 */if (sa10 != null) {
			/*  909 */searchId[10] = sa10[0];
			/*      */}
		/*  911 */String[] sa11 = (String[]) map.get("employee_preferenceSearch");
		/*  912 */if (sa11 != null) {
			/*  913 */searchId[11] = sa11[0];
			/*      */}
		/*  915 */String[] sa12 = (String[]) map.get("employee_noteSearch");
		/*  916 */if (sa12 != null) {
			/*  917 */searchId[12] = sa12[0];
			/*      */}
		/*  919 */boolean whFlag = false;
		/*  920 */for (int i = 0; i < searchId.length; ++i) {
			/*  921 */if ((searchId[i] == null) ||
			/*  922 */(searchId[i].equalsIgnoreCase("")))
				continue;
			/*  923 */whFlag = true;
			/*      */}
		/*      */
		/*  927 */if (whFlag) {
			/*  928 */sb.append(" WHERE ");
			/*      */}
		/*  930 */boolean andFlag = false;
		/*  931 */if ((searchId[0] != null) &&
		/*  932 */(!(searchId[0].equalsIgnoreCase("")))) {
			/*  933 */if (andFlag) {
				/*  934 */sb.append(" AND ");
				/*      */}
			/*  936 */sb.append("LS_EMPLOYEE.EMPLOYEE_CODE like '%").append(searchId[0]).append("%'");
			/*  937 */andFlag = true;
			/*      */}
		/*      */
		/*  940 */if ((searchId[1] != null) &&
		/*  941 */(!(searchId[1].equalsIgnoreCase("")))) {
			/*  942 */if (andFlag) {
				/*  943 */sb.append(" AND ");
				/*      */}
			/*  945 */sb.append("LS_EMPLOYEE.EMPLOYEE_NAME like '%").append(searchId[1]).append("%'");
			/*  946 */andFlag = true;
			/*      */}
		/*      */
		/*  949 */if ((searchId[2] != null) &&
		/*  950 */(!(searchId[2].equalsIgnoreCase("")))) {
			/*  951 */if (andFlag) {
				/*  952 */sb.append(" AND ");
				/*      */}
			/*  954 */sb.append("LS_EMPLOYEE.EMPLOYEE_MARRY like '%").append(searchId[2]).append("%'");
			/*  955 */andFlag = true;
			/*      */}
		/*      */
		/*  958 */if ((searchId[3] != null) &&
		/*  959 */(!(searchId[3].equalsIgnoreCase("")))) {
			/*  960 */if (andFlag) {
				/*  961 */sb.append(" AND ");
				/*      */}
			/*  963 */sb.append("LS_EMPLOYEE.EMPLOYEE_COMPANY like '%").append(searchId[3]).append("%'");
			/*  964 */andFlag = true;
			/*      */}
		/*      */
		/*  967 */if ((searchId[4] != null) &&
		/*  968 */(!(searchId[4].equalsIgnoreCase("")))) {
			/*  969 */if (andFlag) {
				/*  970 */sb.append(" AND ");
				/*      */}
			/*  972 */sb.append("LS_EMPLOYEE.EMPLOYEE_DEGREE like '%").append(searchId[4]).append("%'");
			/*  973 */andFlag = true;
			/*      */}
		/*      */
		/*  976 */if ((searchId[5] != null) &&
		/*  977 */(!(searchId[5].equalsIgnoreCase("")))) {
			/*  978 */if (andFlag) {
				/*  979 */sb.append(" AND ");
				/*      */}
			/*  981 */sb.append("LS_EMPLOYEE.EMPLOYEE_FAX like '%").append(searchId[5]).append("%'");
			/*  982 */andFlag = true;
			/*      */}
		/*      */
		/*  985 */if ((searchId[6] != null) &&
		/*  986 */(!(searchId[6].equalsIgnoreCase("")))) {
			/*  987 */if (andFlag) {
				/*  988 */sb.append(" AND ");
				/*      */}
			/*  990 */sb.append("LS_EMPLOYEE.EMPLOYEE_COUNTRY like '%").append(searchId[6]).append("%'");
			/*  991 */andFlag = true;
			/*      */}
		/*      */
		/*  994 */if ((searchId[7] != null) &&
		/*  995 */(!(searchId[7].equalsIgnoreCase("")))) {
			/*  996 */if (andFlag) {
				/*  997 */sb.append(" AND ");
				/*      */}
			/*  999 */sb.append("LS_EMPLOYEE.EMPLOYEE_PROVINCE like '%").append(searchId[7]).append("%'");
			/* 1000 */andFlag = true;
			/*      */}
		/*      */
		/* 1003 */if ((searchId[8] != null) &&
		/* 1004 */(!(searchId[8].equalsIgnoreCase("")))) {
			/* 1005 */if (andFlag) {
				/* 1006 */sb.append(" AND ");
				/*      */}
			/* 1008 */sb.append("LS_EMPLOYEE.EMPLOYEE_PHONE like '%").append(searchId[8]).append("%'");
			/* 1009 */andFlag = true;
			/*      */}
		/*      */
		/* 1012 */if ((searchId[9] != null) &&
		/* 1013 */(!(searchId[9].equalsIgnoreCase("")))) {
			/* 1014 */if (andFlag) {
				/* 1015 */sb.append(" AND ");
				/*      */}
			/* 1017 */sb.append("LS_EMPLOYEE.EMPLOYEE_DEPT like '%").append(searchId[9]).append("%'");
			/* 1018 */andFlag = true;
			/*      */}
		/*      */
		/* 1021 */if ((searchId[10] != null) &&
		/* 1022 */(!(searchId[10].equalsIgnoreCase("")))) {
			/* 1023 */if (andFlag) {
				/* 1024 */sb.append(" AND ");
				/*      */}
			/* 1026 */sb.append("LS_EMPLOYEE.EMPLOYEE_POST like '%").append(searchId[10]).append("%'");
			/* 1027 */andFlag = true;
			/*      */}
		/*      */
		/* 1030 */if ((searchId[11] != null) &&
		/* 1031 */(!(searchId[11].equalsIgnoreCase("")))) {
			/* 1032 */if (andFlag) {
				/* 1033 */sb.append(" AND ");
				/*      */}
			/* 1035 */sb.append("LS_EMPLOYEE.EMPLOYEE_PREFERENCE like '%").append(searchId[11]).append("%'");
			/* 1036 */andFlag = true;
			/*      */}
		/*      */
		/* 1039 */if ((searchId[12] != null) &&
		/* 1040 */(!(searchId[12].equalsIgnoreCase("")))) {
			/* 1041 */if (andFlag) {
				/* 1042 */sb.append(" AND ");
				/*      */}
			/* 1044 */sb.append("LS_EMPLOYEE.EMPLOYEE_NOTE like '%").append(searchId[12]).append("%'");
			/*      */}
		/*      */
		/* 1047 */queryer.setSql(sb.toString());
		/* 1048 */queryer.setPageAble(true);
		/* 1049 */queryer.compile();
		/* 1050 */return queryer.execute();
	}

	/*      */
	/*      */public List getNode() {
		/* 1053 */LsEmployeeQuery lsEmployeeQuery = new LsEmployeeQuery(getDataSource());
		/* 1054 */StringBuffer sb = new StringBuffer(lsEmployeeQuery.getSql());
		/* 1055 */sb.append(" order by LS_EMPLOYEE.EMPLOYEE_CODE");
		/* 1056 */lsEmployeeQuery.setSql(sb.toString());
		/* 1057 */lsEmployeeQuery.setPageAble(true);
		/* 1058 */lsEmployeeQuery.compile();
		/* 1059 */return lsEmployeeQuery.execute();
		/*      */}

	/*      */
	/*      */protected static class LsEmployeeDelete //extends SqlLobUpdate
	/*      */{
		/*      */protected LsEmployeeDelete(DataSource ds)
		/*      */{
			//			/*  546 */super(ds, LsEmployeeJdbcDao.deleteSql);
			/*      */
			//			/*  548 */declareParameter(new SqlParameter(12));
			/*      */}

		/*      */
		/*      */public int delete(String employeeCode)
		/*      */{
			/*  555 */Object[] objs = { employeeCode };
			/*  556 */return 0;//update(objs);
			/*      */}
		/*      */
	}

	/*      */
	/*      */protected static class LsEmployeeDetail extends MappingSqlQuery
	/*      */{
		/*      */protected LsEmployeeDetail(DataSource ds)
		/*      */{
			/*  327 */super(ds, LsEmployeeJdbcDao.detailSql);
			/*      */
			/*  329 */declareParameter(new SqlParameter(12));
			/*      */}

		/*      */
		/*      */protected Object mapRow(ResultSet rs, int rowNum)
		/*      */throws SQLException
		/*      */{
			/*  338 */LsEmployee lsEmployee = new LsEmployee();
			/*  339 */lsEmployee.setEmployeeCode(rs.getString("EMPLOYEE_CODE"));
			/*  340 */lsEmployee.setEmployeeSex(rs.getString("EMPLOYEE_SEX"));
			/*  341 */lsEmployee.setEmployeeName(rs.getString("EMPLOYEE_NAME"));
			/*  342 */lsEmployee.setEmployeeAge(rs.getInt("EMPLOYEE_AGE"));
			/*  343 */lsEmployee.setEmployeeMarry(rs.getString("EMPLOYEE_MARRY"));
			/*  344 */lsEmployee.setEmployeeBirth(rs.getString("EMPLOYEE_BIRTH"));
			/*  345 */lsEmployee.setEmployeeEnterDate(rs.getString("EMPLOYEE_ENTER_DATE"));
			/*  346 */lsEmployee.setEmployeeCompany(rs.getString("EMPLOYEE_COMPANY"));
			/*  347 */lsEmployee.setEmployeeDegree(rs.getString("EMPLOYEE_DEGREE"));
			/*  348 */lsEmployee.setEmployeeFax(rs.getString("EMPLOYEE_FAX"));
			/*  349 */lsEmployee.setEmployeeCountry(rs.getString("EMPLOYEE_COUNTRY"));
			/*  350 */lsEmployee.setEmployeeProvince(rs.getString("EMPLOYEE_PROVINCE"));
			/*  351 */lsEmployee.setEmployeeCity(rs.getString("EMPLOYEE_CITY"));
			/*  352 */lsEmployee.setEmployeePhone(rs.getString("EMPLOYEE_PHONE"));
			/*  353 */lsEmployee.setEmployeeDept(rs.getString("EMPLOYEE_DEPT"));
			/*  354 */lsEmployee.setEmployeePost(rs.getString("EMPLOYEE_POST"));
			/*  355 */lsEmployee.setEmployeePreference(rs.getString("EMPLOYEE_PREFERENCE"));
			/*      */
			/*  357 */ByteArrayProxy proxy = ByteArrayProxyFactory.getInstance().getProxy(
					rs.getBinaryStream("EMPLOYEE_IMAGECONTENT"));
			/*  358 */lsEmployee.setImageContent(proxy);
			/*      */
			/*  361 */lsEmployee.setEmployeeNote(rs.getString("EMPLOYEE_NOTE"));
			/*  362 */return lsEmployee;
			/*      */}

		/*      */
		/*      */public LsEmployee load(String employeeCode)
		/*      */{
			/*  369 */return ((LsEmployee) findObject(new Object[] { employeeCode }));
			/*      */}
		/*      */
	}

	/*      */
	/*      */protected static class LsEmployeeInsert //extends SqlLobUpdate
	/*      */{
		/*      */protected LsEmployeeInsert(DataSource ds) {
			//			/*  376 */super(ds, LsEmployeeJdbcDao.insertSql);
			//			/*      */
			//			/*  378 */declareParameter(new SqlParameter(12));
			//			/*  379 */declareParameter(new SqlParameter(1));
			//			/*  380 */declareParameter(new SqlParameter(12));
			//			/*  381 */declareParameter(new SqlParameter(4));
			//			/*  382 */declareParameter(new SqlParameter(1));
			//			/*  383 */declareParameter(new SqlParameter(1));
			//			/*  384 */declareParameter(new SqlParameter(1));
			//			/*  385 */declareParameter(new SqlParameter(12));
			//			/*  386 */declareParameter(new SqlParameter(12));
			//			/*  387 */declareParameter(new SqlParameter(12));
			//			/*  388 */declareParameter(new SqlParameter(12));
			//			/*  389 */declareParameter(new SqlParameter(12));
			//			/*  390 */declareParameter(new SqlParameter(12));
			//			/*  391 */declareParameter(new SqlParameter(1));
			//			/*  392 */declareParameter(new SqlParameter(12));
			//			/*  393 */declareParameter(new SqlParameter(1));
			//			/*  394 */declareParameter(new SqlParameter(1));
			//			/*      */
			//			/*  396 */declareParameter(new SqlParameter(2004));
			//			/*  397 */declareParameter(new SqlParameter(12));
			/*      */}

		/*      */
		/*      */public int insert(LsEmployee lsEmployee)
		/*      */{
			/*  404 */Object[] objs =
			/*  405 */{
			/*  406 */lsEmployee.getEmployeeCode(),
			/*  407 */lsEmployee.getEmployeeSex(),
			/*  408 */lsEmployee.getEmployeeName(),
			/*  409 */new Integer(lsEmployee.getEmployeeAge()),
			/*  410 */lsEmployee.getEmployeeMarry(),
			/*  411 */lsEmployee.getEmployeeBirth(),
			/*  412 */lsEmployee.getEmployeeEnterDate(),
			/*  413 */lsEmployee.getEmployeeCompany(),
			/*  414 */lsEmployee.getEmployeeDegree(),
			/*  415 */lsEmployee.getEmployeeFax(),
			/*  416 */lsEmployee.getEmployeeCountry(),
			/*  417 */lsEmployee.getEmployeeProvince(),
			/*  418 */lsEmployee.getEmployeeCity(),
			/*  419 */lsEmployee.getEmployeePhone(),
			/*  420 */lsEmployee.getEmployeeDept(),
			/*  421 */lsEmployee.getEmployeePost(),
			/*  422 */lsEmployee.getEmployeePreference(),
			/*  424 */lsEmployee.getImageContent().getInputStream(),
			/*  425 */lsEmployee.getEmployeeNote() };
			/*      */
			/*  427 */return 0;//update(objs);
			/*      */}
		/*      */
	}

	/*      */
	/*      */protected static class LsEmployeeQuery extends MappingSqlQuery
	/*      */{
		/*      */protected LsEmployeeQuery(DataSource ds)
		/*      */{
			/*  563 */super(ds, LsEmployeeJdbcDao.querySql);
			/*      */}

		/*      */
		/*      */protected Object mapRow(ResultSet rs, int rowNum)
		/*      */throws SQLException
		/*      */{
			/*  572 */LsEmployee lsEmployee = new LsEmployee();
			/*  573 */lsEmployee.setEmployeeCode(rs.getString("EMPLOYEE_CODE"));
			/*  574 */lsEmployee.setEmployeeSex(rs.getString("EMPLOYEE_SEX"));
			/*  575 */lsEmployee.setEmployeeName(rs.getString("EMPLOYEE_NAME"));
			/*  576 */lsEmployee.setEmployeeAge(rs.getInt("EMPLOYEE_AGE"));
			/*  577 */lsEmployee.setEmployeeMarry(rs.getString("EMPLOYEE_MARRY"));
			/*  578 */lsEmployee.setEmployeeBirth(rs.getString("EMPLOYEE_BIRTH"));
			/*  579 */lsEmployee.setEmployeeEnterDate(rs.getString("EMPLOYEE_ENTER_DATE"));
			/*  580 */lsEmployee.setEmployeeCompany(rs.getString("EMPLOYEE_COMPANY"));
			/*  581 */lsEmployee.setEmployeeDegree(rs.getString("EMPLOYEE_DEGREE"));
			/*  582 */lsEmployee.setEmployeeFax(rs.getString("EMPLOYEE_FAX"));
			/*  583 */lsEmployee.setEmployeeCountry(rs.getString("EMPLOYEE_COUNTRY"));
			/*  584 */lsEmployee.setEmployeeProvince(rs.getString("EMPLOYEE_PROVINCE"));
			/*  585 */lsEmployee.setEmployeeCity(rs.getString("EMPLOYEE_CITY"));
			/*  586 */lsEmployee.setEmployeePhone(rs.getString("EMPLOYEE_PHONE"));
			/*  587 */lsEmployee.setEmployeeDept(rs.getString("EMPLOYEE_DEPT"));
			/*  588 */lsEmployee.setEmployeePost(rs.getString("EMPLOYEE_POST"));
			/*  589 */lsEmployee.setEmployeePreference(rs.getString("EMPLOYEE_PREFERENCE"));
			/*      */
			/*  592 */lsEmployee.setEmployeeNote(rs.getString("EMPLOYEE_NOTE"));
			/*  593 */return lsEmployee;
			/*      */}
		/*      */
	}

	/*      */
	/*      */protected static class LsEmployeeUpdate // extends SqlLobUpdate
	/*      */{
		/*      */protected LsEmployeeUpdate(DataSource ds)
		/*      */{
			//			/*  434 */super(ds, LsEmployeeJdbcDao.updateSql);
			/*      */
			//			/*  436 */declareParameter(new SqlParameter(1));
			//			/*  437 */declareParameter(new SqlParameter(12));
			//			/*  438 */declareParameter(new SqlParameter(4));
			//			/*  439 */declareParameter(new SqlParameter(1));
			//			/*  440 */declareParameter(new SqlParameter(1));
			//			/*  441 */declareParameter(new SqlParameter(1));
			//			/*  442 */declareParameter(new SqlParameter(12));
			//			/*  443 */declareParameter(new SqlParameter(12));
			//			/*  444 */declareParameter(new SqlParameter(12));
			//			/*  445 */declareParameter(new SqlParameter(12));
			//			/*  446 */declareParameter(new SqlParameter(12));
			//			/*  447 */declareParameter(new SqlParameter(12));
			//			/*  448 */declareParameter(new SqlParameter(1));
			//			/*  449 */declareParameter(new SqlParameter(12));
			//			/*  450 */declareParameter(new SqlParameter(1));
			//			/*  451 */declareParameter(new SqlParameter(1));
			//			/*      */
			//			/*  453 */declareParameter(new SqlParameter(2004));
			//			/*  454 */declareParameter(new SqlParameter(12));
			//			/*  455 */declareParameter(new SqlParameter(12));
			/*      */}

		/*      */
		/*      */public int update(LsEmployee lsEmployee)
		/*      */{
			/*  462 */Object[] objs =
			/*  463 */{
			/*  464 */lsEmployee.getEmployeeSex(),
			/*  465 */lsEmployee.getEmployeeName(),
			/*  466 */new Integer(lsEmployee.getEmployeeAge()),
			/*  467 */lsEmployee.getEmployeeMarry(),
			/*  468 */lsEmployee.getEmployeeBirth(),
			/*  469 */lsEmployee.getEmployeeEnterDate(),
			/*  470 */lsEmployee.getEmployeeCompany(),
			/*  471 */lsEmployee.getEmployeeDegree(),
			/*  472 */lsEmployee.getEmployeeFax(),
			/*  473 */lsEmployee.getEmployeeCountry(),
			/*  474 */lsEmployee.getEmployeeProvince(),
			/*  475 */lsEmployee.getEmployeeCity(),
			/*  476 */lsEmployee.getEmployeePhone(),
			/*  477 */lsEmployee.getEmployeeDept(),
			/*  478 */lsEmployee.getEmployeePost(),
			/*  479 */lsEmployee.getEmployeePreference(),
			/*  481 */lsEmployee.getImageContent().getInputStream(),
			/*  482 */lsEmployee.getEmployeeNote(),
			/*  483 */lsEmployee.getEmployeeCode() };
			/*      */
			/*  485 */return 0;//update(objs);
			/*      */}
		/*      */
	}

	/*      */
	/*      */protected static class LsEmployeeUpdateNoImg //extends SqlLobUpdate 
	{
		/*      */protected LsEmployeeUpdateNoImg(DataSource ds) {
			//			/*  491 */super(ds, LsEmployeeJdbcDao.updateNoImgSql);
			//			/*      */
			//			/*  493 */declareParameter(new SqlParameter(1));
			//			/*  494 */declareParameter(new SqlParameter(12));
			//			/*  495 */declareParameter(new SqlParameter(4));
			//			/*  496 */declareParameter(new SqlParameter(1));
			//			/*  497 */declareParameter(new SqlParameter(1));
			//			/*  498 */declareParameter(new SqlParameter(1));
			//			/*  499 */declareParameter(new SqlParameter(12));
			//			/*  500 */declareParameter(new SqlParameter(12));
			//			/*  501 */declareParameter(new SqlParameter(12));
			//			/*  502 */declareParameter(new SqlParameter(12));
			//			/*  503 */declareParameter(new SqlParameter(12));
			//			/*  504 */declareParameter(new SqlParameter(12));
			//			/*  505 */declareParameter(new SqlParameter(1));
			//			/*  506 */declareParameter(new SqlParameter(12));
			//			/*  507 */declareParameter(new SqlParameter(1));
			//			/*  508 */declareParameter(new SqlParameter(1));
			//			/*  509 */declareParameter(new SqlParameter(12));
			//			/*  510 */declareParameter(new SqlParameter(12));
			/*      */}

		/*      */
		/*      */public int update(LsEmployee lsEmployee)
		/*      */{
			/*  517 */Object[] objs =
			/*  518 */{
			/*  519 */lsEmployee.getEmployeeSex(),
			/*  520 */lsEmployee.getEmployeeName(),
			/*  521 */new Integer(lsEmployee.getEmployeeAge()),
			/*  522 */lsEmployee.getEmployeeMarry(),
			/*  523 */lsEmployee.getEmployeeBirth(),
			/*  524 */lsEmployee.getEmployeeEnterDate(),
			/*  525 */lsEmployee.getEmployeeCompany(),
			/*  526 */lsEmployee.getEmployeeDegree(),
			/*  527 */lsEmployee.getEmployeeFax(),
			/*  528 */lsEmployee.getEmployeeCountry(),
			/*  529 */lsEmployee.getEmployeeProvince(),
			/*  530 */lsEmployee.getEmployeeCity(),
			/*  531 */lsEmployee.getEmployeePhone(),
			/*  532 */lsEmployee.getEmployeeDept(),
			/*  533 */lsEmployee.getEmployeePost(),
			/*  534 */lsEmployee.getEmployeePreference(),
			/*  535 */lsEmployee.getEmployeeNote(),
			/*  536 */lsEmployee.getEmployeeCode() };
			/*      */
			/*  538 */return 0;//update(objs);
			/*      */}
		/*      */
	}
	/*      */
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.html.dao.jdbc.LsEmployeeJdbcDao
 * JD-Core Version:    0.5.3
 */