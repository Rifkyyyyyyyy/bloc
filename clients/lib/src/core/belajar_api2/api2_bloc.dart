import 'package:bloc/bloc.dart';
import 'package:clients/src/repository/product_repo.dart';
import 'bloc.dart';

class ApiBloc2 extends Bloc<ProductsEvent, ProductState> {
  final ProductRepository productRepository;

  ApiBloc2({required this.productRepository}) : super(InitialState()) {
    on<Create>((event, emit) async {
      emit(ProductAdd());
      await Future.delayed(const Duration(seconds: 1));
      try {
        await productRepository.create(name: event.name, price: event.price , image: event.image , description:  event.description);
        emit(ProductAdded());
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }
}
