part of 'checkout_bloc.dart';

@immutable
abstract class CheckoutEvent {}

class AddToCartEvent extends CheckoutEvent{
  final Product product;
  AddToCartEvent({
    required this.product,
  });
}

class RemoveToCartEvent extends CheckoutEvent{
  final Product product;
  RemoveToCartEvent({
    required this.product,
  });
}
