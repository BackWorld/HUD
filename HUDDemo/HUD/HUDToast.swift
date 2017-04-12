//
//  HUDToast.swift
//  HUDDemo
//
//  Created by zhuxuhong on 2017/4/12.
//  Copyright © 2017年 zhuxuhong. All rights reserved.
//

import UIKit

class HUDToast: UIView {
// MARK: - IBOutlet
    @IBOutlet weak var wrapperView: UIView!
    @IBOutlet weak var infoLabel: UILabel!

    fileprivate var delay = 0
}

extension HUDToast{
    override func awakeFromNib() {
        super.awakeFromNib()
        
        wrapperView.backgroundColor = HUDColors.black
        wrapperView.alpha = 0
        wrapperView.layer.cornerRadius = 20
    }
    
    fileprivate func animate(isShow: Bool){
        let alpha: CGFloat = isShow ? 1 : 0
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut, animations: {
            self.wrapperView.alpha = alpha
        }, completion: {finished in
            if isShow {
                let time = DispatchTime.now() + .seconds(self.delay)
                DispatchQueue.main.asyncAfter(deadline: time) {
                    self.animate(isShow: false)
                }
            }
            else {
                self.removeFromSuperview()
            }
        })
    }
}

extension HUDToast{
    public static func show(message: String, delay: Int){
        if let toast = HUD.xib(type: .toast) as? HUDToast{
            toast.delay = delay
            toast.infoLabel.text = message
            toast.animate(isShow: true)
        }
    }
}
