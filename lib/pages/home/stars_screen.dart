import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:starbucks_redesign/constants/colors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class StarsScreen extends StatefulWidget {
  const StarsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StarsScreenState();
}

class _StarsScreenState extends State<StarsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_starbucksCard(), _freeCoffeeBar(), _detailsButton(), _list()],
    );
  }

  Widget _starbucksCard() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: SvgPicture.asset(
            'assets/images/green_starbucks_card.svg',
          ),
        ),
        Positioned(
          bottom: 24,
          left: 24,
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Toplam Param",
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "55,35 TL",
                      style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                    Container(
                      width: 50,
                    ),
                    const Text(
                      "Yükleme yap",
                      style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _freeCoffeeBar() {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 170,
            width: 170,
            child: SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                    startAngle: 120,
                    endAngle: 60,
                    showLabels: false,
                    showTicks: false,
                    canScaleToFit: true,
                    radiusFactor: 0.7,
                    minimum: 0,
                    maximum: 15,
                    axisLineStyle: AxisLineStyle(
                      thickness: 0.1,
                      color: AppColors.proggressBarDarkGreen.withOpacity(0.5),
                      thicknessUnit: GaugeSizeUnit.factor,
                      cornerStyle: CornerStyle.bothFlat,
                    ),
                    pointers: const <GaugePointer>[
                      RangePointer(
                        value: 6,
                        width: 0.2,
                        sizeUnit: GaugeSizeUnit.factor,
                        enableAnimation: true,
                        animationDuration: 100,
                        color: AppColors.proggressBarDarkGreen,
                        animationType: AnimationType.linear,
                        cornerStyle: CornerStyle.bothFlat,
                        pointerOffset: -0.05,
                      )
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                          widget: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 24.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/coffee_cup.svg',
                                  height: 60,
                                  width: 60,
                                  alignment: Alignment.center,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 6.0),
                                  child: Text(
                                    '6/15',
                                    style: TextStyle(color: AppColors.darkGreen, fontSize: 16, fontWeight: FontWeight.w700),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ))
                    ]),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icon/u_star.svg',
                    height: 30,
                    width: 30,
                    color: AppColors.gold,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '0',
                      style: TextStyle(color: AppColors.dark, fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              const Text(
                'Yıldız bakiyesi',
                style: TextStyle(color: AppColors.dark, fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/icon/u_cup.svg', height: 30, width: 30, color: AppColors.darkGreen),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '0',
                      style: TextStyle(color: AppColors.dark, fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              const Text(
                'İkram içecek',
                style: TextStyle(color: AppColors.dark, fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _detailsButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: SizedBox(
          height: 40,
          width: 90,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(AppColors.buttonGrey),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  side: const BorderSide(color: AppColors.buttonGrey),
                ),
              ),
            ),
            onPressed: () {},
            child: const Center(
                child: Text(
              'Detaylar',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.darkGrey),
            )),
          ),
        ),
      ),
    );
  }

  Widget _list() {
    return Padding(
      padding: const EdgeInsets.only(top: 36.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ), // BorderRadius
        ),
        child: Container(
          height: 300 * 3,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ), // /
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: AppColors.buttonGrey,
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: 6,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 24.0, top: 12.0),
                  child: Text(
                    "Kampanyalar",
                    style: TextStyle(color: AppColors.dark, fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Flexible(
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(8),
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
                              child: Image.asset(
                                'assets/images/campaign.png',
                              ),
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 24.0, top: 12.0),
                                child: Text(
                                  "Lorem Ipsum",
                                  style: TextStyle(color: AppColors.dark, fontSize: 16, fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 24.0, top: 12.0),
                                child: Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet gravida quam aliquam aenean fermentum non accumsan.",
                                  style: TextStyle(color: AppColors.dark, fontSize: 14, fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
