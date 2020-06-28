
// Created by 舘佳紀 on 2020/06/27.
// Copyright (c) 2020 Yoshiki Tachi. All rights reserved.
//
import UIKit

class LoadingViewController: UIViewController {

  // MARK: - Properties

  let ContextLabel : UILabel = {
    let label = UILabel()
    label.text = "Now Loading"
    label.font = UIFont(name: "Bold", size: 100)
    return label
  }()

  var activityIndicatorView: UIActivityIndicatorView = {
    let activityIndicatorView = UIActivityIndicatorView()
    activityIndicatorView.style = .whiteLarge //スタイル設定。他に、gray,whiteが選べる
    return activityIndicatorView
  }()

  private let nextButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("次へ", for: .normal)
    button.setDimensions(width: 300, height: 50)
    button.layer.cornerRadius = 50 / 2
    button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .twitterBlue
    return button
  }()


  // MARK: - Lifecycle

  override func viewDidLoad(){
    super.viewDidLoad()
    view.backgroundColor = .white
    configureUI()
  }
  // MARK: - Selectors

  @objc func handleNext(){
    let controller = MatchingViewController()
    navigationController?.pushViewController(controller, animated: true)
  }

  // MARK: - Helpers
  func configureUI(){
    view.addSubview(ContextLabel)
    ContextLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor,
            right: view.safeAreaLayoutGuide.rightAnchor,
            paddingTop: 50, paddingRight: 147, width: 100, height: 56)
    ContextLabel.layer.cornerRadius = 56/2

    view.addSubview(activityIndicatorView)
    activityIndicatorView.anchor(top:ContextLabel.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 50, paddingRight: 180)

    activityIndicatorView.color = .gray //色設定
    activityIndicatorView.startAnimating() //ローディング(くるくる)をまわす

    activityIndicatorView.hidesWhenStopped = true //ローディング止まった時、indicator消す(隠す)
    if activityIndicatorView.isAnimating { //ローディングしてるか確認
      print("ロード中")
    }
    view.addSubview(nextButton)
    nextButton.anchor(top:ContextLabel.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 300, paddingRight: 55)
  }

}
