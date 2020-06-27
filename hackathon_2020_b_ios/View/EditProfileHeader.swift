//
//  EditProfileHeader.swift
//  hackathon_2020_b_ios
//
//  Created by 梶村律太 on 2020/06/27.
//  Copyright © 2020 Yoshiki Tachi. All rights reserved.
//

import UIKit
import SDWebImage

protocol EditProfileHeaderDelegate: class {
  func didTapChangeProfilePhoto()
}

class EditProfileHeader: UIView {
  // MARK: - Properties
  private let user: User
  weak var delegate: EditProfileHeaderDelegate?

  let profileImageView: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFill
    iv.clipsToBounds = true
    iv.backgroundColor = .lightGray
    iv.layer.borderColor = UIColor.white.cgColor
    iv.layer.borderWidth = 3.0
    return iv
  }()

  private let changePhotoButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Change Profile Photo", for: .normal)
    button.addTarget(self, action: #selector(handleChangeProfilePhoto), for: .touchUpInside)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.setTitleColor(.white, for: .normal)
    return button
  }()

  // MARK: - Lifecycle

  init(user: User) {
    self.user = user
    super.init(frame: .zero)

    backgroundColor = .twitterBlue

    addSubview(profileImageView)
    profileImageView.center(inView: self, yConstant: -16)
    profileImageView.setDimensions(width: 100, height: 100)
    profileImageView.layer.cornerRadius = 100 / 2

    addSubview(changePhotoButton)

    changePhotoButton.centerX(inView: self, topAnchor: profileImageView.bottomAnchor, paddingTop: 8)

    profileImageView.sd_setImage(with: user.image)

  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  // MARK: - Selector

  @objc func handleChangeProfilePhoto() {
    delegate?.didTapChangeProfilePhoto()
  }
}
