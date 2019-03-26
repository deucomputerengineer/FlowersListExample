//
//  AppConstants.swift
//  FlowerList
//
//  Created by Merve on 26.03.2019.
//  Copyright © 2019 Merve Sahan. All rights reserved.
//

import Foundation
import UIKit

struct NetworkConstants {
    static let URL = "https://api.ciceksepeti.com/v1/product/ch/dynamicproductlist";
}

struct TableViewConstants {
    
    static let NibName = "ProductListCell";
    static let CellId = "ProductCell";
}

struct StoryboardIDs {
    static let SB_ID_MAIN = "Main"
}


struct FontNames {
    static let PrimaryFontBold = UIFont(name: "Helvetica-Bold", size: 16)
    static let PrimaryFont = UIFont(name: "Helvetica", size: 16)
    static let HeaderFont = UIFont(name: "Helvetica-Bold", size: 25)
    
}

struct AppStrings {
    static let PopupTitleWarning = "Uyarı"
    static let PopupOneButtonOkTitle = "Tamam"
    static let NotConnectInternet = "Internet bağlantınız sağlanamadı."
    
    
}
