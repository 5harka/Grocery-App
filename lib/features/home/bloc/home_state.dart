part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState{}

class HomeInitial extends HomeState {}

class HomeloadingState extends HomeState{}

class HomeLoadedSuccessState extends HomeState{
  final List<ProductDataModel> products;

  HomeLoadedSuccessState(this.products);
}

class HomeErrorState extends HomeState{}

class HomeNavigateWishlistPageActionState extends HomeActionState{

}
class HomeNavigateCartPageActionState extends HomeActionState{

}
