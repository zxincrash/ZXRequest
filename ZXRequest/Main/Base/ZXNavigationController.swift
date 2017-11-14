//
//  ZXNavigationController.swift
//  ZXRequest
//
//  Created by zhaoxin on 2017/11/7.
//  Copyright © 2017年 zhaoxin. All rights reserved.
//

import UIKit

class ZXNavigationController: UINavigationController {
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // 隐藏默认的 NavigationBar
            navigationBar.isHidden = true
        }
        
        /// 重写 push 方法，所有的 push 动作都会调用此方法！
        /// viewController 是被 push 的控制器，设置他的左侧的按钮作为返回按钮
        override func pushViewController(_ viewController: UIViewController, animated: Bool) {
            
            // 如果不是栈底控制器才需要隐藏，根控制器不需要处理
            if childViewControllers.count > 0 {
                // 隐藏底部的 TabBar
                viewController.hidesBottomBarWhenPushed = true
            }
            
            super.pushViewController(viewController, animated: true)
        }
        
        /// POP 返回到上一级控制器
        @objc private func popToParent() {
            popViewController(animated: true)
        }
}

