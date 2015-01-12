package net.mast.demo.foods.service;

import java.util.List;
import java.util.Map;
import net.mast.demo.foods.view.FoodView;
import net.mast.util.Page;
import net.mast.util.RowSelection;

public abstract interface IFoodService
{
  public abstract void delete(String paramString);

  public abstract FoodView get(String paramString);

  public abstract Page query(RowSelection paramRowSelection, Map paramMap);

  public abstract List queryNoPage(Map paramMap);

  public abstract FoodView insert(FoodView paramFoodView);

  public abstract FoodView update(FoodView paramFoodView);
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.foods.service.IFoodService
 * JD-Core Version:    0.5.3
 */