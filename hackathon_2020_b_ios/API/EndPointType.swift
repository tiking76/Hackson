//
// Created by 舘佳紀 on 2020/06/28.
// Copyright (c) 2020 Yoshiki Tachi. All rights reserved.
//

import Foundation

enum EndPointType : String {
  case resistUse = "/users"
  case getUser = "/users/:id"
  case resistTime = "/tasks"
  case resistDeliverable = "/deliverables"
  case resistEvaluations = "/evaluations"
}