import 'package:ecommerce_tv/bloc/checkout_bloc/checkout_bloc.dart';
import 'package:ecommerce_tv/common/global_variables.dart';
import 'package:ecommerce_tv/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              children: [
                const Text(
                  'Subtotal :',
                  style: TextStyle(fontSize: 20),
                ),
                BlocBuilder<CheckoutBloc, CheckoutState>(
                    builder: (context, state) {
                  if (state is CheckoutLoaded) {
                    final total = state.items
                        .fold(0, (sum, item) => sum + item.attributes!.price!);
                    return Text(
                      'Rp $total',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                  return const Text(
                    'calculate',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: const Color(0xffEE4D2D),
              ),
              child: const Text(
                'Checkout',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Divider(
            thickness: 1,
            color: Colors.black12.withOpacity(0.08),
          ),
          const SizedBox(height: 5),
          BlocBuilder<CheckoutBloc, CheckoutState>(builder: (context, state) {
            if (state is CheckoutLoaded) {
              final uniqueItems = state.items.toSet().length;
              final dataset = state.items.toSet();
              return Expanded(
                child: ListView.builder(
                  itemCount: uniqueItems,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Image.network(
                                dataset.elementAt(index).attributes!.image!,
                                fit: BoxFit.fitWidth,
                                height: 135,
                                width: 135,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 235,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      '${dataset.elementAt(index).attributes!.name}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                  Container(
                                    width: 235,
                                    padding:
                                        const EdgeInsets.only(left: 10, top: 5),
                                    child: Text(
                                      '${dataset.elementAt(index).attributes!.price!}',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                  Container(
                                    width: 235,
                                    padding:
                                        const EdgeInsets.only(left: 10, top: 5),
                                    child: Text(
                                      '${dataset.elementAt(index).attributes!.description!.length >= 20 ? dataset.elementAt(index).attributes!.description!.substring(0, 20) : dataset.elementAt(index).attributes!.description!}...',
                                    ),
                                  ),
                                  Container(
                                    width: 235,
                                    padding:
                                        const EdgeInsets.only(left: 10, top: 5),
                                    child: const Text(
                                      'In Stock',
                                      style: TextStyle(
                                        color: Colors.teal,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black12,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.black12,
                                ),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        context.read<CheckoutBloc>().add(
                                              RemoveToCartEvent(
                                                product:
                                                    dataset.elementAt(index),
                                              ),
                                            );
                                      },
                                      child: Container(
                                        width: 35,
                                        height: 32,
                                        alignment: Alignment.center,
                                        child: const Icon(
                                          Icons.remove,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black12, width: 1.5),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      child: Container(
                                        width: 35,
                                        height: 32,
                                        alignment: Alignment.center,
                                        child: BlocBuilder<CheckoutBloc,
                                            CheckoutState>(
                                          builder: (context, state) {
                                            if (state is CheckoutLoaded) {
                                              final countItem = state.items
                                                  .where((element) =>
                                                      element.id ==
                                                      dataset
                                                          .elementAt(index)
                                                          .id)
                                                  .length;
                                              return Text('$countItem');
                                            }
                                            return const Text('0');
                                          },
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        context.read<CheckoutBloc>().add(
                                              AddToCartEvent(
                                                product:
                                                    dataset.elementAt(index),
                                              ),
                                            );
                                      },
                                      child: Container(
                                        width: 35,
                                        height: 32,
                                        alignment: Alignment.center,
                                        child: const Icon(
                                          Icons.add,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
              );
            }
            return const Text('');
          })
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
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const HomePage();
                        },
                      ),
                    );
                  },
                  child: const Icon(Icons.home_outlined)),
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
