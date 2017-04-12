//
//  HUDSquare.swift
//  HUDDemo
//
//  Created by zhuxuhong on 2017/4/12.
//  Copyright © 2017年 zhuxuhong. All rights reserved.
//

import UIKit

class HUDSquare: UIView {

// MARK: - properties
    @IBOutlet weak var wrapperView: UIView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var iconIV: UIImageView!
    @IBOutlet weak var animator: UIActivityIndicatorView!

    fileprivate var delay = 1
    fileprivate var style: HUDStyle = .tips{
        didSet{
            if style != .loading {
                animator.stopAnimating()
                iconIV.isHidden = false
                iconIV.image = UIImage(named: "hud_icon_\(style.rawValue)")
            }
        }
    }
}

// MARK: - fileprivate method
extension HUDSquare{
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
            if isShow && self.delay > 0{
                let time = DispatchTime.now() + .seconds(self.delay)
                DispatchQueue.main.asyncAfter(deadline: time) {
                    self.animate(isShow: false)
                }
            }
            else if !isShow {
                self.removeFromSuperview()
            }
        })
    }
}

// MARK: - public method
extension HUDSquare{
    public static func dismiss(){
        for sub in UIApplication.shared.keyWindow!.subviews {
            if sub.isKind(of: HUDSquare.self) {
                sub.removeFromSuperview()
            }
        }
    }
    
    public static func show(style: HUDStyle, message: String?, delay: Int){
        if let square = HUD.xib(type: .square) as? HUDSquare{
            square.style = style
            if style != .loading && delay != 0 {
                square.delay = delay
            }
            else if style == .loading{
                square.delay = 0
            }
            square.infoLabel.text = message
            square.animate(isShow: true)
        }
    }
}
