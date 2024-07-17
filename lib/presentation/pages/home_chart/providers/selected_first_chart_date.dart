import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/enums/transaction_range_filter.dart';
import '../../../providers/selected_date_range_filter.dart';
import 'selected_chart_date.dart';

final selectedFirstChartDateProvider = Provider<DateTime>((ref) {
  final currentDate = ref.watch(selectedChartDateProvider);

  switch (ref.watch(selectedDateRangeFilterProvider)) {
    case DateRangeFilter.yearly:
      return DateTime(
        currentDate.year - 2,
      );
    case DateRangeFilter.monthly:
      return DateTime(
        currentDate.year,
        currentDate.month - 3,
      );
    case DateRangeFilter.daily:
      return DateTime(
        currentDate.year,
        currentDate.month,
        currentDate.day - currentDate.weekday + 1,
      );
  }
});
