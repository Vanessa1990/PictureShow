//
//  PictureViewController.swift
//  图片查看
//
//  Created by iosDev on 16/4/8.
//  Copyright © 2016年 iosDev. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController {

    
    var collectionView: UICollectionView!
    var imageNames: [String]?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        title = "图片"
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.blackColor(), NSFontAttributeName: UIFont.systemFontOfSize(20)]
        navigationController?.navigationBar.barTintColor = UIColor(red: 25/255.0, green: 118/255.0, blue: 210/255.0, alpha: 1.0)
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.minimumLineSpacing = 10
        collectionViewLayout.minimumInteritemSpacing = 10
        let width = (UIScreen.mainScreen().bounds.size.width - 20 * 4) / 3
        collectionViewLayout.itemSize = CGSizeMake(width, width)
        collectionViewLayout.scrollDirection = UICollectionViewScrollDirection.Vertical
        
        collectionView  = UICollectionView.init(frame: CGRectMake(20, 20, UIScreen.mainScreen().bounds.size.width - 40, UIScreen.mainScreen().bounds.size.height - 20), collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = UIColor.whiteColor()
        collectionView!.delegate = self
        collectionView!.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        view.addSubview(collectionView!)
        
        collectionView!.registerNib(UINib.init(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension PictureViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames!.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        (cell as? CollectionViewCell)!.pictureImageView.image = UIImage(named: imageNames![indexPath.row])
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //add background view...
        let bgView = NSBundle.mainBundle().loadNibNamed("BGView", owner: nil, options: nil)[0] as? BGView
        bgView?.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height)
        view.addSubview(bgView!)
        
        //show big pictrue in bgView...
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        let point = cell?.center
        let x = 20 + (cell?.contentView.frame.size.width)! * 0.5 + ((cell?.contentView.frame.size.width)! + 20) * (CGFloat(indexPath.row) % 3)
        let y = (point?.y)! - collectionView.contentOffset.y
        let startP = CGPointMake(x, y)
        bgView?.animTime = 1.0
        bgView?.picIndex = indexPath.row
        bgView?.picLastIndex = imageNames!.count - 1
        bgView?.picNames = imageNames!
        bgView?.setShowImage(UIImage(named: imageNames![indexPath.row])!, startPoint: startP, width: (cell?.contentView.bounds.size.width)!)
        
    }

}



