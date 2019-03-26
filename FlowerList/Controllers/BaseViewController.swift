//
//  BaseViewController.swift
//  FlowerList
//
//  Created by Merve on 26.03.2019.
//  Copyright © 2019 Merve Sahan. All rights reserved.
//

import UIKit



public class BaseViewController: UIViewController {

    let reachability = Reachability()
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    public func isConnectInternet() -> Bool {
        
        if reachability!.connection == .none {
            return false
        }else if reachability!.connection == .cellular {
            print("Mobile Network")
            return true
        }else {
            print("Wifi")
            return true
        }

    }
    
    public func openAlertPopup(message : String, title : String , btnTitle : String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: btnTitle, style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
                
            }}))
        self.present(alert, animated: true, completion: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
