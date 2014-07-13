package net.mast.demo.grid.dao;

import java.util.List;
import java.util.Map;
import net.mast.demo.grid.data.MainGrid;
import net.mast.util.Page;
import net.mast.util.RowSelection;

public abstract interface IMainGridDao
{
  public abstract void deleteMainGrid(String paramString);

  public abstract MainGrid getMainGrid(String paramString);

  public abstract MainGrid insertMainGrid(MainGrid paramMainGrid);

  public abstract MainGrid updateMainGrid(MainGrid paramMainGrid);

  public abstract Page getAllMainGrid(RowSelection paramRowSelection, Map paramMap);

  public abstract List getAllMainGridNoPage(Map paramMap);
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.grid.dao.IMainGridDao
 * JD-Core Version:    0.5.3
 */