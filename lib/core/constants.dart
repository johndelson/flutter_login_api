Map<dynamic, dynamic> myJson = <dynamic, dynamic>{
  'apiKey': 'asdasd',
  'sott': false
};

class ApiService {
  final dynamic apiKey;
  final dynamic sott;

  ApiService(this.apiKey, this.sott);

  ApiService.fromJson(Map<dynamic, dynamic> json)
      : apiKey = json['apiKey'],
        sott = json['sott'];

  Map<dynamic, dynamic> toJson() => {
        'apiKey': apiKey,
        'sott': sott,
      };
}

var ApiData = ApiService.fromJson(myJson);
