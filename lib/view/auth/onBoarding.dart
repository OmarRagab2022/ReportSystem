import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gp/theme/constraints.dart';
import 'package:gp/view/auth/login.dart';
import 'package:gp/shared/shared.networks/shared.network.local/cache_helper.dart';
import 'package:gp/shared/shared.styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:gp/shared/shared.styles/theme.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String body;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  void submit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      value = true;
      if (value) {
        navigateTo(context, LoginScreen());
      }
    });
  }

  var boardController = PageController();
  bool isLast = false;

  List<OnBoardingModel> boarding = [
    OnBoardingModel(
        image: 'assets/images/welcome1.png',
        title: 'Welcome To Your Application',
        body: 'At the Time you Get an Account in the Application '
            'you can complain about your problem with your description any time easily ,and faster than your expect ,'),
    OnBoardingModel(
      image: 'assets/images/welcome2.png',
      title: 'Add Your problem ',
      body:
          'By joining in the Application You are allowed to tell us about Your problem '
          'that is interrupted you in this moment by defining it carefully..',
    ),
    OnBoardingModel(
      image: 'assets/images/welcome3.png',
      title: 'Check Your Received Tickets ',
      body:
          'Well Now our turn , be patient and wait our Replay to you with all information '
          'about your ticket that you are complain for. with all Info that interests you ',
    ),
  ];
  Widget defaultTextButton(
    context, {
    required Function function,
    required String text,
  }) =>
      (TextButton(
        onPressed: () {
          function();
        },
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.4,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
        ),
        actions: [
          defaultTextButton(context, function: submit, text: 'SKIP'),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            Column(
              children: [
                SmoothPageIndicator(
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: Colors.deepOrange,
                      dotWidth: 10,
                      dotHeight: 10,
                      expansionFactor: 2,
                      spacing: 5,
                    ),
                    controller: boardController,
                    count: boarding.length),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: 330,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.mainColor,
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        if (isLast) {
                          submit();
                        } else {
                          boardController.nextPage(
                              duration: Duration(
                                milliseconds: 750,
                              ),
                              curve: Curves.fastLinearToSlowEaseIn);
                        }
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildBoardingItem(OnBoardingModel model) => Column(
      children: [
        Text('Lets get Started',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange,
              //fontWeight: Font
            )),
        SizedBox(
          height: 20,
        ),
        Image(
          image: AssetImage('${model.image}'),
        ),
        SizedBox(
          height: 25,
        ),
        Text('${model.title}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              //fontWeight: Font
            )),
        SizedBox(
          height: 25,
        ),
        Text('${model.body}',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              //fontWeight: Font
            )),
      ],
    );
