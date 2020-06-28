//
//  CountDownViewController.swift
//  hackathon_2020_b_ios
//
//  Created by 舘佳紀 on 2020/06/28.
//  Copyright © 2020 Yoshiki Tachi. All rights reserved.
//

import UIKit

class CountDownViewController: UIViewController {

    var min = 0
    var sec = 0
    var tmp = 5


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
        label.text = "0\(self.min)"
        label.font = .boldSystemFont(ofSize: 80)
        return label
    }()

    let ColonLabel: UILabel = {
        let label = UILabel()
        label.text = ":"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 80)
        return label
    }()

    lazy var  SecDownLabel : UILabel = {
        let label = UILabel()
        label.text = "\(self.sec)"
        label.font = .boldSystemFont(ofSize: 80)
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
        MinDownLabel.text = "0"+String(min)
        SecDownLabel.text = String(sec)


        if sec == 0{
            if min > 0{
                min -= 1
            }
            if min < 10 {
                tmp -= 1
                MinDownLabel.text = "0\(min)"
                SecDownLabel.text = "0\(tmp)"
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
        ContextLabel.anchor(top:view.topAnchor, left: view.leftAnchor, paddingTop: 200, paddingLeft: 140)
        let stackView = UIStackView(arrangedSubviews: [MinDownLabel, ColonLabel, SecDownLabel])
        view.addSubview(stackView)
        stackView.anchor(top:view.topAnchor, left: view.leftAnchor, paddingTop: 300, paddingLeft: 50)
        stackView.axis = .horizontal
        stackView.spacing = 30

    }
}

