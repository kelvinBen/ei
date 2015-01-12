package net.mast.demo.tree.service;

import java.util.List;
import java.util.Map;
import net.mast.demo.tree.view.OrganStruView;
import net.mast.util.Page;
import net.mast.util.RowSelection;

public abstract interface IOrganStruService
{
  public abstract void deleteOrganStru(String paramString);

  public abstract OrganStruView getOrganStruView(String paramString);

  public abstract Page getAllOrganStru(RowSelection paramRowSelection, Map paramMap);

  public abstract List getAllOrganStruNoPage(Map paramMap);

  public abstract OrganStruView insertOrganStru(OrganStruView paramOrganStruView);

  public abstract OrganStruView updateOrganStru(OrganStruView paramOrganStruView);

  public abstract List getStruPath(String paramString);

  public abstract List getChildren(String paramString);
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.tree.service.IOrganStruService
 * JD-Core Version:    0.5.3
 */