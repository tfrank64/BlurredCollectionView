//
//  BlurredLoadingView.swift
//  BlurredUtilities
//
//  Created by Taylor Franklin on 8/18/14.
//  Copyright (c) 2014 Taylor Franklin. All rights reserved.
//

import UIKit
import QuartzCore

class BlurredLoadingView: UIView {
    
    var isAnimating: Bool = false
    var backingImageView: UIImageView?
    var blurView: UIVisualEffectView!
    var blurEffect: UIBlurEffect!
    var vibrancyView: UIVisualEffectView!
    
    var smallView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.autoresizingMask = UIViewAutoresizing.FlexibleTopMargin | UIViewAutoresizing.FlexibleBottomMargin
            | UIViewAutoresizing.FlexibleLeftMargin | UIViewAutoresizing.FlexibleRightMargin
        
        self.backingImageView = UIImageView(frame: CGRectMake(0, 0, frame.size.width, frame.size.height))
        self.backingImageView!.image = UIImage(named: "target.jpg")
        self.addSubview(self.backingImageView!)
        
        // TODO: make it a static blur
        self.blurEffect = UIBlurEffect(style: .Light)
        self.blurView = UIVisualEffectView(effect: self.blurEffect)
        self.blurView.userInteractionEnabled = false
        self.blurView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height)
        self.backingImageView!.addSubview(self.blurView)
        
        self.vibrancyView = vibrancyEffectView(forBlurEffectView: self.blurView)
        self.blurView.contentView.addSubview(self.vibrancyView)
        
        smallView = UIView(frame: CGRectMake(30, 30, 50, 50));
        smallView.backgroundColor = UIColor.blueColor()
        self.addSubview(smallView)
    }
    
    required init(coder aDecoder: NSCoder!) {
        
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.blueColor()

    }
    
    func startAnimating() {
        
        isAnimating = true
        
        
        
        
        // var image = imageWithView(self.blurView)
//        
//        UIView.animateWithDuration(NSTimeInterval(2), delay: 0, options: UIViewAnimationOptions.Repeat | UIViewAnimationOptions.CurveLinear, animations:{
//            self.smallView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
//            //self.vibrancyView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
//            }, completion: nil)
    }
    
    func stopAnimating() {
        
        isAnimating = false
    }
    
    // Actually creates the desired blur effect
    func vibrancyEffectView(forBlurEffectView blurEffectView:UIVisualEffectView) -> UIVisualEffectView {
        var vibrancy = UIVibrancyEffect(forBlurEffect: blurEffectView.effect as UIBlurEffect)
        var vibrancyView = UIVisualEffectView(effect: vibrancy)
        vibrancyView.userInteractionEnabled = false
        vibrancyView.frame = blurEffectView.bounds
        vibrancyView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        return vibrancyView
    }

    func imageWithView(view: UIView) -> UIImage
    {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
        view.layer.renderInContext(UIGraphicsGetCurrentContext())
        var img = UIGraphicsGetImageFromCurrentImageContext();
    
        UIGraphicsEndImageContext();
    
        return img;
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
    }
    */

}
