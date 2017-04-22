//
//  CSButton.swift
//  CSButtonDemo
//
//  Created by Joslyn Wu.
//  Copyright © 2017年 joslyn. All rights reserved.
//

import UIKit

enum CSButtonImagePositionStyle: Int {
    case left
    case right
    case top
    case bottom
}

class CSButton: UIButton {
    
    // MARK: ---------------public-------------------------
    
    /// 图片相对于文字的位置。
    /// The position of the ImageView relative to the titleLabel.
    var imagePositionMode: CSButtonImagePositionStyle
    
    /// 图片与文字间的间距。
    /// Distance between imageVeiw and titleLabel.
    var distance: CGFloat = 0
    
    /// 期望图片显示尺寸。
    /// Custom size for imageView.
    var imageSize: CGSize = CGSize.zero
    
    
    
    // MARK: ---------------private-------------------------
    init(frame: CGRect, imagePositionMode: CSButtonImagePositionStyle = .left) {
        self.imagePositionMode = imagePositionMode
        super.init(frame: frame)
        imageSize = imageView?.frame.size ?? CGSize.zero
        adjustsImageWhenHighlighted = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var imgRect_temp = imageView?.frame ?? CGRect.zero
        var titleRect_temp = titleLabel?.frame ?? CGRect.zero
        
        imgRect_temp.size = imageSize
        titleRect_temp.size = adjustTitleSize()
        
        let margin_x = (frame.size.width - (imgRect_temp.size.width + titleRect_temp.size.width) - distance) / 2
        let margin_y = (frame.size.height - (imgRect_temp.size.height + titleRect_temp.size.height) - distance) / 2
        
        let img_y_h = (frame.size.height - imgRect_temp.size.height) / 2
        let label_y_h = (frame.size.height - titleRect_temp.size.height) / 2
        
        let img_x_v = (frame.size.width - imgRect_temp.size.width) / 2
        let label_x_v = (frame.size.width - titleRect_temp.size.width) / 2
        
        switch imagePositionMode {
        case .right:
            if (titleLabel!.textAlignment != .right) { titleLabel!.textAlignment = .right }
            titleRect_temp.origin = CGPoint(x: margin_x, y: label_y_h)
            imgRect_temp.origin = CGPoint(x: margin_x + titleRect_temp.size.width + distance, y: img_y_h)
            
        case .top:
            if (titleLabel!.textAlignment != .center) { titleLabel!.textAlignment = .center }
            titleRect_temp.origin = CGPoint(x: label_x_v, y: margin_y + imgRect_temp.size.height + distance)
            imgRect_temp.origin = CGPoint(x: img_x_v, y: margin_y)
            
        case .bottom:
            if (titleLabel!.textAlignment != .center) { titleLabel!.textAlignment = .center }
            titleRect_temp.origin = CGPoint(x: label_x_v, y: margin_y)
            imgRect_temp.origin = CGPoint(x: img_x_v, y: margin_y + titleRect_temp.size.height + distance)
            
        default:
            imagePositionMode = .left
            if (titleLabel!.textAlignment != .left) { titleLabel!.textAlignment = .left }
            titleRect_temp.origin = CGPoint(x: margin_x + imgRect_temp.size.width + distance, y: label_y_h)
            imgRect_temp.origin = CGPoint(x: margin_x, y: img_y_h)
        }
        imageView?.frame = imgRect_temp
        titleLabel?.frame = titleRect_temp
    }
    
    private func adjustTitleSize() -> CGSize {
        var maxWidth: CGFloat = 0
        var maxHeight: CGFloat = 0
        let titleSize = ((titleLabel?.text ?? "") as NSString).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT)), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName : titleLabel!.font], context: nil).size
        if imagePositionMode == .top || imagePositionMode == .bottom {
            if frame.size.height - imageSize.height - distance < 0 {
                distance = 0
            }
            maxHeight = CGFloat(ceilf(Float(titleSize.height)))
            maxWidth = frame.size.width
        } else {
            maxWidth = frame.size.width - imageSize.width - distance
            if maxWidth < 0 {
                distance = 0
            }
            maxHeight = frame.size.height
            maxWidth = min(maxWidth, CGFloat(ceilf(Float(titleSize.width))))
        }
        return CGSize(width: maxWidth, height: maxHeight)
    }
   
}
