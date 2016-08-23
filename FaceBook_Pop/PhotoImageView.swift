//
//  PhotoImageView.swift
//  FaceBook_Pop
//
//  Created by Diego Aguirre on 8/22/16.
//  Copyright © 2016 home. All rights reserved.
//

import UIKit
import pop

class PhotoImageView: UIImageView {
    
    private let kSmallScaleAnimation = "smallScaleAnimation"
    private let kSpringAnimation = "springAnimation"


    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
        smallScale()
    }

}

extension PhotoImageView {
    func setupView() {
        self.layer.shadowColor = UIColor.darkGrayColor().CGColor
//        self.layer.shadowOffset.height = 2
//        self.layer.shadowOffset.width = 1
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.borderWidth = 3
        self.layer.cornerRadius = 120
        self.clipsToBounds = true
    }
}

extension PhotoImageView {
    func smallScale() {
        let scaleAnimation = POPBasicAnimation(propertyNamed: kPOPLayerScaleXY)
        scaleAnimation.toValue = NSValue(CGSize: CGSizeMake(0.5, 0.5))
        scaleAnimation.completionBlock = {(animation, finished) in
            self.scaleSpringAnimation()
        }
        self.layer.pop_addAnimation(scaleAnimation, forKey: kSmallScaleAnimation)
    }
    
    func scaleSpringAnimation() {
        let springAnimation = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY)
        springAnimation.springBounciness = 28
        springAnimation.velocity = NSValue(CGSize: CGSizeMake(3.0, 3.0))
        springAnimation.toValue = NSValue(CGSize: CGSizeMake(1.0, 1.0))
        self.layer.pop_addAnimation(springAnimation, forKey: kSpringAnimation)
    }
}
