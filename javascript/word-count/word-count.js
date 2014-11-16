function words(text) {
  list = format(text)

  h = {};
  list.forEach(function(val) {
    if (typeof(h[val]) === 'undefined') {
      h[val] = 1;
    } else { 
      h[val] += 1;
    }
  });
  return h;
}

function format(text) {
  return text.replace("\n"," ").split(" ");
}

module.exports = words;
