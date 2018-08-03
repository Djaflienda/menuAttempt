//
//  Logo.swift
//  clucky
//
//  Created by  Игорь on 19.07.2018.
//  Copyright © 2018 Igor Tumanov. All rights reserved.
//

import UIKit

class LogoBackground {
    
    static func setLogoBackground(on: UIViewController, coords: CGPoint) -> UIImageView {
        var logoBorderCircle = UIImageView()
        logoBorderCircle = UIImageView(frame: CGRect(origin: coords, size: CGSize(width: 140, height: 140)))
        logoBorderCircle.backgroundColor = UIColor.white
        logoBorderCircle.layer.opacity = 0.5
        logoBorderCircle.layer.cornerRadius = 70
        return logoBorderCircle
    }
}
