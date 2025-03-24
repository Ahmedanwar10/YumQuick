import 'package:flutter/material.dart';
import 'package:yum_quick/Features/home/presentation/views/widgets/cusstom_list_view_items.dart';

class FuturedListViewItems extends StatelessWidget {
  const FuturedListViewItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
       height: MediaQuery.of(context).size.height * 0.180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const Padding(
          padding:  EdgeInsets.all(3.5),
          child:  CustomListViewItem(price: '15',),
        ),),
    );
  }
}