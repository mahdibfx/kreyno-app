import 'package:flutter/widgets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:phonecodes/phonecodes.dart';
import 'package:stacked_services/stacked_services.dart';

class CountryCodePickerSheetModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();

  String _searchQuery = '';
  List<Country> _filteredCountries = [];

  List<Country> get countriesList => Countries.list;

  String get searchQuery => _searchQuery;

  List<Country> get filteredCountries {
    if (_searchQuery.isEmpty) {
      return countriesList;
    }
    return _filteredCountries;
  }

  Map<String, List<Country>> get groupedCountries {
    final Map<String, List<Country>> grouped = {};
    final countriesToGroup = filteredCountries;

    // Sort countries alphabetically by name
    final sortedCountries = List<Country>.from(countriesToGroup)
      ..sort((a, b) => a.name.compareTo(b.name));

    // Group by first letter
    for (final country in sortedCountries) {
      final firstLetter = country.name.isNotEmpty
          ? country.name[0].toUpperCase()
          : '#';
      grouped.putIfAbsent(firstLetter, () => []).add(country);
    }

    return grouped;
  }

  List<String> get alphabetHeaders {
    return groupedCountries.keys.toList()..sort();
  }

  int get totalItemCount => alphabetHeaders
      .map((letter) => 1 + groupedCountries[letter]!.length)
      .fold(0, (sum, count) => sum + count);

  void onSearch(String search) {
    _searchQuery = search.toLowerCase().trim();

    if (_searchQuery.isEmpty) {
      _filteredCountries = [];
    } else {
      _filteredCountries = countriesList.where((country) {
        return country.name.toLowerCase().contains(_searchQuery) ||
            country.dialCode.contains(_searchQuery) ||
            country.code.toLowerCase().contains(_searchQuery);
      }).toList();
    }

    rebuildUi();
  }

  void clearSearch(TextEditingController controller) {
    _searchQuery = '';
    _filteredCountries = [];
    controller.clear();
    rebuildUi();
  }

  void goBack() {
    _navigationService.back();
  }
}
