//
//  TimeUpViewController.swift
//  hackathon_2020_b_ios
//
//  Created by 舘佳紀 on 2020/06/27.
//  Copyright © 2020 Yoshiki Tachi. All rights reserved.
//

import UIKit

class TimeUpViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationBarDelegate {

  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
    // Do any additional setup after loading the view.
  }

  let ContextLabel : UILabel = {
    let label = UILabel()
    label.text = "Time Up!"
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
    button.backgroundColor = .black
    button.setTitle("写真をアップロードする", for: .normal)
    button.addTarget(self, action: #selector(UpLoadTapped), for: .touchUpInside)
    return button
  }()

  let SendButton : UIButton = {
    let button = UIButton()
    button.tintColor = .white
    button.backgroundColor = .black
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
      cameraPicker.delegate = .some(<#T##(UIImagePickerControllerDelegate & UINavigationControllerDelegate)##(UIKit.UIImagePickerControllerDelegate & UIKit.UINavigationControllerDelegate)#>)
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


  @objc func SendTapped() {
    //post(self.UpLoadPicture)
    //prepare(for: LoadingView, sender: nil)
  }





  func configureUI(){

  }



}
