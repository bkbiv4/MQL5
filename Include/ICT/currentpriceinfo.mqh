//+------------------------------------------------------------------+
//|                                             currentpriceinfo.mqh |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"



MqlRates minutePriceArray[];
double currentPrice;
//datetime dailyOpenTime;

void getCurrentPriceValues() {
   ArraySetAsSeries(minutePriceArray, true);
   int minuteData = CopyRates(_Symbol,PERIOD_M1, 0, 48, minutePriceArray);

   currentPrice = minutePriceArray[0].open;

}