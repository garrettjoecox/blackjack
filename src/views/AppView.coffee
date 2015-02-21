class window.AppView extends Backbone.View
  template: _.template '
    <div class="buttons">
      <button class="hit-button btn grey">Hit</button>
      <button class="stand-button btn grey">Stand</button>
    </div>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
    <div class="result"><div>
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

