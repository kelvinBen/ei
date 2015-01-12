/*     */package net.mast.demo.foods.service.support;

/*     */
/*     */import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.mast.demo.foods.domain.IXubiaoDomain;
import net.mast.demo.foods.domain.Xubiao;
import net.mast.demo.foods.service.IXubiaoService;
import net.mast.demo.foods.view.XubiaoView;
import net.mast.demo.foods.view.XubiaoViewUtils;
import net.mast.util.Page;
import net.mast.util.RowSelection;
import net.mast.util.domain.BaseService;

import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;

/*     */
/*     */public class XubiaoServiceSupport extends BaseService
/*     */implements IXubiaoService
/*     */{
	/*     */private IXubiaoDomain xubiaoDomain;

	/*     */
	/*     */public void delete(final String xbId)
	/*     */{
		/*  42 */getTransactionTemplate().execute(
		/*  43 */new TransactionCallbackWithoutResult()
		/*     */{
			/*     */protected void doInTransactionWithoutResult(TransactionStatus status) {
				/*  46 */XubiaoServiceSupport.this.getXubiaoDomain().delete(xbId);
				/*     */}
			/*     */
		});
		/*     */}

	/*     */
	/*     */public XubiaoView get(String xbId)
	/*     */{
		/*  55 */Xubiao data = getXubiaoDomain().get(xbId);
		/*  56 */XubiaoView view = XubiaoViewUtils.getXubiaoView(data);
		/*  57 */return view;
		/*     */}

	/*     */
	/*     */public Page query(RowSelection rowSelection, Map map)
	/*     */{
		/*  64 */Page page = getXubiaoDomain().query(rowSelection, map);
		/*  65 */List dataList = page.getDatas();
		/*  66 */List viewList = new ArrayList(dataList.size());
		/*  67 */Xubiao data = null;
		/*  68 */for (int i = 0; i < dataList.size(); ++i) {
			/*  69 */data = (Xubiao) dataList.get(i);
			/*  70 */viewList.add(XubiaoViewUtils.getXubiaoView(data));
			/*     */}
		/*  72 */page.setDatas(viewList);
		/*  73 */return page;
		/*     */}

	/*     */
	/*     */public List queryNoPage(Map map)
	/*     */{
		/*  80 */return getXubiaoDomain().queryNoPage(map);
		/*     */}

	/*     */
	/*     */public XubiaoView insert(XubiaoView xubiaoView)
	/*     */{
		/*  89 */final Xubiao data = XubiaoViewUtils.getXubiao(xubiaoView);
		/*  90 */Xubiao ret = (Xubiao) getTransactionTemplate().execute(
		/*  91 */new TransactionCallback() {
			/*     */public Object doInTransaction(TransactionStatus status) {
				/*  93 */return XubiaoServiceSupport.this.getXubiaoDomain().insert(data);
				/*     */}
			/*     */
		});
		/*  96 */XubiaoView view = XubiaoViewUtils.getXubiaoView(ret);
		/*  97 */return view;
		/*     */}

	/*     */
	/*     */public XubiaoView update(XubiaoView xubiaoView)
	/*     */{
		/* 106 */final Xubiao data = XubiaoViewUtils.getXubiao(xubiaoView);
		/* 107 */Xubiao ret = (Xubiao) getTransactionTemplate().execute(
		/* 108 */new TransactionCallback() {
			/*     */public Object doInTransaction(TransactionStatus status) {
				/* 110 */return XubiaoServiceSupport.this.getXubiaoDomain().update(data);
				/*     */}
			/*     */
		});
		/* 113 */XubiaoView view = XubiaoViewUtils.getXubiaoView(ret);
		/* 114 */return view;
		/*     */}

	/*     */
	/*     */public IXubiaoDomain getXubiaoDomain()
	/*     */{
		/* 121 */return this.xubiaoDomain;
		/*     */}

	/*     */
	/*     */public void setXubiaoDomain(IXubiaoDomain xubiaoDomain)
	/*     */{
		/* 128 */this.xubiaoDomain = xubiaoDomain;
		/*     */}

	/*     */
	/*     */protected void initService()
	/*     */{
		/* 135 */if (getXubiaoDomain() == null)
			/* 136 */throw new IllegalArgumentException(
			/* 137 */"XubiaoServiceSupport,XubiaoDomain can't be null");
		/*     */}

	/*     */
	/*     */public XubiaoView saveandquery(XubiaoView view)
	/*     */{
		/* 142 */final Xubiao data = XubiaoViewUtils.getGoodsNoDelete(view);
		/* 143 */Xubiao ret = (Xubiao) getTransactionTemplate().execute(
		/* 144 */new TransactionCallback() {
			/*     */public Object doInTransaction(TransactionStatus status) {
				/* 146 */return XubiaoServiceSupport.this.getXubiaoDomain().saveandquery(data);
				/*     */}
			/*     */
		});
		/* 149 */XubiaoView xubiaoView = XubiaoViewUtils.getXubiaoView(ret);
		/* 150 */return xubiaoView;
		/*     */}

	/*     */
	/*     */public XubiaoView get() {
		/* 154 */Xubiao data = getXubiaoDomain().get();
		/* 155 */XubiaoView view = XubiaoViewUtils.getXubiaoView(data);
		/* 156 */return view;
		/*     */}
	/*     */
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.foods.service.support.XubiaoServiceSupport
 * JD-Core Version:    0.5.3
 */