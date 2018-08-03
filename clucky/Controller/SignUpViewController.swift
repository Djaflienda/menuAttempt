//
//  SignUpViewController.swift
//  clucky
//
//  Created by  Игорь on 19.07.2018.
//  Copyright © 2018 Igor Tumanov. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let backButton = UIButton()
        backButton.setImage(UIImage(named: "arrow-left-in-circle"), for: .normal)
        backButton.frame = CGRect(x: 26.67, y: 30, width: 25, height: 25)
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        view.addSubview(backButton)
    }
    
    @objc func backButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
}
