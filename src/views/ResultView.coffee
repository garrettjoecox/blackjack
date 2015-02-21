class window.ResultView extends Backbone.View
  className: 'results'

  template: _.template '<h2></h2>'

  initialize: ->
    @model.on 'lose', => @$el.text "You Lose!"
    @model.on 'bust', => @$el.text "You Busted!"
    @model.on 'dealerBust', => @$el.text "Dealer Busted!"
    @model.on 'win', => @$el.text "You Won!"
    @model.on 'blackjack', => @$el.text "BlackJack!"
    @model.on 'tie', => @$el.text "It's a Tie!"