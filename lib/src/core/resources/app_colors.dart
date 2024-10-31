part of 'resources.dart';

class AppColors {
  static const Color static = Color.fromRGBO(255, 255, 255, 1);

  static const Color staticGrey = Color(0xffE3E7FA);
  
  static const Color background = Color.fromRGBO(0, 0, 2, 1);

  static const Color kWhite2 = Color(0xFFF8F8F8);

  static const Color mainColor = Color.fromRGBO(230, 64, 37, 1);

  static const Color mainGrey = Color.fromRGBO(255, 255, 255, 0.5);

  static const Color grey8 = Color(0xFFFAFAFA);

  static const Color greyStroke = Color(0xFFECECEC);

  static const Color dark = Color(0xFF433C36);

  static const Color red = Color(0xFFFF2B54);

  static const Color red2 = Color(0xFFFF4747);

  static const Color red100 = Color(0xFFFFDFE5);

  static const Color red300 = Color(0xFFFFAABB);

  static const Color red700 = Color(0xFFE70E38);

  static const Color red900 = Color(0xFFC10025);

  static const Color orange100 = Color(0xFFFDE7CC);

  static const Color orange300 = Color(0xFFFACF99);

  static const Color orange = Color(0xFFF8951D);

  static const Color orange2 = Color(0xFFFFE6D1);

  static const Color orange3 = Color(0xFFF2843F);

  static const Color orange700 = Color(0xFFDD7A00);

  static const Color orange900 = Color(0xFFBA6700);

  static const Color yellow100 = Color(0xFFFEF4D7);

  static const Color yellow300 = Color(0xFFFDE8AE);

  static const Color yellow = Color(0xFFFBC635);

  static const Color yellow700 = Color(0xFFE8B220);

  static const Color yellow900 = Color(0xFFD09D10);

  static const Color orange4 = Color(0xFFE07547);

  static const Color base50 = Color(0xFFFFFFFF);

  static const Color base100 = Color(0xFFF6F6F6);

  static const Color base200 = Color(0xFFEDEDED);

  static const Color base300 = Color(0xFFD7D7D7);

  static const Color base400 = Color(0xFFB0B0B0);

  static const Color base500 = Color(0xFF959595);

  static const Color base700 = Color(0xFF808080);

  static const Color base800 = Color(0xFF333333);

  static const Color base900 = Color(0xFF000000);

  static const Color blue = Color(0xFF006FFD);

  static const Color blue2 = Color(0xFF4762FF);

  static const Color purple = Color(0xFF8958F7);

  static const Color kGrey1 = Color(0xFF4D4A4A);

  static const Color grey1 = Color(0xFF949494);

  static const Color grey2 = Color(0xFFE2E0E0);

  static const Color grey3 = Color(0xFFE0E0E0);

  static const Color grey4 = Color(0xFF8D8989);

  static const Color grey5 = Color(0xFFFBFBFB);

  static const Color grey6 = Color(0xFFF8F8F8);

  static const Color grey7 = Color(0xFFCCC9C9);

  static const Color baseBase700 = Color(0xFF171717);

  static const Color green = Color(0xFF04AD33);

  static const Color green2 = Color(0xFF00B393);

  static const Color green3 = Color(0xFF25A92B);

  static const Color brown = Color(0xFF703C25);

  static const Color pomodoro = Color(0xFFEE2C36);

  static const Color error = Color(0xFFE30011);

  static const Color greyBorder = Color(0xFFD2D2D2);

  static const Color greyText = Color(0xFF656464);

  AppColors._();
}

///
///
///
///
///

class AppDarkColors {
  static const Color static = Color(0xFF000000);

  static const Color mainColor = Color.fromRGBO(69, 99, 255, 1);

  static const Color mainGrey = Color.fromRGBO(230, 233, 235, 1);

  static const Color red = Color(0xFFFF2B54);

  static const Color red100 = Color(0xFFFFDFE5);

  static const Color red300 = Color(0xFFFFAABB);

  static const Color red700 = Color(0xFFE70E38);

  static const Color red900 = Color(0xFFC10025);

  static const Color orange100 = Color(0xFFFDE7CC);

  static const Color orange300 = Color(0xFFFACF99);

  static const Color orange = Color(0xFFF8951D);

  static const Color orange700 = Color(0xFFDD7A00);

  static const Color orange900 = Color(0xFFBA6700);

  static const Color base50 = Color(0xFF1C1C1C);

  static const Color base100 = Color(0xFF0C0C0C);

  static const Color base200 = Color(0xFF333333);

  static const Color base300 = Color(0xFF3A3A3C);

