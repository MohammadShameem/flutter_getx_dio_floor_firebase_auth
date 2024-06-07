
class NearbyPlaceQueryParam{
  String location;
  String type;
  String keyword;
  int radius;
  String key;

  NearbyPlaceQueryParam({
      this.location = "",
      this.type = "",
      this.keyword = "",
      this.radius = 5000,
      this.key = "fdgdgdfg" });

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String,dynamic>{};
    data['location'] = location;
    data['type'] = type;
    data['keyword'] = keyword;
    data['radius'] = radius;
    data['key']= key;
    return data;
  }
}