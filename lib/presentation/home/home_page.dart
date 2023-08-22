import 'package:ecommerce_tv/bloc/checkout_bloc/checkout_bloc.dart';
import 'package:ecommerce_tv/common/global_variables.dart';
import 'package:ecommerce_tv/presentation/cart/cart_page.dart';
import 'package:ecommerce_tv/presentation/home/widgets/banner_widget.dart';
import 'package:ecommerce_tv/presentation/home/widgets/list_category_widget.dart';
import 'package:ecommerce_tv/presentation/home/widgets/list_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Color(0xffEE4D2D),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(10),
                    child: TextFormField(
                      onFieldSubmitted: (_) {},
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(left: 6.0),
                            child: Icon(
                              Icons.search,
                              weight: 23,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(top: 10),
                        hintText: 'Search ',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          ListCategoryWidget(),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: BannerWidget(),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              'List Product',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Expanded(child: ListProductWidget())
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: (index) {},
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(
                  color: _page == 0
                      ? GlobalVariables.selectedNavBarColor
                      : GlobalVariables.backgroundColor,
                  width: bottomBarBorderWidth,
                ),
              )),
              child: const Icon(Icons.home_outlined),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(
                  color: _page == 1
                      ? GlobalVariables.selectedNavBarColor
                      : GlobalVariables.backgroundColor,
                  width: bottomBarBorderWidth,
                ),
              )),
              child: const Icon(Icons.person_outline_outlined),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(
                  color: _page == 2
                      ? GlobalVariables.selectedNavBarColor
                      : GlobalVariables.backgroundColor,
                  width: bottomBarBorderWidth,
                ),
              )),
              child: BlocBuilder<CheckoutBloc, CheckoutState>(
                builder: (context, state) {
                  if (state is CheckoutLoaded) {
                    return badges.Badge(
                      badgeStyle: const badges.BadgeStyle(
                        elevation: 0,
                        badgeColor: Colors.white,
                      ),
                      badgeContent: Text(
                        '${state.items.length}',
                        style: const TextStyle(color: Color(0xffEE4D2D)),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CartPage(),
                            ),
                          );
                        },
                        child: const Icon(Icons.shopping_cart_outlined),
                      ),
                    );
                  }
                  return const badges.Badge(
                    badgeStyle: badges.BadgeStyle(
                      elevation: 0,
                      badgeColor: Colors.white,
                    ),
                    badgeContent: Text(
                      '0',
                      style: TextStyle(color: Color(0xffEE4D2D)),
                    ),
                    child: Icon(Icons.shopping_cart_outlined),
                  );
                },
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
