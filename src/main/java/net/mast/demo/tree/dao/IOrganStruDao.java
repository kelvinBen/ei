package net.mast.demo.tree.dao;

import java.util.List;
import java.util.Map;
import net.mast.demo.tree.data.OrganStru;
import net.mast.util.Page;
import net.mast.util.RowSelection;

public abstract interface IOrganStruDao
{
  public abstract void deleteOrganStru(String paramString);

  public abstract OrganStru getOrganStru(String paramString);

  public abstract Page getAllOrganStru(RowSelection paramRowSelection, Map paramMap);

  public abstract List getAllOrganStruNoPage(Map paramMap);

  public abstract OrganStru insertOrganStru(OrganStru paramOrganStru);

  public abstract OrganStru updateOrganStru(OrganStru paramOrganStru);

  public abstract List getStruPath(String paramString);

  public abstract List getChildren(String paramString);
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.tree.dao.IOrganStruDao
 * JD-Core Version:    0.5.3
 */