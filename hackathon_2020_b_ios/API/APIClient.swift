//
// Created by 舘佳紀 on 2020/06/28.
// Copyright (c) 2020 Yoshiki Tachi. All rights reserved.
//

import Foundation
import Alamofire

struct SendData: Codable {
    let userID: Int
    let taskID: Int
    let imagePath: String

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case taskID = "task_id"
        case imagePath = "image_path"
    }
}


struct GetUser: Codable {
  let id: Int
  let comment: String
  let point: Int
  let imagePath: String
  let createdAt : Date
  let updatedAt : Date

  enum CodingKeys: String, CodingKey {
    case id, comment, point
    case imagePath = "image_path"
    case createdAt = "created_at"
    case updatedAt = "updated_at"
  }
}


class APIClient {
    
    private(set) var data : SendData?
    let url = ""


    func GetData() {
        //ここからデータ通信している
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default)
            .responseJSON{ (response) in
                switch response.result {
                //成功時に実行する内容
                case .success:
                    guard let data = response.data else { return }
                    let decoder = JSONDecoder()
                    //ここでデコードしている
                    guard let Res = try? decoder.decode(SendData.self, from: data) else { return }
                    
                //エラー処理
                case let .failure(error):
                    print(error)
                }
                
            }
    }
    
    func UpLoadPostData(postData : SendData) {
        
        let userID : String = String(postData.userID)
        let taskID : String = String(postData.taskID)
        let imagePath : String = postData.imagePath
        
        let params : [String: String] = ["user_id": userID, "task_id": taskID, "image_path": imagePath]
        //ここからデータ通信している
        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default)
            .responseJSON{ (response) in
                switch response.result {
                //成功時に実行する内容
                case .success:
                    guard let data = response.data else { return }
                    let decoder = JSONDecoder()
                    //ここでデコードしている
                    guard let Res = try? decoder.decode(SendData.self, from: data) else { return }
                    
                //エラー処理
                case let .failure(error):
                    print(error)
                }
                
            }
    }
}
