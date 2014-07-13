package net.mast.demo.foods.dao;

import java.util.List;
import java.util.Map;
import net.mast.demo.foods.domain.Xubiao;
import net.mast.util.Page;
import net.mast.util.RowSelection;

public abstract interface IXubiaoDao
{
  public abstract int delete(String paramString);

  public abstract Xubiao get(String paramString);

  public abstract Page query(RowSelection paramRowSelection, Map paramMap);

  public abstract List queryNoPage(Map paramMap);

  public abstract Xubiao insert(Xubiao paramXubiao);

  public abstract Xubiao update(Xubiao paramXubiao);

  public abstract void batchUpdate(List paramList);

  public abstract void batchInsert(List paramList);
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.foods.dao.IXubiaoDao
 * JD-Core Version:    0.5.3
 */