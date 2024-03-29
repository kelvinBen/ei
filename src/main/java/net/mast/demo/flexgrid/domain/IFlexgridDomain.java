package net.mast.demo.flexgrid.domain;

import java.util.List;
import java.util.Map;
import net.mast.demo.flexgrid.data.Flexgrid;
import net.mast.util.Page;
import net.mast.util.RowSelection;

public abstract interface IFlexgridDomain
{
  public abstract void deleteFlexgrid(String paramString);

  public abstract Flexgrid getFlexgrid(String paramString);

  public abstract Page getAllFlexgrid(RowSelection paramRowSelection, Map paramMap);

  public abstract List getAllFlexgridNoPage(Map paramMap);

  public abstract Flexgrid insertFlexgrid(Flexgrid paramFlexgrid);

  public abstract Flexgrid updateFlexgrid(Flexgrid paramFlexgrid);
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.flexgrid.domain.IFlexgridDomain
 * JD-Core Version:    0.5.3
 */