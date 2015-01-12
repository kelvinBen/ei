/*     */package net.mast.demo.flexgrid.service.support;

/*     */
/*     */import java.util.List;
import java.util.Map;

import net.mast.demo.DP;
import net.mast.demo.flexgrid.data.Flexgrid;
import net.mast.demo.flexgrid.domain.IFlexgridDomain;
import net.mast.demo.flexgrid.service.IFlexgridService;
import net.mast.demo.flexgrid.utils.FlexgridViewUtils;
import net.mast.demo.flexgrid.view.FlexgridView;
import net.mast.util.Page;
import net.mast.util.RowSelection;
import net.mast.util.domain.BaseService;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;

/*     */
/*     */public class FlexgridServiceImpl extends BaseService
/*     */implements IFlexgridService, InitializingBean
/*     */{
	/*  29 */private static Log log = LogFactory.getLog(FlexgridServiceImpl.class);
	/*  30 */private IFlexgridDomain flexgridDomain = null;

	/*     */
	/*     */public void deleteFlexgrid(String flexId)
	/*     */{
		/*  38 */getFlexgridDomain().deleteFlexgrid(flexId);
		/*     */}

	/*     */
	/*     */public FlexgridView getFlexgridView(String flexId)
	/*     */{
		/*  45 */Flexgrid flexgrid = getFlexgridDomain().getFlexgrid(flexId);
		/*     */
		/*  47 */return FlexgridViewUtils.getFlexgridView(flexgrid);
		/*     */}

	/*     */
	/*     */public Page getAllFlexgrid(RowSelection rowSelection, Map map)
	/*     */{
		/*  59 */Page page = getFlexgridDomain().getAllFlexgrid(rowSelection, map);
		/*  60 */page.setDatas(FlexgridViewUtils.getFlexgridListView(page.getDatas()));
		/*     */
		/*  62 */return page;
		/*     */}

	/*     */
	/*     */public List getAllFlexgridNoPage(Map map)
	/*     */{
		/*  71 */List datas = getFlexgridDomain().getAllFlexgridNoPage(map);
		/*  72 */datas = FlexgridViewUtils.getFlexgridListView(datas);
		/*     */
		/*  74 */return datas;
		/*     */}

	/*     */
	/*     */public FlexgridView insertFlexgrid(FlexgridView flexgridView)
	/*     */{
		/*  83 */final Flexgrid flexgrid = FlexgridViewUtils.getFlexgrid(flexgridView);
		/*  84 */Flexgrid newFlexgrid =
		/*  85 */(Flexgrid) getTransactionTemplate()
		/*  86 */.execute(new TransactionCallback() {
			/*     */public Object doInTransaction(TransactionStatus arg0) {
				/*  88 */return FlexgridServiceImpl.this.getFlexgridDomain().insertFlexgrid(flexgrid);
				/*     */}
			/*     */
		});
		/*  91 */return FlexgridViewUtils.getFlexgridView(newFlexgrid);
		/*     */}

	/*     */
	/*     */public FlexgridView updateFlexgrid(FlexgridView flexgridView)
	/*     */{
		/* 100 */final Flexgrid flexgrid = FlexgridViewUtils.getFlexgrid(flexgridView);
		/* 101 */Flexgrid newFlexgrid =
		/* 102 */(Flexgrid) getTransactionTemplate()
		/* 103 */.execute(new TransactionCallback() {
			/*     */public Object doInTransaction(TransactionStatus arg0) {
				/* 105 */return FlexgridServiceImpl.this.getFlexgridDomain().updateFlexgrid(flexgrid);
				/*     */}
			/*     */
		});
		/* 108 */return FlexgridViewUtils.getFlexgridView(newFlexgrid);
		/*     */}

	/*     */
	/*     */public IFlexgridDomain getFlexgridDomain()
	/*     */{
		/* 115 */return this.flexgridDomain;
		/*     */}

	/*     */
	/*     */public void setFlexgridDomain(IFlexgridDomain domain)
	/*     */{
		/* 123 */this.flexgridDomain = domain;
		/*     */}

	/*     */
	/*     */protected void initService()
	/*     */{
		/* 130 */if (getFlexgridDomain() == null)
			/* 131 */throw new RuntimeException("FlexgridServiceImpl" + DP.getString("Demo.Common.ConfigureError")
					+ "flexgridDomain" + DP.getString("Demo.Common.Notbenull"));
		/*     */}
	/*     */
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.flexgrid.service.support.FlexgridServiceImpl
 * JD-Core Version:    0.5.3
 */