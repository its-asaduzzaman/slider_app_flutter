import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slider_app_flutter/cubit/app_cubits.dart';
import 'package:slider_app_flutter/misc/colors.dart';
import 'package:slider_app_flutter/widgets/app_large_text.dart';
import 'package:slider_app_flutter/widgets/app_text.dart';
import 'package:slider_app_flutter/widgets/repossive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = ['welcome-one.png', 'welcome-two.png', 'welcome-three.png'];
  List placeTexts = ['Mountain', 'Sea Beach', 'Forest'];
  List quotes = [
    'The way up to the top of the mountain is always longer than you think. Don’t fool yourself, the moment will arrive when what seemed so near is still very far.',
    'Beach Rules: Soak up the sun. Ride the waves. Breathe the salty air. Feel the breeze. Build sandcastles. Rest, relax, reflect. Collect seashells. Bare-feet required.',
    'In some mysterious way woods have never seemed to me to be static things. In physical terms, I move through them; yet in metaphysical ones, they seem to move through me.'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("img/" + images[index]),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AppLargeText(text: 'Trips'),
                        AppText(
                          text: placeTexts[index],
                          size: 30.0,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          width: 250,
                          child: AppText(
                            text: quotes[index],
                            color: AppColors.textColor2,
                            size: 14.0,
                          ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context).getData();
                          },
                          child: Container(
                            width: 200,
                            child: Row(children: [
                              ResponsiveButtons(
                                width: 120.0,
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexDots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2.0),
                          width: 8.0,
                          height: index == indexDots ? 25.0 : 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == indexDots
                                ? AppColors.mainColor
                                : AppColors.mainColor.withOpacity(0.3),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
