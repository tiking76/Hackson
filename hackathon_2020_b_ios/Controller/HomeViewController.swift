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
    view.backgroundColor = .twitterBlue
    configureUI()
  }


  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.barStyle = .default
    navigationController?.navigationBar.isHidden = true
  }


  let HomeLabel : UILabel = {
    let label = UILabel()
    label.text = "HOME"
    label.font = UIFont(name: "HiraMinProN-W3", size: 20)
    return label
  }()

  let TimerButton30: UIButton = {
    let button = UIButton(type: .system)
    button.tintColor = .white
    button.backgroundColor = .red
    button.setTitle("30分", for: .normal)
    button.addTarget(self, action: #selector(ButtonTapped30), for: .touchUpInside)
    return button
  }()


  let TimerButton60: UIButton = {
    let button = UIButton(type: .system)
    button.tintColor = .white
    button.backgroundColor = .black
    button.setTitle("60分", for: .normal)
    button.addTarget(self, action: #selector(ButtonTapped60), for: .touchUpInside)
    return button
  }()



  @objc func ButtonTapped30() {
    self.TimeCount += 30
    ///prepare(for: loadingView, sender: nil)
  }

  @objc func ButtonTapped60() {
    self.TimeCount += 60
    //prepare(for: loadingView, sender: nil)
  }

  func configureUI(){
    view.addSubview(HomeLabel)
    view.addSubview(TimerButton30)
    view.addSubview(TimerButton60)
    HomeLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 30, paddingRight: 160, width: 100, height: 56)
    HomeLabel.layer.cornerRadius = 56/2
    TimerButton30.anchor(top: HomeLabel.safeAreaLayoutGuide.topAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 100, paddingRight: 160, width: 100, height: 56)
    TimerButton30.layer.cornerRadius = 56/2
    TimerButton60.anchor(top: TimerButton30.safeAreaLayoutGuide.topAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 200, paddingRight: 160, width: 100, height: 56)
    TimerButton60.layer.cornerRadius = 56/2

  }

}


