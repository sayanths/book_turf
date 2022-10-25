import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/controller/time_booking.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';

class AfterNoonTiming extends StatelessWidget {
  const AfterNoonTiming({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final timeBookingAfterNoon = Get.put(TimeBooking());
    return Wrap(
        direction: Axis.horizontal,
        children: List.generate(
            timeBookingAfterNoon.timeBookedListafterNoon.length, (index) {
          return InkWell(
            onTap: () {
              timeBookingAfterNoon.onSelectTimingAfterNoon(
                  index,
                  timeBookingAfterNoon.timeBookedListafterNoon[index]
                      .toString());
            },
            child: GetBuilder<TimeBooking>(builder: (obj) {
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: obj.afterNoonBookedTiming
                          .contains(obj.timeBookedListafterNoon[index])
                      ? black
                      : white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: grey),
                ),
                padding: const EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    obj.timeBookedListafterNoon[index].toString(),
                    style: const TextStyle(color: Colors.green),
                  ),
                ),
              );
            }),
          );
        }));
  }
}
