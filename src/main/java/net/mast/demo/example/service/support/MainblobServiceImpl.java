/*     */package net.mast.demo.example.service.support;

/*     */
/*     */import java.util.List;
import java.util.Map;

import net.mast.demo.DP;
import net.mast.demo.example.data.Mainblob;
import net.mast.demo.example.domain.IMainblobDomain;
import net.mast.demo.example.service.IMainblobService;
import net.mast.demo.example.utils.MainblobViewUtils;
import net.mast.demo.example.view.MainblobView;
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
/*     */public class MainblobServiceImpl extends BaseService
/*     */implements IMainblobService, InitializingBean
/*     */{
	/*  25 */private static Log log = LogFactory.getLog(MainblobServiceImpl.class);
	/*  26 */private IMainblobDomain mainblobDomain = null;

	/*     */
	/*     */public void deleteMainblob(String mainId)
	/*     */{
		/*  33 */final String tomainId = mainId;
		/*     */
		/*  35 */getTransactionTemplate()
		/*  36 */.execute(new TransactionCallbackWithoutResult() {
			/*     */protected void doInTransactionWithoutResult(TransactionStatus arg0) {
				/*  38 */MainblobServiceImpl.this.getMainblobDomain().deleteMainblob(tomainId);
				/*     */}
			/*     */
		});
		/*     */}

	/*     */
	/*     */public MainblobView getMainblobView(String mainId)
	/*     */{
		/*  50 */Mainblob mainblob = getMainblobDomain().getMainblob(mainId);
		/*     */
		/*  52 */return MainblobViewUtils.getMainblobView(mainblob);
		/*     */}

	/*     */
	/*     */public Page getAllMainblob(RowSelection rowSelection, Map map)
	/*     */{
		/*  64 */Page page = getMainblobDomain().getAllMainblob(rowSelection, map);
		/*  65 */page.setDatas(MainblobViewUtils.getMainblobListView(page.getDatas()));
		/*  66 */return page;
		/*     */}

	/*     */
	/*     */public List getAllMainblobNoPage(Map map)
	/*     */{
		/*  75 */List datas = getMainblobDomain().getAllMainblobNoPage(map);
		/*  76 */datas = MainblobViewUtils.getMainblobListView(datas);
		/*     */
		/*  78 */return datas;
		/*     */}

	/*     */
	/*     */public MainblobView insertMainblob(MainblobView mainblobView)
	/*     */{
		/*  87 */final Mainblob mainblob = MainblobViewUtils.getMainblob(mainblobView);
		/*  88 */Mainblob newMainblob =
		/*  89 */(Mainblob) getTransactionTemplate()
		/*  90 */.execute(new TransactionCallback() {
			/*     */public Object doInTransaction(TransactionStatus arg0) {
				/*  92 */return MainblobServiceImpl.this.getMainblobDomain().insertMainblob(mainblob);
				/*     */}
			/*     */
		});
		/*  95 */return MainblobViewUtils.getMainblobView(newMainblob);
		/*     */}

	/*     */
	/*     */public MainblobView updateMainblob(MainblobView mainblobView)
	/*     */{
		/* 104 */final Mainblob mainblob = MainblobViewUtils.getMainblob(mainblobView);
		/* 105 */Mainblob newMainblob =
		/* 106 */(Mainblob) getTransactionTemplate()
		/* 107 */.execute(new TransactionCallback() {
			/*     */public Object doInTransaction(TransactionStatus arg0) {
				/* 109 */return MainblobServiceImpl.this.getMainblobDomain().updateMainblob(mainblob);
				/*     */}
			/*     */
		});
		/* 112 */return MainblobViewUtils.getMainblobView(newMainblob);
		/*     */}

	/*     */
	/*     */public IMainblobDomain getMainblobDomain()
	/*     */{
		/* 119 */return this.mainblobDomain;
		/*     */}

	/*     */
	/*     */public void setMainblobDomain(IMainblobDomain domain)
	/*     */{
		/* 127 */this.mainblobDomain = domain;
		/*     */}

	/*     */
	/*     */protected void initService()
	/*     */{
		/* 134 */if (getMainblobDomain() == null)
			/* 135 */throw new RuntimeException("MainblobServiceSupport" + DP.getString("Demo.Common.ConfigureError")
					+ "mainblobDomain" + DP.getString("Demo.Common.Notbenull"));
		/*     */}
	/*     */
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.example.service.support.MainblobServiceImpl
 * JD-Core Version:    0.5.3
 */