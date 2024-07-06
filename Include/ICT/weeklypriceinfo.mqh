//###<Experts/ICT.mq5>
//+------------------------------------------------------------------+
//|                                              weeklypriceinfo.mqh |
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

MqlRates weeklyPriceArray[];

string weeklyDirection;

void drawWeeklyValues(void) {
	ArraySetAsSeries(weeklyPriceArray, true);
     int weeklyData = CopyRates(_Symbol,PERIOD_W1, 0, 16, weeklyPriceArray);
     double weeklyOpenPrice = weeklyPriceArray[0].open;
	double weeklyHighPrice = weeklyPriceArray[0].high;
     double weeklyLowPrice = weeklyPriceArray[0].low;
     datetime weeklyOpenTime = weeklyPriceArray[0].time;
     
	ObjectCreate(0, "weeklyOpen", OBJ_TREND, 0, weeklyPriceArray[0].time + 86400, weeklyOpenPrice, weeklyPriceArray[0].time + 518400, weeklyOpenPrice);
	ObjectSetInteger(0, "weeklyOpen",OBJPROP_COLOR, clrMediumSpringGreen);

	ObjectCreate(0, "weeklyLow", OBJ_TREND, 0, weeklyPriceArray[0].time + 86400, weeklyLowPrice, weeklyPriceArray[0].time + 518400, weeklyLowPrice);
	ObjectSetInteger(0, "weeklyLow",OBJPROP_COLOR, clrMediumSpringGreen);
	
	ObjectCreate(0, "weeklyHigh", OBJ_TREND, 0, weeklyPriceArray[0].time + 86400, weeklyHighPrice, weeklyPriceArray[0].time + 518400, weeklyHighPrice);
	ObjectSetInteger(0, "weeklyHigh",OBJPROP_COLOR, clrMediumSpringGreen);
     
	ObjectCreate(0, "weeklyOpenText", OBJ_TEXT, 0, weeklyPriceArray[0].time + 518400, weeklyOpenPrice);
     ObjectSetString(0, "weeklyOpenText", OBJPROP_TEXT, "Weekly Open");
     ObjectSetString(0, "weeklyOpenText", OBJPROP_FONT, "Arial");
     ObjectSetInteger(0, "weeklyOpenText", OBJPROP_ANCHOR, ANCHOR_RIGHT_LOWER);
     ObjectSetInteger(0, "weeklyOpenText", OBJPROP_FONTSIZE, 8);

	ObjectCreate(0, "weeklyLowText", OBJ_TEXT, 0, weeklyPriceArray[0].time + 518400, weeklyLowPrice);
     ObjectSetString(0, "weeklyLowText", OBJPROP_TEXT, "Weekly Low");
     ObjectSetString(0, "weeklyLowText", OBJPROP_FONT, "Arial");
     ObjectSetInteger(0, "weeklyLowText", OBJPROP_ANCHOR, ANCHOR_RIGHT_LOWER);
     ObjectSetInteger(0, "weeklyLowText", OBJPROP_FONTSIZE, 8);

	ObjectCreate(0, "weeklyHighText", OBJ_TEXT, 0, weeklyPriceArray[0].time + 518400, weeklyHighPrice);
     ObjectSetString(0, "weeklyHighText", OBJPROP_TEXT, "Weekly High");
     ObjectSetString(0, "weeklyHighText", OBJPROP_FONT, "Arial");
     ObjectSetInteger(0, "weeklyHighText", OBJPROP_ANCHOR, ANCHOR_RIGHT_LOWER);
     ObjectSetInteger(0, "weeklyHighText", OBJPROP_FONTSIZE, 8);

	
     ObjectCreate(0, "weeklyOpenLine", OBJ_VLINE, 0, weeklyOpenTime + 86400, 0);
     ObjectSetInteger(0, "weeklyOpenLine",OBJPROP_COLOR, clrMediumSpringGreen);
     
     
     ObjectCreate(0, "weeklyOpenLineText", OBJ_TEXT, 0, weeklyOpenTime, 1.32);
     ObjectSetString(0, "weeklyOpenLineText", OBJPROP_TEXT, "Weekly Open");
     ObjectSetString(0, "weeklyOpenLineText", OBJPROP_FONT, "Arial");
     ObjectSetInteger(0, "weeklyOpenLineText", OBJPROP_ANCHOR, ANCHOR_RIGHT_LOWER);
     ObjectSetInteger(0, "weeklyOpenLineText", OBJPROP_FONTSIZE, 8);
     
     
     getCurrentPriceValues();
      
      if (currentPrice > weeklyOpenPrice) {
         weeklyDirection = "WEEKLY DIRECTION - BUY";
      }
      
      else if (currentPrice < weeklyOpenPrice) {
         weeklyDirection = "WEEKLY DIRECTION - SELL";
      }
}