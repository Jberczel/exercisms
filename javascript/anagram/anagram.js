var anagram = function(word) {
  var obj = new Object();

  obj.matches = function(words) {
    if (arguments.length > 1) {
      words = Array.prototype.slice.call(arguments);
    }

    return words.filter(function(match) {
      return isAnagram(word, match) && !isIdentical(word, match);
    });
  };

  return obj;
};

function isIdentical(a, b) {
  return a.toLowerCase() === b.toLowerCase();
}

function isAnagram(a, b) {
  return sort(a) === sort(b);
}

function sort(word) {
  return word.toLowerCase().split('').sort().join('');
}

module.exports = anagram;