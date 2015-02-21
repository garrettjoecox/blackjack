class window.ResultView extends Backbone.View
  className: 'results'

  template: _.template '<h2></h2>'

  initialize: ->
    @model.on 'lose', => @renderLose()
    @model.on 'bust', => @renderBust()
    @model.on 'dealerBust', => @renderDBust()
    @model.on 'win', => @renderWin()
    @model.on 'blackjack', => @renderBlackJack()

  renderBust: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$('h2').text "You Busted!"

  renderLose: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$('h2').text "You Lost!"

  renderWin: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$('h2').text "You Won!"

  renderDBust: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$('h2').text "Dealer Busted!"

  renderBlackJack: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$('h2').text "BlackJack!"