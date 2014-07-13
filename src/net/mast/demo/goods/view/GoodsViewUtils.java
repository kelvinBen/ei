/*     */ package net.mast.demo.goods.view;
/*     */ 
/*     */ import java.util.ArrayList;
/*     */ import java.util.List;
/*     */ import net.mast.demo.goods.domain.Goods;
/*     */ import net.mast.web.taglib.util.IDelete;
/*     */ 
/*     */ public class GoodsViewUtils
/*     */ {
/*     */   public static Goods getGoods(GoodsView goodsView)
/*     */   {
/*  21 */     Goods goods = new Goods();
/*     */ 
/*  23 */     goods.setGoodsId(goodsView.getGoodsId());
/*     */ 
/*  26 */     goods.setGoodsName(goodsView.getGoodsName());
/*     */ 
/*  29 */     goods.setGoodsPrice(goodsView.getGoodsPrice());
/*     */ 
/*  31 */     List factoryListView = removeDeleted(goodsView.getFactoryList());
/*     */ 
/*  33 */     List factoryList = FactoryViewUtils.getFactoryList(factoryListView);
/*     */ 
/*  35 */     goods.setFactoryList(factoryList);
/*  36 */     return goods;
/*     */   }
/*     */ 
/*     */   public static GoodsView getGoodsView(Goods goods)
/*     */   {
/*  43 */     GoodsView goodsView = new GoodsView();
/*  44 */     goodsView.setGoodsId(goods.getGoodsId());
/*     */ 
/*  46 */     goodsView.setGoodsName(goods.getGoodsName());
/*     */ 
/*  48 */     goodsView.setGoodsPrice(goods.getGoodsPrice());
/*     */ 
/*  50 */     List factoryList = goods.getFactoryList();
/*  51 */     if (factoryList != null) {
/*  52 */       List factoryListView = FactoryViewUtils.getFactoryListView(factoryList);
/*  53 */       goodsView.setFactoryList(factoryListView);
/*     */     }
/*  55 */     return goodsView;
/*     */   }
/*     */ 
/*     */   public static List getGoodsList(List listView)
/*     */   {
/*  62 */     if (listView == null) {
/*  63 */       return null;
/*     */     }
/*  65 */     List ret = new ArrayList(listView.size());
/*  66 */     for (int i = 0; i < listView.size(); ++i) {
/*  67 */       ret.add(getGoods((GoodsView)listView.get(i)));
/*     */     }
/*  69 */     return ret;
/*     */   }
/*     */ 
/*     */   public static List getGoodsListView(List listData)
/*     */   {
/*  76 */     if (listData == null) {
/*  77 */       return null;
/*     */     }
/*  79 */     List ret = new ArrayList(listData.size());
/*  80 */     for (int i = 0; i < listData.size(); ++i) {
/*  81 */       ret.add(getGoodsView((Goods)listData.get(i)));
/*     */     }
/*  83 */     return ret;
/*     */   }
/*     */ 
/*     */   private static List removeDeleted(List list) {
/*  87 */     List ret = new ArrayList(list.size());
/*  88 */     for (int i = 0; i < list.size(); ++i) {
/*  89 */       IDelete o = (IDelete)list.get(i);
/*  90 */       if (o.getIsDelete().equals("1")) {
/*     */         continue;
/*     */       }
/*  93 */       ret.add(o);
/*     */     }
/*  95 */     return ret; }
/*     */ 
/*     */   private static String ArrayToString(String[] args) {
/*  98 */     StringBuffer sb = new StringBuffer();
/*  99 */     for (int i = 0; i < args.length; ++i) {
/* 100 */       sb.append(args[i]);
/* 101 */       if (i < args.length - 1) {
/* 102 */         sb.append(",");
/*     */       }
/*     */     }
/* 105 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static Goods getGoodsNoDelete(GoodsView goodsView) {
/* 109 */     Goods goods = new Goods();
/*     */ 
/* 111 */     goods.setGoodsId(goodsView.getGoodsId());
/*     */ 
/* 114 */     goods.setGoodsName(goodsView.getGoodsName());
/*     */ 
/* 117 */     goods.setGoodsPrice(goodsView.getGoodsPrice());
/*     */ 
/* 119 */     List factoryList = FactoryViewUtils.getFactoryList(goodsView.getFactoryList());
/*     */ 
/* 121 */     goods.setFactoryList(factoryList);
/*     */ 
/* 123 */     return goods;
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.goods.view.GoodsViewUtils
 * JD-Core Version:    0.5.3
 */