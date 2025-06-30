import 'package:shopnest/Common/bottom_bar.dart';
import 'package:shopnest/features/address/screens/address_screen.dart';
import 'package:shopnest/features/admin/screens/add_product_screen.dart';
import 'package:shopnest/features/auth/screens/auth_screen.dart';
import 'package:shopnest/features/home/screens/home_screen.dart';
import 'package:shopnest/features/order_details/screens/order_details_screen.dart';
import 'package:shopnest/features/product_details/screens/product_details_screen.dart';
import 'package:shopnest/features/search/screens/search_screen.dart';
import 'package:shopnest/models/order.dart';
import 'package:shopnest/models/product.dart';
import 'features/home/screens/category_deals.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AuthScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const HomeScreen());
    case BottomBar.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const BottomBar());
    case AddProductScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AddProductScreen());
    case CategoryDeals.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => CategoryDeals(category: category  ));
    case SearchScreen.routeName:
    var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => SearchScreen(searchQuery: searchQuery));
    case ProductDetailScreen.routeName:
    var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => ProductDetailScreen(product: product));
    case AddressScreen.routeName:
    var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => AddressScreen(totalAmount: totalAmount,));
    case OrderDetailScreen.routeName:
    var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => OrderDetailScreen(order: order));
    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text("No route exists"),
                ),
              ));
  }
}
