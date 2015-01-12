package net.mast.demo.example.dao;

import java.util.List;
import java.util.Map;
import net.mast.demo.example.data.Mainblob;
import net.mast.util.Page;
import net.mast.util.RowSelection;

public abstract interface IMainblobDao
{
  public abstract void deleteMainblob(String paramString);

  public abstract Mainblob getMainblob(String paramString);

  public abstract Mainblob insertMainblob(Mainblob paramMainblob);

  public abstract Mainblob updateMainblob(Mainblob paramMainblob);

  public abstract Page getAllMainblob(RowSelection paramRowSelection, Map paramMap);

  public abstract List getAllMainblobNoPage(Map paramMap);
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.example.dao.IMainblobDao
 * JD-Core Version:    0.5.3
 */