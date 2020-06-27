//
// Created by 舘佳紀 on 2020/06/27.
// Copyright (c) 2020 Yoshiki Tachi. All rights reserved.
//

import Foundation
import UIKit
class LoadingView : UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .twitterBlue
    configureUI()
  }

  let  ContextLabel : UILabel = {
    let label = UILabel()
    label.text = "Now Loading"
    label.font = UIFont(name: "Bold", size: 100)
    return label
  }()

  func configureUI(){
    view.addSubview(ContextLabel)
    ContextLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 30, paddingRight: 147, width: 100, height: 56)
    ContextLabel.layer.cornerRadius = 56/2
  }
}