package net.mast.demo.combo.combobox.service;

import java.util.List;
import java.util.Map;
import net.mast.demo.combo.combobox.view.ComboboxTestView;
import net.mast.util.Page;
import net.mast.util.RowSelection;

public abstract interface IComboboxTestService
{
  public abstract void deleteComboboxTest(String paramString);

  public abstract ComboboxTestView getComboboxTestView(String paramString);

  public abstract Page getAllComboboxTest(RowSelection paramRowSelection, Map paramMap);

  public abstract List getAllComboboxTestNoPage(Map paramMap);

  public abstract ComboboxTestView insertComboboxTest(ComboboxTestView paramComboboxTestView);

  public abstract ComboboxTestView updateComboboxTest(ComboboxTestView paramComboboxTestView);
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.combo.combobox.service.IComboboxTestService
 * JD-Core Version:    0.5.3
 */