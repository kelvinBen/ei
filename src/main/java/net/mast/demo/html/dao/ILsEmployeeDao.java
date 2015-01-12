package net.mast.demo.html.dao;

import java.util.List;
import java.util.Map;
import net.mast.demo.html.data.LsEmployee;
import net.mast.util.Page;
import net.mast.util.RowSelection;

public abstract interface ILsEmployeeDao
{
  public abstract void deleteLsEmployee(String paramString);

  public abstract LsEmployee getLsEmployee(String paramString);

  public abstract Page getAllLsEmployee(RowSelection paramRowSelection, Map paramMap);

  public abstract List getAllLsEmployeeNoPage(Map paramMap);

  public abstract LsEmployee insertLsEmployee(LsEmployee paramLsEmployee);

  public abstract LsEmployee updateLsEmployee(LsEmployee paramLsEmployee);

  public abstract LsEmployee updateLsEmployeeNoImg(LsEmployee paramLsEmployee);

  public abstract List getNode();
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.html.dao.ILsEmployeeDao
 * JD-Core Version:    0.5.3
 */