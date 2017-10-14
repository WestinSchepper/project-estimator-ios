//  Created by Westin Schepper on 10/14/17.

import ReSwift

func counterReducer(action: Action, state: AppState?) -> AppState {
  var state = state ?? AppState()

  switch action {

  case let action as CounterActionIncrease:
    state.counter += action.number
  case let action as CounterActionDecrease:
    state.counter -= action.number
  default:
    break
  }

  return state
}
