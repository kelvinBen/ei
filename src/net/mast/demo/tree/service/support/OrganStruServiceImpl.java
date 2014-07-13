/*     */package net.mast.demo.tree.service.support;

/*     */
/*     */import java.util.List;
import java.util.Map;

import net.mast.demo.DP;
import net.mast.demo.tree.data.OrganStru;
import net.mast.demo.tree.domain.IOrganStruDomain;
import net.mast.demo.tree.service.IOrganStruService;
import net.mast.demo.tree.utils.OrganStruViewUtils;
import net.mast.demo.tree.view.OrganStruView;
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
/*     */public class OrganStruServiceImpl extends BaseService
/*     */implements IOrganStruService, InitializingBean
/*     */{
	/*  33 */private static Log log = LogFactory.getLog(OrganStruServiceImpl.class);
	/*  34 */private IOrganStruDomain organStruDomain = null;

	/*     */
	/*     */public void deleteOrganStru(String organId)
	/*     */{
		/*  42 */final String toorganId = organId;
		/*  43 */getTransactionTemplate()
		/*  44 */.execute(new TransactionCallbackWithoutResult() {
			/*     */protected void doInTransactionWithoutResult(TransactionStatus arg0) {
				/*  46 */OrganStruServiceImpl.this.getOrganStruDomain().deleteOrganStru(toorganId);
				/*     */}
			/*     */
		});
		/*     */}

	/*     */
	/*     */public OrganStruView getOrganStruView(String organId)
	/*     */{
		/*  56 */OrganStru organStru = getOrganStruDomain().getOrganStru(organId);
		/*     */
		/*  58 */return OrganStruViewUtils.getOrganStruView(organStru);
		/*     */}

	/*     */
	/*     */public Page getAllOrganStru(RowSelection rowSelection, Map map)
	/*     */{
		/*  70 */Page page = getOrganStruDomain().getAllOrganStru(rowSelection, map);
		/*  71 */page.setDatas(OrganStruViewUtils.getOrganStruListView(page.getDatas()));
		/*     */
		/*  73 */return page;
		/*     */}

	/*     */
	/*     */public List getAllOrganStruNoPage(Map map)
	/*     */{
		/*  82 */List datas = getOrganStruDomain().getAllOrganStruNoPage(map);
		/*  83 */datas = OrganStruViewUtils.getOrganStruListView(datas);
		/*     */
		/*  85 */return datas;
		/*     */}

	/*     */
	/*     */public OrganStruView insertOrganStru(OrganStruView organStruView)
	/*     */{
		/*  94 */final OrganStru organStru = OrganStruViewUtils.getOrganStru(organStruView);
		/*  95 */OrganStru newOrganStru =
		/*  96 */(OrganStru) getTransactionTemplate()
		/*  97 */.execute(new TransactionCallback() {
			/*     */public Object doInTransaction(TransactionStatus arg0) {
				/*  99 */return OrganStruServiceImpl.this.getOrganStruDomain().insertOrganStru(organStru);
				/*     */}
			/*     */
		});
		/* 102 */return OrganStruViewUtils.getOrganStruView(newOrganStru);
		/*     */}

	/*     */
	/*     */public OrganStruView updateOrganStru(OrganStruView organStruView)
	/*     */{
		/* 111 */final OrganStru organStru = OrganStruViewUtils.getOrganStru(organStruView);
		/* 112 */OrganStru newOrganStru =
		/* 113 */(OrganStru) getTransactionTemplate()
		/* 114 */.execute(new TransactionCallback() {
			/*     */public Object doInTransaction(TransactionStatus arg0) {
				/* 116 */return OrganStruServiceImpl.this.getOrganStruDomain().updateOrganStru(organStru);
				/*     */}
			/*     */
		});
		/* 119 */return OrganStruViewUtils.getOrganStruView(newOrganStru);
		/*     */}

	/*     */
	/*     */public IOrganStruDomain getOrganStruDomain()
	/*     */{
		/* 126 */return this.organStruDomain;
		/*     */}

	/*     */
	/*     */public void setOrganStruDomain(IOrganStruDomain domain)
	/*     */{
		/* 134 */this.organStruDomain = domain;
		/*     */}

	/*     */
	/*     */protected void initService()
	/*     */{
		/* 141 */if (getOrganStruDomain() == null)
			/* 142 */throw new RuntimeException("OrganStruServiceImpl" + DP.getString("Demo.Common.ConfigureError")
					+ "organStruDomain" + DP.getString("Demo.Common.Notbenull"));
		/*     */}

	/*     */
	/*     */public List getStruPath(String organAlias)
	/*     */{
		/* 149 */List list = getOrganStruDomain().getStruPath(organAlias);
		/* 150 */return OrganStruViewUtils.getOrganStruListView(list);
		/*     */}

	/*     */
	/*     */public List getChildren(String code) {
		/* 154 */List list = getOrganStruDomain().getChildren(code);
		/* 155 */return OrganStruViewUtils.getOrganStruListView(list);
		/*     */}
	/*     */
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.tree.service.support.OrganStruServiceImpl
 * JD-Core Version:    0.5.3
 */