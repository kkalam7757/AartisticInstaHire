class PickList {
  final String value;
  PickList({this.value});

  PickList.fromData(Map<String, dynamic> data):
  value=data['value'];

  Map<String, dynamic> toJson(Data){
    return {
      'value':value
    };
  }


  
  
}