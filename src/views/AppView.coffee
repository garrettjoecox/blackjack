class window.AppView extends Backbone.View
  className: "container"
  template: _.template '
    <div class="player-hand-container col-xs-6 col-sm-4"></div>
    <div class="buttons col-xs-6 col-sm-4">
      <button class="hit-button btn-lg btn btn-default">Hit</button>
      <button class="stand-button btn-lg btn btn-default">Stand</button>
      <h2 class="result"><h2>
    </div>
    <div class="dealer-hand-container col-xs-6 col-sm-4"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').stand()

  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.result').html new ResultView(model: @model).el
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

