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


void ictKillzones() {

    getHourlyPriceData(); 

    

    datetime ictNewYorkOpenTime = newyorkOpenTime - 3600;
    datetime ictNewYorkCloseTime = ictNewYorkOpenTime + 7200;
    
    double ictNewYorkOpenPrice = 0.0;
    for(ulong i = 0; i < hourlyPriceArray.Size(); i++) { 
        if(hourlyPriceArray[i].time == ictNewYorkOpenTime) {
            ictNewYorkOpenPrice = hourlyPriceArray[i].high;
        }
    }
    
    datetime ictLondonCloseTime = londonCloseTime;
    datetime ictLondonCloseOpenTime = ictLondonCloseTime - 7200;
    
    double ictLondonClosePrice = 0.0;
    for(ulong i = 0; i < hourlyPriceArray.Size(); i++) { 
        if(hourlyPriceArray[i].time == ictLondonCloseOpenTime) {
            ictLondonClosePrice = hourlyPriceArray[i].high;
        }
    }

    ObjectCreate(0, "ictLondonCloseOpenTimeText", OBJ_TEXT, 0, (ictLondonCloseOpenTime + ictLondonCloseTime)/2, ictLondonClosePrice + 0.0015, ictLondonCloseTime, ictLondonClosePrice + 0.0015);
    ObjectSetString(0, "ictLondonCloseOpenTimeText", OBJPROP_TEXT, "London Open");
    ObjectSetInteger(0, "ictLondonCloseOpenTimeText",OBJPROP_COLOR, clrDodgerBlue);
    ObjectSetInteger(0, "ictLondonCloseOpenTimeText",OBJPROP_FONTSIZE, 10);
    ObjectSetInteger(0, "ictLondonCloseOpenTimeText", OBJPROP_ANCHOR, ANCHOR_CENTER);

    ObjectCreate(0, "ictLondonCloseOpenBox", OBJ_RECTANGLE, 0, ictLondonCloseOpenTime, ictLondonClosePrice + 0.0015 + 0.0002, ictLondonCloseTime, ictLondonClosePrice + 0.0015 - 0.0002);
    ObjectCreate(0, "ictLondonCloseOpenBoxLeft", OBJ_TREND, 0, ictLondonCloseOpenTime, ictLondonClosePrice + 0.0015 + 0.0001, ictLondonCloseOpenTime, ictLondonClosePrice + 0.0015 - 0.0005);
    ObjectCreate(0, "ictLondonCloseOpenBoxRight", OBJ_TREND, 0, ictLondonCloseTime, ictLondonClosePrice + 0.0015 + 0.0001, ictLondonCloseTime, ictLondonClosePrice + 0.0015 - 0.0005);

    ObjectCreate(0, "ictNewyorkOpenText", OBJ_TEXT, 0, (ictNewYorkOpenTime + ictNewYorkCloseTime)/2, ictNewYorkOpenPrice + 0.0015, ictNewYorkCloseTime, ictNewYorkOpenPrice + 0.0015);
    ObjectSetString(0, "ictNewyorkOpenText", OBJPROP_TEXT, "New York Open");
    ObjectSetInteger(0, "ictNewyorkOpenText",OBJPROP_COLOR, clrDodgerBlue);
    ObjectSetInteger(0, "ictNewyorkOpenText",OBJPROP_FONTSIZE, 10);
    ObjectSetInteger(0, "ictNewyorkOpenText", OBJPROP_ANCHOR, ANCHOR_CENTER);

    ObjectCreate(0, "ictNewyorkOpenBox", OBJ_RECTANGLE, 0, ictNewYorkOpenTime, ictNewYorkOpenPrice + 0.0015 + 0.0002, ictNewYorkCloseTime, ictNewYorkOpenPrice + 0.0015 - 0.0002);
    ObjectCreate(0, "ictNewyorkOpenBoxLeft", OBJ_TREND, 0, ictNewYorkOpenTime, ictNewYorkOpenPrice + 0.0015 + 0.0001, ictNewYorkOpenTime, ictNewYorkOpenPrice + 0.0015 - 0.0005);
    ObjectCreate(0, "ictNewyorkOpenBoxRight", OBJ_TREND, 0, ictNewYorkCloseTime, ictNewYorkOpenPrice + 0.0015 + 0.0001, ictNewYorkCloseTime, ictNewYorkOpenPrice + 0.0015 - 0.0005);
}