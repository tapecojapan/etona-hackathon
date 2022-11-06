String? getEtonaImage(String? id) {
  if (id == null) {
    return null;
  }
  return 'assets/images/$id.png';
}