package net.mast.demo.grid.service;

import java.util.List;
import java.util.Map;
import net.mast.demo.grid.view.ProductView;
import net.mast.util.Page;
import net.mast.util.RowSelection;

public abstract interface IProductService
{
  public abstract void deleteProduct(String paramString);

  public abstract ProductView getProductView(String paramString);

  public abstract Page getAllProduct(RowSelection paramRowSelection, Map paramMap);

  public abstract List getAllProductNoPage(Map paramMap);

  public abstract ProductView insertProduct(ProductView paramProductView);

  public abstract ProductView updateProduct(ProductView paramProductView);
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.grid.service.IProductService
 * JD-Core Version:    0.5.3
 */