# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get('playerHand').on 'stand', =>
        @get('dealerHand').dealerPlay(@get('playerHand'));

    @get('playerHand').on 'bust', =>
        @get('dealerHand').reveal();
        console.log "bust"
        @trigger 'bust', @

    @get('dealerHand').on 'done', =>
        dealerScore = @get('dealerHand').scoreFinal()
        playerScore = @get('playerHand').scoreFinal()
        if playerScore == 21
            @trigger 'blackjack', @
        else if playerScore > dealerScore
            @trigger 'win', @
        else if dealerScore > 21
            @trigger 'dealerBust', @
        else
            @trigger 'lose', @