//
//  ProductListCell.swift
//  FlowerList
//
//  Created by Merve on 26.03.2019.
//  Copyright © 2019 Merve Sahan. All rights reserved.
//

import UIKit

class ProductListCell: UITableViewCell {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var lblInstalment: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var mainView: UIView!
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.contentView.backgroundColor = UIColor.clear.withAlphaComponent(0.1)
        mainView.backgroundColor = UIColor.white
        
        mainView.backgroundColor = UIColor.white
        mainView.layer.cornerRadius = 5
        mainView.layer.shadowRadius = 3.0
        mainView.layer.shadowColor = UIColor.black.cgColor
        mainView.layer.shadowOffset = CGSize(width: 0, height: 0)
        mainView.layer.shadowOpacity = 0.3
        mainView.layer.masksToBounds = false
        
        imgProduct.layer.cornerRadius = 3
        imgProduct.clipsToBounds = true
        
        lblName.font = FontNames.PrimaryFontBold
        lblName.textColor = UIColor.green
        lblName.numberOfLines = 0
        
        lblPrice.font = FontNames.PrimaryFont
        lblPrice.textColor = UIColor.black
        lblPrice.numberOfLines = 1
        
        lblInstalment.font = FontNames.PrimaryFont
        lblInstalment.textColor = UIColor.black
        lblInstalment.numberOfLines = 1
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    fileprivate func formatMoney(_ price : Double){
        
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        if let formattedTipAmount = formatter.string(from: price as NSNumber) {
            lblPrice.text = "\(formattedTipAmount)"
        }
    }
    
    public func configureWith(_ item : Product){
        
        lblName.text = item.name
        lblInstalment.text = item.installmentText

        if let price = item.price {
            let total = price.total
            formatMoney(total ?? 0)
        }

        
        if let imgUrl = item.image {
            let imageUrl = URL(string: imgUrl)!
            
            if let image = appDelegate.images[imageUrl] {
                imgProduct.image = image
            } else {
                self.imgProduct.image = nil
                self.activityIndicator.isHidden = false
                self.activityIndicator.startAnimating()
                DispatchQueue.global().async {
                    let img = self.convertToImage(imgUrl)
                    DispatchQueue.main.async {
                        self.appDelegate.images[imageUrl] = img
                        self.imgProduct.image = img
                        self.activityIndicator.stopAnimating()
                        self.activityIndicator.isHidden = true

                    }
                }
            }
        }
        
    }
    
    func convertToImage (_ imgUrl : String) -> UIImage {
        var img : UIImage?
        let url = URL(string: imgUrl)
        
        do {
            let data = try Data(contentsOf: url!)
            img = UIImage(data: data)
        } catch  {
            print(error)
        }
        
        return img!
        
    }
    
}
