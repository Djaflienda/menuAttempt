//
//  LeaderboardView.swift
//  clucky
//
//  Created by  Игорь on 19.07.2018.
//  Copyright © 2018 Igor Tumanov. All rights reserved.
//

import UIKit

class LeaderboardView: UIViewController, SlideMenuDelegate {

    let menu = LeftSlideMenu()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navigationBarBackground.png"), for: .default)
        
        navigationItem.rightBarButtonItem = NavigationButton.createNavigationButtonOf(type: .menuButton, with: #selector(menuPressed), on: self)

        menu.delegate = self
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
