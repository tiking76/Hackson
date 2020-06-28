//
//  MatchingViewController.swift
//  hackathon_2020_b_ios
//
//  Created by 梶村律太 on 2020/06/27.
//  Copyright © 2020 Yoshiki Tachi. All rights reserved.
//

import UIKit

class MatchingViewController: ViewController {
  // MARK: - Properties

  let profileImageView: UIImageView = {
    let iv = UIImageView()
    iv.image = UIImage(named: "minomonnta")
    iv.contentMode = .scaleAspectFill
    iv.clipsToBounds = true
    iv.backgroundColor = .lightGray
    iv.layer.borderColor = UIColor.white.cgColor
    iv.layer.borderWidth = 3.0
    return iv
  }()

  private let messageLabel: UILabel = {
    let label = UILabel()
    label.text = "マッチングしました"
    label.textColor = .black
    label.font = UIFont.systemFont(ofSize: 24)
    return label
  }()
    
    
  private let nextButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("次へ", for: .normal)
    button.setDimensions(width: 300, height: 50)
    button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.setTitleColor(.blue, for: .normal)
    button.backgroundColor = .white
    return button
  }()

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }

  // MARK: - Selectors

  @objc func handleNext(){
        let controller = CountDownViewController()
        navigationController?.pushViewController(controller, animated: true)
  }

  // MARK: - Helper

  func configureUI(){
    view.backgroundColor = .white
    view.addSubview(profileImageView)

    profileImageView.setDimensions(width: 100, height: 100)
    profileImageView.layer.cornerRadius = 100 / 2
    profileImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, paddingTop: 300, paddingLeft: 150)

    view.addSubview(messageLabel)
    messageLabel.anchor(top:profileImageView.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor,paddingTop: 100, paddingLeft: 95)

    view.addSubview(nextButton)
    nextButton.anchor(top: messageLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor,paddingTop: 100,paddingLeft: 55)

  }
}
