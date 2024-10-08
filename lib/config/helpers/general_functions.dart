import 'package:ibox/network/url_helper.dart';

String getImageUrl(String? imagePath, String type){
  if(imagePath == null || imagePath == "") {
    if (type == "media") {
      return "https://www.popcorn.app/assets/app/images/placeholder-movieimage.png";
    } else {
      return "https://cdn.vectorstock.com/i/500p/08/19/gray-photo-placeholder-icon-design-ui-vector-35850819.jpg";
    }
  }

  return (UrlHelper.imageUrl + imagePath);
}