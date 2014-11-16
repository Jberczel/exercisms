var Bob = function() {};

Bob.prototype.hey = function(input) {
  if (isShouting(input)) { return 'Whoa, chill out!'; }
  if (isQuestion(input)) { return 'Sure.'; }
  if (isBlank(input))    { return "Fine. Be that way!"; }
  return "Whatever.";
};

function isShouting(s) {
  return allCaps(s) && hasLetters(s);
}

function allCaps(s) {
  return s == s.toUpperCase();
}

function hasLetters(s) {
  return s.match(/[a-zA-Z]/);
}

function isQuestion(s) {
  return s.slice(-1) == '?';
}

function isBlank(s) { 
  return s.trim().length == 0; 
}

module.exports = Bob;

