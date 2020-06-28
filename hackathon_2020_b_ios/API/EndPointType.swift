//
// Created by 舘佳紀 on 2020/06/28.
// Copyright (c) 2020 Yoshiki Tachi. All rights reserved.
//

import Foundation

enum EndPointType {
    case resistUser
    case getUser(user_id: Int)
    case resisterTask(user_id: Int)
    case resistDeliverable(user_id: Int, task_id: Int)
    case resistEvaluations(user_id: Int, task_id: Int, deliverable_id: Int)
    
    var path: String {
        switch self {
        case .resistUser:
            return "/users"
        case .getUser(let user_id):
            return "/users/\(user_id)"
        case .resisterTask(let user_id):
            return "/users/\(user_id)/tasks"
        case .resistDeliverable(let user_id, let task_id):
            return  "/users/\(user_id)/tasks/\(task_id)/deliverables"
        case .resistEvaluations(let user_id, let task_id, let deliverable_id):
            return  "users/\(user_id)/tasks/\(task_id)/deliverables/\(deliverable_id)/evaluations"
        }
    }
}
