import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:starbucks_redesign/constants/colors.dart';
import 'package:starbucks_redesign/utils/device/device_utils.dart';
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
      children: [
        _starbucksCard(),
        _freeCoffeeBar(),
      ],
    );
  }

  Widget _starbucksCard() {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/green_starbucks_card.svg',
          alignment: Alignment.center,
        ),
        Positioned(
          left: 50,
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
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(
              child: SfRadialGauge(axes: <RadialAxis>[
            RadialAxis(
                showLabels: false,
                showTicks: false,
                canScaleToFit: true,
                radiusFactor: 0.9,
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
                    value: 4,
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
                      positionFactor: 0,
                      widget: Stack(
                        alignment: Alignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/images/coffee_cup.svg',
                                alignment: Alignment.center,
                              ),
                              Text(
                                'FIFTEEN DAYS SCORE',
                                style: TextStyle(color: Colors.grey[400], fontFamily: 'UbuntuMedium'),
                              )
                            ],
                          )
                        ],
                      ))
                ]),
          ])),
        )
      ],
    );
  }
}
