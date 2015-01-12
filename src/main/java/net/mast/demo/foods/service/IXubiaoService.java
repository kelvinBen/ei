package net.mast.demo.foods.service;

import java.util.List;
import java.util.Map;
import net.mast.demo.foods.view.XubiaoView;
import net.mast.util.Page;
import net.mast.util.RowSelection;

public abstract interface IXubiaoService
{
  public abstract void delete(String paramString);

  public abstract XubiaoView get(String paramString);

  public abstract Page query(RowSelection paramRowSelection, Map paramMap);

  public abstract List queryNoPage(Map paramMap);

  public abstract XubiaoView insert(XubiaoView paramXubiaoView);

  public abstract XubiaoView update(XubiaoView paramXubiaoView);

  public abstract XubiaoView saveandquery(XubiaoView paramXubiaoView);

  public abstract XubiaoView get();
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.foods.service.IXubiaoService
 * JD-Core Version:    0.5.3
 */