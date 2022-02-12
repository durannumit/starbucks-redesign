import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:starbucks_redesign/constants/colors.dart';

class OrderCompletedScreen extends StatelessWidget {
  const OrderCompletedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(
        elevation: 20,
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  AppColors.mainGreen,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    side: const BorderSide(color: AppColors.mainGreen),
                  ),
                ),
              ),
              onPressed: () {},
              child: Center(
                child: Text(
                  'Kapat',
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        titleSpacing: 0,
        leadingWidth: 18,
        title: Text(
          "Sipariş Tamamlandı",
          style: Theme.of(context).textTheme.headline2,
        ),
        actions: [
          SvgPicture.asset(
            'assets/icon/notification_bell_icon.svg',
          ),
          const SizedBox(width: 10),
          SvgPicture.asset(
            'assets/icon/three_dots_icon.svg',
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: AppColors.background,
              height: MediaQuery.of(context).size.height * .4,
              width: double.infinity,
              child: Column(
                children: [
                  Image.asset('assets/images/Success.png'),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Bizden sipariş verdiğiniz için\nteşekkürler!',
                    style: Theme.of(context).textTheme.headline2,
                    textAlign: TextAlign.center,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .4,
              color: Colors.white,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.buttonGrey,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Tebrikler',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              Container(
                                height: 30,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: AppColors.buttonGrey,
                                  ),
                                  color: AppColors.darkGreen,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      '+ 2',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    SvgPicture.asset(
                                      'assets/icon/u_star.svg',
                                      color: AppColors.gold,
                                      height: 22,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/coffee1.png',
                              scale: 4,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Bizden 2 puan kazandın',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Hazelnut Coffee',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: MediaQuery.of(context).size.height * .12,
                    width: MediaQuery.of(context).size.width * .9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.buttonGrey,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Best sellers to best sellers increased'),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 120,
                                  height: 7,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.softGrey,
                                  ),
                                ),
                                Container(
                                  width: 25,
                                  height: 7,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.darkGreen,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 20),
                            SvgPicture.asset(
                              'assets/icon/u_star.svg',
                              color: AppColors.darkGreen,
                              height: 25,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              '7 / 10',
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.darkGreen,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
