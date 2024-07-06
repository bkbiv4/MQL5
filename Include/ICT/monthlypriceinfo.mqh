//+------------------------------------------------------------------+
//|                                             monthlypriceinfo.mqh |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"

#include "currentpriceinfo.mqh"

input bool drawMonthlyData = true;
string monthlyDirection;


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
      ObjectSetInteger(0, "monthlyOpen",OBJPROP_COLOR, clrOrange);
      ObjectSetInteger(0, "monthlyOpen", OBJPROP_TIMEFRAMES, OBJ_PERIOD_H4 | OBJ_PERIOD_D1 | OBJ_PERIOD_W1);
      
      
      ObjectCreate(0, "monthlyOpenPrice", OBJ_TREND, 0, monthlyOpenTime, monthlyOpenPrice, monthlyOpenTime + 2592000, monthlyOpenPrice);
      ObjectSetInteger(0, "monthlyOpenPrice",OBJPROP_COLOR, clrOrange);
      ObjectSetInteger(0, "monthlyOpenPrice",OBJPROP_STYLE, STYLE_DASH);
      ObjectSetInteger(0, "monthlyOpenPrice", OBJPROP_TIMEFRAMES, OBJ_PERIOD_H4 | OBJ_PERIOD_D1 | OBJ_PERIOD_W1);
      
      ObjectCreate(0, "monthlyOpenPriceText", OBJ_TEXT, 0, monthlyOpenTime + 2592000, monthlyOpenPrice);
      ObjectSetInteger(0, "monthlyOpenPriceText",OBJPROP_COLOR, clrOrange);
      ObjectSetString(0, "monthlyOpenPriceText", OBJPROP_TEXT, "Monthly Open");
      ObjectSetString(0, "monthlyOpenPriceText", OBJPROP_FONT, "Arial");
      ObjectSetInteger(0, "monthlyOpenPriceText", OBJPROP_ANCHOR, ANCHOR_RIGHT_LOWER);
      ObjectSetInteger(0, "monthlyOpenPriceText", OBJPROP_FONTSIZE, 8);
      ObjectSetInteger(0, "monthlyOpenPriceText", OBJPROP_TIMEFRAMES, OBJ_PERIOD_H4 | OBJ_PERIOD_D1 | OBJ_PERIOD_W1);
      
      
      getCurrentPriceValues();
      
      if (currentPrice > monthlyOpenPrice) {
         monthlyDirection = "MONTHLY DIRECTION - BUY";
      }
      
      else if (currentPrice < monthlyOpenPrice) {
         monthlyDirection = "MONTHLY DIRECTION - SELL";
      }

}