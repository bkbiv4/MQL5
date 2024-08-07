//###<Experts/ICT.mq5>

//+------------------------------------------------------------------+
//|                                                ictjudasswing.mqh |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"


#include "hourlypriceinfo.mqh"
#include "dailypriceinfo.mqh"


input bool drawJudasSwing = true;
double judasSwingOpen;
datetime judasOpenTime;


void judasSwing() {

    getHourlyPriceData();

    /// MARK: - Judas Swing Values
    judasOpenTime = dailyOpenTime + 25200;
    ObjectCreate(0,"judasOpenTime", OBJ_VLINE, 0, judasOpenTime, 0.0);
    ObjectSetInteger(0, "judasOpenTime", OBJPROP_COLOR, clrAzure);
    ObjectSetInteger(0, "judasOpenTime", OBJPROP_TIMEFRAMES, OBJ_PERIOD_M1 | OBJ_PERIOD_M5 | OBJ_PERIOD_M15 | OBJ_PERIOD_M30);
    ObjectSetInteger(0, "judasOpenTime", OBJPROP_STYLE, STYLE_DASH);
    
    int pricex, pricey;
      
   ChartTimePriceToXY(0, 0, judasOpenTime, 0, pricex, pricey);
   
   ObjectCreate(0, "midnightOpenLabel", OBJ_LABEL, 0, 0, 0);
   ObjectSetString(0, "midnightOpenLabel",OBJPROP_TEXT, "12AM OPEN");
   ObjectSetInteger(0, "midnightOpenLabel", OBJPROP_XDISTANCE, pricex);
   ObjectSetInteger(0, "midnightOpenLabel", OBJPROP_COLOR, clrAzure);
   ObjectSetInteger(0, "midnightOpenLabel", OBJPROP_YDISTANCE, 5);
   ObjectSetInteger(0, "midnightOpenLabel", OBJPROP_FONTSIZE, 12);
   ObjectSetInteger(0, "midnightOpenLabel", OBJPROP_CORNER, CORNER_LEFT_LOWER);
   ObjectSetInteger(0, "midnightOpenLabel", OBJPROP_ANCHOR, ANCHOR_LEFT_UPPER);
   ObjectSetDouble(0, "midnightOpenLabel", OBJPROP_ANGLE, 90.0);
   ObjectSetInteger(0, "midnightOpenLabel", OBJPROP_TIMEFRAMES, OBJ_PERIOD_M1 | OBJ_PERIOD_M5 | OBJ_PERIOD_M15 | OBJ_PERIOD_M30);

    for(ulong i = 0; i < hourlyPriceArray.Size(); i++) {
        if (hourlyPriceArray[i].time == judasOpenTime) {
            judasSwingOpen = hourlyPriceArray[i].open;
        }
    }

    ObjectCreate(0, "judasOpenPrice", OBJ_TREND, 0, judasOpenTime, judasSwingOpen, judasOpenTime + 39600, judasSwingOpen);
    ObjectSetInteger(0, "judasOpenPrice", OBJPROP_COLOR, clrAzure);
    ObjectSetInteger(0, "judasOpenPrice", OBJPROP_TIMEFRAMES, OBJ_PERIOD_M1 | OBJ_PERIOD_M5 | OBJ_PERIOD_M15 | OBJ_PERIOD_M30);
    
     ObjectCreate(0, "judasSwingText", OBJ_TEXT, 0, judasOpenTime + 39600, judasSwingOpen);
     ObjectSetString(0, "judasSwingText", OBJPROP_TEXT, "JS");
     ObjectSetInteger(0, "judasSwingText", OBJPROP_COLOR, clrAzure);
     ObjectSetString(0, "judasSwingText", OBJPROP_FONT, "Arial");
     ObjectSetInteger(0, "judasSwingText", OBJPROP_ANCHOR, ANCHOR_RIGHT_LOWER);
     ObjectSetInteger(0, "judasSwingText", OBJPROP_FONTSIZE, 8);
     ObjectSetInteger(0, "judasSwingText", OBJPROP_TIMEFRAMES, OBJ_PERIOD_M1 | OBJ_PERIOD_M5 | OBJ_PERIOD_M15 | OBJ_PERIOD_M30 | OBJ_PERIOD_H1);
}