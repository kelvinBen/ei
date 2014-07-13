package net.mast.demo.goods.domain;

import java.util.List;
import java.util.Map;
import net.mast.util.Page;
import net.mast.util.RowSelection;

public abstract interface IFactoryDomain
{
  public abstract int delete(String paramString);

  public abstract Factory get(String paramString);

  public abstract Page query(RowSelection paramRowSelection, Map paramMap);

  public abstract List queryNoPage(Map paramMap);

  public abstract Factory insert(Factory paramFactory);

  public abstract Factory update(Factory paramFactory);
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.goods.domain.IFactoryDomain
 * JD-Core Version:    0.5.3
 */