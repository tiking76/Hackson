//
//  ResultViewController.swift
//  hackathon_2020_b_ios
//
//  Created by 梶村律太 on 2020/06/28.
//  Copyright © 2020 Yoshiki Tachi. All rights reserved.
//
import UIKit

class ResultViewController: ViewController{

  // MARK: - Properties

  private let message1Label: UILabel = {
    let label = UILabel()
    label.text = "お疲れ様です！"
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 24)
    return label
  }()

  private let message2Label: UILabel = {
    let label = UILabel()
    label.text = "よく頑張りましたね！"
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 24)
    return label
  }()
  private let message3Label: UILabel = {
    let label = UILabel()
    label.text = "基礎点"
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 24)
    return label
  }()


  private let message4Label: UILabel = {
    let label = UILabel()
    label.text = "ボーナス"
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 24)
    return label
  }()

  private let message5Label: UILabel = {
    let label = UILabel()
    label.text = "×"
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 24)
    return label
  }()

  private let message6Label: UILabel = {
    let label = UILabel()
    label.text = "="
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 24)
    return label
  }()


  lazy var pointCount1Label: UILabel = {
    let label = UILabel()
    label.text = "30"
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 48)
    return label
  }()

  lazy var pointCount2Label: UILabel = {
    let label = UILabel()
    label.text = "30"
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 48)
    return label
  }()


  lazy var pointCount3Label: UILabel = {
    let label = UILabel()
    label.text = "900"
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 64)
    return label
  }()

  private let pointLabel: UILabel = {
    let label = UILabel()
    label.text = "POINT GET"
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 24)
    return label
  }()

  private let backButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("ホームに戻る", for: .normal)
    button.setDimensions(width: 300, height: 50)
    button.layer.cornerRadius = 50 / 2
    button.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .twitterBlue
    return button
  }()

  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    congigureUI()
  }

  // MARK: - Selectors

  @objc func handleBack(){
    let controller = HomeViewController()
    navigationController?.pushViewController(controller, animated: true)
  }

  // MARK: - Helpers

  func congigureUI(){
    view.backgroundColor = .white

    view.addSubview(message1Label)
    message1Label.anchor(top:view.topAnchor, left: view.leftAnchor, paddingTop: 50, paddingLeft: 140)

    view.addSubview(message2Label)
    message2Label.anchor(top:message1Label.bottomAnchor, left: view.leftAnchor, paddingTop: 3, paddingLeft: 100)

    let stack1 = UIStackView(arrangedSubviews: [message3Label,pointCount1Label])
    stack1.axis = .vertical
    stack1.spacing = 10
    view.addSubview(stack1)
    stack1.anchor(top:message2Label.bottomAnchor, left: view.leftAnchor, paddingTop: 30, paddingLeft: 60)

    let stack2 = UIStackView(arrangedSubviews: [message4Label,pointCount2Label])
    stack2.axis = .vertical
    stack2.spacing = 10
    view.addSubview(stack2)
    stack2.anchor(top:message2Label.bottomAnchor, left: stack1.rightAnchor, paddingTop: 30, paddingLeft: 100)

    view.addSubview(message1Label)
    message1Label.anchor(top:view.topAnchor, left: view.leftAnchor, paddingTop: 200, paddingLeft: 140)

    view.addSubview(message5Label)
    message5Label.anchor(left: stack1.rightAnchor, bottom: stack1.bottomAnchor, paddingLeft: 40, paddingBottom: 10)

    view.addSubview(message6Label)
    message6Label.anchor(left: stack2.rightAnchor, bottom: stack1.bottomAnchor, paddingLeft: 20, paddingBottom: 10)

    view.addSubview(pointCount3Label)
    pointCount3Label.anchor(top: stack1.bottomAnchor, left: view.leftAnchor, paddingTop: 60, paddingLeft: 100)
    view.addSubview(pointLabel)
    pointLabel.anchor(left: pointCount3Label.rightAnchor, bottom: pointCount3Label.bottomAnchor, paddingLeft: 10, paddingBottom: 10)

    view.addSubview(backButton)
    backButton.anchor(top: pointLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 150, paddingLeft: 60)


  }

}