  static const Color base400 = Color(0xFF808080);

  static const Color base500 = Color(0xFFC7C7CC);

  static const Color base700 = Color(0xFFD7D7D7);

  static const Color base800 = Color(0xFFF2F2F7);

  static const Color base900 = Color(0xFFFFFFFF);

  AppDarkColors._();
}

///
///
///
///
///

extension ThemeColorX on ThemeData {
  Color get redColor => AppDarkColors.red;

  Color get red100 => AppDarkColors.red100;

  Color get mainColor => AppDarkColors.mainColor;

  Color get textHeaderColor => brightness == Brightness.light
      ? AppColors.baseBase700
      : AppDarkColors.base900;

  Color get base900 => brightness == Brightness.light
      ? AppColors.base900
      : AppDarkColors.base900;

  Color get textParagraphColor => brightness == Brightness.light
      ? AppColors.base700
      : AppDarkColors.base700;

  Color get background => brightness == Brightness.light
      ? AppColors.base100
      : AppDarkColors.base100;

  Color get background50 =>
      brightness == Brightness.light ? AppColors.base50 : AppDarkColors.base50;

  Color get base200 => brightness == Brightness.light
      ? AppColors.base200
      : AppDarkColors.base200;

  Color get base300 => brightness == Brightness.light
      ? AppColors.base300
      : AppDarkColors.base300;

  Color get base400 => brightness == Brightness.light
      ? AppColors.base400
      : AppDarkColors.base400;

  Color get base500 => brightness == Brightness.light
      ? AppColors.base500
      : AppDarkColors.base500;

  Color get base700 => brightness == Brightness.light
      ? AppColors.base700
      : AppDarkColors.base700;

  Color get base800 => AppDarkColors.base800;

  Color get baseDay100Night200 => brightness == Brightness.light
      ? AppColors.base100
      : AppDarkColors.base200;

  Color get barrierColor => brightness == Brightness.light
      ? const Color.fromRGBO(0, 0, 0, 0.5)
      : const Color.fromARGB(153, 239, 239, 239);

  Color get buttonBackgroundGrey => AppColors.grey1;
}

///
///
///
///
///
final Map<int, Color> primaryColorMap = {
  50: const Color.fromRGBO(177, 249, 163, .1),
  200: const Color.fromRGBO(177, 249, 163, .3),
  300: const Color.fromRGBO(177, 249, 163, .4),
  400: const Color.fromRGBO(177, 249, 163, .5),
  100: const Color.fromRGBO(177, 249, 163, .2),
  500: const Color.fromRGBO(177, 249, 163, .6),
  600: const Color.fromRGBO(177, 249, 163, .7),
  700: const Color.fromRGBO(177, 249, 163, .8),
  800: const Color.fromRGBO(177, 249, 163, .9),
  900: const Color.fromRGBO(177, 249, 163, 1),
};


/*
В конструкторе Color первые два символа означают opacity, ниже приведены hex для всех возможных значений.

100% — FF
99% — FC
98% — FA
97% — F7
96% — F5
95% — F2
94% — F0
93% — ED
92% — EB
91% — E8
90% — E6
89% — E3
88% — E0
87% — DE
86% — DB
85% — D9
84% — D6
83% — D4
82% — D1
81% — CF
80% — CC
79% — C9
78% — C7
77% — C4
76% — C2
75% — BF
74% — BD
73% — BA
72% — B8
71% — B5
70% — B3
69% — B0
68% — AD
67% — AB
66% — A8
65% — A6
64% — A3
63% — A1
62% — 9E
61% — 9C
60% — 99
59% — 96
58% — 94
57% — 91
56% — 8F
55% — 8C
54% — 8A
53% — 87
52% — 85
51% — 82
50% — 80
49% — 7D
48% — 7A
47% — 78
46% — 75
45% — 73
44% — 70
43% — 6E
42% — 6B
41% — 69
40% — 66
39% — 63
38% — 61
37% — 5E
36% — 5C
35% — 59
34% — 57
33% — 54
32% — 52
31% — 4F
30% — 4D
29% — 4A
28% — 47
27% — 45
26% — 42
25% — 40
24% — 3D
23% — 3B
22% — 38
21% — 36
20% — 33
19% — 30
18% — 2E
17% — 2B
16% — 29
15% — 26
14% — 24
13% — 21
12% — 1F
11% — 1C
10% — 1A
9% — 17
8% — 14
7% — 12
6% — 0F
5% — 0D
4% — 0A
3% — 08
2% — 05
1% — 03
0% — 00
*/
