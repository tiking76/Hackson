
//  WaitingViewController.swift
//  hackathon_2020_b_ios
//
//  Created by 梶村律太 on 2020/06/27.
//  Copyright © 2020 Yoshiki Tachi. All rights reserved.
//
​
import UIKit
​
class WaitingViewController: ViewController {

  // MARK: - Properties
  private let state1label: UILabel = {
    let label = UILabel()
    label.text = "制限時間"
    label.textColor = .black
    label.font = UIFont.systemFont(ofSize: 20)
    return label
  }()

  lazy var timeLabel: UILabel = {
    let label = UILabel()
    label.text = "60"
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 40)
    return label
  }()

  private let state2label: UILabel = {
    let label = UILabel()
    label.text = "相手が送信するのを待っています！"
    label.textColor = .black
    label.font = UIFont.systemFont(ofSize: 20)
    return label
  }()
  // MARK: - LifeCycle

  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }

  // MARK: - Helpers
  func configureUI(){
    view.backgroundColor = .white

    view.addSubview(state1label)
    state1label.anchor(top:view.topAnchor, left: view.leftAnchor, paddingTop: 200, paddingLeft: 160)
    view.addSubview(timeLabel)
    timeLabel.anchor(top:state1label.bottomAnchor, left: view.leftAnchor, paddingTop: 80, paddingLeft: 180)
    view.addSubview(state2label)
    state2label.anchor(top:timeLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 200, paddingLeft: 60)
    ​
  }
}