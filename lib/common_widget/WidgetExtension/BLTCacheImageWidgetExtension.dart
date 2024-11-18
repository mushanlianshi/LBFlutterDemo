import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

// extension BLTExtension on CachedNetworkImage{
//
// }

// PlaceholderWidgetBuilder? cacheImagePlaceholderWidgetBuilder(String assetName,
//     {BoxFit fit = BoxFit.cover, double? borderRaduis = 10}) {
//   return (context, url) {
//     return (borderRaduis == null)
//         ? Image.asset(assetName, fit: fit)
//         : ClipRRect(
//             child: Image.asset(assetName, fit: fit),
//             borderRadius: BorderRadius.circular(borderRaduis!),
//           );
//   };
// }
//
// PlaceholderWidgetBuilder? cacheImageHousePlaceholderWidgetBuilder({BoxFit fit = BoxFit.cover, double? borderRaduis = 10}) {
//   return cacheImagePlaceholderWidgetBuilder(R.assetsImageHousePlaceholderImg, fit: fit, borderRaduis: borderRaduis);
// }
//
// LoadingErrorWidgetBuilder? cacheImageLoadingErrorWidgetBuilder(String assetName,
//     {BoxFit fit = BoxFit.cover, double? borderRaduis = 10}) {
//   return (context, url, error) {
//     return (borderRaduis == null)
//         ? Image.asset(assetName, fit: fit)
//         : ClipRRect(
//             child: Image.asset(assetName, fit: fit),
//             borderRadius: BorderRadius.circular(borderRaduis!),
//           );
//   };
// }
//
// LoadingErrorWidgetBuilder? cacheImageHouseLoadingErrorWidgetBuilder({BoxFit fit = BoxFit.cover, double? borderRaduis = 10}) {
//   return cacheImageLoadingErrorWidgetBuilder(R.assetsImageHousePlaceholderImg, fit: fit, borderRaduis: borderRaduis);
// }