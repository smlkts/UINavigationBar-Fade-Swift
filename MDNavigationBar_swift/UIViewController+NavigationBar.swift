//
//  UIViewController+NavigationBar.swift
//  MDNavigationBar_swift
//
//  Created by 张雁军 on 2017/5/18.
//  Copyright © 2017年 smlkts. All rights reserved.
//

import Foundation
import UIKit

private var backgroundImageViewKey: UInt8 = 0
private var colorKey = "color"
private var imageKey = "image"

public extension UIViewController{
    var backgroundImageView: UIImageView?{
        get {
            var iv = objc_getAssociatedObject(self, &backgroundImageViewKey) as? UIImageView
            if iv == nil {
                iv = UIImageView.init()
                iv?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                iv?.alpha = 0
                objc_setAssociatedObject(self, &backgroundImageViewKey, iv, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
            return iv
        }
    }
    
    var navigationBarBackgroundColor: UIColor?{
        get {
            return objc_getAssociatedObject(self, &colorKey) as? UIColor
        }
        
        set {
            if navigationBarBackgroundColor == nil {
                objc_setAssociatedObject(self, &colorKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                self.backgroundImageView?.backgroundColor = newValue
            }
            self.navigationController?.navigationBar.setBackgroundImage(UIImage.init(), for: .default)
            self.navigationController?.navigationBar.shadowImage = self.backgroundImageView!.alpha < CGFloat(0.5) ? UIImage.init() : nil
            self.navigationController?.navigationBar.subviews[0].insertSubview(self.backgroundImageView!, at: 0)
            self.fd_layoutSubviews()
        }
    }
    
    var navigationBarBackgroundImage: UIImage?{
        get {
            return objc_getAssociatedObject(self, &imageKey) as? UIImage
        }
        
        set {
            if navigationBarBackgroundImage == nil {
                objc_setAssociatedObject(self, &imageKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                self.backgroundImageView?.image = newValue
            }
            self.navigationController?.navigationBar.setBackgroundImage(UIImage.init(), for: .default)
            self.navigationController?.navigationBar.shadowImage = self.backgroundImageView!.alpha < CGFloat(0.5) ? UIImage.init() : nil
            self.navigationController?.navigationBar.subviews[0].insertSubview(self.backgroundImageView!, at: 0)
            self.fd_layoutSubviews()
        }
    }
    
    func fd_layoutSubviews() {
        let statusBarHeight = UIApplication.shared.statusBarFrame.height;
        let navigationBarHeight = self.navigationController?.navigationBar.bounds.height;
        self.backgroundImageView?.frame = CGRect.init(x: 0, y: 0, width: (self.navigationController?.navigationBar.frame.width)!, height: navigationBarHeight! + statusBarHeight)
    }
    
    func fd_setNavigationBarAlpha(alpha: CGFloat) {
        self.backgroundImageView!.alpha = alpha
        self.navigationController?.navigationBar.shadowImage = alpha < 0.5 ? UIImage.init() : nil
    }
    
    func fd_recoverNavigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController?.navigationBar.shadowImage = nil
        self.backgroundImageView?.removeFromSuperview()
    }
}
