import 'package:clinic/view/screens/category_child/categoy_items/category_items.dart';
import 'package:clinic/view/widgets/auth/auth_button.dart';
import 'package:clinic/view/widgets/category_and_title.dart';
import 'package:clinic/view/widgets/grid_custom.dart';
import 'package:clinic/view/widgets/notification_search_title.dart';
import 'package:flutter/material.dart';

class CategoryChildScreen extends StatelessWidget {
  const CategoryChildScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          NotificationSearchTitle(text: 'مستهلكات طبية'),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 5,
                // padding: EdgeInsets.zero,
                physics: BouncingScrollPhysics(),
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCountAndCentralizedLastElement(
                        itemCount: 5,
                        childAspectRatio: 1.2,
                        crossAxisCount: 2,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 1),
                itemBuilder: (ctxt, index) {
                  return CategoryandTitle(
                      height: 100,
                      width: 100,
                      text: 'معدات جراحية',
                      imgurl: 'assets/images/demo.jpg',
                      ontap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => CategoryItemsScreen()));
                      });
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(colors: [
                      Colors.green,
                      Colors.blue.shade900,
                    ], begin: Alignment.topLeft, end: Alignment.topRight),
                  ),
                  // width: 50,
                  child: AuthButton(
                    color: Colors.transparent,
                    text: 'who are we',
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.green,
          )
        ],
      ),
    );
  }
}
