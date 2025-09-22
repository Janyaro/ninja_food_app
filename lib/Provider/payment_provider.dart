import 'package:flutter/material.dart';

class PaymentProvider extends ChangeNotifier{
  String _paymentMethod = 'paypal';
  String get paymentMethod => _paymentMethod;

  void setPaymentMethod (String method){
    _paymentMethod = method;
    notifyListeners();
  }
}