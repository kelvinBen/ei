/*    */ package net.mast.demo.combo.combobox.data;
/*    */ 
/*    */ import java.util.ArrayList;
/*    */ import java.util.HashMap;
/*    */ import net.mast.demo.DP;
/*    */ 
/*    */ public class Nation
/*    */ {
/*  6 */   private static ArrayList nation = new ArrayList();
/*    */ 
/*    */   static { HashMap hash = null;
/*  9 */     hash = new HashMap();
/* 10 */     hash.put("nodeId", "1");
/* 11 */     hash.put("CheckData", DP.getString("Demo.Common.Han"));
/* 12 */     hash.put("helpData", "hanzu");
/* 13 */     nation.add(hash);
/* 14 */     hash = new HashMap();
/* 15 */     hash.put("nodeId", "2");
/* 16 */     hash.put("CheckData", DP.getString("Demo.Common.Hui"));
/* 17 */     hash.put("helpData", "huizu");
/* 18 */     nation.add(hash);
/* 19 */     hash = new HashMap();
/* 20 */     hash.put("nodeId", "3");
/* 21 */     hash.put("CheckData", DP.getString("Demo.Common.Miao"));
/* 22 */     hash.put("helpData", "miaozu");
/* 23 */     nation.add(hash);
/* 24 */     hash = new HashMap();
/* 25 */     hash.put("nodeId", "4");
/* 26 */     hash.put("CheckData", DP.getString("Demo.Common.Zhuang"));
/* 27 */     hash.put("helpData", "zhuangzu");
/* 28 */     nation.add(hash);
/* 29 */     hash = new HashMap();
/* 30 */     hash.put("nodeId", "5");
/* 31 */     hash.put("CheckData", DP.getString("Demo.Common.Mongolia"));
/* 32 */     hash.put("helpData", "menggu");
/* 33 */     nation.add(hash);
/* 34 */     hash = new HashMap();
/* 35 */     hash.put("nodeId", "6");
/* 36 */     hash.put("CheckData", DP.getString("Demo.Common.Korean"));
/* 37 */     hash.put("helpData", "chaoxian");
/* 38 */     nation.add(hash);
/* 39 */     hash = new HashMap();
/* 40 */     hash.put("nodeId", "7");
/* 41 */     hash.put("CheckData", DP.getString("Demo.Common.Uygur"));
/* 42 */     hash.put("helpData", "weiwuer");
/* 43 */     nation.add(hash);
/* 44 */     hash = new HashMap();
/* 45 */     hash.put("nodeId", "8");
/* 46 */     hash.put("CheckData", DP.getString("Demo.Common.Yi"));
/* 47 */     hash.put("helpData", "yizu");
/* 48 */     nation.add(hash);
/* 49 */     hash = new HashMap();
/* 50 */     hash.put("nodeId", "9");
/* 51 */     hash.put("CheckData", DP.getString("Demo.Common.Dai"));
/* 52 */     hash.put("helpData", "daizu");
/* 53 */     nation.add(hash);
/*    */   }
/*    */ 
/*    */   public ArrayList getNation()
/*    */   {
/* 71 */     return nation; }
/*    */ 
/*    */   public void setNation(ArrayList nation) {
/* 74 */     nation = nation;
/*    */   }
/*    */ }

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.combo.combobox.data.Nation
 * JD-Core Version:    0.5.3
 */