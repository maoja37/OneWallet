//  prefer_const_literals_to_create_immutables
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_wallet/AddCardSection/add_card_screen.dart';
import 'package:one_wallet/database/database.dart';
import 'package:one_wallet/widgets/bank_list_widget.dart';
import 'package:one_wallet/widgets/no_card_available_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
//import animated text kit package
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dough/dough.dart';

class MyCards extends StatefulWidget {
  const MyCards({Key? key}) : super(key: key);

  @override
  State<MyCards> createState() => _MyCardsState();
}

class _MyCardsState extends State<MyCards> {
  //this is just used to get firebaseuser, it can return a value or null
  final currentUser = FirebaseAuth.instance.currentUser;

//i created this string so i dont have to be typing it everytime i want to style a text
  String sfpro = 'SF-Pro';

  // this is used to get database from drift a.k.a moor
  late AppDatabase database;
  @override
  Widget build(BuildContext context) {
    //gets the database from the provider
    database = Provider.of<AppDatabase>(context);
    return Scaffold(
      backgroundColor:const  Color(0xffFAFAFA),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 76),
              SvgPicture.asset(
                'assets/onboarding_screen_svg_black.svg',
                width: 154,
                height: 34,
              ),
              const SizedBox(height: 40),
              //this is the widget that shows the man holding the cofee and name of the user
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding:const  EdgeInsets.only(
                      left: 24,
                      top: 36,
                    ),
                    width: double.infinity,
                    height: 148,
                    decoration: BoxDecoration(
                      color: const Color(0xff02003D),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            AnimatedTextKit(
                              totalRepeatCount: 2,
                              animatedTexts: [
                              WavyAnimatedText('Hi ',
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontFamily: sfpro,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ]),
                            AnimatedTextKit(
                              totalRepeatCount: 2,
                              animatedTexts: [
                              WavyAnimatedText(
                                currentUser != null
                                    ? currentUser!.displayName!
                                    : 'User',
                                    textStyle: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                      
                              ),
                            ])
                          ],
                        ),
                        
                        const SizedBox(height: 4),
                        Text(
                          'Welcome back',
                          style: TextStyle(
                            color: const Color(0xffAAA8BD),
                            fontFamily: sfpro,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                       const  SizedBox(height: 16),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: const AddCardScreen(),
                                    type: PageTransitionType.bottomToTop,
                                    duration: const Duration(milliseconds: 500)));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 28, vertical: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xffFFFFFF).withOpacity(.24),
                            ),
                            child: Text('Add Card',
                                style: TextStyle(
                                  color: const Color(0xffFFFFFF),
                                  fontFamily: sfpro,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: -40,
                      child: Image.asset(
                        'assets/man_holding_cup.png',
                        width: 264,
                        height: 211,
                      ))
                ],
              ),
              const SizedBox(
                height: 48
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My cards',
                    style: TextStyle(
                        fontFamily: sfpro,
                        fontSize: 16,
                        color: const Color(0xff505780),
                        fontWeight: FontWeight.w400),
                  ),
                  Text('',
                      style: TextStyle(
                          fontFamily: sfpro,
                          fontSize: 14,
                          color: const Color(0xff5F00F8),
                          fontWeight: FontWeight.w400))
                ],
              ),

              //this streambuilder is used to check the list of card data in the database and update the widgets in real time
              StreamBuilder<List<CardData>>(
                stream: _watchCards(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.connectionState ==
                          ConnectionState.active ||
                      snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return const Center(child:  Text('There was an error'));
                    } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      return BankListWidget(cardList: snapshot.data!);
                    } else {
                      return const NoCardWidget();
                    }
                  } else {
                    return Text('State: ${snapshot.connectionState}');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stream<List<CardData>> _watchCards() {
    return database.watchEntriesInCard();
  }
}
