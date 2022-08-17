import 'package:ecommerce_b6_n/page/category_page.dart';
import 'package:ecommerce_b6_n/page/dashboard_page.dart';
import 'package:ecommerce_b6_n/page/login_page.dart';
import 'package:ecommerce_b6_n/page/order_page.dart';
import 'package:ecommerce_b6_n/page/product_details_page.dart';
import 'package:ecommerce_b6_n/page/user_page.dart';
import 'package:ecommerce_b6_n/providers/product_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'page/launcher_page.dart';
import 'page/new_product_page.dart';
import 'page/product_page.dart';
import 'page/report_page.dart';
import 'page/settings_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'providers/order_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ProductProvider()),
      ChangeNotifierProvider(create: (_) => OrderProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: EasyLoading.init(),
      initialRoute: LauncherPage.routeName,
      routes: {
        DashboardPage.routeName: (_) => const DashboardPage(),
        LauncherPage.routeName: (_) => const LauncherPage(),
        LoginPage.routeName: (_) => const LoginPage(),
        ProductPage.routeName: (_) => const ProductPage(),
        NewProductPage.routeName: (_) => const NewProductPage(),
        ProductDetailsPage.routeName: (_) => ProductDetailsPage(),
        CategoryPage.routeName: (_) => const CategoryPage(),
        OrderPage.routeName: (_) => const OrderPage(),
        UserPage.routeName: (_) => const UserPage(),
        SettingsPage.routeName: (_) => const SettingsPage(),
        ReportPage.routeName: (_) => const ReportPage(),
      },
    );
  }
}
