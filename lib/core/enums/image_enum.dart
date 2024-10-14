

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

enum ImageEnum {
  asset,
  file,
  network,
  svg,
  none,
}

ImageEnum checkImageType(ImageProvider imageProvider) {
  if (imageProvider is NetworkImage) {
    return  ImageEnum.network;
  } else if (imageProvider is AssetImage) {
    return ImageEnum.asset;
  } else if (imageProvider is SvgPicture) {
    return ImageEnum.svg;
  } else {
    return ImageEnum.none;
  }
}