/*     */package net.mast.demo.foods.service.support;

/*     */
/*     */import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.mast.demo.foods.domain.Food;
import net.mast.demo.foods.domain.IFoodDomain;
import net.mast.demo.foods.service.IFoodService;
import net.mast.demo.foods.view.FoodView;
import net.mast.demo.foods.view.FoodViewUtils;
import net.mast.util.Page;
import net.mast.util.RowSelection;
import net.mast.util.domain.BaseService;

import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;

/*     */
/*     */public class FoodServiceSupport extends BaseService
/*     */implements IFoodService
/*     */{
	/*     */private IFoodDomain foodDomain;

	/*     */
	/*     */public void delete(final String foodId)
	/*     */{
		/*  42 */getTransactionTemplate().execute(
		/*  43 */new TransactionCallbackWithoutResult()
		/*     */{
			/*     */protected void doInTransactionWithoutResult(TransactionStatus status) {
				/*  46 */FoodServiceSupport.this.getFoodDomain().delete(foodId);
				/*     */}
			/*     */
		});
		/*     */}

	/*     */
	/*     */public FoodView get(String foodId)
	/*     */{
		/*  55 */Food data = getFoodDomain().get(foodId);
		/*  56 */FoodView view = FoodViewUtils.getFoodView(data);
		/*  57 */return view;
		/*     */}

	/*     */
	/*     */public Page query(RowSelection rowSelection, Map map)
	/*     */{
		/*  64 */Page page = getFoodDomain().query(rowSelection, map);
		/*  65 */List dataList = page.getDatas();
		/*  66 */List viewList = new ArrayList(dataList.size());
		/*  67 */Food data = null;
		/*  68 */for (int i = 0; i < dataList.size(); ++i) {
			/*  69 */data = (Food) dataList.get(i);
			/*  70 */viewList.add(FoodViewUtils.getFoodView(data));
			/*     */}
		/*  72 */page.setDatas(viewList);
		/*  73 */return page;
		/*     */}

	/*     */
	/*     */public List queryNoPage(Map map)
	/*     */{
		/*  80 */return getFoodDomain().queryNoPage(map);
		/*     */}

	/*     */
	/*     */public FoodView insert(FoodView foodView)
	/*     */{
		/*  89 */final Food data = FoodViewUtils.getFood(foodView);
		/*  90 */Food ret = (Food) getTransactionTemplate().execute(
		/*  91 */new TransactionCallback() {
			/*     */public Object doInTransaction(TransactionStatus status) {
				/*  93 */return FoodServiceSupport.this.getFoodDomain().insert(data);
				/*     */}
			/*     */
		});
		/*  96 */FoodView view = FoodViewUtils.getFoodView(ret);
		/*  97 */return view;
		/*     */}

	/*     */
	/*     */public FoodView update(FoodView foodView)
	/*     */{
		/* 106 */final Food data = FoodViewUtils.getFood(foodView);
		/* 107 */Food ret = (Food) getTransactionTemplate().execute(
		/* 108 */new TransactionCallback() {
			/*     */public Object doInTransaction(TransactionStatus status) {
				/* 110 */return FoodServiceSupport.this.getFoodDomain().update(data);
				/*     */}
			/*     */
		});
		/* 113 */FoodView view = FoodViewUtils.getFoodView(ret);
		/* 114 */return view;
		/*     */}

	/*     */
	/*     */public IFoodDomain getFoodDomain()
	/*     */{
		/* 121 */return this.foodDomain;
		/*     */}

	/*     */
	/*     */public void setFoodDomain(IFoodDomain foodDomain)
	/*     */{
		/* 128 */this.foodDomain = foodDomain;
		/*     */}

	/*     */
	/*     */protected void initService()
	/*     */{
		/* 135 */if (getFoodDomain() == null)
			/* 136 */throw new IllegalArgumentException(
			/* 137 */"FoodServiceSupport,FoodDomain can't be null");
		/*     */}
	/*     */
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.foods.service.support.FoodServiceSupport
 * JD-Core Version:    0.5.3
 */