String formatList(List<dynamic> list) {
  if (list.isEmpty) {
    return 'NA';
  } else {
    // Convert each element to a string, handling different types
    List<String> stringList = list.map((item) {
      if (item == null) {
        return 'null'; // Handle null values if needed
      } else if (item is String) {
        return item;
      } else if (item is int || item is double || item is bool) {
        return item.toString();
      } else {
        return item.toString(); // Handle other types as default
      }
    }).toList();

    return stringList.join(', ');
  }
}
