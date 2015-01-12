/*     */package net.mast.demo.goods.cmd;

/*     */
/*     */import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.mast.demo.DP;
import net.mast.demo.goods.dao.IFactoryDao;
import net.mast.demo.goods.service.IGoodsService;
import net.mast.demo.goods.view.GoodsView;
import net.mast.util.IErrorHandler;
import net.mast.util.IMessageHandler;
import net.mast.util.Page;
import net.mast.waf.mvc.MultiQueryCommand;
import net.mast.waf.mvc.QueryHelper;
import net.mast.waf.mvc.ViewHelper;

/*     */
/*     */public class GoodsCmd extends MultiQueryCommand
/*     */{
	/*  29 */private IGoodsService goodsService = null;
	/*  30 */private IFactoryDao factoryDao = null;

	/*     */
	/*     */protected List[] query(HttpServletRequest req, HttpServletResponse rep, QueryHelper helper, Map map) {
		/*  33 */Page page = this.factoryDao.query(helper.getRowSelection(), map);
		/*  34 */helper.setPage(page);
		/*  35 */return new List[] { page.getDatas() };
		/*     */}

	/*     */
	/*     */public String saveandupdate(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler,
			IMessageHandler messageHandler, ViewHelper viewHelper)
	/*     */{
		/*  45 */viewHelper.setListnames(new String[] { "factoryList" });
		/*  46 */viewHelper.setSearch(false);
		/*  47 */String goodsId = ((GoodsView) viewHelper.getView()).getGoodsId();
		/*  48 */viewHelper.setView(getGoodsService().saveandquery((GoodsView) viewHelper.getView(), goodsId));
		/*  49 */return "goodsView.forupdate";
		/*     */}

	/*     */
	/*     */public String saveandinsert(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler,
			IMessageHandler messageHandler, ViewHelper viewHelper)
	/*     */{
		/*  57 */viewHelper.setListnames(new String[] { "factoryList" });
		/*  58 */String goodsId = ((GoodsView) viewHelper.getView()).getGoodsId();
		/*  59 */viewHelper.setPrimaryKey(goodsId);
		/*  60 */viewHelper.setSearch(false);
		/*  61 */viewHelper.setView(getGoodsService().saveandquery((GoodsView) viewHelper.getView(), goodsId));
		/*  62 */return "goodsView.forinsert";
		/*     */}

	/*     */
	/*     */public IFactoryDao getFactoryDao() {
		/*  66 */return this.factoryDao;
		/*     */}

	/*     */
	/*     */public void setFactoryDao(IFactoryDao factoryDao)
	/*     */{
		/*  71 */this.factoryDao = factoryDao;
		/*     */}

	/*     */
	/*     */private void putCollection(HttpServletRequest req, HttpServletResponse rep)
	/*     */{
		/*     */}

	/*     */
	/*     */public String forinsert(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler,
			IMessageHandler messageHandler, ViewHelper viewHelper)
	/*     */{
		/*  93 */GoodsView view = new GoodsView();
		/*  94 */viewHelper.setView(view);
		/*  95 */putCollection(req, rep);
		/*  96 */return "goodsView.forinsert";
		/*     */}

	/*     */
	/*     */public String forupdate(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler,
			IMessageHandler messageHandler, ViewHelper viewHelper)
	/*     */{
		/* 109 */viewHelper.setListnames(new String[] { "factoryList" });
		/* 110 */String pk = req.getParameter("primaryKey");
		/* 111 */GoodsView viewin = getGoodsService().get(pk);
		/* 112 */viewHelper.setView(viewin);
		/* 113 */putCollection(req, rep);
		/* 114 */return "goodsView.forupdate";
		/*     */}

	/*     */
	/*     */public String detail(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler,
			IMessageHandler messageHandler, ViewHelper viewHelper)
	/*     */{
		/* 127 */viewHelper.setListnames(new String[] { "factoryList" });
		/* 128 */String pk = req.getParameter("primaryKey");
		/* 129 */GoodsView viewin = getGoodsService().get(pk);
		/* 130 */viewHelper.setView(viewin);
		/* 131 */putCollection(req, rep);
		/* 132 */return "goodsView.detail";
		/*     */}

	/*     */
	/*     */public String insert(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler,
			IMessageHandler messageHandler, ViewHelper viewHelper)
	/*     */{
		/* 145 */viewHelper.setListnames(new String[] { "factoryList" });
		/* 146 */String goodsId = ((GoodsView) viewHelper.getView()).getGoodsId();
		/* 147 */GoodsView view = getGoodsService().saveandquery((GoodsView) viewHelper.getView(), goodsId);
		/* 148 */viewHelper.setView(view);
		/* 149 */viewHelper.setPrimaryKey(view.getGoodsId());
		/* 150 */return "goodsView.detail";
		/*     */}

	/*     */
	/*     */public String insertContinue(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler,
			IMessageHandler messageHandler, ViewHelper viewHelper)
	/*     */{
		/* 164 */GoodsView viewin = (GoodsView) viewHelper.getView();
		/*     */
		/* 166 */getGoodsService().insert(viewin);
		/* 167 */GoodsView vi = new GoodsView();
		/* 168 */viewHelper.setView(vi);
		/* 169 */putCollection(req, rep);
		/* 170 */return "goodsView.forinsert";
		/*     */}

	/*     */
	/*     */public String querySearch(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler,
			IMessageHandler messageHandler, ViewHelper viewHelper)
	/*     */{
		/* 175 */viewHelper.setListnames(new String[] { "factoryList" });
		/* 176 */String pk = req.getParameter("primaryKey");
		/* 177 */GoodsView viewin = getGoodsService().get(pk);
		/* 178 */viewHelper.setView(viewin);
		/* 179 */putCollection(req, rep);
		/* 180 */if (req.getParameter("forward").equals("forupdate")) {
			/* 181 */return "goodsView.forupdate";
			/*     */}
		/* 183 */return "goodsView.detail";
		/*     */}

	/*     */
	/*     */public String update(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler,
			IMessageHandler messageHandler, ViewHelper viewHelper)
	/*     */{
		/* 197 */viewHelper.setListnames(new String[] { "factoryList" });
		/* 198 */GoodsView viewin = (GoodsView) viewHelper.getView();
		/* 199 */String goodsId = ((GoodsView) viewHelper.getView()).getGoodsId();
		/* 200 */viewHelper.setView(getGoodsService().saveandquery((GoodsView) viewHelper.getView(), goodsId));
		/* 201 */putCollection(req, rep);
		/* 202 */return "goodsView.detail";
		/*     */}

	/*     */
	/*     */public String delete(HttpServletRequest req, HttpServletResponse rep, IErrorHandler errorHandler,
			IMessageHandler messageHandler, ViewHelper viewHelper)
	/*     */{
		/* 215 */String[] pk = req.getParameterValues("primaryKey");
		/* 216 */for (int i = 0; i < pk.length; ++i) {
			/* 217 */getGoodsService().delete(pk[i]);
			/*     */}
		/* 219 */putCollection(req, rep);
		/* 220 */return "goodsViewChain.success";
		/*     */}

	/*     */
	/*     */public void afterPropertiesSet()
	/*     */throws Exception
	/*     */{
		/* 228 */super.afterPropertiesSet();
		/* 229 */if (getGoodsService() == null)
			/* 230 */throw new IllegalArgumentException("GoodsCmd" + DP.getString("Demo.Common.ConfigureError")
					+ "goodsService" + DP.getString("Demo.Common.Notbenull"));
		/*     */}

	/*     */
	/*     */public IGoodsService getGoodsService()
	/*     */{
		/* 239 */return this.goodsService;
		/*     */}

	/*     */
	/*     */public void setGoodsService(IGoodsService service)
	/*     */{
		/* 247 */this.goodsService = service;
		/*     */}
	/*     */
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.goods.cmd.GoodsCmd
 * JD-Core Version:    0.5.3
 */