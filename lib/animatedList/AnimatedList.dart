import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedListScreen extends StatelessWidget{
  List<String> items=[];
  final GlobalKey<AnimatedListState> listKey=GlobalKey();
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
   return Scaffold(
     backgroundColor: Colors.green.shade300,
     body:Column(
       children: [
         Container(
           height:size.height/5 ,
           color: Colors.purple.shade400,
           width: double.infinity,
           child: Padding(
             padding:  EdgeInsetsDirectional.only(top: size.height/10),
             child: Center(child: Text('Flutter Map',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)),
           ),
         ),
         Padding(
           padding:const  EdgeInsetsDirectional.only(top: 10),
           child: IconButton(onPressed: isertItem
           , icon:const Icon(Icons.add_circle_outline,color: Colors.purple,size: 40,)),
         ),
        const SizedBox(height: 10,),
         Expanded(
           child: AnimatedList(
             controller: scrollController,
               key: listKey,
               initialItemCount: items.length,
               itemBuilder: (context, index, animation) =>SizeTransition(
                   sizeFactor: animation,
                   child: AnimatedListItem(
                     text: items[index],
                   onPressed: () {

                        deletItem(index);
                      },
                     background:Colors.white ,
                   ))

           ),
         ),
       ],
     ) ,
   );

  }

  void isertItem() {
    var index = items.length;
    items.add(' Item ${index + 1}');
   listKey.currentState!.insertItem(index);

    Future.delayed(const Duration(milliseconds:300),(){
      scrollController.animateTo(scrollController.position.maxScrollExtent, duration:const Duration(milliseconds: 300), curve: Curves.easeIn);

    });
  }

  void deletItem(int index) {
 var removeItem=   items.removeAt(index);
listKey.currentState!.removeItem(index, (context, animation) => SizeTransition(
     sizeFactor: animation,
     child: AnimatedListItem(text: removeItem, onPressed: (){},background: Colors.red,)));

  }
}


class AnimatedListItem extends StatelessWidget{
const  AnimatedListItem({Key?key, required this.text ,required this.onPressed,required this.background  }) : super(key: key);
final String text;
final Color background;
final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,
      vertical: 5),
      child: Card(
color: background,
        elevation: 5,
        child: ListTile(
          trailing: IconButton(onPressed: onPressed,icon:const Icon(Icons.delete_outline,color: Colors.red,size: 23,),),

          title: Text(text,style: TextStyle(fontSize: 23,color: Colors.purple),),
        ),
      ),
    );
  }
}