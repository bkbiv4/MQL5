//###<Experts/ICT.mq5>
//+------------------------------------------------------------------+
//|                                               dailypriceinfo.mqh |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
//+------------------------------------------------------------------+
//| defines                                                          |
//+------------------------------------------------------------------+
// #define MacrosHello   "Hello, world!"
// #define MacrosYear    2010
//+------------------------------------------------------------------+
//| DLL imports                                                      |
//+------------------------------------------------------------------+
// #import "user32.dll"
//   int      SendMessageA(int hWnd,int Msg,int wParam,int lParam);
// #import "my_expert.dll"
//   int      ExpertRecalculate(int wParam,int lParam);
// #import
//+------------------------------------------------------------------+
//| EX5 imports                                                      |
//+------------------------------------------------------------------+
// #import "stdlib.ex5"
//   string ErrorDescription(int error_code);
// #import
//+------------------------------------------------------------------+

#include "currentpriceinfo.mqh"

MqlRates dailyPriceArray[];
datetime dailyOpenTime;

string dailyDirection;


void drawDailyValues() {
      ArraySetAsSeries(dailyPriceArray, true);
      int dailyData = CopyRates(_Symbol, PERIOD_D1, 0, 28, dailyPriceArray);
      double dailyOpenPrice = dailyPriceArray[0].open;
      double dailyHighPrice = dailyPriceArray[0].high;
      double dailyLowPrice = dailyPriceArray[0].low;
      dailyOpenTime = dailyPriceArray[0].time;

      ObjectCreate(0, "dailyOpen", OBJ_VLINE, 0, dailyOpenTime, 0);
      ObjectSetInteger(0, "dailyOpen", OBJPROP_TIMEFRAMES, OBJ_PERIOD_M1 | OBJ_PERIOD_M5 | OBJ_PERIOD_M15 | OBJ_PERIOD_M30 | OBJ_PERIOD_H1);
      ObjectSetInteger(0, "dailyOpen",OBJPROP_COLOR, clrHotPink);
      ObjectSetInteger(0, "dailyOpen", OBJPROP_STYLE, STYLE_DASH);
      
      int pricex, pricey;
      
      ChartTimePriceToXY(0, 0, dailyOpenTime, 0, pricex, pricey);
     
      ObjectCreate(0, "dailyOpenLabel", OBJ_LABEL, 0, 0, 0);
      ObjectSetString(0, "dailyOpenLabel",OBJPROP_TEXT, "DAILY OPEN");
      ObjectSetInteger(0, "dailyOpenLabel", OBJPROP_XDISTANCE, pricex);
      ObjectSetInteger(0, "dailyOpenLabel", OBJPROP_COLOR, clrHotPink);
      ObjectSetInteger(0, "dailyOpenLabel", OBJPROP_YDISTANCE, 5);
      ObjectSetInteger(0, "dailyOpenLabel", OBJPROP_FONTSIZE, 12);
      ObjectSetInteger(0, "dailyOpenLabel", OBJPROP_CORNER, CORNER_LEFT_LOWER);
      ObjectSetInteger(0, "dailyOpenLabel", OBJPROP_ANCHOR, ANCHOR_LEFT_UPPER);
      ObjectSetDouble(0, "dailyOpenLabel", OBJPROP_ANGLE, 90.0);
      
      
   
      ObjectCreate(0, "dailyHigh", OBJ_TREND, 0, dailyOpenTime, dailyHighPrice, dailyOpenTime + 86400, dailyHighPrice);
      ObjectSetInteger(0, "dailyHigh", OBJPROP_TIMEFRAMES, OBJ_PERIOD_M1 | OBJ_PERIOD_M5 | OBJ_PERIOD_M15 | OBJ_PERIOD_M30 | OBJ_PERIOD_H1);
      ObjectSetInteger(0, "dailyHigh",OBJPROP_COLOR, clrHotPink);
      
      ObjectCreate(0, "dailyLow", OBJ_TREND, 0, dailyOpenTime, dailyLowPrice, dailyOpenTime + 86400, dailyLowPrice);
      ObjectSetInteger(0, "dailyLow", OBJPROP_TIMEFRAMES, OBJ_PERIOD_M1 | OBJ_PERIOD_M5 | OBJ_PERIOD_M15 | OBJ_PERIOD_M30 | OBJ_PERIOD_H1);
      ObjectSetInteger(0, "dailyLow",OBJPROP_COLOR, clrHotPink);
      
      ObjectCreate(0, "dailyOpenPrice", OBJ_TREND, 0, dailyOpenTime, dailyOpenPrice, dailyOpenTime + 86400, dailyOpenPrice);
      ObjectSetInteger(0, "dailyOpenPrice", OBJPROP_TIMEFRAMES, OBJ_PERIOD_M1 | OBJ_PERIOD_M5 | OBJ_PERIOD_M15 | OBJ_PERIOD_M30 | OBJ_PERIOD_H1);
      ObjectSetInteger(0, "dailyOpenPrice",OBJPROP_COLOR, clrHotPink);

      ObjectCreate(0, "dailyHighText", OBJ_TEXT, 0, dailyOpenTime + 86400, dailyHighPrice);
      ObjectSetString(0, "dailyHighText", OBJPROP_TEXT, "Daily High");
      ObjectSetString(0, "dailyHighText", OBJPROP_FONT, "Arial");
      ObjectSetInteger(0, "dailyHighText", OBJPROP_ANCHOR, ANCHOR_RIGHT_LOWER);
      ObjectSetInteger(0, "dailyHighText", OBJPROP_FONTSIZE, 8);
      ObjectSetInteger(0, "dailyHighText", OBJPROP_TIMEFRAMES, OBJ_PERIOD_M1 | OBJ_PERIOD_M5 | OBJ_PERIOD_M15 | OBJ_PERIOD_M30 | OBJ_PERIOD_H1);
      ObjectSetInteger(0, "dailyHighText",OBJPROP_COLOR, clrHotPink);

      ObjectCreate(0, "dailyLowText", OBJ_TEXT, 0, dailyOpenTime + 86400, dailyLowPrice);
      ObjectSetString(0, "dailyLowText", OBJPROP_TEXT, "Daily Low");
      ObjectSetString(0, "dailyLowText", OBJPROP_FONT, "Arial");
      ObjectSetInteger(0, "dailyLowText", OBJPROP_ANCHOR, ANCHOR_RIGHT_LOWER);
      ObjectSetInteger(0, "dailyLowText", OBJPROP_FONTSIZE, 8);
      ObjectSetInteger(0, "dailyLowText", OBJPROP_TIMEFRAMES, OBJ_PERIOD_M1 | OBJ_PERIOD_M5 | OBJ_PERIOD_M15 | OBJ_PERIOD_M30 | OBJ_PERIOD_H1);
      ObjectSetInteger(0, "dailyLowText",OBJPROP_COLOR, clrHotPink);

      ObjectCreate(0, "dailyOpenPriceText", OBJ_TEXT, 0, dailyOpenTime + 86400, dailyOpenPrice);
      ObjectSetString(0, "dailyOpenPriceText", OBJPROP_TEXT, "Daily Open");
      ObjectSetString(0, "dailyOpenPriceText", OBJPROP_FONT, "Arial");
      ObjectSetInteger(0, "dailyOpenPriceText", OBJPROP_ANCHOR, ANCHOR_RIGHT_LOWER);
      ObjectSetInteger(0, "dailyOpenPriceText", OBJPROP_FONTSIZE, 8);
      ObjectSetInteger(0, "dailyOpenPriceText", OBJPROP_TIMEFRAMES, OBJ_PERIOD_M1 | OBJ_PERIOD_M5 | OBJ_PERIOD_M15 | OBJ_PERIOD_M30 | OBJ_PERIOD_H1);
      ObjectSetInteger(0, "dailyOpenPriceText",OBJPROP_COLOR, clrHotPink);
      
      getCurrentPriceValues();
      
      if (currentPrice > dailyOpenPrice) {
         dailyDirection = "DAILY DIRECTION - BUY";
      }
      
      else if (currentPrice < dailyOpenPrice) {
         dailyDirection = "DAILY DIRECTION - SELL";
      }
  }