package net.mast.demo.example.domain;

import java.util.List;
import java.util.Map;
import net.mast.demo.example.data.Mainblob;
import net.mast.util.Page;
import net.mast.util.RowSelection;

public abstract interface IMainblobDomain
{
  public abstract void deleteMainblob(String paramString);

  public abstract Mainblob getMainblob(String paramString);

  public abstract Page getAllMainblob(RowSelection paramRowSelection, Map paramMap);

  public abstract List getAllMainblobNoPage(Map paramMap);

  public abstract Mainblob insertMainblob(Mainblob paramMainblob);

  public abstract Mainblob updateMainblob(Mainblob paramMainblob);
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.example.domain.IMainblobDomain
 * JD-Core Version:    0.5.3
 */