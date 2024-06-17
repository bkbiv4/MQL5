//###<Experts/ICT.mq5>
//+------------------------------------------------------------------+
//|                                              hourlypriceinfo.mqh |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"


MqlRates hourlyPriceArray[];

void getHourlyPriceData() {
     ArraySetAsSeries(hourlyPriceArray, true);
     int hourlyData = CopyRates(_Symbol,PERIOD_H1, 0, 48, hourlyPriceArray);

}