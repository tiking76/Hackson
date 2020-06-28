//
// Created by 舘佳紀 on 2020/06/28.
// Copyright (c) 2020 Yoshiki Tachi. All rights reserved.
//

import Foundation

enum EndPointType : String {
  case resistUse = "/users"
  case getUser = "/users/:user_id"
  case resisterTask = "/:user_id/tasks"
  case resistTime = "/tasks"
  case resistDeliverable = "/:user_id/tasks/:task_id/deliverables"
  case resistEvaluations = "/:user_id/tasks/:task_id/deliverables/:deliverable_id/evaluations"
}