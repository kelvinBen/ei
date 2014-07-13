/*     */package net.mast.demo.goods.service.support;

/*     */
/*     */import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.mast.demo.goods.domain.Goods;
import net.mast.demo.goods.domain.IGoodsDomain;
import net.mast.demo.goods.service.IGoodsService;
import net.mast.demo.goods.view.GoodsView;
import net.mast.demo.goods.view.GoodsViewUtils;
import net.mast.util.Page;
import net.mast.util.RowSelection;
import net.mast.util.domain.BaseService;

import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;

/*     */
/*     */public class GoodsServiceSupport extends BaseService
/*     */implements IGoodsService
/*     */{
	/*     */private IGoodsDomain goodsDomain;

	/*     */
	/*     */public void delete(final String goodsId)
	/*     */{
		/*  41 */getTransactionTemplate().execute(new TransactionCallbackWithoutResult() {
			/*     */protected void doInTransactionWithoutResult(TransactionStatus status) {
				/*  43 */GoodsServiceSupport.this.getGoodsDomain().delete(goodsId);
				/*     */}
			/*     */
		});
		/*     */}

	/*     */
	/*     */public GoodsView get(String goodsId)
	/*     */{
		/*  52 */Goods data = getGoodsDomain().get(goodsId);
		/*  53 */GoodsView view = GoodsViewUtils.getGoodsView(data);
		/*  54 */return view;
		/*     */}

	/*     */
	/*     */public Page query(RowSelection rowSelection, Map map)
	/*     */{
		/*  61 */Page page = getGoodsDomain().query(rowSelection, map);
		/*  62 */List dataList = page.getDatas();
		/*  63 */List viewList = new ArrayList(dataList.size());
		/*  64 */Goods data = null;
		/*  65 */for (int i = 0; i < dataList.size(); ++i) {
			/*  66 */data = (Goods) dataList.get(i);
			/*  67 */viewList.add(GoodsViewUtils.getGoodsView(data));
			/*     */}
		/*  69 */page.setDatas(viewList);
		/*  70 */return page;
		/*     */}

	/*     */
	/*     */public List queryNoPage(Map map)
	/*     */{
		/*  77 */return getGoodsDomain().queryNoPage(map);
		/*     */}

	/*     */
	/*     */public GoodsView insert(GoodsView goodsView)
	/*     */{
		/*  86 */final Goods data = GoodsViewUtils.getGoods(goodsView);
		/*  87 */Goods ret = (Goods) getTransactionTemplate().execute(new TransactionCallback() {
			/*     */public Object doInTransaction(TransactionStatus status) {
				/*  89 */return GoodsServiceSupport.this.getGoodsDomain().insert(data);
				/*     */}
			/*     */
		});
		/*  92 */GoodsView view = GoodsViewUtils.getGoodsView(ret);
		/*  93 */return view;
		/*     */}

	/*     */
	/*     */public GoodsView update(GoodsView goodsView)
	/*     */{
		/* 102 */final Goods data = GoodsViewUtils.getGoods(goodsView);
		/* 103 */Goods ret = (Goods) getTransactionTemplate().execute(new TransactionCallback() {
			/*     */public Object doInTransaction(TransactionStatus status) {
				/* 105 */return GoodsServiceSupport.this.getGoodsDomain().update(data);
				/*     */}
			/*     */
		});
		/* 108 */GoodsView view = GoodsViewUtils.getGoodsView(ret);
		/* 109 */return view;
		/*     */}

	/*     */
	/*     */public IGoodsDomain getGoodsDomain()
	/*     */{
		/* 116 */return this.goodsDomain;
		/*     */}

	/*     */
	/*     */public void setGoodsDomain(IGoodsDomain goodsDomain)
	/*     */{
		/* 123 */this.goodsDomain = goodsDomain;
		/*     */}

	/*     */
	/*     */protected void initService()
	/*     */{
		/* 130 */if (getGoodsDomain() == null)
			/* 131 */throw new IllegalArgumentException("GoodsServiceSupport,GoodsDomain can't be null");
		/*     */}

	/*     */
	/*     */public GoodsView saveandquery(GoodsView goodsView, final String goodsId)
	/*     */{
		/* 137 */final Goods data = GoodsViewUtils.getGoodsNoDelete(goodsView);
		/* 138 */Goods ret = (Goods) getTransactionTemplate().execute(new TransactionCallback() {
			/*     */public Object doInTransaction(TransactionStatus status) {
				/* 140 */return GoodsServiceSupport.this.getGoodsDomain().saveandquery(data, goodsId);
				/*     */}
			/*     */
		});
		/* 143 */GoodsView view = GoodsViewUtils.getGoodsView(ret);
		/* 144 */return view;
		/*     */}
	/*     */
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.goods.service.support.GoodsServiceSupport
 * JD-Core Version:    0.5.3
 */