import 'package:intl/intl.dart';

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}

const double kPaddingHorizontal = 16;
