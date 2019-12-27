const cards = [
    {
      front: 'The "First Computer Programmer"',
      back: 'Ada Lovelace',
      flipped: false,
    },
    {
      front: 'Invented the "Clarke Calculator"',
      back: 'Edith Clarke',
      flipped: false,
  
    },
    {
      front: 'Famous World War II Enigma code breaker',
      back: 'Alan Turing',
      flipped: false,
    },
    {
      front: 'Created satellite orbit analyzation software for NASA',
      back: 'Dr. Evelyn Boyd Granville',
      flipped: false,
    },
  ]; 

  // Display our data
  // On click: flip cards back and forth
  // Get info for new cards form the user
    // Create data properties for fornt and back of new card
    // Bind those prperties to the form inputs using v-model
  // Add new card when user hits enter or cliks button
    // Create a method
      // creates a new card object containing new card information
      // pushes that card object in to the cards array
  // Delete cards
  // Animate card flip
  // Display an error message if form fields are blank

  new Vue({
    el: '#flashcard-app',
    data: {
      cards: cards,
      newFront: '',
      newBack: '',
      error: false
    },
    methods: {
      toggleCard: function(card) {
        card.flipped = !card.flipped
      },
      createCard: function() {
        if (!this.newFront || !this.newBack){
          this.error = true
        } else {
          cards.push({
            front: this.newFront,
            back: this.newBack,
            flipped: false
          })
          this.newFront = ''
          this.newBack = ''
          this.error = false
        }
      },
      deleteCard: function(index) {
        cards.splice(index, 1)
      }
    }
  });