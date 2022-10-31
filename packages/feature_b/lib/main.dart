import 'package:bloc/bloc.dart';

class ProductCubitState {
  final String product;

  ProductCubitState(this.product);
}

class ProductCubit extends Cubit<ProductCubitState> {
  ProductCubit(super.initialState) {
    Stream<String>.periodic(Duration(seconds: 2), (count) => 'NewProduct$count')
        .listen((event) => emit(ProductCubitState(event)));
  }
}
