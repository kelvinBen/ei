package net.mast.demo.goods.dao;

import java.util.List;
import java.util.Map;
import net.mast.demo.goods.domain.Goods;
import net.mast.util.Page;
import net.mast.util.RowSelection;

public abstract interface IGoodsDao
{
  public abstract int delete(String paramString);

  public abstract Goods get(String paramString);

  public abstract Page query(RowSelection paramRowSelection, Map paramMap);

  public abstract List queryNoPage(Map paramMap);

  public abstract Goods insert(Goods paramGoods);

  public abstract Goods update(Goods paramGoods);

  public abstract void batchUpdate(List paramList);

  public abstract void batchInsert(List paramList);
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.goods.dao.IGoodsDao
 * JD-Core Version:    0.5.3
 */