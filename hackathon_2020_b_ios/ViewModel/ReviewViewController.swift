//
//  ReviewViewController.swift
//  hackathon_2020_b_ios
//
//  Created by 梶村律太 on 2020/06/28.
//  Copyright © 2020 Yoshiki Tachi. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

  // MARK: - Properties

  lazy var profileImageView: UIImageView = {
    let iv = UIImageView()
    iv.image = UIImage(named: "")
    iv.contentMode = .scaleAspectFill
    iv.clipsToBounds = true
    iv.backgroundColor = .lightGray
    iv.layer.borderColor = UIColor.white.cgColor
    iv.setDimensions(width: 300, height: 400)
    iv.layer.borderWidth = 3.0
    return iv
  }()

  private let messageLabel: UILabel = {
    let label = UILabel()
    label.text = "相手の成果物を評価してください"
    label.font = UIFont.boldSystemFont(ofSize: 24)
    label.textColor = .black
    return label
  }()

  private let goodButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("OK", for: .normal)
    button.setDimensions(width: 300, height: 50)
    button.addTarget(self, action: #selector(handlegood), for: .touchUpInside)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .twitterBlue
    return button
  }()

  private let badButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("NG", for: .normal)
    button.setDimensions(width: 300, height: 50)
    button.addTarget(self, action: #selector(handlegood), for: .touchUpInside)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .twitterBlue
    return button
  }()


  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }

  // MARK: - Selectors

  @objc func handlegood(){
    print("DEBUG: success")
    senderView()
  }

  @objc func handlebad(){
    print("DEBUG: success")
    senderView()
  }

  // MARK: - Helpers

  func senderView() {
    let controller = WaitingViewController2()
    navigationController?.pushViewController(controller, animated: true)
  }

  func configureUI(){
    view.backgroundColor = .white

    let stack1 = UIStackView(arrangedSubviews: [goodButton, badButton])
    stack1.axis = .vertical
    stack1.alignment = .center
    stack1.spacing = 30



    let stack = UIStackView(arrangedSubviews: [profileImageView, messageLabel, stack1])
    view.addSubview(stack)
    stack.axis = .vertical
    stack.alignment = .center
    stack.spacing = 50
    stack.anchor(top: view.topAnchor, left: view.leftAnchor, paddingTop: 50, paddingLeft: 20)
  }
}
