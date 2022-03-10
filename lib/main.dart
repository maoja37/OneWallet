// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:one_wallet/OnboardingProcess/splash_screen.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('assets/onboarding_card.png'), context);
    return DismissKeyboard(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Gotham',
        ),
        home: SplashScreen()
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
              onPressed: _showSheet,
              child: const Text('Open BottomSheet'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showSheetWithoutList,
              child: const Text('Open StickyBottomSheet'),
            ),
          ],
        ),
      ),
    );
  }

  void _showSheet() {
    showFlexibleBottomSheet<void>(
      minHeight: 0,
      initHeight: 0.5,
      maxHeight: 0.5,
      context: context,
      builder: (context, controller, offset) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          child: ListView(controller: controller, children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 32,
                  ),
                  SvgPicture.asset('assets/Rectangle.svg'),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    'Forgot password',
                    style: TextStyle(
                      fontFamily: 'Gotham',
                      fontWeight: FontWeight.w700,
                      color: Color(0xff0B0B0B),
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Enter email attached to your account',
                    style: TextStyle(
                        color: Color(0xff505780),
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Gotham',
                        fontSize: 14),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        filled: true,
                        labelText: 'Email Address',
                        labelStyle:
                            TextStyle(color: Color(0xffAAA8BD), fontSize: 14),
                        floatingLabelStyle: TextStyle(color: Color(0xff02003D)),
                        fillColor: Color(0xffFAFBFF),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(16))),
                  ),
                  SizedBox(
                    height: 48,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    color: Color(0xff02003D),
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 18),
                    child: Text(
                      'Continue',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        );
      },
    );
  }

  void _showSheetWithoutList() {
    showStickyFlexibleBottomSheet<void>(
      minHeight: 0,
      initHeight: 0.5,
      maxHeight: .8,
      headerHeight: 200,
      context: context,
      decoration: const BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      headerBuilder: (context, offset) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(offset == 0.8 ? 0 : 40),
              topRight: Radius.circular(offset == 0.8 ? 0 : 40),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    'Header',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
              Text(
                'position $offset',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        );
      },
      bodyBuilder: (context, offset) {
        return SliverChildListDelegate(
          _children,
        );
      },
      anchors: [.2, 0.5, .8],
    );
  }
}

class _BottomSheet extends StatelessWidget {
  final ScrollController scrollController;
  final double bottomSheetOffset;

  const _BottomSheet({
    required this.scrollController,
    required this.bottomSheetOffset,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            controller: scrollController,
            children: [
              Text(
                'position $bottomSheetOffset',
                style: Theme.of(context).textTheme.headline6,
              ),
              Column(
                children: _children,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> _children = [
  const _TextField(),
  const _TestContainer(color: Color(0xEEFFFF00)),
  const _TextField(),
  const _TestContainer(color: Color(0xDD99FF00)),
  const _TextField(),
  const _TestContainer(color: Color(0xCC00FFFF)),
  const _TextField(),
  const _TestContainer(color: Color(0xBB555555)),
  const _TextField(),
  const _TestContainer(color: Color(0xAAFF5555)),
  const _TextField(),
  const _TestContainer(color: Color(0x9900FF00)),
  const _TextField(),
  const _TestContainer(color: Color(0x8800FF00)),
  const _TextField(),
  const _TestContainer(color: Color(0x7700FF00)),
  const _TextField(),
];

class _TextField extends StatelessWidget {
  const _TextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Enter a search term',
      ),
    );
  }
}

class _TestContainer extends StatelessWidget {
  final Color color;

  const _TestContainer({
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        color: color,
      ),
    );
  }
}

class DismissKeyboard extends StatelessWidget {
  final Widget child;
  const DismissKeyboard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: child,
    );
  }
}
