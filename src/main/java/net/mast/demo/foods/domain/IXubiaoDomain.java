package net.mast.demo.foods.domain;

import java.util.List;
import java.util.Map;
import net.mast.util.Page;
import net.mast.util.RowSelection;

public abstract interface IXubiaoDomain
{
  public abstract int delete(String paramString);

  public abstract Xubiao get(String paramString);

  public abstract Page query(RowSelection paramRowSelection, Map paramMap);

  public abstract List queryNoPage(Map paramMap);

  public abstract Xubiao insert(Xubiao paramXubiao);

  public abstract Xubiao update(Xubiao paramXubiao);

  public abstract Xubiao saveandquery(Xubiao paramXubiao);

  public abstract Xubiao get();
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.foods.domain.IXubiaoDomain
 * JD-Core Version:    0.5.3
 */