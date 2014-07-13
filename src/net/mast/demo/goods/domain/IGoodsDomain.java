package net.mast.demo.goods.domain;

import java.util.List;
import java.util.Map;
import net.mast.util.Page;
import net.mast.util.RowSelection;

public abstract interface IGoodsDomain
{
  public abstract int delete(String paramString);

  public abstract Goods get(String paramString);

  public abstract Page query(RowSelection paramRowSelection, Map paramMap);

  public abstract List queryNoPage(Map paramMap);

  public abstract Goods insert(Goods paramGoods);

  public abstract Goods update(Goods paramGoods);

  public abstract Goods saveandquery(Goods paramGoods, String paramString);
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.goods.domain.IGoodsDomain
 * JD-Core Version:    0.5.3
 */