package net.mast.demo.foods.domain;

import java.util.List;
import java.util.Map;
import net.mast.util.Page;
import net.mast.util.RowSelection;

public abstract interface IFoodDomain
{
  public abstract int delete(String paramString);

  public abstract Food get(String paramString);

  public abstract Page query(RowSelection paramRowSelection, Map paramMap);

  public abstract List queryNoPage(Map paramMap);

  public abstract Food insert(Food paramFood);

  public abstract Food update(Food paramFood);
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.foods.domain.IFoodDomain
 * JD-Core Version:    0.5.3
 */