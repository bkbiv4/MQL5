//###<Experts/ICT.mq5>
//+------------------------------------------------------------------+
//|                                                 ictkillzones.mqh |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"

#include "sessionpriceinfo.mqh"
#include "dailypriceinfo.mqh"
#include "hourlypriceinfo.mqh"

input bool drawICTKillzones = true;

void ictKillzones() {

    getHourlyPriceData(); 

    

    datetime ictNewYorkOpenTime = newyorkOpenTime - 3600;
    datetime ictNewYorkCloseTime = ictNewYorkOpenTime + 7200;
    datetime ictLondonCloseTime = londonCloseTime;
    datetime ictLondonCloseOpenTime = ictLondonCloseTime - 7200;

      ObjectCreate(0, "ictLondonCloseOpenLine", OBJ_VLINE, 0, ictLondonCloseOpenTime, 0);
      ObjectSetInteger(0, "ictLondonCloseOpenLine", OBJPROP_TIMEFRAMES, OBJ_PERIOD_M1 | OBJ_PERIOD_M5 | OBJ_PERIOD_M15 | OBJ_PERIOD_M30);
      ObjectSetInteger(0, "ictLondonCloseOpenLine",OBJPROP_COLOR, clrHotPink);
      ObjectSetInteger(0, "ictLondonCloseOpenLine", OBJPROP_STYLE, STYLE_DASH);
      
      ObjectCreate(0, "ictLondonCloseCloseLine", OBJ_VLINE, 0, ictLondonCloseTime, 0);
      ObjectSetInteger(0, "ictLondonCloseCloseLine", OBJPROP_TIMEFRAMES, OBJ_PERIOD_M1 | OBJ_PERIOD_M5 | OBJ_PERIOD_M15 | OBJ_PERIOD_M30);
      ObjectSetInteger(0, "ictLondonCloseCloseLine",OBJPROP_COLOR, clrHotPink);
      ObjectSetInteger(0, "ictLondonCloseCloseLine", OBJPROP_STYLE, STYLE_DASH);
      
      

      ObjectCreate(0, "ictNewyorkOpenLine", OBJ_VLINE, 0, ictNewYorkOpenTime, 0);
      ObjectSetInteger(0, "ictNewyorkOpenLine", OBJPROP_TIMEFRAMES, OBJ_PERIOD_M1 | OBJ_PERIOD_M5 | OBJ_PERIOD_M15 | OBJ_PERIOD_M30);
      ObjectSetInteger(0, "ictNewyorkOpenLine",OBJPROP_COLOR, clrHotPink);
      ObjectSetInteger(0, "ictNewyorkOpenLine", OBJPROP_STYLE, STYLE_DASH);
      
      ObjectCreate(0, "ictNewyorkCloseLine", OBJ_VLINE, 0, ictNewYorkCloseTime, 0);
      ObjectSetInteger(0, "ictNewyorkCloseLine", OBJPROP_TIMEFRAMES, OBJ_PERIOD_M1 | OBJ_PERIOD_M5 | OBJ_PERIOD_M15 | OBJ_PERIOD_M30);
      ObjectSetInteger(0, "ictNewyorkCloseLine",OBJPROP_COLOR, clrHotPink);
      ObjectSetInteger(0, "ictNewyorkCloseLine", OBJPROP_STYLE, STYLE_DASH);
      
      int newyorkX;
      int newyorkY;
      
      ChartTimePriceToXY(0, 0, ictNewYorkOpenTime + 3600, 0, newyorkX, newyorkY);
     
      ObjectCreate(0, "ictNewYorkLabel", OBJ_LABEL, 0, 0, 0);
      ObjectSetString(0, "ictNewYorkLabel",OBJPROP_TEXT, "NY OPEN");
      ObjectSetInteger(0, "ictNewYorkLabel", OBJPROP_XDISTANCE, newyorkX);
      ObjectSetInteger(0, "ictNewYorkLabel", OBJPROP_COLOR, clrHotPink);
      ObjectSetInteger(0, "ictNewYorkLabel", OBJPROP_YDISTANCE, 5);
      ObjectSetInteger(0, "ictNewYorkLabel", OBJPROP_FONTSIZE, 12);
      ObjectSetInteger(0, "ictNewYorkLabel", OBJPROP_CORNER, CORNER_LEFT_LOWER);
      ObjectSetInteger(0, "ictNewYorkLabel", OBJPROP_ANCHOR, ANCHOR_LOWER);
      ObjectSetInteger(0, "ictNewYorkLabel", OBJPROP_TIMEFRAMES, OBJ_PERIOD_M1 | OBJ_PERIOD_M5 | OBJ_PERIOD_M15 | OBJ_PERIOD_M30);
      
      int londonX;
      int londonY;
      
      ChartTimePriceToXY(0, 0, ictLondonCloseOpenTime + 3600, 0, londonX, londonY);
     
      ObjectCreate(0, "ictLondonLabel", OBJ_LABEL, 0, 0, 0);
      ObjectSetString(0, "ictLondonLabel",OBJPROP_TEXT, "LN CLOSE");
      ObjectSetInteger(0, "ictLondonLabel", OBJPROP_XDISTANCE, londonX);
      ObjectSetInteger(0, "ictLondonLabel", OBJPROP_COLOR, clrHotPink);
      ObjectSetInteger(0, "ictLondonLabel", OBJPROP_YDISTANCE, 5);
      ObjectSetInteger(0, "ictLondonLabel", OBJPROP_FONTSIZE, 12);
      ObjectSetInteger(0, "ictLondonLabel", OBJPROP_CORNER, CORNER_LEFT_LOWER);
      ObjectSetInteger(0, "ictLondonLabel", OBJPROP_ANCHOR, ANCHOR_LOWER);
      ObjectSetInteger(0, "ictLondonLabel", OBJPROP_TIMEFRAMES, OBJ_PERIOD_M1 | OBJ_PERIOD_M5 | OBJ_PERIOD_M15 | OBJ_PERIOD_M30);
      

}