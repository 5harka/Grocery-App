import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_one/data/GroceryItems.dart';
import 'package:bloc_one/features/home/model/ProductDataModel.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);

    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);

    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);

    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);

    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeloadingState());
    await Future.delayed(Duration(seconds: 0));

    emit(HomeLoadedSuccessState(GroceryProducts.groceryItems
        .map((e) => ProductDataModel(
            e['id'],
            e['name'],
            e['description'],
            e['price'],
            e['imageUrl']))
            .toList()));
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print('You clicked on product Wishlist');
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('You clicked on the product cart');
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('You clicked on the Cart');
    emit(HomeNavigateWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('You clicked on the Wishlist');
    emit(HomeNavigateCartPageActionState());
  }
}
