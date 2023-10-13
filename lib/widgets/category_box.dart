import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:login_page/theme/color.dart';
import 'package:login_page/utils/data.dart';
import 'package:login_page/widgets/details_screen..dart';
import 'package:login_page/widgets/feature_item.dart';
import 'package:login_page/widgets/notification_box.dart';
import 'package:login_page/widgets/recommend_item.dart';
import 'package:login_page/screens/notification_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColor.appBarColor,
            pinned: true,
            snap: true,
            floating: true,
            title: _buildAppBar(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildBody(),
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profile["name"]!,
                style: TextStyle(
                  color: AppColor.labelColor,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Good  Noon !",
                style: TextStyle(
                  color: AppColor.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            // Navigate to the NotificationScreen when the bell is tapped
            Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
          },
          child: NotificationBox(
            notifiedNumber: 1,
          ),
        ),
      ],
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCategories(),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
            child: Text(
              "Featured",
              style: TextStyle(
                color: AppColor.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
          ),
          _buildFeatured(),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recommended",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: AppColor.textColor),
                ),
                Text(
                  "See all",
                  style: TextStyle(fontSize: 14, color: AppColor.darker),
                ),
              ],
            ),
          ),
          _buildRecommended(),
        ],
      ),
    );
  }

  _buildCategories() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CategoryBox(
              selectedColor: Colors.white,
              data: categories[index],
              onTap: () {
                if (categories[index]["name"] == "Coding") {
                  // Navigate to the details collection screen
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  _buildFeatured() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 290,
        enlargeCenterPage: true,
        disableCenter: true,
        viewportFraction: .75,
      ),
      items: List.generate(
        features.length,
        (index) => FeatureItem(
          data: features[index],
        ),
      ),
    );
  }

  _buildRecommended() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          recommends.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 10),
            child: RecommendItem(
              data: recommends[index],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryBox extends StatelessWidget {
  CategoryBox({
    Key? key,
    required this.data,
    this.isSelected = false,
    this.onTap,
    this.selectedColor = const Color.fromARGB(255, 15, 15, 15),
    this.backgroundColor = const Color.fromARGB(255, 64, 155, 229),
  }) : super(key: key);

  final data;
  final Color selectedColor;
  final Color backgroundColor;
  final bool isSelected;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? selectedColor : Colors.transparent,
                width: isSelected ? 2 : 0,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColor.shadowColor.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(1, 1),
                ),
              ],
            ),
            child: Center(
              child: Icon(
                Icons.star,
                color: isSelected ? selectedColor : AppColor.textColor,
                size: 30,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            data["name"],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColor.textColor,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
