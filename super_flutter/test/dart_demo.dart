void execute(var callback){
  callback();
}



void main(List<String> args) {
  


  Future.wait(
    [
      Future.delayed(new Duration(seconds: 2),(){

      }),
      Future.delayed(Duration(seconds: 4),(){

      })
    ]
  ).then((results){
    // print(results[0],results[1]);
  }).catchError((e){
    print(e);
  });
}