bool dataEqual({required Map<String, dynamic> dataOne, required Map<String, dynamic> dataTwo}) {
  if (dataOne['code'] != dataTwo['code']) {
    return true;
  }

  for (var key in dataOne.keys) {
    if (dataTwo.containsKey(key)) {
      if (dataOne[key] != dataTwo[key]) {
        return true;
      }
    } else {
      return true;
    }
  }

  return false;
}
