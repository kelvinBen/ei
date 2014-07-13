/*     */package net.mast.demo.combo.collection.service.support;

/*     */
/*     */import java.util.List;
import java.util.Map;

import net.mast.demo.DP;
import net.mast.demo.combo.collection.data.ComboCollection;
import net.mast.demo.combo.collection.domain.IComboCollectionDomain;
import net.mast.demo.combo.collection.service.IComboCollectionService;
import net.mast.demo.combo.collection.utils.ComboCollectionViewUtils;
import net.mast.demo.combo.collection.view.ComboCollectionView;
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
/*     */public class ComboCollectionServiceImpl extends BaseService
/*     */implements IComboCollectionService, InitializingBean
/*     */{
	/*  25 */private static Log log = LogFactory.getLog(ComboCollectionServiceImpl.class);
	/*  26 */private IComboCollectionDomain comboCollectionDomain = null;

	/*     */
	/*     */public void deleteComboCollection(String comboId)
	/*     */{
		/*  33 */final String tocomboId = comboId;
		/*  34 */getTransactionTemplate()
		/*  35 */.execute(new TransactionCallbackWithoutResult() {
			/*     */protected void doInTransactionWithoutResult(TransactionStatus arg0) {
				/*  37 */ComboCollectionServiceImpl.this.getComboCollectionDomain().deleteComboCollection(tocomboId);
				/*     */}
			/*     */
		});
		/*     */}

	/*     */
	/*     */public ComboCollectionView getComboCollectionView(String comboId)
	/*     */{
		/*  48 */ComboCollection comboCollection = getComboCollectionDomain().getComboCollection(comboId);
		/*     */
		/*  50 */return ComboCollectionViewUtils.getComboCollectionView(comboCollection);
		/*     */}

	/*     */
	/*     */public Page getAllComboCollection(RowSelection rowSelection, Map map)
	/*     */{
		/*  62 */Page page = getComboCollectionDomain().getAllComboCollection(rowSelection, map);
		/*  63 */page.setDatas(ComboCollectionViewUtils.getComboCollectionListView(page.getDatas()));
		/*     */
		/*  65 */return page;
		/*     */}

	/*     */
	/*     */public List getAllComboCollectionNoPage(Map map)
	/*     */{
		/*  74 */List datas = getComboCollectionDomain().getAllComboCollectionNoPage(map);
		/*  75 */datas = ComboCollectionViewUtils.getComboCollectionListView(datas);
		/*     */
		/*  77 */return datas;
		/*     */}

	/*     */
	/*     */public ComboCollectionView insertComboCollection(ComboCollectionView comboCollectionView)
	/*     */{
		/*  86 */final ComboCollection comboCollection = ComboCollectionViewUtils
				.getComboCollection(comboCollectionView);
		/*  87 */ComboCollection newComboCollection =
		/*  88 */(ComboCollection) getTransactionTemplate()
		/*  89 */.execute(new TransactionCallback() {
			/*     */public Object doInTransaction(TransactionStatus arg0) {
				/*  91 */return ComboCollectionServiceImpl.this.getComboCollectionDomain().insertComboCollection(
						comboCollection);
				/*     */}
			/*     */
		});
		/*  94 */return ComboCollectionViewUtils.getComboCollectionView(newComboCollection);
		/*     */}

	/*     */
	/*     */public ComboCollectionView updateComboCollection(ComboCollectionView comboCollectionView)
	/*     */{
		/* 103 */final ComboCollection comboCollection = ComboCollectionViewUtils
				.getComboCollection(comboCollectionView);
		/* 104 */ComboCollection newComboCollection =
		/* 105 */(ComboCollection) getTransactionTemplate()
		/* 106 */.execute(new TransactionCallback() {
			/*     */public Object doInTransaction(TransactionStatus arg0) {
				/* 108 */return ComboCollectionServiceImpl.this.getComboCollectionDomain().updateComboCollection(
						comboCollection);
				/*     */}
			/*     */
		});
		/* 111 */return ComboCollectionViewUtils.getComboCollectionView(newComboCollection);
		/*     */}

	/*     */
	/*     */public IComboCollectionDomain getComboCollectionDomain()
	/*     */{
		/* 118 */return this.comboCollectionDomain;
		/*     */}

	/*     */
	/*     */public void setComboCollectionDomain(IComboCollectionDomain domain)
	/*     */{
		/* 126 */this.comboCollectionDomain = domain;
		/*     */}

	/*     */
	/*     */protected void initService()
	/*     */{
		/* 133 */if (getComboCollectionDomain() == null)
			/* 134 */throw new RuntimeException("ComboCollectionServiceImpl"
					+ DP.getString("Demo.Common.ConfigureError") + "comboCollectionDomain"
					+ DP.getString("Demo.Common.Notbenull"));
		/*     */}
	/*     */
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.combo.collection.service.support.ComboCollectionServiceImpl
 * JD-Core Version:    0.5.3
 */