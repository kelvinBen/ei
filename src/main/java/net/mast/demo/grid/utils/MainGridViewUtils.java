/*     */ package net.mast.demo.grid.utils;
/*     */ 
/*     */ import java.util.ArrayList;
/*     */ import java.util.Iterator;
/*     */ import java.util.List;
/*     */ import net.mast.commons.exception.BaseRuntimeException;
/*     */ import net.mast.demo.DP;
/*     */ import net.mast.demo.grid.data.GridItem;
/*     */ import net.mast.demo.grid.data.MainGrid;
/*     */ import net.mast.demo.grid.view.GridItemView;
/*     */ import net.mast.demo.grid.view.MainGridView;
/*     */ 
/*     */ public class MainGridViewUtils
/*     */ {
/*     */   public static List getMainGridListView(List list)
/*     */   {
/*  23 */     List view = new ArrayList(list.size());
/*  24 */     for (int i = 0; i < list.size(); ++i) {
/*  25 */       view.add(getMainGridView((MainGrid)list.get(i)));
/*     */     }
/*  27 */     return view;
/*     */   }
/*     */ 
/*     */   public static List getMainGridList(List list)
/*     */   {
/*  37 */     List datas = new ArrayList(list.size());
/*  38 */     for (int i = 0; i < list.size(); ++i) {
/*  39 */       datas.add(getMainGrid((MainGridView)list.get(i)));
/*     */     }
/*  41 */     return datas;
/*     */   }
/*     */ 
/*     */   public static MainGridView getMainGridView(MainGrid mainGrid)
/*     */   {
/*  49 */     if (mainGrid == null) {
/*  50 */       throw new BaseRuntimeException(DP.getString("Demo.Common.Query") + 
/*  51 */         "MainGrid" + DP.getString("Demo.Common.Recordisnull"));
/*     */     }
/*  53 */     MainGridView view = new MainGridView();
/*     */     try {
/*  55 */       view.setMainGridId(mainGrid.getMainGridId());
/*  56 */       view.setOperatorCode(mainGrid.getOperatorCode());
/*  57 */       view.setOperateName(mainGrid.getOperateName());
/*  58 */       view.setOperateCooperate(mainGrid.getOperateCooperate());
/*  59 */       view.setOperateDept(mainGrid.getOperateDept());
/*  60 */       view.setOperateDate(mainGrid.getOperateDate());
/*  61 */       view.setOperateEffdate(mainGrid.getOperateEffdate());
/*  62 */       view.setOperatorStatus(mainGrid.getOperatorStatus());
/*  63 */       view.setOperatorDepot(mainGrid.getOperatorDepot());
/*  64 */       Iterator lines = mainGrid.getListGridItem().iterator();
/*  65 */       List detailview = new ArrayList();
/*  66 */       GridItem line = null;
/*  67 */       GridItemView lineView = null;
/*  68 */       while (lines.hasNext()) {
/*  69 */         line = (GridItem)lines.next();
/*  70 */         lineView = new GridItemView();
/*  71 */         lineView.setMainGridId(line.getMainGridId());
/*  72 */         lineView.setItemDetailid(line.getItemDetailid());
/*  73 */         lineView.setItemProductid(line.getItemProductid());
/*  74 */         lineView.setItemUnitprice(line.getItemUnitprice());
/*  75 */         lineView.setItemDiscount(line.getItemDiscount());
/*  76 */         lineView.setItemQuantity(line.getItemQuantity());
/*  77 */         lineView.setItemAmount(line.getItemAmount());
/*  78 */         lineView.setItemDate(line.getItemDate());
/*  79 */         lineView.setItemDatetime(line.getItemDatetime());
/*  80 */         lineView.setItemLevel(line.getItemLevel());
/*  81 */         lineView.setItemNote(line.getItemNote());
/*  82 */         detailview.add(lineView);
/*     */       }
/*  84 */       view.setListGridItem(detailview);
/*     */     } catch (Exception e) {
/*  86 */       throw new BaseRuntimeException(DP.getString("Demo.Common.From") + 
/*  87 */         "MainGrid" + DP.getString("Demo.Common.Get") + 
/*  88 */         "MainGridView" + DP.getString("Demo.Common.Error"), e);
/*     */     }
/*  90 */     return view;
/*     */   }
/*     */ 
/*     */   public static MainGrid getMainGrid(MainGridView mainGridView)
/*     */   {
/*  98 */     MainGrid data = new MainGrid();
/*     */     try {
/* 100 */       data.setMainGridId(mainGridView.getMainGridId());
/* 101 */       data.setOperatorCode(mainGridView.getOperatorCode());
/* 102 */       data.setOperateName(mainGridView.getOperateName());
/* 103 */       data.setOperateCooperate(mainGridView.getOperateCooperate());
/* 104 */       data.setOperateDept(mainGridView.getOperateDept());
/* 105 */       data.setOperateDate(mainGridView.getOperateDate());
/* 106 */       data.setOperateEffdate(mainGridView.getOperateEffdate());
/* 107 */       data.setOperatorStatus(mainGridView.getOperatorStatus());
/* 108 */       data.setOperatorDepot(mainGridView.getOperatorDepot());
/* 109 */       Iterator lines = mainGridView.getListGridItem().iterator();
/* 110 */       List detail = new ArrayList();
/* 111 */       GridItemView lineView = null;
/* 112 */       GridItem line = null;
/* 113 */       while (lines.hasNext()) {
/* 114 */         lineView = (GridItemView)lines.next();
/* 115 */         line = new GridItem();
/* 116 */         line.setMainGridId(lineView.getMainGridId());
/* 117 */         line.setItemDetailid(lineView.getItemDetailid());
/* 118 */         line.setItemProductid(lineView.getItemProductid());
/* 119 */         line.setItemUnitprice(lineView.getItemUnitprice());
/* 120 */         if (lineView.getItemDiscount() == "")
/* 121 */           line.setItemDiscount("0");
/*     */         else {
/* 123 */           line.setItemDiscount(lineView.getItemDiscount());
/*     */         }
/* 125 */         line.setItemQuantity(lineView.getItemQuantity());
/* 126 */         line.setItemAmount(lineView.getItemAmount());
/* 127 */         line.setItemDate(lineView.getItemDate());
/* 128 */         line.setItemDatetime(lineView.getItemDatetime());
/* 129 */         line.setItemLevel(lineView.getItemLevel());
/* 130 */         line.setItemNote(lineView.getItemNote());
/* 131 */         line.setIsDelete(lineView.getIsDelete());
/* 132 */         detail.add(line);
/*     */       }
/* 134 */       data.setListGridItem(detail);
/*     */     } catch (Exception e) {
/* 136 */       throw new BaseRuntimeException(DP.getString("Demo.Common.From") + 
/* 137 */         "MainGridView" + DP.getString("Demo.Common.Get") + 
/* 138 */         "MainGrid" + DP.getString("Demo.Common.Error"), e);
/*     */     }
/* 140 */     return data;
/*     */   }
/*     */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.grid.utils.MainGridViewUtils
 * JD-Core Version:    0.5.3
 */