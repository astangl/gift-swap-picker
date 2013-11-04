Simple Haskell app that computes random person (e.g., for gift exchange)
pairing, forming a Hamiltonian (all vertex) cycle, constrained to not
match w/ self or spouse. 

To use:

1. List all names of participants on "data Person" line.
2. List all couple on the couples = line.
3. Seed prng to random value (e.g., ISO date code of holiday in question.)
4. Run main.

With sample data it shows output:

Kitty -> Lydia
Lydia -> Jane
Jane -> Darcy
Darcy -> Mary
Mary -> Bingley
Bingley -> Elizabeth
Elizabeth -> Wickham
Wickham -> Kitty

meaning Kitty gets Lydia a gift, Lydia gets Jane a gift, ... , and
Wickham gets Kitty a gift.

