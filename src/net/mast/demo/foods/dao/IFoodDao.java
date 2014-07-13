package net.mast.demo.foods.dao;

import java.util.List;
import java.util.Map;
import net.mast.demo.foods.domain.Food;
import net.mast.util.Page;
import net.mast.util.RowSelection;

public abstract interface IFoodDao
{
  public abstract int delete(String paramString);

  public abstract Food get(String paramString);

  public abstract Page query(RowSelection paramRowSelection, Map paramMap);

  public abstract List queryNoPage(Map paramMap);

  public abstract Food insert(Food paramFood);

  public abstract Food update(Food paramFood);

  public abstract void batchUpdate(List paramList);

  public abstract void batchInsert(List paramList);

  public abstract List queryByXubiao(String paramString);

  public abstract int deleteByXubiao(String paramString);
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.foods.dao.IFoodDao
 * JD-Core Version:    0.5.3
 */