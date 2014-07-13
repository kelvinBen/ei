package net.mast.demo.goods.service;

import java.util.List;
import java.util.Map;
import net.mast.demo.goods.view.GoodsView;
import net.mast.util.Page;
import net.mast.util.RowSelection;

public abstract interface IGoodsService
{
  public abstract void delete(String paramString);

  public abstract GoodsView get(String paramString);

  public abstract Page query(RowSelection paramRowSelection, Map paramMap);

  public abstract List queryNoPage(Map paramMap);

  public abstract GoodsView insert(GoodsView paramGoodsView);

  public abstract GoodsView update(GoodsView paramGoodsView);

  public abstract GoodsView saveandquery(GoodsView paramGoodsView, String paramString);
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.goods.service.IGoodsService
 * JD-Core Version:    0.5.3
 */