class AIChatModel{
  String? text;
  bool? sentByMe;

  AIChatModel({this.text,this.sentByMe});

  AIChatModel.fromJson(Map<String,dynamic> json){
    text=json['message'];
    sentByMe=false;
  }

// AIChatModel.toJson(Map<String,dynamic> json){
//   text=json['message'];
//   sentByMe=false;
// }



}