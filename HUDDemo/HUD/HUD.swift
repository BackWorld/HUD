//
//  HUD.swift
//  HUDDemo
//
//  Created by zhuxuhong on 2017/4/12.
//  Copyright © 2017年 zhuxuhong. All rights reserved.
//

import UIKit

enum HUDType: Int{
    case bar
    case toast
    case square
}

enum HUDStyle: String{
    case loading
    case tips
    case warning
    case error
}

let HUDColors = (
    black: UIColor.black.withAlphaComponent(0.7),
    tips: UIColor(red: 40/255.0, green: 177/255.0, blue: 121/255.0, alpha: 1),
    warning: UIColor(red: 249/255.0, green: 183/255.0, blue: 74/255.0, alpha: 1),
    error: UIColor(red: 247/255.0, green: 110/255.0, blue: 103/255.0, alpha: 1)
)

class HUD: NSObject {

// MARK: - public method
    public static func bar(style: HUDStyle, message: String, delay: Int){
        HUDBar.show(style: style, message: message, delay: delay)
    }
    
    public static func square(style: HUDStyle, message: String?, delay: Int){
        HUDSquare.show(style: style, message: message, delay: delay)
    }
    
    public static func toast(message: String, delay: Int){
        HUDToast.show(message: message, delay: delay)
    }
    
    public static func dismiss(){
        HUDSquare.dismiss()
    }
}

extension HUD{
    public static func xib(type: HUDType) -> UIView?{
        guard let nib = Bundle.main.loadNibNamed("HUD", owner: nil, options: nil),
            let view = nib[type.rawValue] as? UIView else {
            return nil
        }
        
        let window = UIApplication.shared.keyWindow!
        view.frame = window.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        window.addSubview(view)
        
        return view
    }
}

