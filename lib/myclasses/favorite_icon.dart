import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteIcon {
  IconData favoriteIcon = Icons.favorite_outline;

  void ChangeIcon(){
    if(favoriteIcon == Icons.favorite_outline){
      favoriteIcon = Icons.favorite;
    }else{
      favoriteIcon = Icons.favorite_outline;
    }
  }

}