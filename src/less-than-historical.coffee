ReturnValue = require 'nanocyte-component-return-value'
sameType = require 'same-type'

class LessThanHistorical extends ReturnValue
  onEnvelope: (envelope) =>
    { config, message, data } = envelope
    { left } = config
    right = data

    [typedLeft, typedRight] = sameType [left, right]
    return message if typedLeft < typedRight

module.exports = LessThanHistorical
