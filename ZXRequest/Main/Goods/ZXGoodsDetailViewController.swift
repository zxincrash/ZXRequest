//
//  ZXGoodsDetailViewController.swift
//  ZXRequest
//
//  Created by zhaoxin on 2017/11/13.
//  Copyright © 2017年 zhaoxin. All rights reserved.
//

import UIKit

class ZXGoodsDetailViewController:ZXBaseViewController,UITableViewDelegate,UITableViewDataSource {
    var goodsArray:Array<ZXGoodsModel>!
    var goodName:String!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.goodsArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell(style:UITableViewCellStyle.value1, reuseIdentifier: "Cell")
        let model:ZXGoodsModel = self.goodsArray[indexPath.row]
        
        cell.textLabel?.text = model.goodsName
        cell.detailTextLabel?.text = model.goodsCode
        cell.selectionStyle = .none
        
        return cell
    }

    
    override func viewDidLoad() {
        let str:String = "查询内容：".appending(goodName)
        
        self.createLeftNavgationBar(title: str)
        super.viewDidLoad()
        self.goodsArray = Array()
        
        self.view.addSubview(self.goodsTable)
        
        let success:(Any?)->Void = { data in
            guard data != nil else {
                print("返回数据为空")
                return
            }
            self.goodsArray = ZXBaseModel.goodsModelWithData(data: data)
            
            self.goodsTable.reloadData()
        }
        ZXRequest.request(.query(q:goodName), success: success, error: { errorCode, errorMessage in
            print("\(errorCode) : \(errorMessage)")
            self.view.makeToast("\(errorMessage)")
        })
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var goodsTable: UITableView = {
        var table:UITableView = UITableView.init(frame: CGRect.init(x: 0, y: navView.frame.maxY, width: view.frame.size.width, height: view.frame.size.height - navView.frame.size.height), style: .plain)
        table.dataSource = self
        table.delegate = self
        table.showsVerticalScrollIndicator = false
        table.tableFooterView = UIView()
        return table
    }()

}
