import 'package:bloc/bloc.dart';

class SymbolCubitState {
  final String symbol;

  SymbolCubitState(this.symbol);
}


class SymbolCubit extends Cubit<SymbolCubitState> {
  SymbolCubit(super.initialState) {
    Stream<String>.periodic(Duration(seconds: 1), (count) => 'NewSymbol$count')
        .listen((event) => emit(SymbolCubitState(event)));
  }
}
