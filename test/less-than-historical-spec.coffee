ReturnValue = require 'nanocyte-component-return-value'
LessThanHistorical = require '..'

describe 'LessThanHistorical', ->
  beforeEach ->
    @sut = new LessThanHistorical

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when called with an equal left than data', ->
      beforeEach ->
        @result = @sut.onEnvelope config: {left: 2}, data: {left: 2}, message: 'anything'

      it 'should not return the message', ->
        expect(@result).not.to.exist

    describe 'when called with a lesser left than data', ->
      beforeEach ->
        @result = @sut.onEnvelope config: {left: 1}, data: {left: 2}, message: 'anything'

      it 'should return the message', ->
        expect(@result).to.deep.equal 'anything'

    describe 'when called with a greater left than data', ->
      beforeEach ->
        @result = @sut.onEnvelope config: {left: 6}, data: {left: 2}, message: 'anything'

      it 'should not return the message', ->
        expect(@result).not.to.exist

    describe 'when left and data are gregorically equal', ->
      beforeEach ->
        @result = @sut.onEnvelope config: {left: 'Jan 1, 2012'}, data: {left: '2012-01-01'}, message: 'anything'

      it 'should not return the message', ->
        expect(@result).not.to.exist

    describe 'when left is gregorically less than data', ->
      beforeEach ->
        @result = @sut.onEnvelope config: {left: 'Jan 2, 1777'}, data: {left: '2012-01-01'}, message: 'anything'

      it 'should return the message', ->
        expect(@result).to.deep.equal 'anything'
