import 'package:buildcondition/buildcondition.dart';
import 'package:clinic/applocal.dart';
import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/view/screens/item/item.dart';
import 'package:clinic/view/widgets/category_item.dart';
import 'package:clinic/view/widgets/category_item_cart_widget.dart';
import 'package:clinic/view/widgets/drawer_widget.dart';
import 'package:clinic/view/widgets/grid_custom.dart';
import 'package:clinic/view/widgets/header_widget.dart';
import 'package:clinic/view/widgets/notification_search_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            drawer: DrawerPage(),
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
                          color: Colors.green.shade400),
                    ),
                condition: state is SuccessShowCartState,
                builder: (context) {
                  // HomeCubit.get(context).getcart();
                  return Column(
                    children: [
                      NotificationSearchTitle(
                        text: 'Cart',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: GridView.builder(
                            itemCount: HomeCubit.get(context)
                                .showCartModel!
                                .data!
                                .cart!
                                .length,
                            // HomeCubit.get(context).subModel!.data!.length,
                            physics: BouncingScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCountAndCentralizedLastElement(
                                    itemCount: HomeCubit.get(context)
                                        .showCartModel!
                                        .data!
                                        .cart!
                                        .length,
                                    // HomeCubit.get(context).subModel!.data!.length,
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    childAspectRatio: 0.7),
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemBuilder: (ctxt, index) =>
                                CartCategoryItemWidget(
                                  modelCart: HomeCubit.get(context)
                                      .showCartModel!
                                      .data!
                                      .cart![index],
                                )),
                      ),
                    ],
                  );
                }),
          );
        },
      ),
    );
  }
}
