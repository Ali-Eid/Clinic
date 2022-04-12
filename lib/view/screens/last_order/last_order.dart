import 'package:buildcondition/buildcondition.dart';
import 'package:clinic/applocal.dart';
import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/model/last_order_model.dart';
import 'package:clinic/view/screens/cart/cart_screen.dart';
import 'package:clinic/view/screens/last_order/last_product_order.dart';
import 'package:clinic/view/widgets/fotter.dart';
import 'package:clinic/view/widgets/header_widget.dart';
import 'package:clinic/view/widgets/notification_search_title.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class LastOrderScreen extends StatelessWidget {
  const LastOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(listener: (context, state) {
      // TODO: implement listener
    }, builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: HeaderWidget(),
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Builder(builder: (context) {
              return Padding(
                padding: const EdgeInsets.only(top: 20),
                child: IconButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                ),
              );
            }),
          ),
          body: BuildCondition(
            fallback: (context) => Center(
              child: CircularProgressIndicator(
                color: Color(0Xff054F86),
              ),
            ),
            condition: HomeCubit.get(context).lastOrderModel?.data! != null,
            builder: (context) => Column(
              children: [
                NotificationSearchTitle(
                  text: 'Last Order',
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount:
                        HomeCubit.get(context).lastOrderModel?.data!.length,
                    itemBuilder: (ctxt, index) {
                      return item_last_order(
                        model:
                            HomeCubit.get(context).lastOrderModel?.data![index],
                      );
                    },
                  ),
                ),
                FotterWidget(
                  salla1: true,
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

class item_last_order extends StatelessWidget {
  DataLastOrder? model;
  item_last_order({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              300,
            ),
            border: Border.all(width: 0.3, color: Colors.grey)
            // color: Colors.red,
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.center,
              width: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    300,
                  ),
                  color: Colors.grey.shade300),
              child: TextUtils(
                  text: '${model!.status}',
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            TextUtils(
                text: '${model!.createdAt!.substring(0, 10)}',
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.bold),
            Container(
              padding: EdgeInsets.all(5),
              alignment: Alignment.center,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  300,
                ),
                gradient: LinearGradient(
                  colors: [
                    Color(0Xff054F86),
                    Color(0Xff61C089),
                  ],
                ),
              ),
              child: model!.type == 'buy_products'
                  ? InkWell(
                      onTap: () {
                        print(model!.details!.products!.length);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => LastProductOrder(
                                  title: model!.createdAt!.substring(0, 10),
                                  products: model!.details!.products!,
                                )));
                      },
                      child: Icon(
                        Icons.shopping_cart_sharp,
                        color: Colors.white,
                      ),
                    )
                  : TextUtils(
                      text: '${model!.type}',
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
