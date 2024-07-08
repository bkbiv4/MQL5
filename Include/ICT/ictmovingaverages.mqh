//+------------------------------------------------------------------+
//|                                            ictmovingavergaes.mqh |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
//+------------------------------------------------------------------+
//| defines                                                          |
//+------------------------------------------------------------------+
// #define MacrosHello   "Hello, world!"
// #define MacrosYear    2010
//+------------------------------------------------------------------+
//| DLL imports                                                      |
//+------------------------------------------------------------------+
// #import "user32.dll"
//   int      SendMessageA(int hWnd,int Msg,int wParam,int lParam);
// #import "my_expert.dll"
//   int      ExpertRecalculate(int wParam,int lParam);
// #import
//+------------------------------------------------------------------+
//| EX5 imports                                                      |
//+------------------------------------------------------------------+
// #import "stdlib.ex5"
//   string ErrorDescription(int error_code);
// #import
//+------------------------------------------------------------------+
void drawICTMovingAverages() {

     
    
     //create an array for several prices
   double myMovingAverageArray1[], myMovingAverageArray2[];
   
   //define the properties of  MAs - simple MA, 1st 24 / 2nd 50
   int movingAverage1 = iMA(_Symbol, _Period, 10, 0, MODE_EMA, PRICE_CLOSE);
   int movingAverage2 = iMA(_Symbol, _Period, 20, 0, MODE_EMA, PRICE_CLOSE);
   
   //sort the price arrays 1, 2 from current candle
   //ArraySetAsSeries(myMovingAverageArray1,true);
   
   ChartIndicatorAdd(0, 0, movingAverage1);
   ChartIndicatorAdd(0, 0, movingAverage2);
   
   //ArraySetAsSeries(myMovingAverageArray2,true);
   
}