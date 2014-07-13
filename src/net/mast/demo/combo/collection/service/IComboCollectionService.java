package net.mast.demo.combo.collection.service;

import java.util.List;
import java.util.Map;
import net.mast.demo.combo.collection.view.ComboCollectionView;
import net.mast.util.Page;
import net.mast.util.RowSelection;

public abstract interface IComboCollectionService
{
  public abstract void deleteComboCollection(String paramString);

  public abstract ComboCollectionView getComboCollectionView(String paramString);

  public abstract Page getAllComboCollection(RowSelection paramRowSelection, Map paramMap);

  public abstract List getAllComboCollectionNoPage(Map paramMap);

  public abstract ComboCollectionView insertComboCollection(ComboCollectionView paramComboCollectionView);

  public abstract ComboCollectionView updateComboCollection(ComboCollectionView paramComboCollectionView);
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.combo.collection.service.IComboCollectionService
 * JD-Core Version:    0.5.3
 */