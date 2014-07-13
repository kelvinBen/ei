package net.mast.demo.grid.dao;

import java.util.List;
import java.util.Map;
import net.mast.demo.grid.data.Product;
import net.mast.util.Page;
import net.mast.util.RowSelection;

public abstract interface IProductDao
{
  public abstract void deleteProduct(String paramString);

  public abstract Product getProduct(String paramString);

  public abstract Page getAllProduct(RowSelection paramRowSelection, Map paramMap);

  public abstract List getAllProductNoPage(Map paramMap);

  public abstract Product insertProduct(Product paramProduct);

  public abstract Product updateProduct(Product paramProduct);
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.grid.dao.IProductDao
 * JD-Core Version:    0.5.3
 */