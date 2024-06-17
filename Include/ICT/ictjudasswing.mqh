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

double judasSwingOpen;
datetime judasOpenTime;

void judasSwing() {

    getHourlyPriceData();

    /// MARK: - Judas Swing Values
    judasOpenTime = dailyOpenTime + 25200;
    ObjectCreate(0,"judasOpenTime", OBJ_VLINE, 0, judasOpenTime, 0.0);
    ObjectSetInteger(0, "judasOpenTime", OBJPROP_COLOR, clrAzure);

    for(ulong i = 0; i < hourlyPriceArray.Size(); i++) {
        if (hourlyPriceArray[i].time == judasOpenTime) {
            judasSwingOpen = hourlyPriceArray[i].open;
        }
    }

    ObjectCreate(0, "judasOpenPrice", OBJ_TREND, 0, judasOpenTime, judasSwingOpen, judasOpenTime + 61200, judasSwingOpen);
    ObjectSetInteger(0, "judasOpenPrice", OBJPROP_COLOR, clrAzure);
}