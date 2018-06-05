//
//  UIViewController.swift
//  PharmaPlus
//
//  Created by Eric Hth on 05/06/2018.
//  Copyright © 2018 Eric Hth. All rights reserved.
//

import UIKit
extension UIViewController{
    func show(viewController : UIViewController, animated: Bool, completion : @escaping () -> Void){
        if(self.presentedViewController != viewController){
            if(self.presentedViewController != nil){
                dismiss(animated: animated, completion: {
                    self.present(viewController, animated: animated, completion: {
                        completion()
                    })
                })
            }else {
                present(viewController, animated: animated, completion: {
                    completion()
                })
            }
        }
    }
}
