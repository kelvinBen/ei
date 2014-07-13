package net.mast.demo.goods.dao;

import java.util.List;
import java.util.Map;
import net.mast.demo.goods.domain.Factory;
import net.mast.util.Page;
import net.mast.util.RowSelection;

public abstract interface IFactoryDao
{
  public abstract int delete(String paramString);

  public abstract Factory get(String paramString);

  public abstract Page query(RowSelection paramRowSelection, Map paramMap);

  public abstract List queryNoPage(Map paramMap);

  public abstract Factory insert(Factory paramFactory);

  public abstract Factory update(Factory paramFactory);

  public abstract void batchUpdate(List paramList);

  public abstract void batchInsert(List paramList);

  public abstract int deleteByGoods(String paramString);

  public abstract List queryByGoods(String paramString);
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.goods.dao.IFactoryDao
 * JD-Core Version:    0.5.3
 */