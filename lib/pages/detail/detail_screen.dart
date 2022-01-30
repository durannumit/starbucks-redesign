import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:starbucks_redesign/constants/colors.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int amount = 0;
  int selectedCupSizeIndex = -1;
  List cupSizeList = [
    {
      'name': 'T',
      'price': 10.50,
      'scaleRatio': 3.0,
    },
    {
      'name': 'G',
      'price': 12.25,
      'scaleRatio': 2.5,
    },
    {
      'name': 'V',
      'price': 17.75,
      'scaleRatio': 2.0,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
        ),
        flexibleSpace: Container(),
        title: Text(
          "Ürün Detayı",
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            'assets/images/coffee1.png',
            scale: 1.2,
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Toffee Nut Frappucino',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Toffee nut syrup is blended with ice and milk, then topped with whipped cream and a delicious tofee nut flavoured topping.',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .3,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  35,
                ),
                topRight: Radius.circular(
                  35,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0.0, 2.0), //(x,y)
                  blurRadius: 2.5,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '${selectedCupSizeIndex == -1 ? 0.0 : (cupSizeList[selectedCupSizeIndex]['price'] * amount).toString().padRight(5, '0').replaceFirst('.', ',')} TL',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildInputAmountWidget(context),
                      _buildCupSizeWidget(context),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
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
                            'Satın Al',
                            style: Theme.of(context).textTheme.button,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildInputAmountWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      width: MediaQuery.of(context).size.width * .45,
      height: MediaQuery.of(context).size.height * .045,
      decoration: BoxDecoration(
        color: AppColors.buttonGrey,
        borderRadius: BorderRadius.circular(
          5,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              if (amount > 0) {
                setState(() {
                  amount -= 1;
                  if (amount == 0) {
                    selectedCupSizeIndex = -1;
                  }
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
    );
  }

  Widget _buildCupSizeWidget(BuildContext context) {
    List<Widget> rowChildren = [];
    for (var item in cupSizeList) {
      var ownIndex = cupSizeList.indexOf(item);
      var sizeWidget = InkWell(
        key: Key('${item['name']}'),
        onTap: () {
          setState(() {
            selectedCupSizeIndex = ownIndex;
            if (amount == 0) {
              amount = 1;
            }
          });
        },
        child: Container(
          height: MediaQuery.of(context).size.height * .045,
          width: MediaQuery.of(context).size.width * .1,
          decoration: BoxDecoration(
            color: selectedCupSizeIndex == ownIndex ? AppColors.mainGreen.withOpacity(.5) : AppColors.buttonGrey,
            borderRadius: BorderRadius.circular(
              5,
            ),
            border: Border.all(
              color: selectedCupSizeIndex == ownIndex ? AppColors.mainGreen : AppColors.buttonGrey,
              width: 2,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 4.0 * (item['scaleRatio'] % 2 == 0 ? 1 : item['scaleRatio']),
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  'assets/icon/cup_icon.svg',
                  height: 55 / item['scaleRatio'],
                  fit: BoxFit.scaleDown,
                ),
              ),
              Positioned(
                top: 5.0 * item['scaleRatio'],
                left: 13,
                child: Text(item['name']),
              ),
            ],
          ),
        ),
      );
      rowChildren.add(sizeWidget);
    }
    return SizedBox(
        width: MediaQuery.of(context).size.width * .4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: rowChildren,
        ));
  }
}
