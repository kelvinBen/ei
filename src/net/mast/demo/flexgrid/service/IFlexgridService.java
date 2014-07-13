package net.mast.demo.flexgrid.service;

import java.util.List;
import java.util.Map;
import net.mast.demo.flexgrid.view.FlexgridView;
import net.mast.util.Page;
import net.mast.util.RowSelection;

public abstract interface IFlexgridService
{
  public abstract void deleteFlexgrid(String paramString);

  public abstract FlexgridView getFlexgridView(String paramString);

  public abstract Page getAllFlexgrid(RowSelection paramRowSelection, Map paramMap);

  public abstract List getAllFlexgridNoPage(Map paramMap);

  public abstract FlexgridView insertFlexgrid(FlexgridView paramFlexgridView);

  public abstract FlexgridView updateFlexgrid(FlexgridView paramFlexgridView);
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.flexgrid.service.IFlexgridService
 * JD-Core Version:    0.5.3
 */