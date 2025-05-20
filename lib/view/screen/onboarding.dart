<<<<<<< HEAD
import 'package:flutter/cupertino.dart';
=======
>>>>>>> 1232d01 (CompleteForm)
import 'package:flutter/material.dart';


<<<<<<< HEAD
import '../../controller/constant/color.dart';

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                  itemCount: onboardinglist.length,
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
                        Container(
                          height: 20,
                        ),
                        Text(
                          onboardinglist[i].text!,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          height: 20,
                        ),
                        Image.asset(
                          onboardinglist[i].image!,
                          height: 300,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                        Container(
                          height: 20,
                        )
                      ],
                    );
                  }),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          onboardinglist.length,
                          (index) => AnimatedContainer(
                            duration: Duration(milliseconds: 900),
                            margin: EdgeInsets.only(right: 5),
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                                color: AppColor.blue,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      child: Container(
                        height: 20,
                      ),
                    ),
                    MaterialButton(
                        onPressed: () {},
                        child: Text("Continu..."),
                        color: AppColor.blue,
                        textColor: AppColor.white)
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
=======
class Onboarding extends StatelessWidget  {
  @override
  Widget build (BuildContext context)=>
  Scaffold(

  );
}
>>>>>>> 1232d01 (CompleteForm)
