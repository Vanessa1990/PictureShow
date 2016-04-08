//
//  BGView.swift
//  图片查看
//
//  Created by iosDev on 16/4/8.
//  Copyright © 2016年 iosDev. All rights reserved.
//

import UIKit

class BGView: UIView {

    @IBOutlet weak var showImageView: UIImageView!
    @IBOutlet weak var imageViewH: NSLayoutConstraint!
    @IBOutlet weak var imageViewW: NSLayoutConstraint!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var preButton: UIButton!
    
    var animTime: Double?
    
    @IBAction func closeClick(sender: AnyObject) {
        
        self.removeFromSuperview()
    }
    
    override func awakeFromNib() {
        
        preButton.hidden = true
        nextButton.hidden = true
        
    }
    
    func setShowImage(showImage: UIImage, startPoint: CGPoint, width: CGFloat) {
        
        if let time = animTime {
        }else {
            animTime = 1.5
        }
        showImageView.image = showImage
        self.imageViewH.constant = 260
        self.imageViewW.constant = 260
        // 缩放动画
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = NSNumber(float: 0.5)
        scaleAnimation.toValue = NSNumber(float: 1.0)
//        scaleAnimation.autoreverses = true;
        scaleAnimation.repeatCount = 1;
        scaleAnimation.duration = animTime!;
        
        //移动动画
        let moveAnimation = CABasicAnimation(keyPath: "position")
        moveAnimation.fromValue = NSValue(CGPoint: startPoint)
        moveAnimation.toValue = NSValue(CGPoint: CGPointMake(UIScreen.mainScreen().bounds.size.width * 0.5, UIScreen.mainScreen().bounds.size.height * 0.5));
//        moveAnimation.autoreverses = true;
        moveAnimation.repeatCount = 1;
        moveAnimation.duration = animTime!;
        showImageView.layer.anchorPoint = CGPointMake(0.5, 0.5)
        
        let groupAnnimation = CAAnimationGroup()
        groupAnnimation.duration = animTime!;
//        groupAnnimation.autoreverses = true;
        groupAnnimation.animations = [moveAnimation, scaleAnimation];
        groupAnnimation.repeatCount = 1;
        //开演
        showImageView.layer.addAnimation(groupAnnimation, forKey: "groupAnnimation")
        
    }
   
}
