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
     
void OnTick(void) {
   drawDailyValues();
   drawWeeklyValues();
   setSessionTimes();
   
   if (drawSessionBoxes) {
          //drawSessionsRegular();
          drawSessions();
     }
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
      Print("1st");
      drawAsianSession();
      drawLondonSession();
      drawNewYorkSession();
   }
   else if (TimeCurrent() > londonOpenTime) {
      Print("2nd");
      drawAsianSession();
      drawLondonSession();
   }
   else if (TimeCurrent() > asianOpenTime) {
      Print("3rd");
      drawAsianSession();
  
   }
   else {
      Print("4th");
   }
}