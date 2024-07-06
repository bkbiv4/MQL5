//+------------------------------------------------------------------+
//|                                                          ICT.mq5 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                    [https://www.mql5.com](https://www.mql5.com/) |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "[https://www.mql5.com](https://www.mql5.com/)"
#property version   "1.00"

#include "../Include/ICT/dailypriceinfo.mqh"
#include "../Include/ICT/weeklypriceinfo.mqh"
#include "../Include/ICT/sessionpriceinfo.mqh"
#include "../Include/ICT/ictkillzones.mqh"
#include "../Include/ICT/ictjudasswing.mqh"

#property indicator_chart_window
#property indicator_buffers 1
#property indicator_plots   1
//--- the iMA plot
#property indicator_label1  "iMA"
#property indicator_type1   DRAW_LINE
#property indicator_color1  clrRed
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1
     
void OnTick(void) {
     drawDailyValues();
     drawWeeklyValues();
     setSessionTimes();
     
     if (drawSessionBoxes) {
          drawSessionsRegular();
          // drawSessions();
     }
     judasSwing();
}
//     
void drawSessionsRegular() {
     if (TimeCurrent() > newyorkOpenTime) {
          drawAsianSession();
          drawLondonSession();
          drawNewYorkSession();
     }
     else if (TimeCurrent() > londonOpenTime) {
          drawAsianSession();
          drawLondonSession();
          newyorkOpenTime -= 86400;
          newyorkCloseTime -= 86400;
          drawNewYorkSession();
     }
     else if (TimeCurrent() > asianOpenTime) {
          drawAsianSession();
          londonCloseTime -= 86400;
          londonOpenTime -= 86400;
          drawLondonSession();
          newyorkOpenTime -= 86400;
          newyorkCloseTime -= 86400;
          drawNewYorkSession();
     }
     else {
     
          asianOpenTime -= 86400;
          asianCloseTime -= 86400;
          drawAsianSession();
          londonCloseTime -= 86400;
          londonOpenTime -= 86400;
          drawLondonSession();
          newyorkOpenTime -= 86400;
          newyorkCloseTime -= 86400;
          drawNewYorkSession();
     }
}

void drawSessions() {
   if (TimeCurrent() > newyorkOpenTime) {
     //  Print("1st");
      drawAsianSession();
      drawLondonSession();
      drawNewYorkSession();
   }
   else if (TimeCurrent() > londonOpenTime) {
     //  Print("2nd");
      drawAsianSession();
      drawLondonSession();
   }
   else if (TimeCurrent() > asianOpenTime) {
     //  Print("3rd");
      drawAsianSession();
  
   }
   else {
     //  Print("4th");
   }
}


     /// MARK: - Weekly Smart Money

     /*
     Bullish Conditions - I will need to determine probabilities and different scenarios to choose a proper timeframe
     Create a Price array that spans weekly open time until Wednesday 7AM
     High Odds that the low will from before the above end date of the price array
     The odds are even greater between Tuesday 3AM and Wednesday 7AM
     Test and Find a higher timeframe moving average to help with directional bias
     Can also use a hourly or 30 minute moving average

     Map weekly opening
     */