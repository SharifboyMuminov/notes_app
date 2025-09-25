import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotes/screens/home/add_category/add_category_page.dart';
import 'package:mynotes/utils/app_colors.dart';
import 'package:mynotes/utils/app_size.dart';

class CategoryDelegate extends SliverPersistentHeaderDelegate {
  final ScrollController scrollController;
  final ValueChanged<int> selectIndex;
  final int activeIndex;
  final List<GlobalKey> itemKeys;

  CategoryDelegate({
    required this.scrollController,
    required this.selectIndex,
    required this.activeIndex,
    required this.itemKeys,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppColors.c252525,
      child: ListView.builder(
        controller: scrollController,
        padding: EdgeInsets.symmetric(horizontal: 11.we),
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          if (index == 6) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const AddCategoryPage();
                    },
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.c3B3B3B,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                alignment: AlignmentGeometry.center,
                margin: EdgeInsets.symmetric(horizontal: 4.we, vertical: 10.he),
                padding: EdgeInsets.symmetric(horizontal: 16.we),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            );
          }

          return GestureDetector(
            onTap: () {
              selectIndex(index);
            },
            child: Container(
              key: itemKeys[index],
              alignment: AlignmentGeometry.center,
              margin: EdgeInsets.symmetric(horizontal: 4.we, vertical: 10.he),
              padding: EdgeInsets.symmetric(horizontal: 16.we),
              decoration: BoxDecoration(
                color: activeIndex == index ? Colors.amber : Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: const Text(
                "All",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  double get maxExtent => 70;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
