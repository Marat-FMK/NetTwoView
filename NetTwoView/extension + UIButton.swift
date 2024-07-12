//
//  extension + UIButton.swift
//  NetTwoView
//
//  Created by Marat Fakhrizhanov on 12.07.2024.
//


import UIKit

extension UIButton {
    
func pulsate() {
    let pulse = CASpringAnimation(keyPath: "transform.scale") // изменить keyPath на нужный , import UIKit
        pulse.duration = 0.6
        pulse.fromValue = 0.5
        pulse.toValue = 2
        pulse.autoreverses = true
        pulse.repeatCount = 5
        pulse.initialVelocity = 0.5
    
    layer.add(pulse, forKey: nil) // применить к кнопке в функции IBAction ( sender.pulsate() ) forКey - ключ для кнопок с общей анимацией
    }
}
