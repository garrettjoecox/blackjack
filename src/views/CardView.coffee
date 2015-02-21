class window.CardView extends Backbone.View
  className: 'card1'

  template: _.template 'url(img/newCards/<%= rankName %>_of_<%= suitName %>.jpg)'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.css 'background-image', @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'
