//
//  HUDBar.swift
//  HUDDemo
//
//  Created by zhuxuhong on 2017/4/12.
//  Copyright © 2017年 zhuxuhong. All rights reserved.
//

import UIKit

class HUDBar: UIView {
// MARK: - IBOutlet
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var wrapperView: UIView!
    
// MARK: - properties
    fileprivate let H: CGFloat = 44
    
    fileprivate var delay = 0{
        didSet{
            wrapperView.frame = CGRect(x: 0, y: -H, width: bounds.size.width, height: H)
        }
    }
    
    fileprivate var style: HUDStyle = .tips{
        didSet{
            switch style {
                case .warning:
                    wrapperView.backgroundColor = HUDColors.warning
                case .error:
                    wrapperView.backgroundColor = HUDColors.error
                default:
                    wrapperView.backgroundColor = HUDColors.tips
            }
        }
    }
}

extension HUDBar{
    override func layoutSubviews() {
        super.layoutSubviews()
        
        infoLabel.frame = CGRect(x: 10, y: 0, width: bounds.size.width-20, height: H)
    }
}

extension HUDBar{
    fileprivate func animate(isShow: Bool){
        
        let frame = CGRect(x: 0, y: isShow ? 20 : -H, width: bounds.size.width, height: 44)
        
        UIView.animate(withDuration: 0.15, delay: 0, options: .curveEaseInOut, animations: {
            
            self.wrapperView.frame = frame
            
        }, completion: {finished in
            if isShow{
                let time = DispatchTime.now() + .seconds(self.delay)
                DispatchQueue.main.asyncAfter(deadline: time) {
                    self.animate(isShow: false)
                }
            }
            else{
                self.removeFromSuperview()
            }
        })
    }
}

// MARK: - public method
extension HUDBar{
    public static func show(style: HUDStyle, message: String, delay: Int)
    {
        if let bar = HUD.xib(type: .bar) as? HUDBar{
            bar.style = style
            bar.delay = delay
            bar.infoLabel.text = message
            bar.animate(isShow: true)
        }
    }
}
