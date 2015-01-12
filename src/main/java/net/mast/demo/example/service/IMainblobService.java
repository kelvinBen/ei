package net.mast.demo.example.service;

import java.util.List;
import java.util.Map;
import net.mast.demo.example.view.MainblobView;
import net.mast.util.Page;
import net.mast.util.RowSelection;

public abstract interface IMainblobService
{
  public abstract void deleteMainblob(String paramString);

  public abstract MainblobView getMainblobView(String paramString);

  public abstract Page getAllMainblob(RowSelection paramRowSelection, Map paramMap);

  public abstract List getAllMainblobNoPage(Map paramMap);

  public abstract MainblobView insertMainblob(MainblobView paramMainblobView);

  public abstract MainblobView updateMainblob(MainblobView paramMainblobView);
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.example.service.IMainblobService
 * JD-Core Version:    0.5.3
 */