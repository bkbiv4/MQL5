//+------------------------------------------------------------------+
//|                                             monthlypriceinfo.mqh |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"


input bool drawMonthlyData = true;


MqlRates monthlyPriceArray[];
datetime monthlyOpenTime;

void drawMonthlyValues() {
      ArraySetAsSeries(monthlyPriceArray, true);
      int monthlyData = CopyRates(_Symbol,PERIOD_MN1, 0, 48, monthlyPriceArray);
      
      double monthlyOpenPrice = monthlyPriceArray[0].open;
      double monthlyHighPrice = monthlyPriceArray[0].high;
      double monthlyLowPrice = monthlyPriceArray[0].low;
      monthlyOpenTime = monthlyPriceArray[0].time;
      
      ObjectCreate(0, "monthlyOpen", OBJ_VLINE, 0, monthlyOpenTime, 0);
      ObjectSetInteger(0, "monthlyOpen",OBJPROP_COLOR, clrPurple);
      
      ObjectCreate(0, "monthlyOpenPrice", OBJ_TREND, 0, monthlyOpenTime, monthlyOpenPrice, monthlyOpenTime + 2592000, monthlyOpenPrice);
      
      ObjectCreate(0, "monthlyOpenPriceText", OBJ_TEXT, 0, monthlyOpenTime + 86400, monthlyOpenPrice);
      ObjectSetString(0, "monthlyOpenPriceText", OBJPROP_TEXT, "Daily Open");
      ObjectSetString(0, "monthlyOpenPriceText", OBJPROP_FONT, "Arial");
      ObjectSetInteger(0, "monthlyOpenPriceText", OBJPROP_ANCHOR, ANCHOR_RIGHT_LOWER);
      ObjectSetInteger(0, "monthlyOpenPriceText", OBJPROP_FONTSIZE, 8);

}