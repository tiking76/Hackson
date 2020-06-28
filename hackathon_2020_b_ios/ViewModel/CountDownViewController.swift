//
//  CountDownViewController.swift
//  hackathon_2020_b_ios
//
//  Created by 舘佳紀 on 2020/06/28.
//  Copyright © 2020 Yoshiki Tachi. All rights reserved.
//

import UIKit

class CountDownViewController: UIViewController {

    var min = 1
    var sec = 10
    var tmp = 10


    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        createTimer()
    }
    
    let ContextLabel : UILabel = {
        let label = UILabel()
        label.text = "この画面のまま！"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()

    lazy var  MinDownLabel : UILabel = {
        let label = UILabel()
        label.text = "\(self.min)"
        label.font = .boldSystemFont(ofSize: 100)
        return label
    }()

    let ColonLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 200)
        return label
    }()

    lazy var  SecDownLabel : UILabel = {
        let label = UILabel()
        label.text = "\(self.sec)"
        label.font = .boldSystemFont(ofSize: 100)
        return label
    }()

    //タイマー作成
    func createTimer(){
        let timer = Timer.scheduledTimer(timeInterval: 1.0,
                target: self,
                selector: #selector(self.timerAction(sender:)),
                userInfo: nil,
                repeats: true)
        timer.fire()
    }

    //タイマーの処理
    @objc func timerAction(sender:Timer){
        MinDownLabel.text = String(min)
        SecDownLabel.text = String(sec)


        if sec == 0{
            if min > 0{
                min -= 1
            }
            if min <= 0 {
                tmp -= 1
                MinDownLabel.text = "0\(tmp)"
                if tmp == 0 {
                    sender.invalidate() //止める
                    senderView()
                }
            }
        }else {
            sec -= 1
        }
    }


    func senderView() {
        let controller = TimeUpViewController()
        navigationController?.pushViewController(controller, animated: true)
    }

// MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
        view.addSubview(ContextLabel)
        view.addSubview(MinDownLabel)
        view.addSubview(ColonLabel)
        view.addSubview(SecDownLabel)
        ContextLabel.anchor(top:view.topAnchor, left: view.leftAnchor, paddingTop: 200, paddingLeft: 140)
        MinDownLabel.anchor(top:ColonLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 400, paddingLeft: 100)
        ColonLabel.anchor(top:ColonLabel.bottomAnchor, left: MinDownLabel.leftAnchor, paddingTop: 400, paddingLeft: 60)
        SecDownLabel.anchor(top:ColonLabel.bottomAnchor, left: ColonLabel.leftAnchor, paddingTop: 400, paddingLeft: 60)
    }
}
