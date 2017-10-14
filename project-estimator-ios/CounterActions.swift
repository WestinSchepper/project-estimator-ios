//  Created by Westin Schepper on 10/14/17.

import ReSwift

func counterIncrease (_ number: Int?) -> Action {
  return CounterActionIncrease(number: number ?? 1)
}

func counterDecrease (_ number: Int?) -> Action {
  return CounterActionDecrease(number: number ?? 1)
}

struct CounterActionIncrease: Action {
  let number: Int
}

struct CounterActionDecrease: Action {
  let number: Int
}
