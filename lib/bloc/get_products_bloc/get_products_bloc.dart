import 'package:ecommerce_tv/data/datasources/product_remote_datasource.dart';
import 'package:ecommerce_tv/data/model/responses/list_product_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_products_event.dart';
part 'get_products_state.dart';

class GetProductsBloc extends Bloc<GetProductsEvent, GetProductsState> {
  final ProductRemotedatasource datasources;
  GetProductsBloc(
    this.datasources,
  ) : super(GetProductsInitial()) {
    on<DoGetProductEvent>((event, emit) async {
      emit(GetProductsLoading());
      final result = await datasources.getAllProduct();
      result.fold(
        (l) => emit(GetProductsError()),
        (r) => emit(GetProductsLoaded(data: r)),
      );
    });
  }
}
