import 'package:bloc_one/features/cart/ui/cart.dart';
import 'package:bloc_one/features/home/bloc/home_bloc.dart';
import 'package:bloc_one/features/home/model/ProductDataModel.dart';
import 'package:bloc_one/features/home/ui/ProductTileWidget.dart';
import 'package:bloc_one/features/wishlist/ui/wishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }
  final HomeBloc homeBloc = HomeBloc();

  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listener: (context, state) {
        if(state is HomeNavigateCartPageActionState){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Cart()));
        }
        else if(state is HomeNavigateWishlistPageActionState){
          Navigator.push(context,MaterialPageRoute(builder: (context)=> Wishlist()));
        }

      },
      listenWhen: (previous,current) => current is HomeActionState,
      buildWhen: (previous,current) => current is !HomeActionState,
      builder: (context, state) {
        switch(state.runtimeType){
          case  HomeloadingState:
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          case HomeLoadedSuccessState:

            final successState = state as HomeLoadedSuccessState;

            return Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xFFFDA403),
                title: Text('Gorcery App'),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishlistButtonNavigateEvent());
                      },
                      icon: Icon(CupertinoIcons.heart)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartButtonNavigateEvent());
                      },
                      icon: Icon(CupertinoIcons.shopping_cart))
                ],
              ),
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context,index){
                return ProductTileWidget(productDataModel: successState.products[index]);
            })
            );
          case HomeErrorState:
            return SizedBox(child: Text("Error"),);
          default:
            return SizedBox();
        }
      },
    );
  }
}
