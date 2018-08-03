//
//  ViewController.swift
//  clucky
//
//  Created by  Игорь on 16.07.2018.
//  Copyright © 2018 Igor Tumanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var logoImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(LogoBackground.setLogoBackground(on: self, coords: CGPoint(x: self.view.frame.width / 2 - 70, y:  125)))
        logoImage = UIImageView(frame: CGRect(origin: CGPoint(x: view.frame.width / 2 - 45, y: 130), size: CGSize(width: 102, height: 130)))
        logoImage.backgroundColor = UIColor(patternImage: UIImage(named: "logo")!)
        view.addSubview(logoImage)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

