//
//  ZXBaseViewController.swift
//  ZXRequest
//
//  Created by zhaoxin on 2017/11/13.
//  Copyright © 2017年 zhaoxin. All rights reserved.
//

import UIKit
import SnapKit

class ZXBaseViewController: UIViewController {
    var navView:UIView!
    var leftButton:UIButton!
    var rightButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // 取消自动缩进 - 如果隐藏了导航栏，会缩进 20 个点
        automaticallyAdjustsScrollViewInsets = false
        
        self.setupUI()
    }
    
    func setupUI()  {
        
    }
}

// MARK: - 设置界面
extension ZXBaseViewController {
    /// 创建navigationBar
    private func createNav(title:String?, titleView: UIView? = nil){
        self.navigationController?.navigationBar.isHidden = true
        
        navView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 64))
        navView.backgroundColor = UIColor.white
        self.view.addSubview(navView)
        
        if let title = title {
            let titleLab:UILabel = UILabel.init()
            titleLab.font = UIFont.systemFont(ofSize: 17)
            titleLab.text = title
            titleLab.textColor = .black
            navView.addSubview(titleLab)
            titleLab.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview().offset(10)
            }
            
        }
        
        if let titleView = titleView {
            navView.addSubview(titleView)
            titleView.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview().offset(10)
            }
        }
        
        let lineView:UIView = UIView()
        lineView.backgroundColor = UIColor.lightGray
        navView.addSubview(lineView)
        lineView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    /// 创建带左侧返回按钮的navigationBar
    /// 注意：一定要在super.viewDidLoad()之前调用
    ///
    /// - Parameter title: 界面title
    public func createLeftNavgationBar(title: String? = nil, titleView: UIView? = nil){
        self.createNav(title: title, titleView: titleView)
        
        leftButton = UIButton.init()
        leftButton.backgroundColor = UIColor.clear
        leftButton.setTitle("", for: .normal)
        leftButton.setImage(UIImage.init(named: "arrow_left"), for: .normal)
        leftButton.addTarget(self, action: #selector(backAction), for: .touchDown)
        navView.addSubview(leftButton)
        
        leftButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(10)
            make.left.equalTo(navView).offset(8)
            make.width.equalTo(60)
            make.height.equalTo(40)
        }
        leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20)
        
    }
    
    
    /// 创建navigationBar
    /// 注意：一定要在super.viewDidLoad()之前调用
    ///
    /// - Parameters:
    ///   - hasLeft:        是否有左侧返回按钮
    ///   - title:          界面title
    ///   - rightStr:       右侧文本
    ///   - rightImgname:   右侧显示图片名称
    public func createNavgationBar(hasLeft:Bool, title:String, rightStr:String, rightImgname:String){
        self.createNav(title: title)
        if hasLeft {
            self.createLeftNavgationBar(title: title)
        }
        
        rightButton = UIButton.init()
        rightButton.backgroundColor = UIColor.clear
        rightButton.setTitle(rightStr, for: .normal)
        rightButton.setTitleColor(UIColor.black, for: .normal)
        rightButton.setImage(UIImage.init(named: rightImgname), for: .normal)
        rightButton.addTarget(self, action: #selector(rightAction), for: .touchDown)
        navView.addSubview(rightButton)
        
        rightButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(10)
            make.right.equalTo(navView).offset(-8)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        rightButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20)
        
    }
    
    
    /// 返回按钮事件，默认退出当前界面
    @objc
    func backAction(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func rightAction(){
        
    }
    
    func showToast(_ message: String?) {
        self.view.makeToast(message)
    }
}


