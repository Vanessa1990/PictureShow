//
//  ViewController.swift
//  图片查看
//
//  Created by iosDev on 16/4/8.
//  Copyright © 2016年 iosDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    let imageArray = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: "tap")
        imageView.userInteractionEnabled = true
        imageView.addGestureRecognizer(tap)
        
    }
    
    func tap() {
        
        let picVC = PictureViewController()
        picVC.imageNames = imageArray
        let mainNV = UINavigationController.init(rootViewController: picVC)
        UIApplication.sharedApplication().delegate!.window??.rootViewController = mainNV
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

