class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->
    @canHit = true

  hit: ->
    if @canHit
      if @scoreFinal() <= 21
        @add @deck.pop()
      if @scoreFinal() > 21
        @canHit = false;
        @trigger 'bust', @

  stand: ->
    if @canHit
      @canHit = false;
      @trigger 'stand', @

  reveal: ->
    @at(0).flip()

  dealerPlay: (playerHand) ->
    @reveal();
    while @scoreFinal() < 17
      @add @deck.pop()
    @trigger 'done', @
    # playerScore = playerHand.scoreFinal()
    # dealerScore = @scoreFinal()
    # if playerScore > dealerScore
    #         console.log "win"
    #         @trigger 'win', @
    #     else if dealerScore > 21
    #         console.log "dbust"
    #         @trigger 'dealerBust', @
    #     else
    #         console.log "lose"
    #         @trigger 'lose', @

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scoreFinal: ->
    if @scores()[1] > 21
      @scores()[0]
    else
      @scores()[1]

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]
