package net.mast.demo.grid.service;

import java.util.List;
import java.util.Map;
import net.mast.demo.grid.view.MainGridView;
import net.mast.util.Page;
import net.mast.util.RowSelection;

public abstract interface IMainGridService
{
  public abstract void deleteMainGrid(String paramString);

  public abstract MainGridView getMainGridView(String paramString);

  public abstract Page getAllMainGrid(RowSelection paramRowSelection, Map paramMap);

  public abstract List getAllMainGridNoPage(Map paramMap);

  public abstract MainGridView insertMainGrid(MainGridView paramMainGridView);

  public abstract MainGridView updateMainGrid(MainGridView paramMainGridView);
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.grid.service.IMainGridService
 * JD-Core Version:    0.5.3
 */