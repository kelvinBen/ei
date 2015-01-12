/*     */package net.mast.demo.combo.combobox.service.support;

/*     */
/*     */import java.util.List;
import java.util.Map;

import net.mast.demo.DP;
import net.mast.demo.combo.combobox.data.ComboboxTest;
import net.mast.demo.combo.combobox.domain.IComboboxTestDomain;
import net.mast.demo.combo.combobox.service.IComboboxTestService;
import net.mast.demo.combo.combobox.utils.ComboboxTestViewUtils;
import net.mast.demo.combo.combobox.view.ComboboxTestView;
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
/*     */public class ComboboxTestServiceImpl extends BaseService
/*     */implements IComboboxTestService, InitializingBean
/*     */{
	/*  25 */private static Log log = LogFactory.getLog(ComboboxTestServiceImpl.class);
	/*  26 */private IComboboxTestDomain comboboxTestDomain = null;

	/*     */
	/*     */public void deleteComboboxTest(String comboBoxId)
	/*     */{
		/*  33 */final String tocomboBoxId = comboBoxId;
		/*  34 */getTransactionTemplate()
		/*  35 */.execute(new TransactionCallbackWithoutResult() {
			/*     */protected void doInTransactionWithoutResult(TransactionStatus arg0) {
				/*  37 */ComboboxTestServiceImpl.this.getComboboxTestDomain().deleteComboboxTest(tocomboBoxId);
				/*     */}
			/*     */
		});
		/*     */}

	/*     */
	/*     */public ComboboxTestView getComboboxTestView(String comboBoxId)
	/*     */{
		/*  48 */ComboboxTest comboboxTest = getComboboxTestDomain().getComboboxTest(comboBoxId);
		/*     */
		/*  50 */return ComboboxTestViewUtils.getComboboxTestView(comboboxTest);
		/*     */}

	/*     */
	/*     */public Page getAllComboboxTest(RowSelection rowSelection, Map map)
	/*     */{
		/*  62 */Page page = getComboboxTestDomain().getAllComboboxTest(rowSelection, map);
		/*  63 */page.setDatas(ComboboxTestViewUtils.getComboboxTestListView(page.getDatas()));
		/*     */
		/*  65 */return page;
		/*     */}

	/*     */
	/*     */public List getAllComboboxTestNoPage(Map map)
	/*     */{
		/*  74 */List datas = getComboboxTestDomain().getAllComboboxTestNoPage(map);
		/*  75 */datas = ComboboxTestViewUtils.getComboboxTestListView(datas);
		/*     */
		/*  77 */return datas;
		/*     */}

	/*     */
	/*     */public ComboboxTestView insertComboboxTest(ComboboxTestView comboboxTestView)
	/*     */{
		/*  86 */final ComboboxTest comboboxTest = ComboboxTestViewUtils.getComboboxTest(comboboxTestView);
		/*  87 */ComboboxTest newComboboxTest =
		/*  88 */(ComboboxTest) getTransactionTemplate()
		/*  89 */.execute(new TransactionCallback() {
			/*     */public Object doInTransaction(TransactionStatus arg0) {
				/*  91 */return ComboboxTestServiceImpl.this.getComboboxTestDomain().insertComboboxTest(comboboxTest);
				/*     */}
			/*     */
		});
		/*  94 */return ComboboxTestViewUtils.getComboboxTestView(newComboboxTest);
		/*     */}

	/*     */
	/*     */public ComboboxTestView updateComboboxTest(ComboboxTestView comboboxTestView)
	/*     */{
		/* 103 */final ComboboxTest comboboxTest = ComboboxTestViewUtils.getComboboxTest(comboboxTestView);
		/* 104 */ComboboxTest newComboboxTest =
		/* 105 */(ComboboxTest) getTransactionTemplate()
		/* 106 */.execute(new TransactionCallback() {
			/*     */public Object doInTransaction(TransactionStatus arg0) {
				/* 108 */return ComboboxTestServiceImpl.this.getComboboxTestDomain().updateComboboxTest(comboboxTest);
				/*     */}
			/*     */
		});
		/* 111 */return ComboboxTestViewUtils.getComboboxTestView(newComboboxTest);
		/*     */}

	/*     */
	/*     */public IComboboxTestDomain getComboboxTestDomain()
	/*     */{
		/* 118 */return this.comboboxTestDomain;
		/*     */}

	/*     */
	/*     */public void setComboboxTestDomain(IComboboxTestDomain domain)
	/*     */{
		/* 126 */this.comboboxTestDomain = domain;
		/*     */}

	/*     */
	/*     */protected void initService()
	/*     */{
		/* 133 */if (getComboboxTestDomain() == null)
			/* 134 */throw new RuntimeException("ComboboxTestServiceImpl" + DP.getString("Demo.Common.ConfigureError")
					+ "comboboxTestDomain" + DP.getString("Demo.Common.Notbenull"));
		/*     */}
	/*     */
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.combo.combobox.service.support.ComboboxTestServiceImpl
 * JD-Core Version:    0.5.3
 */