class window.CardView extends Backbone.View
  className: 'card1'

  template: _.template 'url(img/cards/<%= rankName %>-<%= suitName %>.png)'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.css 'background-image', @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'
