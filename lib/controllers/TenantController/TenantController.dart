import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TenantController extends GetxController {
  // Tenant Details
  String name = '';
  String phone = '';
  String altPhone = '';

  // Stay Details
  String selectedProperty = '';
  String selectedFlat = '';
  DateTime moveInDate = DateTime.now();
  DateTime moveOutDate = DateTime.now();
  String lockInPeriod = '';
  String noticePeriod = '';
  String agreementPeriod = '';

  // Payment Details
  String rentalFrequency = '';
  String addRentOn = '';
  String fixedRentOn = '';
  String securityDeposit = '';

  // Methods to update each field
  void setName(String value) {
    name = value;
    update();
  }

  void setPhone(String value) {
    phone = value;
    update();
  }

  void setAltPhone(String value) {
    altPhone = value;
    update();
  }

  void setProperty(String value) {
    selectedProperty = value;
    update();
  }

  void setRoomFlat(String value) {
    selectedFlat = value;
    update();
  }

  void selectMoveInDate(DateTime date) {
    moveInDate = date;
    update();
  }

  void selectMoveOutDate(DateTime date) {
    moveOutDate = date;
    update();
  }

  void setLockInPeriod(String value) {
    lockInPeriod = value;
    update();
  }

  void setNoticePeriod(String value) {
    noticePeriod = value;
    update();
  }

  void setAgreementPeriod(String value) {
    agreementPeriod = value;
    update();
  }

  void setRentalFrequency(String value) {
    rentalFrequency = value;
    update();
  }

  void setAddRentOn(String value) {
    addRentOn = value;
    update();
  }

  void setFixedRentOn(String value) {
    fixedRentOn = value;
    update();
  }

  void setSecurityDeposit(String value) {
    securityDeposit = value;
    update();
  }

  void addTenant() {
    // Add tenant logic
    print('Tenant added with name: $name');
  }
}
