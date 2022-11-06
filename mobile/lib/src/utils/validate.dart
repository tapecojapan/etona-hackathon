bool nullOrEmpty(String? value) {
  if (value == null) {
    return true;
  }

  return value.isEmpty;
}
