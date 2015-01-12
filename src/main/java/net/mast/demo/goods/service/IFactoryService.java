package net.mast.demo.goods.service;

import java.util.List;
import java.util.Map;
import net.mast.demo.goods.view.FactoryView;
import net.mast.util.Page;
import net.mast.util.RowSelection;

public abstract interface IFactoryService
{
  public abstract void delete(String paramString);

  public abstract FactoryView get(String paramString);

  public abstract Page query(RowSelection paramRowSelection, Map paramMap);

  public abstract List queryNoPage(Map paramMap);

  public abstract FactoryView insert(FactoryView paramFactoryView);

  public abstract FactoryView update(FactoryView paramFactoryView);
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.goods.service.IFactoryService
 * JD-Core Version:    0.5.3
 */