//
//  ViewController.swift
//  quaterButton
//
//  Created by kanematsu tsubasa on 2019/03/27.
//  Copyright © 2019 kanematsu tsubasa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var quarterButton: [UIButton]!
    @IBOutlet weak var quarterButtonView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.quarterButton(quarterButton: quarterButton, view: quarterButtonView, radius: 15.0)
        
    }
    
    func quarterButton(quarterButton button: [UIButton]!, view: UIView!, radius: CGFloat){
        if (button.count != 4){
            print("Error: The number of buttons is not four.")
            return
        }
        
        button[0].frame = CGRect(x:0, y:0,
                                 width:view.frame.width/2-0.5, height:view.frame.height/2-0.5)
        button[1].frame = CGRect(x:view.frame.width/2+0.5, y:0,
                                 width:view.frame.width/2-0.5, height:view.frame.height/2-0.5)
        button[2].frame = CGRect(x:0, y:view.frame.height/2+0.5,
                                 width:view.frame.width/2-0.5, height:view.frame.height/2-0.5)
        button[3].frame = CGRect(x:view.frame.width/2+0.5, y:view.frame.height/2+0.5,
                                 width:view.frame.width/2-0.5, height:view.frame.height/2-0.5)
        view.layer.cornerRadius = radius
        
        button[0].roundCorners([.topLeft], radius: radius)
        button[1].roundCorners([.topRight], radius: radius)
        button[2].roundCorners([.bottomLeft], radius: radius)
        button[3].roundCorners([.bottomRight], radius: radius)
    }
}

extension UIButton {
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: self.bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        
        self.layer.mask = maskLayer
    }
}
