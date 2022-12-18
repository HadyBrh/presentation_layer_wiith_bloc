/// ImageAssetsManager is used to handle the application images instead of statically type
/// the image path each time whe need it.

const String imagesPath = 'assets/images';
const String translationsPath = 'assets/translations';

class ImageAssetsManager {
  static const String imageLogo = '$imagesPath/logo.png';
  static const String logoRectangular = '$imagesPath/logo_rectangular.png';
  static const String logoCircular = '$imagesPath/logo_circular.svg';
  static const String loadingImage = '$imagesPath/loading.gif';
  static const String ksaFlagImage = '$imagesPath/ksa.png';
  static const String usaFlagImage = '$imagesPath/usa.png';
  static const String mapImage = '$imagesPath/map.png';
  static const String placeHolderImage = '$imagesPath/placeholder.png';
  static const String notificationIcon = 'notification_icon';
  static const String IMAGE_HOME = '$imagesPath/home/home.png';
  static const String IMAGE_STORE = '$imagesPath/home/store.png';
  static const String IMAGE_TARGET = '$imagesPath/home/target.png';
  static const String IMAGE_ORDERS = '$imagesPath/home/orders.png';
  static const String IMAGE_CASH = '$imagesPath/home/cash.png';
  static const String IMAGE_INVENTORY = '$imagesPath/home/inventory.png';
  static const String IMAGE_KPIS = '$imagesPath/home/kpis.png';
}
