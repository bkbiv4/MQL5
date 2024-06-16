//+------------------------------------------------------------------+
//|                                                    ICT_ZONES.mq5 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+


void OnCalculate()
  {
//---
   DrawSunFri();
  }
//+------------------------------------------------------------------+


void DrawSunFri() {


   ObjectsDeleteAll(0,"",-1,-1);
//  
//   
   
   
   datetime asianOpen=__DATE__ + 97200;
   datetime asianKillZoneClose=asianOpen+14400;
   datetime asianClose=asianOpen+32400;
   
   
   
   datetime londonOpen=asianClose-7200;
   datetime londonClose=londonOpen+32400;
   datetime londonCloseOpen=londonClose-7200;
   
   
   
   datetime newyorkOpen=londonClose-14400;
   datetime newyorkClose=newyorkOpen+32400;
   datetime newyorkKillzone=newyorkOpen+7200;
   
   
   
  
//   
   
   
   
   
//   else if (TimeCurrent() < newyorkSessionClose && TimeCurrent() > newyorkSessionOpen) {
//      Comment("New York Session");
//      
//      if (TimeCurrent() < newyorkOpenClose && TimeCurrent() > newyorkSessionOpen) {
//         Comment("New York Killzone");
//   
//      }
//   }
//   
//   else if (TimeCurrent() < asianKillZoneClose && TimeCurrent() > asianOpen) {
//      Comment("Asian Session");
//   
//   }
//   
//   else if (TimeCurrent() < londonCloseClose && TimeCurrent() > londonOpen) {
//      Comment("London Session");
//      
//      if (TimeCurrent() < londonCloseClose && TimeCurrent() > londonCloseOpen) {
//         Comment("London Close Killzone");
//      }
//   
//   }
    
    
    //Add in Overlaps
   if (TimeCurrent() > (asianOpen-3600) && TimeCurrent() < (asianClose+3600)) {
      Comment("Asian Sesion");
      
      ObjectCreate(_Symbol,"asianOpenLine", OBJ_VLINE, 0, asianOpen, 0);
      ObjectCreate(_Symbol,"asianCloseLine", OBJ_VLINE, 0, asianClose, 0);
      ObjectCreate(_Symbol,"asianKillZoneCloseLine", OBJ_VLINE, 0, asianKillZoneClose, 0);
      
      ObjectSetInteger(_Symbol,"asianOpenLine",OBJPROP_COLOR,clrPurple);
      ObjectSetInteger(_Symbol,"asianCloseLine",OBJPROP_COLOR,clrPurple);
   
   }
   
   else if (TimeCurrent() > (londonOpen-3600) && TimeCurrent() < (londonClose+3600)) {
      Comment("London Sesion");
      ObjectCreate(_Symbol,"londonOpenLine", OBJ_VLINE, 0, londonOpen, 0);
      ObjectCreate(_Symbol,"londonCloseLine", OBJ_VLINE, 0, londonClose, 0);
      ObjectCreate(_Symbol,"londonCloseOpenLine", OBJ_VLINE, 0, londonCloseOpen, 0);
      
      ObjectSetInteger(_Symbol,"londonOpenLine",OBJPROP_COLOR,clrPeru);
      ObjectSetInteger(_Symbol,"londonCloseLine",OBJPROP_COLOR,clrPeru);
   
   }
   
   else if (TimeCurrent() > (newyorkOpen - 3600) && TimeCurrent() < (newyorkClose + 3600)) {
      Comment("New York Sesion");
      ObjectCreate(_Symbol,"newyorkOpenLine", OBJ_VLINE, 0, newyorkOpen, 0);
      ObjectCreate(_Symbol,"newyorkCloseLine", OBJ_VLINE, 0, newyorkClose, 0);
      ObjectCreate(_Symbol,"newyorkKillzoneLine", OBJ_VLINE, 0, newyorkKillzone, 0);
      
      
      ObjectSetInteger(_Symbol,"newyorkOpenLine",OBJPROP_COLOR,clrSpringGreen);
      ObjectSetInteger(_Symbol,"newyorkCloseLine",OBJPROP_COLOR,clrSpringGreen);
   
   }
   
   else {
      Comment("No Major Market is Currently Open");
   }
   
   
   
}