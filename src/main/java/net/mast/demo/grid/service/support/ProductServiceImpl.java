/*     */package net.mast.demo.grid.service.support;

/*     */
/*     */import java.util.List;
import java.util.Map;

import net.mast.demo.DP;
import net.mast.demo.grid.data.Product;
import net.mast.demo.grid.domain.IProductDomain;
import net.mast.demo.grid.service.IProductService;
import net.mast.demo.grid.utils.ProductViewUtils;
import net.mast.demo.grid.view.ProductView;
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
/*     */public class ProductServiceImpl extends BaseService
/*     */implements IProductService, InitializingBean
/*     */{
	/*  25 */private static Log log = LogFactory.getLog(ProductServiceImpl.class);
	/*  26 */private IProductDomain productDomain = null;

	/*     */
	/*     */public void deleteProduct(String itemProductid)
	/*     */{
		/*  33 */final String toitemProductid = itemProductid;
		/*  34 */getTransactionTemplate()
		/*  35 */.execute(new TransactionCallbackWithoutResult() {
			/*     */protected void doInTransactionWithoutResult(TransactionStatus arg0) {
				/*  37 */ProductServiceImpl.this.getProductDomain().deleteProduct(toitemProductid);
				/*     */}
			/*     */
		});
		/*     */}

	/*     */
	/*     */public ProductView getProductView(String itemProductid)
	/*     */{
		/*  49 */Product product = getProductDomain().getProduct(itemProductid);
		/*  50 */return ProductViewUtils.getProductView(product);
		/*     */}

	/*     */
	/*     */public Page getAllProduct(RowSelection rowSelection, Map map)
	/*     */{
		/*  62 */Page page = getProductDomain().getAllProduct(rowSelection, map);
		/*  63 */page.setDatas(ProductViewUtils.getProductListView(page.getDatas()));
		/*     */
		/*  65 */return page;
		/*     */}

	/*     */
	/*     */public List getAllProductNoPage(Map map)
	/*     */{
		/*  74 */List datas = getProductDomain().getAllProductNoPage(map);
		/*  75 */datas = ProductViewUtils.getProductListView(datas);
		/*     */
		/*  77 */return datas;
		/*     */}

	/*     */
	/*     */public ProductView insertProduct(ProductView productView)
	/*     */{
		/*  86 */final Product product = ProductViewUtils.getProduct(productView);
		/*  87 */Product newProduct =
		/*  88 */(Product) getTransactionTemplate()
		/*  89 */.execute(new TransactionCallback() {
			/*     */public Object doInTransaction(TransactionStatus arg0) {
				/*  91 */return ProductServiceImpl.this.getProductDomain().insertProduct(product);
				/*     */}
			/*     */
		});
		/*  94 */return ProductViewUtils.getProductView(newProduct);
		/*     */}

	/*     */
	/*     */public ProductView updateProduct(ProductView productView)
	/*     */{
		/* 103 */final Product product = ProductViewUtils.getProduct(productView);
		/* 104 */Product newProduct =
		/* 105 */(Product) getTransactionTemplate()
		/* 106 */.execute(new TransactionCallback() {
			/*     */public Object doInTransaction(TransactionStatus arg0) {
				/* 108 */return ProductServiceImpl.this.getProductDomain().updateProduct(product);
				/*     */}
			/*     */
		});
		/* 111 */return ProductViewUtils.getProductView(newProduct);
		/*     */}

	/*     */
	/*     */public IProductDomain getProductDomain()
	/*     */{
		/* 118 */return this.productDomain;
		/*     */}

	/*     */
	/*     */public void setProductDomain(IProductDomain domain)
	/*     */{
		/* 124 */this.productDomain = domain;
		/*     */}

	/*     */
	/*     */protected void initService()
	/*     */{
		/* 131 */if (getProductDomain() == null)
			/* 132 */throw new RuntimeException("ProductServiceImpl" + DP.getString("Demo.Common.ConfigureError")
					+ "productDomain" + DP.getString("Demo.Common.Notbenull"));
		/*     */}
	/*     */
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.grid.service.support.ProductServiceImpl
 * JD-Core Version:    0.5.3
 */