function words(text) {
  var words = text.split(/\s+/);
  return words.reduce(count, {});
}

function count(hash, val) {
  hash[val] = (hash[val] || 0) + 1;
  return hash;
}

module.exports = words;
