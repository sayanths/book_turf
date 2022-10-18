import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';

class BookController extends GetxController {
  //DatePickerController datePickerController = DatePickerController();
  int selected = 0;
  late Razorpay _razorpay;
  @override
  void onInit() {
    super.onInit();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSucess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSucess() {
    Get.snackbar('payement Sucessfull', '');
  }

  _handlePaymentError() {
    Get.snackbar("Payment Failed", '');
  }

  _handleExternalWallet() {
    Get.snackbar('external  wallet', '');
  }

  Widget customRadio(String mainTile, String text, int index) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            mainTile,
            style: const TextStyle(
                color: Color.fromARGB(255, 0, 89, 162),
                fontWeight: FontWeight.w500,
                fontSize: 15),
          ),
        ),
        OutlinedButton(
          onPressed: () {
            selected = index;
            update();
          },
          child: Row(
            children: [
              const Text(
                '₹',
                style: TextStyle(
                    color: Color.fromARGB(255, 2, 112, 33),
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
              Text(
                text,
                style: TextStyle(
                    color: (selected == index)
                        ? const Color.fromARGB(255, 3, 201, 10)
                        : const Color.fromARGB(255, 148, 147, 147),
                    fontSize: 20),
              ),
            ],
          ),
        ),
      ],
    );
  }

  option() {
    var options = {
      "key": "rzp_test_g9wjrkJkmYw27N",
      // "amount": num.parse(_amountController.text) * 100,
      "name": "new project",
      "description": "payment for our work",
      "prefill": {"contact": "7055451245", "email": "mveli620@gmail.com"},
      "external": {
        "wallets": ["paytm"]
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  datePicking() {
    DatePicker(DateTime.now(),
        initialSelectedDate: DateTime.now(),
        selectionColor: const Color.fromARGB(255, 11, 94, 2),
        selectedTextColor: Colors.white, onDateChange: (date) {
     // bottomSheetWidget();
      update();
    });
  }

  bottomSheetWidget() {
    BottomSheet(
      onClosing: () {},
      builder: (context) {
        return const SizedBox();
      },
    );
  }
}
