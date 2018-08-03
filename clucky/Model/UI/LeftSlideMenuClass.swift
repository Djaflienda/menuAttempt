//
//  LeftSlideMenuClass.swift
//  clucky
//
//  Created by  Игорь on 18.07.2018.
//  Copyright © 2018 Igor Tumanov. All rights reserved.
//

import Foundation
import UIKit

protocol SlideMenuDelegate {
    func menuButtonTapped(_ sender: UIButton)
}

class LeftSlideMenu: UIViewController {
    
    var delegate: SlideMenuDelegate?
    
    var backgroundAlpha = UIView()
    var closeButton = UIButton()
    var menuView = UIView()
    
    var menuButtonsArray = [UIButton]()
    var arrayButtonsCaption = ["Profile", "Questions feed", "My questions", "My answers", "Leaderboard", "Settings", "Log out"]
    var arrayOfLinesUnderButtons = [UIImageView]()
    let arrayOfButtonImagesNames = ["home", "home", "home", "home", "home", "home", "home"]
    var arrayOfButtonImages = [UIImageView]()
    
    //ЧТО ТО ТУТ КАЖЕТСЯ СТОИТ ПЕРЕДЕЛАТЬ=))
    @ objc func menuPressed(on: UINavigationController?) {

        backgroundAlpha = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: self.view.frame.width, height: self.view.frame.height)))
        backgroundAlpha.backgroundColor = UIColor(red: 0.318, green: 0.305, blue: 0.623, alpha: 0.8)
        on?.view.addSubview(backgroundAlpha)

        menuView = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: self.view.frame.width - 50, height: self.view.frame.height)))
        menuView.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.4)
        menuView.layer.shadowOpacity = 1
        menuView.layer.shadowRadius = 5
//        backgroundAlpha.addSubview(menuView)
        on?.view.addSubview(menuView)

        closeButton = UIButton(frame: CGRect(origin: CGPoint(x: menuView.frame.width - 30, y: 15), size: CGSize(width: 15, height: 15)))
        closeButton.setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
        closeButton.addTarget(self, action: #selector(hideMenu), for: .touchUpInside)
        on?.view.addSubview(closeButton)

        var yPosition = 50
        var yPositionLine = 105
        var yPositionImage: Double = 62

        for i in 0 ... (arrayButtonsCaption.count - 1) {
            let button = UIButton(frame: CGRect(origin: CGPoint(x: 50, y: yPosition), size: CGSize(width: menuView.frame.width - 100, height: 50)))
            button.backgroundColor = UIColor.clear
            button.layer.cornerRadius = 5
            button.setTitle(arrayButtonsCaption[i], for: .normal)
            button.tag = i
            button.addTarget(self, action: #selector(goTo(_:)), for: .touchUpInside)
            yPosition += 70
            menuButtonsArray.append(button)
            on?.view.addSubview(menuButtonsArray[i])

            let line = UIImageView(frame: CGRect(origin: CGPoint(x: 50, y: yPositionLine), size: CGSize(width: button.frame.width, height: 1)))
            line.backgroundColor = UIColor(patternImage: UIImage(named: "Line")!)
            yPositionLine += 70
            arrayOfLinesUnderButtons.append(line)
            on?.view.addSubview(arrayOfLinesUnderButtons[i])

            let buttonImage = UIImageView(frame: CGRect(origin: CGPoint(x: 12.5, y: yPositionImage), size: CGSize(width: 25, height: 26)))
            buttonImage.backgroundColor = UIColor(patternImage: UIImage(named: arrayOfButtonImagesNames[i])!)
            yPositionImage += 70
            arrayOfButtonImages.append(buttonImage)
            on?.view.addSubview(arrayOfButtonImages[i])
        }
    }
    
    @objc func goTo(_ sender: UIButton) {
        self.delegate?.menuButtonTapped(sender)
//        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func hideMenu() {
        menuView.removeFromSuperview()
        backgroundAlpha.removeFromSuperview()
        closeButton.removeFromSuperview()
        
        for i in 0 ... (menuButtonsArray.count - 1) {
            menuButtonsArray[i].removeFromSuperview()
            arrayOfLinesUnderButtons[i].removeFromSuperview()
            arrayOfButtonImages[i].removeFromSuperview()
        }
    }
    
    @objc func filterPressed(on: UINavigationController?) {
        //CREATE THIS METHOD
    }
}
