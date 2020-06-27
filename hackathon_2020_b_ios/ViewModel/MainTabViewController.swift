
//  MainTabViewController.swift
//  hackathon_2020_b_ios
//
//  Created by 梶村律太 on 2020/06/27.
//  Copyright © 2020 Yoshiki Tachi. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController {

    // MARK: - Properties


    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        guard let nav = viewControllers?[0] as? UINavigationController else { return }
        guard let home = nav.viewControllers.first as? HomeViewController else { return }
    }
    // MARK: - API
    


//    func authenticateUserAndConfigureUI() {
//        if Auth.auth().currentUser == nil {
//            DispatchQueue.main.async {
//                let nav = UINavigationController(rootViewController: LoginController())
//                nav.modalPresentationStyle = .fullScreen
//                self.present(nav,animated: true,completion: nil)
//            }
//        }else{
//            configureViewController()
//            configureUI()
//            fetchUser()
//        }
//    }

    // MARK: - Selectors


    // MARK: - Helpers
//    func configureUI(){
//
//    }
//
//
    func configureViewController() {
        let home = HomeViewController()
        let nav1 = templeteNavigationController(image: UIImage(named: "home_unselected")!, rootViewController: home)
        let mypage = MyPageViewController()
        let nav2 = templeteNavigationController(image: UIImage(named: "ic_person_outline_white_2x")!, rootViewController: mypage)
        
        
        
        viewControllers = [nav1, nav2]
    }
        
    func templeteNavigationController(image:UIImage,rootViewController:UIViewController)->UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        return nav
    }
}
