//
//  ViewController.swift
//  CSButtonDemo
//
//  Created by Joslyn Wu on 2017/4/21.
//  Copyright © 2017年 joslyn. All rights reserved.
//

import UIKit

let sideOne: CGFloat = 100
let sideTwo: CGFloat = 61.8

let kTestTitleName = "小幸运"
let kTestImgName = "icon_red"

enum buttonStyle: Int {
    case top
    case bottom
    case right
    case left
}

class ViewController: UIViewController {
    
    @IBOutlet weak var descLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(csButton)
        descLabel.text = "这是个图片在 上 的Button"
    }

    @IBAction func changeButtonStyle(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case buttonStyle.top.rawValue:
            csButton.imagePositionMode = CSButtonImagePositionStyle.top
            csButton.frame.size = CGSize(width: sideTwo, height: sideOne)
            descLabel.text = "这是个图片在 上 的Button"
            
        case buttonStyle.bottom.rawValue:
            csButton.imagePositionMode = CSButtonImagePositionStyle.bottom
            csButton.frame.size = CGSize(width: sideTwo, height: sideOne)
            descLabel.text = "这是个图片在 下 的Button"
            
        case buttonStyle.right.rawValue:
            csButton.imagePositionMode = CSButtonImagePositionStyle.right
            csButton.frame.size = CGSize(width: sideOne, height: sideTwo)
            descLabel.text = "这是个图片在 右 的Button"
            
        default:
            csButton.imagePositionMode = CSButtonImagePositionStyle.left
            csButton.frame.size = CGSize(width: sideOne, height: sideTwo)
            descLabel.text = "这是个图片在 左 的Button"
        }
        csButton.center = view.center
        csButton.layoutSubviews()
    }
    
    
    lazy var csButton: CSButton = {
        let btn = CSButton(frame: CGRect(x: 0, y: 0, width: sideTwo, height: sideOne), imagePositionMode: .top)
        btn.center = self.view.center;
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btn.setTitle(kTestTitleName, for: .normal)
        btn.backgroundColor = UIColor.brown
        btn.setImage(#imageLiteral(resourceName: "icon_red"), for: .normal)
        btn.distance = 6
        btn.imageSize = CGSize(width: 36, height: 42)
        return btn
    }()
    
}

