Feature: code-breaker submits guess

  The code-breaker submits a guess of four numbrs. The game marks the guess with + and - signs.

  For each number in the guess that matches the number and postiion of a number int eh secret code, the mark includes one +. For each number in the guess that matches the number but not the position of a number int eh secret code, a - is added to the mark.

  Each position in teh secret code can only be matched once. For example, a guess of 1134 against a secret code of 1234 would get three plus signs: one for each of the exact matcehs in the first, third and fourth positions. the number match in the second position would be ignored.

  Scenario Outline: submit guess
    Given the secret code is "<code>"
    When I guess "<guess>"
    Then the mark should be "<mark>"

  Scenarios: all numbers correct
    | code | guess | mark |
    | 1234 | 1234  | ++++ |
    | 1234 | 1243  | ++-- |
    | 1234 | 1423  | +--- |
    | 1234 | 4321  | ---- |

  Scenarios: no matches
    | code | guess | mark |
    | 1234 | 5555  |      |

  Scenarios: 1 numbers correct
    | code | guess | mark |
    | 1234 | 1555  | +    |
    | 1234 | 2555  | -    |
    | 1234 | 5255  | +    |
    | 1234 | 5535  | +    |
    | 1234 | 5554  | +    |
    | 1234 | 1111  | +--- |
    #| 1234 | 2222  | -+-- | --> OFF THE GRID TEST. this will not pass. The algorithm will return  +--- in current version, which looks like the 2 should be placed in position 1 (that's the book algorithm so far. will see if they improve it further down)

  Scenarios: 2 numbers correct
    | code | guess | mark |
    | 1234 | 5254  | ++   |
    | 1234 | 5154  | +-   |
    | 1234 | 2545  | --   |

  Scenarios: 3 numbers correct
    | code | guess | mark |
    | 1234 | 5234  | +++  |
    | 1234 | 5134  | ++-  |
    | 1234 | 5124  | +--  |
    | 1234 | 5123  | ---  |

  Scenarios: all numbers correct
    | code | guess | mark |
    | 1234 | 1234  | ++++ |
    | 1234 | 1243  | ++-- |
    | 1234 | 1423  | +--- |
    | 1234 | 4321  | ---- |
    #| 1234 | 1324  | +--+ | --> OFF THE GRID TEST. Not really how the game works but that would be nice to have a better clue onto which number is actually + and - in the order we typed those in (same issue as above).

  Scenarios: matches with duplicates
    | code | guess | mark |
    | 1234 | 1155  | +    |
    | 1234 | 5115  | -    |
    | 1134 | 1155  | ++   |
    | 1134 | 5115  | +-   |
    | 1134 | 5511  | --   |
    | 1134 | 1115  | ++   |
    | 1134 | 5111  | +-   |
