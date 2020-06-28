//
// Created by 舘佳紀 on 2020/06/27.
// Copyright (c) 2020 Yoshiki Tachi. All rights reserved.
//

//
//  MyPageViewController.swift
//  hackathon_2020_b_ios
//
//  Created by 梶村律太 on 2020/06/27.
//  Copyright © 2020 Yoshiki Tachi. All rights reserved.
//
import UIKit

class MyPageViewController: UIViewController {

  // MARK: - Properties

  var label : String?

  private var user: User?

  private lazy var containerView: UIView = {
    let view = UIView()
    view.backgroundColor = .twitterBlue
    return view
  }()

    var profileImageView: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFit
    iv.clipsToBounds = true
    iv.backgroundColor = .lightGray
    iv.layer.borderColor = UIColor.white.cgColor
    iv.layer.borderWidth = 4
    return iv
  }()

  lazy var editProfileFollowButton: UIButton = {
    let button = UIButton(type: .system)
    button.layer.borderColor = UIColor.twitterBlue.cgColor
    button.layer.borderWidth = 1.25
    button.setTitle("Loading", for: .normal)
    button.setTitleColor(.twitterBlue, for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.addTarget(self, action: #selector(handleEditProfile), for: .touchUpInside)
    return button
  }()
  var fullnameLabel: UILabel = {
    let label = UILabel()
    label.text = "namae"
    label.font = UIFont.boldSystemFont(ofSize: 20)
    return label
  }()
  var usernameLabel: UILabel = {
    let label = UILabel()
    label.text = "namae"
    label.font = UIFont.systemFont(ofSize: 16)
    label.textColor = .lightGray
    return label
  }()
  var bionameLabel: UILabel = {
    let label = UILabel()
    label.text = "namae"
    label.font = UIFont.systemFont(ofSize: 16)
    label.numberOfLines = 3
    return label
  }()

  private let followingLabel: UILabel = {
    let label = UILabel()
    label.text = "namae"
    return label
  }()

  private let followersLabel: UILabel = {
    let label = UILabel()
    label.text = "namae"
    return label
  }()


  // MARK: - Lifecycle

  override func viewDidLoad(){
    super.viewDidLoad()
    configureUI()
    user = User(id: "", name: "", comment: "")
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.barStyle = .default
    navigationController?.navigationBar.isHidden = true
  }
        



  // MARK: - Selectors

  @objc func handleEditProfile(){
    guard let user = user else { return }
    let controller = EditProfileController(user: user)
    navigationController?.pushViewController(controller, animated: true)
  }


  // MARK: - Helpers

  func configureUI(){
    view.backgroundColor = .white


    view.addSubview(containerView)
    containerView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 108)

    view.addSubview(profileImageView)
    profileImageView.anchor(top: containerView.bottomAnchor,left: view.leftAnchor,
            paddingTop: -24, paddingLeft: 8)
    profileImageView.setDimensions(width: 80, height: 80)
    profileImageView.layer.cornerRadius = 80 / 2

    view.addSubview(editProfileFollowButton)
    editProfileFollowButton.anchor(top: containerView.bottomAnchor,
            right: view.rightAnchor,paddingTop: 12,paddingRight: 12)

    editProfileFollowButton.setDimensions(width: 100, height: 36)
    editProfileFollowButton.layer.cornerRadius = 36 / 2


    let userDetailsStack = UIStackView(arrangedSubviews: [fullnameLabel,usernameLabel,bionameLabel])

    userDetailsStack.axis = .vertical
    userDetailsStack.distribution = .fillProportionally
    userDetailsStack.spacing = 4

    view.addSubview(userDetailsStack)
    userDetailsStack.anchor(top: profileImageView.bottomAnchor, left: view.leftAnchor,
            right: view.rightAnchor, paddingTop: 8,paddingLeft: 12,paddingRight: 12)
  }

}
