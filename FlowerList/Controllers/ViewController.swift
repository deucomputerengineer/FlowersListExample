//
//  ViewController.swift
//  FlowerList
//
//  Created by Merve on 26.03.2019.
//  Copyright © 2019 Merve Sahan. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    @IBOutlet weak var tableViewList: UITableView!
    @IBOutlet var mainView: UIView!
    
    var productList = [Product]()
    var data : FlowerModel?
    let maxAmount : Double = 100.0
    let minAmount : Double = 50.0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        checkInternet()
    }
    
    fileprivate func checkInternet(){
        
        if self.isConnectInternet() {
            initViews()
        }else{
            super.openAlertPopup(message: AppStrings.NotConnectInternet, title: AppStrings.PopupTitleWarning, btnTitle: AppStrings.PopupOneButtonOkTitle)
        }
    }
    
    fileprivate func initViews(){
    
        mainView.backgroundColor = UIColor.clear.withAlphaComponent(0.1)
        tableViewList.backgroundColor = UIColor.clear
        
        let nib = UINib(nibName: TableViewConstants.NibName, bundle: nil)
        tableViewList.register(nib, forCellReuseIdentifier: TableViewConstants.CellId)
        tableViewList.delegate = self
        tableViewList.dataSource = self
        callService()
    }
    
    fileprivate func setData(_ data : DataClass){
        
        productList.removeAll()
        
        for item in data.products!{
            
            let price = item.price
            let amount = price?.total
            
            if item.productGroupID == 1  {
                if let amount = amount {
                    if amount >= minAmount && amount <= maxAmount {
                        productList.append(item)
                    }
                }
            }
            
        }

        DispatchQueue.main.async {
            self.tableViewList.reloadData()
            self.tableViewList.isHidden = false
        }
    }

    
    fileprivate func callService(){
        
        let url = NetworkConstants.URL
        
        let successHandler: (FlowerModel) -> Void = { (data) in
            
            guard let result = data.result else {
                 super.openAlertPopup(message:AppStrings.NotConnectInternet , title: AppStrings.PopupTitleWarning, btnTitle: AppStrings.PopupOneButtonOkTitle)
                return
            }
            
            if let data = result.data , data.products != nil {
                
                self.setData(data)
                
            }
        }
        let errorHandler: (String) -> Void = { (error) in
            self.tableViewList.isHidden = true
            super.openAlertPopup(message:AppStrings.NotConnectInternet , title: AppStrings.PopupTitleWarning, btnTitle: AppStrings.PopupOneButtonOkTitle)
        }
        
        
        let networkLayer = NetworkLayer()
        networkLayer.get(urlString: url, successHandler: successHandler, errorHandler: errorHandler)
    }

}

extension ViewController : UITableViewDelegate {
    
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = productList[indexPath.row]
        
        let cell : ProductListCell = tableView.dequeueReusableCell(withIdentifier: TableViewConstants.CellId, for: indexPath) as! ProductListCell
        cell.configureWith(item)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

