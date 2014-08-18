//
//  ViewController.swift
//  BlurredUtilities
//
//  Created by Taylor Franklin on 8/17/14.
//  Copyright (c) 2014 Taylor Franklin. All rights reserved.
//

import UIKit

class BlurredViewController: UICollectionViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var myself = UIImageView(frame: self.view.frame)
        myself.image = UIImage(named: "profile.jpg")
        myself.contentMode = UIViewContentMode.ScaleAspectFit
        self.collectionView.backgroundView = myself
        
        var loadingHUD = BlurredLoadingView(frame: CGRectMake(self.view.frame.size.width/2 - 50, self.view.frame.size.height/2 - 50, 100, 100))
        self.view.addSubview(loadingHUD)
        loadingHUD.startAnimating()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    override func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell! {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("blurCell", forIndexPath: indexPath) as BlurredCollectionViewCell

        return cell
    }


    
}

