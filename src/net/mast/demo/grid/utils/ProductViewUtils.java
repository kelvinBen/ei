/*    */ package net.mast.demo.grid.utils;
/*    */ 
/*    */ import java.util.ArrayList;
/*    */ import java.util.List;
/*    */ import net.mast.commons.exception.BaseRuntimeException;
/*    */ import net.mast.demo.DP;
/*    */ import net.mast.demo.grid.data.Product;
/*    */ import net.mast.demo.grid.view.ProductView;
/*    */ 
/*    */ public class ProductViewUtils
/*    */ {
/*    */   public static List getProductListView(List list)
/*    */   {
/* 28 */     if (list == null) {
/* 29 */       return null;
/*    */     }
/* 31 */     List view = new ArrayList(list.size());
/* 32 */     for (int i = 0; i < list.size(); ++i) {
/* 33 */       view.add(getProductView((Product)list.get(i)));
/*    */     }
/* 35 */     return view;
/*    */   }
/*    */ 
/*    */   public static List getProductList(List list)
/*    */   {
/* 45 */     if (list == null) {
/* 46 */       return null;
/*    */     }
/* 48 */     List datas = new ArrayList(list.size());
/* 49 */     for (int i = 0; i < list.size(); ++i) {
/* 50 */       datas.add(getProduct((ProductView)list.get(i)));
/*    */     }
/* 52 */     return datas;
/*    */   }
/*    */ 
/*    */   public static ProductView getProductView(Product product)
/*    */   {
/* 60 */     if (product == null) {
/* 61 */       throw new BaseRuntimeException(DP.getString("Demo.Common.Query") + 
/* 62 */         "Product " + DP.getString("Demo.Common.Recordisnull"));
/*    */     }
/* 64 */     ProductView view = new ProductView();
/*    */     try {
/* 66 */       view.setItemProductid(product.getItemProductid());
/* 67 */       view.setItemProductname(product.getItemProductname());
/* 68 */       view.setItemUnitprice(product.getItemUnitprice());
/* 69 */       view.setItemQuantity(product.getItemQuantity());
/* 70 */       view.setItemAmount(product.getItemAmount());
/* 71 */       view.setItemLevel(product.getItemLevel());
/*    */     } catch (Exception e) {
/* 73 */       throw new BaseRuntimeException(DP.getString("Demo.Common.From") + 
/* 74 */         "Product" + DP.getString("Demo.Common.Get") + 
/* 75 */         "ProductView" + DP.getString("Demo.Common.Error"), e);
/*    */     }
/* 77 */     return view;
/*    */   }
/*    */ 
/*    */   public static Product getProduct(ProductView productView)
/*    */   {
/* 85 */     Product data = new Product();
/*    */     try {
/* 87 */       data.setItemProductid(productView.getItemProductid());
/* 88 */       data.setItemProductname(productView.getItemProductname());
/* 89 */       data.setItemUnitprice(productView.getItemUnitprice());
/* 90 */       data.setItemQuantity(productView.getItemQuantity());
/* 91 */       data.setItemAmount(productView.getItemAmount());
/* 92 */       data.setItemLevel(productView.getItemLevel());
/*    */     } catch (Exception e) {
/* 94 */       throw new BaseRuntimeException(DP.getString("Demo.Common.From") + 
/* 95 */         "ProductView" + DP.getString("Demo.Common.Get") + 
/* 96 */         "Product" + DP.getString("Demo.Common.Error"), e);
/*    */     }
/* 98 */     return data;
/*    */   }
/*    */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.grid.utils.ProductViewUtils
 * JD-Core Version:    0.5.3
 */