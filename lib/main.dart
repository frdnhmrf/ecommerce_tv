import 'package:ecommerce_tv/bloc/checkout_bloc/checkout_bloc.dart';
import 'package:ecommerce_tv/bloc/get_products_bloc/get_products_bloc.dart';
import 'package:ecommerce_tv/bloc/login_bloc/login_bloc.dart';
import 'package:ecommerce_tv/data/datasources/remotes/auth_remote_datasource.dart';
import 'package:ecommerce_tv/data/datasources/remotes/product_remote_datasource.dart';
import 'package:ecommerce_tv/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetProductsBloc(ProductRemotedatasource()),
        ),
        BlocProvider(
          create: (context) => CheckoutBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDatasource()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
