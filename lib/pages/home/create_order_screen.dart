import 'package:flutter/material.dart';
import 'package:starbucks_redesign/constants/colors.dart';
import 'package:starbucks_redesign/utils/widgets/text_form_field.dart';

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
  List<bool> showQty = [];

  bool isSelected = false;
  int selectedIndex = 0;
  int amount = 0;
  String dropdownValue = 'Tall';

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < categoryList.length; i++) {
      showQty.add(false);
    }
  }

  void showHide(int i) {
    setState(() {
      showQty[i] = !showQty[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _takeAway(),
        _menu(),
        _coffeeList(),
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
              child: SizedBox(
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

  Widget _buildInputAmountWidget(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: AppColors.buttonGrey,
        borderRadius: BorderRadius.circular(
          5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                if (amount > 0) {
                  setState(() {
                    amount -= 1;
                  });
                }
              },
              child: const Icon(
                Icons.remove,
                color: AppColors.darkGrey,
              ),
            ),
            Text(
              '$amount',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            InkWell(
              highlightColor: Colors.red,
              onTap: () {
                setState(() {
                  amount += 1;
                });
              },
              child: const Icon(
                Icons.add,
                color: AppColors.darkGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dropdown() {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: AppColors.buttonGrey,
        borderRadius: BorderRadius.circular(
          5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.keyboard_arrow_down),
          isExpanded: true,
          style: const TextStyle(color: AppColors.darkGrey, fontSize: 14, fontWeight: FontWeight.w600),
          underline: Container(
            height: 0,
          ),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>['Tall', 'Grande', 'Venti'].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _coffeeList() {
    return Container(
      height: 120 * categoryList.length.toDouble(),
      color: Colors.white,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8),
          itemCount: categoryList.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 110,
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'assets/images/coffee1.png',
                        height: 100.0,
                        width: 100.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: !showQty[index] ? MainAxisAlignment.center : MainAxisAlignment.end,
                          children: [
                            const Text(
                              "Hazelnut Coffee",
                              style: TextStyle(color: AppColors.dark, fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                            const Text(
                              "20 TL",
                              style: TextStyle(color: AppColors.dark, fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            showQty[index]
                                ? Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 12.0, right: 24.0),
                                      child: Row(
                                        children: [
                                          Expanded(child: _buildInputAmountWidget(context)),
                                          Container(
                                            width: 8,
                                          ),
                                          Expanded(child: _dropdown()),
                                        ],
                                      ),
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                      !showQty[index]
                          ? Align(
                              alignment: Alignment.bottomRight,
                              child: SizedBox(
                                height: 30,
                                width: 70,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainGreen),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4.0),
                                        side: const BorderSide(color: AppColors.mainGreen),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    showHide(index);
                                  },
                                  child: const Center(
                                      child: Text(
                                    'Ekle',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
                                  )),
                                ),
                              ),
                            )
                          : Align(
                              alignment: Alignment.bottomRight,
                              child: InkWell(
                                onTap: () {
                                  showHide(index);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                    color: AppColors.mainGreen,
                                  ),
                                  child: Icon(Icons.done, color: Colors.white, size: 22),
                                ),
                              ),
                            )
                    ],
                  )),
            );
          }),
    );
  }
}
