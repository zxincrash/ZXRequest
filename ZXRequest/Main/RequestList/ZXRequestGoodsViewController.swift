//
//  ZXRequestGoodsViewController.swift
//  ZXRequest
//
//  Created by zhaoxin on 2017/11/13.
//  Copyright © 2017年 zhaoxin. All rights reserved.
//

import UIKit

class ZXRequestGoodsViewController: ZXBaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goodArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell(style: .default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = goodArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let goodName:String = goodArray[indexPath.row]
        
        let goodVC:ZXGoodsDetailViewController = ZXGoodsDetailViewController()
        goodVC.goodName = goodName
        self.navigationController?.pushViewController(goodVC, animated: true)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        

        
        self.view.addSubview(self.myInfoTable)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var goodArray: Array = {
        return ["abcdefgh","g","h","a"];
    }()
    
    lazy var myInfoTable: UITableView = {
        let table:UITableView = UITableView.init(frame: view.frame, style: .plain)
        table.dataSource = self
        table.delegate = self
        table.showsVerticalScrollIndicator = false
        table.tableFooterView = UIView.init()
        return table
    }()

}
