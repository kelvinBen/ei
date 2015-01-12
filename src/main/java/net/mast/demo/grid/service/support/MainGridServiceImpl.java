/*     */package net.mast.demo.grid.service.support;

/*     */
/*     */import java.util.List;
import java.util.Map;

import net.mast.demo.DP;
import net.mast.demo.grid.data.MainGrid;
import net.mast.demo.grid.domain.IMainGridDomain;
import net.mast.demo.grid.service.IMainGridService;
import net.mast.demo.grid.utils.MainGridViewUtils;
import net.mast.demo.grid.view.MainGridView;
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
/*     */public class MainGridServiceImpl extends BaseService
/*     */implements IMainGridService, InitializingBean
/*     */{
	/*  27 */private static Log log = LogFactory.getLog(MainGridServiceImpl.class);
	/*  28 */private IMainGridDomain mainGridDomain = null;

	/*     */
	/*     */public void deleteMainGrid(String mainGridId)
	/*     */{
		/*  35 */final String tomainGridId = mainGridId;
		/*  36 */getTransactionTemplate()
		/*  37 */.execute(new TransactionCallbackWithoutResult() {
			/*     */protected void doInTransactionWithoutResult(TransactionStatus arg0) {
				/*  39 */MainGridServiceImpl.this.getMainGridDomain().deleteMainGrid(tomainGridId);
				/*     */}
			/*     */
		});
		/*     */}

	/*     */
	/*     */public MainGridView getMainGridView(String mainGridId)
	/*     */{
		/*  51 */MainGrid mainGrid = getMainGridDomain().getMainGrid(mainGridId);
		/*     */
		/*  53 */return MainGridViewUtils.getMainGridView(mainGrid);
		/*     */}

	/*     */
	/*     */public Page getAllMainGrid(RowSelection rowSelection, Map map)
	/*     */{
		/*  65 */Page page = getMainGridDomain().getAllMainGrid(rowSelection, map);
		/*  66 */page.setDatas(MainGridViewUtils.getMainGridListView(page.getDatas()));
		/*     */
		/*  68 */return page;
		/*     */}

	/*     */
	/*     */public List getAllMainGridNoPage(Map map)
	/*     */{
		/*  77 */List datas = getMainGridDomain().getAllMainGridNoPage(map);
		/*  78 */datas = MainGridViewUtils.getMainGridListView(datas);
		/*     */
		/*  80 */return datas;
		/*     */}

	/*     */
	/*     */public MainGridView insertMainGrid(MainGridView mainGridView)
	/*     */{
		/*  89 */final MainGrid mainGrid = MainGridViewUtils.getMainGrid(mainGridView);
		/*  90 */MainGrid newMainGrid =
		/*  91 */(MainGrid) getTransactionTemplate()
		/*  92 */.execute(new TransactionCallback() {
			/*     */public Object doInTransaction(TransactionStatus arg0) {
				/*  94 */return MainGridServiceImpl.this.getMainGridDomain().insertMainGrid(mainGrid);
				/*     */}
			/*     */
		});
		/*  97 */return MainGridViewUtils.getMainGridView(newMainGrid);
		/*     */}

	/*     */
	/*     */public MainGridView updateMainGrid(MainGridView mainGridView)
	/*     */{
		/* 106 */final MainGrid mainGrid = MainGridViewUtils.getMainGrid(mainGridView);
		/* 107 */MainGrid newMainGrid =
		/* 108 */(MainGrid) getTransactionTemplate()
		/* 109 */.execute(new TransactionCallback() {
			/*     */public Object doInTransaction(TransactionStatus arg0) {
				/* 111 */return MainGridServiceImpl.this.getMainGridDomain().updateMainGrid(mainGrid);
				/*     */}
			/*     */
		});
		/* 114 */return MainGridViewUtils.getMainGridView(newMainGrid);
		/*     */}

	/*     */
	/*     */public IMainGridDomain getMainGridDomain()
	/*     */{
		/* 121 */return this.mainGridDomain;
		/*     */}

	/*     */
	/*     */public void setMainGridDomain(IMainGridDomain domain)
	/*     */{
		/* 129 */this.mainGridDomain = domain;
		/*     */}

	/*     */
	/*     */protected void initService()
	/*     */{
		/* 136 */if (getMainGridDomain() == null)
			/* 137 */throw new RuntimeException("MainGridServiceSupport" + DP.getString("Demo.Common.ConfigureError")
					+ "mainGridDomain" + DP.getString("Demo.Common.Notbenull"));
		/*     */}
	/*     */
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.grid.service.support.MainGridServiceImpl
 * JD-Core Version:    0.5.3
 */