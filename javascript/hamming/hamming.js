exports.compute = function(a,b) { 
  var i = 0,
    count = 0;

  for( ; i < a.length; i++ ) {
    if ( a[i] !== b[i] ) {
      count++;
    }
  }
  return count;
};