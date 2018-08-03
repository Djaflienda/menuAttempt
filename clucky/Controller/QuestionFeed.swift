//
//  QuestionFeedTableViewController.swift
//  clucky
//
//  Created by  Игорь on 16.07.2018.
//  Copyright © 2018 Igor Tumanov. All rights reserved.
//

import UIKit

class QuestionFeed: UITableViewController, SlideMenuDelegate {

    
    
    
    let menu = LeftSlideMenu()

    var slideMenu = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navigationBarBackground.png"), for: .default)
        
        navigationItem.rightBarButtonItem = NavigationButton.createNavigationButtonOf(type: .menuButton, with: #selector(menuPressed), on: self)
        navigationItem.leftBarButtonItem = NavigationButton.createNavigationButtonOf(type: .backButton, with: #selector(filterPressed), on: self)

        
        //setting an background image to UITableViewController
        let tempImageView = UIImageView(image: UIImage(named: "background"))
        tempImageView.frame = tableView.frame
        tableView.backgroundView = tempImageView;

        menu.delegate = self
    }
    
    @objc func menuPressed() {
        
        menu.menuPressed(on: navigationController)
    }
    
    @objc func filterPressed() {
        menu.filterPressed(on: navigationController)
    }
    
    func menuButtonTapped(_ sender: UIButton) {
        if sender.titleLabel?.text != "Log out" {
            navigationController?.present(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: menu.arrayButtonsCaption[sender.tag]), animated: true, completion: nil)
        } else {
            navigationController?.present(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "First view"), animated: true, completion: nil)
        }
    }
}

extension QuestionFeed {
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 50
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "questionCell", for: indexPath)
        
        cell.backgroundColor = UIColor.clear
        return cell
    }
}
