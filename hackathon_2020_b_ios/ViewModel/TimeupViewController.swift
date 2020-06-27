//
//  TimeUpViewController.swift
//  hackathon_2020_b_ios
//
//  Created by 舘佳紀 on 2020/06/27.
//  Copyright © 2020 Yoshiki Tachi. All rights reserved.
//

import UIKit

class TimeUpViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationBarDelegate, UINavigationControllerDelegate {
    
  let client = APIClient()
  var timeUpCount = 0
  let userTimer:Int = 1

  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
    createTimer()
    // Do any additional setup after loading the view.
  }

  let TitleLabel : UILabel = {
    let label = UILabel()
    label.text = "Time Up!"
    label.font = .boldSystemFont(ofSize: 32)
    return label
  }()

  let LimitLabel : UILabel = {
    let label = UILabel()
    label.text = "制限時間"
    label.font = .boldSystemFont(ofSize: 32)
    return label
  }()

  lazy var CountLabel : UILabel = {
    let label = UILabel()
    label.text = "\(self.timeUpCount)"
    label.font = .boldSystemFont(ofSize: 32)
    return label
  }()

  let UpLoadPicture : UIImageView = {
    let image = UIImageView()
    image.contentMode = .scaleAspectFit
    image.clipsToBounds = true
    image.backgroundColor = .lightGray
    image.layer.borderColor = UIColor.white.cgColor
    image.layer.borderWidth = 4
    return image
  }()

  let UpLoadButton : UIButton = {
    let button = UIButton()
    button.tintColor = .white
    button.backgroundColor = .twitterBlue
    button.setTitle("写真をアップロードする", for: .normal)
    button.addTarget(self, action: #selector(UpLoadTapped), for: .touchUpInside)
    return button
  }()

let SendButton : UIButton = {
    let button = UIButton()
    button.tintColor = .white
    button.backgroundColor = .twitterBlue
    button.setTitle("相手に送信する", for: .normal)
    button.addTarget(self, action: #selector(SendTapped), for: .touchUpInside)
    return button
  }()


  @objc func UpLoadTapped() {
    //post(self.UpLoadPicture)
    //prepare(for: LoadingView, sender: nil)
    let sourceType:UIImagePickerController.SourceType = UIImagePickerController.SourceType.photoLibrary
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
      // インスタンスの作成
      let cameraPicker = UIImagePickerController()
      cameraPicker.sourceType = sourceType
      //課題１・selfが呼べない
      cameraPicker.delegate = self
      //アルバム画面を開く
      self.present(cameraPicker, animated: true, completion: nil)
    }
  }

  func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    //imageにアルバムで選択した画像が格納される
    if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
      //ImageViewに表示
      self.UpLoadPicture.image = image
      //アルバム画面を閉じる
      self.dismiss(animated: true, completion: nil)
    }
  }


//Todo ソケット通信とhttp通信の実行
  @objc func SendTapped() {
    //APIClient.UpLoadPostData()
    senderView()
  }

  func senderView() {
    let controller = WaitingViewController()
    //controller.count = timeUpCount
    navigationController?.pushViewController(controller, animated: true)
  }

//タイマー作成
  func createTimer(){
    //デバック用に10秒
    timeUpCount = userTimer * 60

    let timer = Timer.scheduledTimer(timeInterval: 1.0,
            target: self,
            selector: #selector(self.timerAction(sender:)),
            userInfo: nil,
            repeats: true)
    timer.fire()
  }

  //タイマーの処理
  @objc func timerAction(sender:Timer){
    CountLabel.text = String(timeUpCount)
    if timeUpCount == 0{
      sender.invalidate() //止める
    }
    self.timeUpCount -= 1
  }


  func configureUI(){
    view.backgroundColor = .white
    view.addSubview(TitleLabel)
    view.addSubview(LimitLabel)
    view.addSubview(CountLabel)
    view.addSubview(UpLoadPicture)
    view.addSubview(UpLoadButton)
    view.addSubview(SendButton)
    TitleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 30, paddingRight: 140, width: 150, height: 56)
    LimitLabel.anchor(top: TitleLabel.safeAreaLayoutGuide.topAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 50, paddingRight: 15, width: 265, height: 56)
    CountLabel.anchor(top: LimitLabel.safeAreaLayoutGuide.topAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 50, paddingRight: 140, width: 100, height: 56)
    UpLoadPicture.anchor(top: CountLabel.safeAreaLayoutGuide.topAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 90, paddingRight: 90, width: 250, height: 250)
    UpLoadButton.anchor(top: UpLoadPicture.safeAreaLayoutGuide.topAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 250,paddingRight: 60, width: 300, height: 80)
    UpLoadButton.layer.cornerRadius = 56/2
    SendButton.anchor(top: UpLoadButton.safeAreaLayoutGuide.topAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 120,paddingRight: 60, width: 300, height: 80)
    SendButton.layer.cornerRadius = 56/2
  }

}
