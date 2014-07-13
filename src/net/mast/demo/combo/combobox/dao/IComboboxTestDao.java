package net.mast.demo.combo.combobox.dao;

import java.util.List;
import java.util.Map;
import net.mast.demo.combo.combobox.data.ComboboxTest;
import net.mast.util.Page;
import net.mast.util.RowSelection;

public abstract interface IComboboxTestDao
{
  public abstract void deleteComboboxTest(String paramString);

  public abstract ComboboxTest getComboboxTest(String paramString);

  public abstract Page getAllComboboxTest(RowSelection paramRowSelection, Map paramMap);

  public abstract List getAllComboboxTestNoPage(Map paramMap);

  public abstract ComboboxTest insertComboboxTest(ComboboxTest paramComboboxTest);

  public abstract ComboboxTest updateComboboxTest(ComboboxTest paramComboboxTest);
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.combo.combobox.dao.IComboboxTestDao
 * JD-Core Version:    0.5.3
 */