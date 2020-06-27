//
//  User.swift
//  hackathon_2020_b_ios
//
//  Created by 梶村律太 on 2020/06/27.
//  Copyright © 2020 Yoshiki Tachi. All rights reserved.
//
import Foundation
struct User{
  var id: String
  var name: String
  var comment: String
  var image: URL?
  var created_at: Date?
  var updated_at: Date?

  init(id: String, name: String, comment: String) {
    self.id = id
    self.name = name
    self.comment = comment

    if let imageString = image as? String{
      guard let url = URL(string: imageString) else { return }
      self.image = URL(string: imageString)
    }
  }
}
