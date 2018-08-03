//
//  ProfileView.swift
//  clucky
//
//  Created by  Игорь on 18.07.2018.
//  Copyright © 2018 Igor Tumanov. All rights reserved.
//

import UIKit

class ProfileView: UIViewController, SlideMenuDelegate {

    let menu = LeftSlideMenu()
    var profileImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navigationBarBackground.png"), for: .default)
        
        navigationItem.rightBarButtonItem = NavigationButton.createNavigationButtonOf(type: .menuButton, with: #selector(menuPressed), on: self)

        view.addSubview(LogoBackground.setLogoBackground(on: self, coords: CGPoint(x: 50, y: 100)))
        profileImage = UIImageView(frame: CGRect(origin: CGPoint(x: 55, y: 105), size: CGSize(width: 130, height: 130)))
        profileImage.backgroundColor = UIColor(patternImage: UIImage(named: "profileImage")!)
        profileImage.layer.cornerRadius = 65
        view.addSubview(profileImage)
        
        view.addSubview(NavigationButton.createMoreInfoButton(with: CGPoint(x: view.frame.width / 2 - 20, y: 550), sized: CGSize(width: 40, height: 40), with: #selector(showMoreInfo), on: self))
        
        menu.delegate = self
    }
    
    @objc func showMoreInfo() {
        performSegue(withIdentifier: "More info", sender: self)
    }
    
    @objc func menuPressed() {
        menu.menuPressed(on: navigationController)
    }

    func menuButtonTapped(_ sender: UIButton) {
        if sender.titleLabel?.text != "Log out" {
            navigationController?.present(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: menu.arrayButtonsCaption[sender.tag]), animated: true, completion: nil)
        } else {
            navigationController?.present(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "First view"), animated: true, completion: nil)
        }
    }
}
