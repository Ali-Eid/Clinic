import 'package:clinic/view/screens/item/item.dart';
import 'package:clinic/view/widgets/category_item.dart';
import 'package:clinic/view/widgets/grid_custom.dart';
import 'package:clinic/view/widgets/notification_search_title.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryItemsScreen extends StatelessWidget {
  const CategoryItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          NotificationSearchTitle(text: 'معدات جراحية'),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
                itemCount: 15,
                physics: BouncingScrollPhysics(),
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCountAndCentralizedLastElement(
                  itemCount: 15,
                  crossAxisCount: 2,
                ),
                itemBuilder: (ctxt, index) => CategoryItemWidget(
                    ontap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => ItemScreen()));
                    },
                    image: AssetImage('assets/images/demo.jpg'),
                    name: 'Name')),
          ),
          Container(
            height: 50,
            child: SvgPicture.asset(
              'assets/images/footer.svg',
              color: Colors.green,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
