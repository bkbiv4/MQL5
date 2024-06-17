//+------------------------------------------------------------------+
//|                                                         ICT2.mq5 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#property indicator_chart_window
#property indicator_buffers 1
#property indicator_plots   1
//--- the iMA plot
#property indicator_label1  "iMA"
#property indicator_type1   DRAW_LINE
#property indicator_color1  clrRed
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1

//input string startTradingTime = "09:00";
//input string endTradingTime = "16:30";
//input int dailyOpens = 0;
//input int weeklyOpens = 0;
//input bool ictKillzones = false;
input bool drawSessionBoxes = true;
MqlRates hourlyPriceArray[], dailyPriceArray[],  weeklyPriceArray[], asianPriceArray[], newyorkPriceArray[], londonPriceArray[]; 
datetime asianOpenTime, asianCloseTime, newyorkOpenTime, newyorkCloseTime, londonOpenTime, londonCloseTime;
double asianLow, asianHigh, londonLow, londonHigh, newyorkLow, newyorkHigh;
//int tenperiodMA;
//
//enum ICTZoneMethod {
//   Call_iMA,               // use iMA
//   Call_IndicatorCreate    // use IndicatorCreate
//};


void OnTick() {

     
    
     //create an array for several prices
   double myMovingAverageArray1[], myMovingAverageArray2[];
   
   //define the properties of  MAs - simple MA, 1st 24 / 2nd 50
   int movingAverage1 = iMA(_Symbol, _Period, 10, 0, MODE_EMA, PRICE_CLOSE);
   int movingAverage2 = iMA(_Symbol, _Period, 20,0,MODE_EMA,PRICE_CLOSE);
   
   //sort the price arrays 1, 2 from current candle
   ArraySetAsSeries(myMovingAverageArray1,true);
   ArraySetAsSeries(myMovingAverageArray2,true);
   
   //Defined MA1, MA2 - one line - currentcandle, 3 candles - store result
   //CopyBuffer(movingAverage1,0,0,3,myMovingAverageArray1);
   //CopyBuffer(movingAverage2,0,0,3,myMovingAverageArray2);
   
   //Check if we have a buy entry signal
//   if (
//      (myMovingAverageArray1[0]>myMovingAverageArray2[0])
//   && (myMovingAverageArray1[1]<myMovingAverageArray2[1])
//      )
//         {
//         Comment("BUY");
//         }
//    
//   //check if we have a sell entry signal      
//     if (
//      (myMovingAverageArray1[0]<myMovingAverageArray2[0])
//   && (myMovingAverageArray1[1]>myMovingAverageArray2[1])
//      )
//         {
//         Comment("SELL");
//         }          

     

     
     
     

     if (drawSessionBoxes) {
          drawSessions();
     }
//     


     
     
     
     
}




//Switch Case 
//     //On the chart set up clickable butttons to control the switch
//     //Use boolean to set up different modes



//ObjectCreate(0, "yesterdayLow", OBJ_TREND, 0, dailyPriceArray[0].time, dailyPriceArray[1].low, dailyPriceArray[0].time + 86400, dailyPriceArray[1].low);
     //ObjectCreate(0, "yesterdayHigh", OBJ_TREND, 0, dailyPriceArray[0].time, dailyPriceArray[1].high, dailyPriceArray[0].time + 86400, dailyPriceArray[1].high);
     //ObjectCreate(0, "yesterdayClose", OBJ_TREND, 0, dailyPriceArray[0].time, dailyPriceArray[1].close, dailyPriceArray[0].time + 86400, dailyPriceArray[1].close);
     //ObjectCreate(0, "yesterdayOpen", OBJ_TREND, 0, dailyPriceArray[0].time, dailyPriceArray[1].open, dailyPriceArray[0].time + 86400, dailyPriceArray[1].open);
     //ObjectSetInteger(0, "yesterdayLow",OBJPROP_COLOR, clrDodgerBlue);
     //ObjectSetInteger(0, "yesterdayHigh",OBJPROP_COLOR, clrDodgerBlue);
     //ObjectSetInteger(0, "yesterdayClose",OBJPROP_COLOR, clrWhite);
     //ObjectSetInteger(0, "yesterdayOpen",OBJPROP_COLOR, clrGray);








//void OnDeinit(const int reason)
//  {
//   if(tenperiodMA!=INVALID_HANDLE)
//      IndicatorRelease(tenperiodMA);
////--- clear the chart after deleting the indicator
//   Comment("");
//
  //}    