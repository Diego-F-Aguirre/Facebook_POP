//
//  ResetButton.swift
//  FaceBook_Pop
//
//  Created by Diego Aguirre on 8/22/16.
//  Copyright © 2016 home. All rights reserved.
//

import UIKit
import pop

class ResetButton: UIButton {
    
    private let kSmallScaleAnimation = "smallScaleAnimation"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
        
        self.addTarget(self, action: #selector(smallScale), forControlEvents: .TouchDown)
        self.addTarget(self, action: #selector(springAnimation), forControlEvents: .TouchUpInside)
        self.addTarget(self, action: #selector(springAnimation), forControlEvents: .TouchDragExit)
    }


}

// View setup 
extension ResetButton {
    func setupView() {
        self.layer.cornerRadius = self.frame.width / 2
    }
}

// Animations
extension ResetButton {
    func smallScale() {
        let scaleAnimation = POPBasicAnimation(propertyNamed: kPOPLayerScaleXY)
        scaleAnimation.toValue = NSValue(CGSize: CGSizeMake(0.95, 0.05))
        self.layer.pop_addAnimation(scaleAnimation, forKey: kSmallScaleAnimation)
    }
    
    func springAnimation() {
        let spring = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY)
        spring.springBounciness = 20
        spring.toValue = NSValue(CGSize: CGSizeMake(1.0, 1.0))
        spring.velocity = NSValue(CGSize: CGSizeMake(3.0, 3.0))
        self.layer.pop_addAnimation(spring, forKey: "springAnimation")
    }
}