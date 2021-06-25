
import 'package:mobx/mobx.dart';

part 'counter.g.dart';

class CounterStore  = Counter with _$CounterStore;

abstract class Counter with Store{
  //final FormErrorState error = FormErrorState();

  @observable
  int counter = 0;

  @observable

  bool isLiked = false;
  bool isLikedButton = false;

  @observable
  String isLikeString = 'Dislike Post';
//
//  @observable
//  String name = '';
//
//  @observable
//  String email = '';
//
//  @action
//  void setUsername(String value)
//  {
//    name = value;
//  }
//
//  @action
//  void setEmail(String value)
//  {
//    email = value;
//  }

  @action
  void increment(){
    counter++;
  }
  @action
  void decrement(){
    counter--;
  }
  @action
   onLikeButtonTapped(bool isEnbaled)
  //=> isLiked =  isEnbaled;
  {
    if (isEnbaled == isLiked) {
      print('Like ');
      isLiked = true;
      isLikeString = 'Like Post';
    } else {
      print('DisLike');
     isLiked = false;
      isLikeString = 'Dislike Post';
    }
  }
}

