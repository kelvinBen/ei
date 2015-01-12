package net.mast.demo.combo.collection.dao;

import java.util.List;
import java.util.Map;
import net.mast.demo.combo.collection.data.ComboCollection;
import net.mast.util.Page;
import net.mast.util.RowSelection;

public abstract interface IComboCollectionDao
{
  public abstract void deleteComboCollection(String paramString);

  public abstract ComboCollection getComboCollection(String paramString);

  public abstract Page getAllComboCollection(RowSelection paramRowSelection, Map paramMap);

  public abstract List getAllComboCollectionNoPage(Map paramMap);

  public abstract ComboCollection insertComboCollection(ComboCollection paramComboCollection);

  public abstract ComboCollection updateComboCollection(ComboCollection paramComboCollection);
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.combo.collection.dao.IComboCollectionDao
 * JD-Core Version:    0.5.3
 */