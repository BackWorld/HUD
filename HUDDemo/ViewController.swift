//
//  ViewController.swift
//  HUDDemo
//
//  Created by zhuxuhong on 2017/4/12.
//  Copyright © 2017年 zhuxuhong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var barButton: UIButton!
    @IBOutlet weak var toastButton: UIButton!
    @IBOutlet weak var squareButton: UIButton!
    @IBOutlet weak var dismissButton: UIButton!
    
    @IBOutlet weak var styleSegment: UISegmentedControl!
    
    fileprivate var style: HUDStyle = .tips
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func actionForSCValueChanged(_ sender: UISegmentedControl){
        switch sender.selectedSegmentIndex {
            case 1:
                style = .loading
            case 2:
                style = .warning
            case 3:
                style = .error
            default:
                style = .tips
        }
    }
    
    @IBAction func actionForButtonClicked(_ sender: UIButton){
        if sender == barButton {
            HUD.bar(style: style, message: "你已经进入了没网的二次元", delay: 2)
        }
        else if sender == toastButton{
            HUD.toast(message: "登录成功", delay: 2)
        }
        else if sender == squareButton{
            HUD.square(style: style, message: "拼命加载中...", delay: 2)
        }
        else{
            HUD.dismiss()
        }
    }

}

