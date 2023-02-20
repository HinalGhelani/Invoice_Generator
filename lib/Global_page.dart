

import 'package:flutter/cupertino.dart';

class GlobalVar {
  // Page 1

  static GlobalKey<FormState> page1 = GlobalKey<FormState>();
  static TextEditingController invoiceDt = TextEditingController();
  static TextEditingController dueDate = TextEditingController();
  static TextEditingController inNumber = TextEditingController();
  static TextEditingController currency = TextEditingController();
  static TextEditingController notes = TextEditingController();
  static TextEditingController condition = TextEditingController();
  static String inDate = '',
      dueDt = '',
      num = '',
      curre = '',
      des = '',
      note = '',
      condi = '';

  // Page 2 Customer Details

  static GlobalKey<FormState> customerDetail = GlobalKey<FormState>();
  static TextEditingController cName = TextEditingController();
  static TextEditingController cGSTNo = TextEditingController();
  static TextEditingController cPlace = TextEditingController();
  static TextEditingController cStreet = TextEditingController();
  static TextEditingController cCity = TextEditingController();
  static TextEditingController cState = TextEditingController();
  static TextEditingController cZipCode = TextEditingController();
  static TextEditingController cCountry = TextEditingController();
  static String nameC = '',
      GstC = '',
      placeC = '',
      streetC = '',
      cityC = '',
      stateC = '',
      zipC = '',
      countryC = '';

  // Page 3 Item Details

  static GlobalKey<FormState> itemDetail = GlobalKey<FormState>();
  static TextEditingController iName = TextEditingController();
  static TextEditingController iHSN = TextEditingController();
  static TextEditingController iPrice = TextEditingController();
  static TextEditingController iQun = TextEditingController();
  static TextEditingController iGST = TextEditingController();
  static TextEditingController iCess = TextEditingController();
  static String nameI = '',
      hsnI = '',
      priceI = '',
      qunI = '',
      gstI = '',
      cessI = '';

  // Page 4 Business Details

  static GlobalKey<FormState> businessDetail = GlobalKey<FormState>();
  static TextEditingController bBusiness = TextEditingController();
  static TextEditingController bName = TextEditingController();
  static TextEditingController bGST = TextEditingController();
  static TextEditingController bLocate = TextEditingController();
  static TextEditingController bDate = TextEditingController();
  static TextEditingController bStreet = TextEditingController();
  static TextEditingController bCity = TextEditingController();
  static TextEditingController bState = TextEditingController();
  static TextEditingController bZip = TextEditingController();
  static String businessB = '',
      nameB = '',
      gstB = '',
      locateB = '',
      dateB = '',
      streetB = '',
      cityB = '',
      stateB = '',
      zipB = '';


  static double totalBill = 0;
  static double totalGst = 0;
  static double totalCess = 0;
  static int totalPrice = 0;
  static double cGst = 0;
  static double sGst = 0;
}