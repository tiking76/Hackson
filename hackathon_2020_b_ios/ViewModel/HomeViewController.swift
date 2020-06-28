//
//  HomeViewController.swift
//  hackathon_2020_b_ios
//
//  Created by 梶村律太 on 2020/06/27.
//  Copyright © 2020 Yoshiki Tachi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  var TimeCount = 0

  override func viewDidLoad() {
    super.viewDidLoad()

    configureUI()
  }


  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.barStyle = .default
    navigationController?.navigationBar.isHidden = true
  }


  let ContextLable : UILabel = {
    let label = UILabel()
    label.text = "勉強時間を選んでください！"
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 20)
    return label
  }()


  let HomeLabel : UILabel = {
    let label = UILabel()
    label.text = "HOME"
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 30)
    return label
  }()

  private let button1: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("30分", for: .normal)
    button.setDimensions(width: 300, height: 200)
    button.addTarget(self, action: #selector(handlebutton1), for: .touchUpInside)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .twitterBlue
    button.layer.cornerRadius = 50 / 2
    return button
  }()

  private let button2: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("60分", for: .normal)
    button.setDimensions(width: 300, height: 200)
    button.addTarget(self, action: #selector(handlebutton2), for: .touchUpInside)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .twitterBlue
    button.layer.cornerRadius = 50 / 2
    return button
  }()



  @objc func handlebutton1() {
    self.TimeCount += 30
    let controller = LoadingViewController()
    navigationController?.pushViewController(controller, animated: true)
  }

  @objc func handlebutton2() {
    self.TimeCount += 60
    let controller = LoadingViewController()
    navigationController?.pushViewController(controller, animated: true)
  }

  func configureUI(){
    view.backgroundColor = .white
    view.addSubview(HomeLabel)
    view.addSubview(ContextLable)
    view.addSubview(button1)
    view.addSubview(button2)
    HomeLabel.anchor(top: view.topAnchor, right: view.rightAnchor, paddingTop: 50, paddingRight: 170)
    HomeLabel.layer.cornerRadius = 56 / 2
    ContextLable.anchor(top: HomeLabel.topAnchor, right: view.rightAnchor, paddingTop: 80, paddingRight: 60)
    ContextLable.layer.cornerRadius = 56/2
    button1.anchor(top: ContextLable.topAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 100, paddingRight: 60)
    button2.anchor(top: button1.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 100, paddingRight: 60)
    button2.layer.cornerRadius = 56/2

  }

}


