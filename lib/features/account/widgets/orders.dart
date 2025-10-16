import 'package:shopnest/Common/loader.dart';
import 'package:shopnest/constants/global_variables.dart';
import 'package:shopnest/features/account/services/account_services.dart';
import 'package:shopnest/features/account/widgets/single_product.dart';
import 'package:flutter/material.dart';
import 'package:shopnest/features/order_details/screens/order_details_screen.dart';
import 'package:shopnest/models/order.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  AccountServices accountServices = AccountServices();
  List<Order>? orders;

  @override
  void initState() {
    super.initState();
    fetchMyOrder();
  }

  void fetchMyOrder() async {
    orders = await accountServices.fetchMyOrders(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? const Loader()
        : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Text("Your Orders",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Text(
                      "See All",
                      style:
                          TextStyle(color: GlobalVariables.selectedNavBarColor),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 150,
                padding: EdgeInsets.only(
                  left: 10,
                  top: 10,
                  right: 0,
                ),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: orders!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => {
                          Navigator.pushNamed(
                              context, OrderDetailScreen.routeName,
                              arguments: orders![index])
                        },
                        child: SingleProduct(
                            image: orders![index].products[0].images[0]),
                      );
                    }),
              )
            ],
          );
  }
}
