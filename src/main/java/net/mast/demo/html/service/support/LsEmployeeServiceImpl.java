/*     */package net.mast.demo.html.service.support;

/*     */
/*     */import java.util.List;
import java.util.Map;

import net.mast.demo.DP;
import net.mast.demo.html.data.LsEmployee;
import net.mast.demo.html.domain.ILsEmployeeDomain;
import net.mast.demo.html.service.ILsEmployeeService;
import net.mast.demo.html.utils.LsEmployeeViewUtils;
import net.mast.demo.html.view.LsEmployeeView;
import net.mast.util.Page;
import net.mast.util.RowSelection;
import net.mast.util.domain.BaseService;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;

/*     */
/*     */public class LsEmployeeServiceImpl extends BaseService
/*     */implements ILsEmployeeService, InitializingBean
/*     */{
	/*  33 */private static Log log = LogFactory.getLog(LsEmployeeServiceImpl.class);
	/*  34 */private ILsEmployeeDomain lsEmployeeDomain = null;

	/*     */
	/*     */public void deleteLsEmployee(String employeeCode)
	/*     */{
		/*  41 */final String toemployeeCode = employeeCode;
		/*  42 */getTransactionTemplate()
		/*  43 */.execute(new TransactionCallbackWithoutResult() {
			/*     */protected void doInTransactionWithoutResult(TransactionStatus arg0) {
				/*  45 */LsEmployeeServiceImpl.this.getLsEmployeeDomain().deleteLsEmployee(toemployeeCode);
				/*     */}
			/*     */
		});
		/*     */}

	/*     */
	/*     */public LsEmployeeView getLsEmployeeView(String employeeCode)
	/*     */{
		/*  56 */LsEmployee lsEmployee = getLsEmployeeDomain().getLsEmployee(employeeCode);
		/*     */
		/*  58 */return LsEmployeeViewUtils.getLsEmployeeView(lsEmployee);
		/*     */}

	/*     */
	/*     */public Page getAllLsEmployee(RowSelection rowSelection, Map map)
	/*     */{
		/*  70 */Page page = getLsEmployeeDomain().getAllLsEmployee(rowSelection, map);
		/*  71 */page.setDatas(LsEmployeeViewUtils.getLsEmployeeListView(page.getDatas()));
		/*     */
		/*  73 */return page;
		/*     */}

	/*     */
	/*     */public List getAllLsEmployeeNoPage(Map map)
	/*     */{
		/*  82 */List datas = getLsEmployeeDomain().getAllLsEmployeeNoPage(map);
		/*  83 */datas = LsEmployeeViewUtils.getLsEmployeeListView(datas);
		/*     */
		/*  85 */return datas;
		/*     */}

	/*     */
	/*     */public List getNode() {
		/*  89 */List datas = getLsEmployeeDomain().getNode();
		/*  90 */datas = LsEmployeeViewUtils.getLsEmployeeListView(datas);
		/*  91 */return datas;
		/*     */}

	/*     */
	/*     */public LsEmployeeView insertLsEmployee(LsEmployeeView lsEmployeeView)
	/*     */{
		/*  99 */final LsEmployee lsEmployee = LsEmployeeViewUtils.getLsEmployee(lsEmployeeView);
		/* 100 */LsEmployee newLsEmployee =
		/* 101 */(LsEmployee) getTransactionTemplate()
		/* 102 */.execute(new TransactionCallback() {
			/*     */public Object doInTransaction(TransactionStatus arg0) {
				/* 104 */return LsEmployeeServiceImpl.this.getLsEmployeeDomain().insertLsEmployee(lsEmployee);
				/*     */}
			/*     */
		});
		/* 107 */return LsEmployeeViewUtils.getLsEmployeeView(newLsEmployee);
		/*     */}

	/*     */
	/*     */public LsEmployeeView updateLsEmployee(LsEmployeeView lsEmployeeView)
	/*     */{
		/* 116 */final LsEmployee lsEmployee = LsEmployeeViewUtils.getLsEmployee(lsEmployeeView);
		/* 117 */LsEmployee newLsEmployee =
		/* 118 */(LsEmployee) getTransactionTemplate()
		/* 119 */.execute(new TransactionCallback() {
			/*     */public Object doInTransaction(TransactionStatus arg0) {
				/* 121 */return LsEmployeeServiceImpl.this.getLsEmployeeDomain().updateLsEmployee(lsEmployee);
				/*     */}
			/*     */
		});
		/* 124 */return LsEmployeeViewUtils.getLsEmployeeView(newLsEmployee);
		/*     */}

	/*     */
	/*     */public ILsEmployeeDomain getLsEmployeeDomain()
	/*     */{
		/* 131 */return this.lsEmployeeDomain;
		/*     */}

	/*     */
	/*     */public void setLsEmployeeDomain(ILsEmployeeDomain domain)
	/*     */{
		/* 139 */this.lsEmployeeDomain = domain;
		/*     */}

	/*     */
	/*     */protected void initService()
	/*     */{
		/* 146 */if (getLsEmployeeDomain() == null)
			/* 147 */throw new RuntimeException("LsEmployeeServiceImpl" + DP.getString("Demo.Common.ConfigureError")
					+ "lsEmployeeDomain" + DP.getString("Demo.Common.Notbenull"));
		/*     */}
	/*     */
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.html.service.support.LsEmployeeServiceImpl
 * JD-Core Version:    0.5.3
 */