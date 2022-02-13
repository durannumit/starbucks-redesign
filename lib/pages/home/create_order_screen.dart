import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:starbucks_redesign/constants/colors.dart';
import 'package:starbucks_redesign/utils/widgets/text_form_field.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CreateOrderScreen extends StatefulWidget {
  const CreateOrderScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends State<CreateOrderScreen> {
  TextEditingController timePickerController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  TimeOfDay selectedTime = TimeOfDay.now();

  List categoryList = ['Çok Satanlar', 'Yiyecek', 'Yeniler', 'Kahveler'];

  bool isSelected = false;
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _takeAway(),
        _menu(),
      ],
    );
  }

  Widget _takeAway() {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Container(
        height: 235,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 24.0, top: 12.0),
                child: Text(
                  "Gel Al Seçimi",
                  style: TextStyle(color: AppColors.dark, fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
              child: Container(
                padding: const EdgeInsets.only(top: 5.0, right: 12.0, bottom: 5.0),

                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: AppColors.buttonGrey, // set border color
                        width: 2.0), // set border width
                    borderRadius: const BorderRadius.all(Radius.circular(10.0))), // set rounded corner radius
                child: TextFormInput(
                  textStyle: const TextStyle(color: AppColors.dark, fontSize: 16, fontWeight: FontWeight.w500),
                  textEditingController: timePickerController,
                  label: "Paketinizi alma zamanı",
                  prefixIcon: const Icon(Icons.access_time),
                  suffixText: "Değiştir",
                  onTapCb: () async {
                    TimeOfDay date;
                    FocusScope.of(context).requestFocus(FocusNode());

                    date = (await showTimePicker(
                      context: context,
                      initialTime: selectedTime,
                      initialEntryMode: TimePickerEntryMode.dial,
                    ))!;
                    timePickerController.text = date.format(context).toString();
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
              child: Container(
                padding: const EdgeInsets.only(top: 5.0, right: 12.0, bottom: 5.0),

                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: AppColors.buttonGrey, // set border color
                        width: 2.0), // set border width
                    borderRadius: const BorderRadius.all(Radius.circular(10.0))), // set rounded corner radius
                child: TextFormInput(
                  textStyle: const TextStyle(color: AppColors.dark, fontSize: 16, fontWeight: FontWeight.w500),
                  textEditingController: addressController,
                  prefixIcon: const Icon(Icons.home),
                  hintText: "Adres",
                  suffixText: "Değiştir",
                  onTapCb: () async {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menu() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        height: 120,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 24.0, top: 12.0),
                child: Text(
                  "Menu",
                  style: TextStyle(color: AppColors.dark, fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 12.0),
              child: Container(
                height: 60,
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: categoryList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.buttonGrey),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(4.0),
                                  ),
                                  color: selectedIndex == index ? AppColors.buttonGrey : null),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                                child: Text(
                                  categoryList[index],
                                  style: const TextStyle(color: AppColors.dark, fontSize: 14, fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ));
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
