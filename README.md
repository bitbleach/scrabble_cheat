# Introduction

The app serves to help people cheat at Scrabble. A user can "plant" a gibberish word in the app's storage, causing searches for that word to return a hit, displaying the word and a bogus definition.

Specifications are as follows:

* A search for a word returns a page showing the word. If the word is a valid dictionary word or exists within the app's bogus word store, the definition is also displayed. If the word does not exist in either the dictionary or the store, the page indicates the word is not valid.
* When a searched word is prepended with an empty space and the word is neither a valid Scrabble word nor an existing word in the app's store: 
  (1) the word is then planted in the app's store accompanied with a bogus dictionary definition or definitions 
  (2) the request will return a page with the word and the newly generated bogus definition(s).
* To give a greater appearance of credibility, a generated bogus word will randomly have between 1 and 4 definitions.
* Bogus words and definitions stored by the app should expire 2 hours after they are created, except as otherwise provided by these rules.
* If a searched word is prepended with an empty space and the word is not a valid Scrabble word but the word is an existing word in the app's store, the word's expiration time should be reset (i.e., expire in 2 hours)
* Definitions are presented in substantially the following format: (1) [first definition]; (2) [second definition]; ...

