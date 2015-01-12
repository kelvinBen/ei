/*     */package net.mast.demo.goods.service.support;

/*     */
/*     */import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.mast.demo.goods.domain.Factory;
import net.mast.demo.goods.domain.IFactoryDomain;
import net.mast.demo.goods.service.IFactoryService;
import net.mast.demo.goods.view.FactoryView;
import net.mast.demo.goods.view.FactoryViewUtils;
import net.mast.util.Page;
import net.mast.util.RowSelection;
import net.mast.util.domain.BaseService;

import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;

/*     */
/*     */public class FactoryServiceSupport extends BaseService
/*     */implements IFactoryService
/*     */{
	/*     */private IFactoryDomain factoryDomain;

	/*     */
	/*     */public void delete(final String factoryId)
	/*     */{
		/*  41 */getTransactionTemplate().execute(new TransactionCallbackWithoutResult() {
			/*     */protected void doInTransactionWithoutResult(TransactionStatus status) {
				/*  43 */FactoryServiceSupport.this.getFactoryDomain().delete(factoryId);
				/*     */}
			/*     */
		});
		/*     */}

	/*     */
	/*     */public FactoryView get(String factoryId)
	/*     */{
		/*  52 */Factory data = getFactoryDomain().get(factoryId);
		/*  53 */FactoryView view = FactoryViewUtils.getFactoryView(data);
		/*  54 */return view;
		/*     */}

	/*     */
	/*     */public Page query(RowSelection rowSelection, Map map)
	/*     */{
		/*  61 */Page page = getFactoryDomain().query(rowSelection, map);
		/*  62 */List dataList = page.getDatas();
		/*  63 */List viewList = new ArrayList(dataList.size());
		/*  64 */Factory data = null;
		/*  65 */for (int i = 0; i < dataList.size(); ++i) {
			/*  66 */data = (Factory) dataList.get(i);
			/*  67 */viewList.add(FactoryViewUtils.getFactoryView(data));
			/*     */}
		/*  69 */page.setDatas(viewList);
		/*  70 */return page;
		/*     */}

	/*     */
	/*     */public List queryNoPage(Map map)
	/*     */{
		/*  77 */return getFactoryDomain().queryNoPage(map);
		/*     */}

	/*     */
	/*     */public FactoryView insert(FactoryView factoryView)
	/*     */{
		/*  86 */final Factory data = FactoryViewUtils.getFactory(factoryView);
		/*  87 */Factory ret = (Factory) getTransactionTemplate().execute(new TransactionCallback() {
			/*     */public Object doInTransaction(TransactionStatus status) {
				/*  89 */return FactoryServiceSupport.this.getFactoryDomain().insert(data);
				/*     */}
			/*     */
		});
		/*  92 */FactoryView view = FactoryViewUtils.getFactoryView(ret);
		/*  93 */return view;
		/*     */}

	/*     */
	/*     */public FactoryView update(FactoryView factoryView)
	/*     */{
		/* 102 */final Factory data = FactoryViewUtils.getFactory(factoryView);
		/* 103 */Factory ret = (Factory) getTransactionTemplate().execute(new TransactionCallback() {
			/*     */public Object doInTransaction(TransactionStatus status) {
				/* 105 */return FactoryServiceSupport.this.getFactoryDomain().update(data);
				/*     */}
			/*     */
		});
		/* 108 */FactoryView view = FactoryViewUtils.getFactoryView(ret);
		/* 109 */return view;
		/*     */}

	/*     */
	/*     */public IFactoryDomain getFactoryDomain()
	/*     */{
		/* 116 */return this.factoryDomain;
		/*     */}

	/*     */
	/*     */public void setFactoryDomain(IFactoryDomain factoryDomain)
	/*     */{
		/* 123 */this.factoryDomain = factoryDomain;
		/*     */}

	/*     */
	/*     */protected void initService()
	/*     */{
		/* 130 */if (getFactoryDomain() == null)
			/* 131 */throw new IllegalArgumentException("FactoryServiceSupport,FactoryDomain can't be null");
		/*     */}
	/*     */
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.goods.service.support.FactoryServiceSupport
 * JD-Core Version:    0.5.3
 */