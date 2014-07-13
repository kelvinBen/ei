package net.mast.demo.html.service;

import java.util.List;
import java.util.Map;
import net.mast.demo.html.view.LsEmployeeView;
import net.mast.util.Page;
import net.mast.util.RowSelection;

public abstract interface ILsEmployeeService
{
  public abstract void deleteLsEmployee(String paramString);

  public abstract LsEmployeeView getLsEmployeeView(String paramString);

  public abstract Page getAllLsEmployee(RowSelection paramRowSelection, Map paramMap);

  public abstract List getAllLsEmployeeNoPage(Map paramMap);

  public abstract LsEmployeeView insertLsEmployee(LsEmployeeView paramLsEmployeeView);

  public abstract LsEmployeeView updateLsEmployee(LsEmployeeView paramLsEmployeeView);

  public abstract List getNode();
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.html.service.ILsEmployeeService
 * JD-Core Version:    0.5.3
 */