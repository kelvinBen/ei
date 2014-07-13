/*     */ package net.mast.demo.goods.domain.support;
/*     */ 
/*     */ import java.util.ArrayList;
/*     */ import java.util.Iterator;
/*     */ import java.util.List;
/*     */ import java.util.Map;
/*     */ import net.mast.demo.goods.dao.IFactoryDao;
/*     */ import net.mast.demo.goods.dao.IGoodsDao;
/*     */ import net.mast.demo.goods.domain.Factory;
/*     */ import net.mast.demo.goods.domain.Goods;
/*     */ import net.mast.demo.goods.domain.IGoodsDomain;
/*     */ import net.mast.util.Page;
/*     */ import net.mast.util.RowSelection;
/*     */ import net.mast.util.domain.BaseDomain;
/*     */ 
/*     */ public class GoodsDomainSupport extends BaseDomain
/*     */   implements IGoodsDomain
/*     */ {
/*     */   private IGoodsDao goodsDao;
/*     */   private IFactoryDao factoryDao;
/*     */ 
/*     */   public int delete(String goodsId)
/*     */   {
/*  41 */     getFactoryDao().deleteByGoods(goodsId);
/*  42 */     return getGoodsDao().delete(goodsId);
/*     */   }
/*     */ 
/*     */   public Goods get(String goodsId)
/*     */   {
/*  51 */     Goods goods = getGoodsDao().get(goodsId);
/*  52 */     List factoryList = getFactoryDao().queryByGoods(goodsId);
/*  53 */     goods.setFactoryList(factoryList);
/*  54 */     return goods;
/*     */   }
/*     */ 
/*     */   public Page query(RowSelection rowSelection, Map map)
/*     */   {
/*  63 */     return getGoodsDao().query(rowSelection, map);
/*     */   }
/*     */ 
/*     */   public List queryNoPage(Map map)
/*     */   {
/*  72 */     return getGoodsDao().queryNoPage(map);
/*     */   }
/*     */ 
/*     */   public Goods insert(Goods goods)
/*     */   {
/*  81 */     Goods mainData = getGoodsDao().insert(goods);
/*  82 */     List factoryList = goods.getFactoryList();
/*  83 */     Iterator factoryite = factoryList.iterator();
/*  84 */     while (factoryite.hasNext()) {
/*  85 */       Factory data = (Factory)factoryite.next();
/*  86 */       data.setGoodsId(goods.getGoodsId());
/*     */     }
/*  88 */     getFactoryDao().batchInsert(factoryList);
/*  89 */     return mainData;
/*     */   }
/*     */ 
/*     */   public Goods update(Goods goods)
/*     */   {
/*  98 */     Goods mainData = getGoodsDao().update(goods);
/*  99 */     List factoryList = goods.getFactoryList();
/* 100 */     Iterator factoryite = factoryList.iterator();
/* 101 */     while (factoryite.hasNext()) {
/* 102 */       Factory data = (Factory)factoryite.next();
/* 103 */       data.setGoodsId(goods.getGoodsId());
/*     */     }
/* 105 */     getFactoryDao().deleteByGoods(goods.getGoodsId());
/* 106 */     getFactoryDao().batchInsert(factoryList);
/* 107 */     return mainData;
/*     */   }
/*     */ 
/*     */   public IGoodsDao getGoodsDao()
/*     */   {
/* 114 */     return this.goodsDao;
/*     */   }
/*     */ 
/*     */   public void setGoodsDao(IGoodsDao goodsDao)
/*     */   {
/* 121 */     this.goodsDao = goodsDao;
/*     */   }
/*     */ 
/*     */   public IFactoryDao getFactoryDao()
/*     */   {
/* 128 */     return this.factoryDao;
/*     */   }
/*     */ 
/*     */   public void setFactoryDao(IFactoryDao factoryDao)
/*     */   {
/* 135 */     this.factoryDao = factoryDao;
/*     */   }
/*     */ 
/*     */   protected void initDomain()
/*     */   {
/* 142 */     if (getGoodsDao() == null) {
/* 143 */       throw new IllegalArgumentException("GoodsDao must not be null");
/*     */     }
/* 145 */     if (getFactoryDao() == null)
/* 146 */       throw new IllegalArgumentException("FactoryDao must not be null");
/*     */   }
/*     */ 
/*     */   public Goods saveandquery(Goods goods, String goodsId)
/*     */   {
/* 151 */     Goods isexist = getGoodsDao().get(goodsId);
/* 152 */     Goods mainData = new Goods();
/* 153 */     if (isexist == null)
/* 154 */       mainData = getGoodsDao().insert(goods);
/* 155 */     mainData = getGoodsDao().update(goods);
/* 156 */     List factoryList = goods.getFactoryList();
/* 157 */     Iterator factoryite = factoryList.iterator();
/*     */ 
/* 159 */     List insertList = new ArrayList();
/* 160 */     List deleteList = new ArrayList();
/* 161 */     List updateList = new ArrayList();
/* 162 */     int i = 1;
/* 163 */     while (factoryite.hasNext()) {
/* 164 */       Factory data = (Factory)factoryite.next();
/* 165 */       if ("".equals(data.getFactoryId())) {
/* 166 */         data.setGoodsId(goodsId);
/* 167 */         insertList.add(data);
/* 168 */       } else if (data.getIsDelete().equals("1")) {
/* 169 */         deleteList.add(data.getFactoryId());
/*     */       } else {
/* 171 */         updateList.add(data); }
/* 172 */       data.setGoodsId(goods.getGoodsId());
/* 173 */       ++i;
/*     */     }
/* 175 */     for (int j = 0; j < deleteList.size(); ++j) {
/* 176 */       getFactoryDao().delete((String)deleteList.get(j));
/*     */     }
/* 178 */     getFactoryDao().batchInsert(insertList);
/* 179 */     getFactoryDao().batchUpdate(updateList);
/* 180 */     mainData.setFactoryList(new ArrayList());
/* 181 */     return mainData;
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.goods.domain.support.GoodsDomainSupport
 * JD-Core Version:    0.5.3
 */