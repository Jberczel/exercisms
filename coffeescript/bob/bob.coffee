class Bob
  hey: (msg) ->
    return "Whoa, chill out!"   if isShouting(msg)
    return "Sure."              if isQuestion(msg)
    return "Fine. Be that way!" if isBlank(msg)
    "Whatever."

  isShouting = (msg) -> msg is msg.toUpperCase() and msg.match /[A-Z]/
  isQuestion = (msg) -> msg[-1..] is '?'
  isBlank    = (msg) -> msg.match /^\s*$/

module.exports = Bob
