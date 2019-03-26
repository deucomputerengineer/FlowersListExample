//
//  FlowerModel.swift
//  FlowerList
//
//  Created by Merve on 26.03.2019.
//  Copyright © 2019 Merve Sahan. All rights reserved.
//

import Foundation

class FlowerModel: Codable {
    let result: Result?
    let error: FlowerError?
    
    init(result: Result?, error: FlowerError?) {
        self.result = result
        self.error = error
    }
}

class FlowerError: Codable {
    let type: Int?
    let title, message, returnURL: JSONNull?
    
    enum CodingKeys: String, CodingKey {
        case type, title, message
        case returnURL = "returnUrl"
    }
    
    init(type: Int?, title: JSONNull?, message: JSONNull?, returnURL: JSONNull?) {
        self.type = type
        self.title = title
        self.message = message
        self.returnURL = returnURL
    }
}

class Result: Codable {
    let data: DataClass?
    
    init(data: DataClass?) {
        self.data = data
    }
}

class DataClass: Codable {
    let categoryName: JSONNull?
    let products: [Product]?
    let filter, banners: JSONNull?
    let mainFilter: MainFilter?
    let branch, message: JSONNull?
    let productCount: Int?
    let title: JSONNull?
    let isAlternate: Bool?
    let storeID: JSONNull?
    
    enum CodingKeys: String, CodingKey {
        case categoryName, products, filter, banners, mainFilter, branch, message, productCount, title, isAlternate
        case storeID = "storeId"
    }
    
    init(categoryName: JSONNull?, products: [Product]?, filter: JSONNull?, banners: JSONNull?, mainFilter: MainFilter?, branch: JSONNull?, message: JSONNull?, productCount: Int?, title: JSONNull?, isAlternate: Bool?, storeID: JSONNull?) {
        self.categoryName = categoryName
        self.products = products
        self.filter = filter
        self.banners = banners
        self.mainFilter = mainFilter
        self.branch = branch
        self.message = message
        self.productCount = productCount
        self.title = title
        self.isAlternate = isAlternate
        self.storeID = storeID
    }
}

class MainFilter: Codable {
    let dynamicFilter: [DynamicFilter]?
    let sort: [Sort]?
    
    init(dynamicFilter: [DynamicFilter]?, sort: [Sort]?) {
        self.dynamicFilter = dynamicFilter
        self.sort = sort
    }
}

class DynamicFilter: Codable {
    let detailID: Int?
    let name: String?
    let sequence: Int?
    let clearLink: JSONNull?
    let filterType: Int?
    let urlTag: JSONNull?
    let values: [Sort]?
    let filterBehaviour: Int?
    let isMainCategory, isReload: Bool?
    let id: Int?
    
    enum CodingKeys: String, CodingKey {
        case detailID = "detailId"
        case name, sequence, clearLink, filterType, urlTag, values, filterBehaviour, isMainCategory, isReload, id
    }
    
    init(detailID: Int?, name: String?, sequence: Int?, clearLink: JSONNull?, filterType: Int?, urlTag: JSONNull?, values: [Sort]?, filterBehaviour: Int?, isMainCategory: Bool?, isReload: Bool?, id: Int?) {
        self.detailID = detailID
        self.name = name
        self.sequence = sequence
        self.clearLink = clearLink
        self.filterType = filterType
        self.urlTag = urlTag
        self.values = values
        self.filterBehaviour = filterBehaviour
        self.isMainCategory = isMainCategory
        self.isReload = isReload
        self.id = id
    }
}

class Sort: Codable {
    let count, id: Int?
    let selected: Bool?
    let link: String?
    let filterQueryString: JSONNull?
    let name: String?
    let icon: String?
    let group, detailValueID: Int?
    
    enum CodingKeys: String, CodingKey {
        case count, id, selected, link, filterQueryString, name, icon, group
        case detailValueID = "detailValueId"
    }
    
    init(count: Int?, id: Int?, selected: Bool?, link: String?, filterQueryString: JSONNull?, name: String?, icon: String?, group: Int?, detailValueID: Int?) {
        self.count = count
        self.id = id
        self.selected = selected
        self.link = link
        self.filterQueryString = filterQueryString
        self.name = name
        self.icon = icon
        self.group = group
        self.detailValueID = detailValueID
    }
}

class Product: Codable {
    let id: Int?
    let code, name: String?
    let image: String?
    let link: String?
    let deliveryBadgeType: Int?
    let deliveryBadgeText: DeliveryBadgeText?
    let deliveryChargeText: JSONNull?
    let price: Price?
    let marketplaceBranch: JSONNull?
    let isMarketplace: Bool?
    let largeImage: String?
    let isDiscountAvailable, isOriginal, installment: Bool?
    let installmentText: String?
    let smallImage, xlargeImage, mediumImage: String?
    let mostSellestProduct, isHaveVase: Bool?
    let isHaveVaseText: String?
    let productDeliveryCity: ProductDeliveryCity?
    let productGroupID: Int?
    let variantCode, information: String?
    
    enum CodingKeys: String, CodingKey {
        case id, code, name, image, link, deliveryBadgeType, deliveryBadgeText, deliveryChargeText, price, marketplaceBranch, isMarketplace, largeImage, isDiscountAvailable, isOriginal, installment, installmentText, smallImage, xlargeImage, mediumImage, mostSellestProduct, isHaveVase, isHaveVaseText, productDeliveryCity
        case productGroupID = "productGroupId"
        case variantCode, information
    }
    
    init(id: Int?, code: String?, name: String?, image: String?, link: String?, deliveryBadgeType: Int?, deliveryBadgeText: DeliveryBadgeText?, deliveryChargeText: JSONNull?, price: Price?, marketplaceBranch: JSONNull?, isMarketplace: Bool?, largeImage: String?, isDiscountAvailable: Bool?, isOriginal: Bool?, installment: Bool?, installmentText: String?, smallImage: String?, xlargeImage: String?, mediumImage: String?, mostSellestProduct: Bool?, isHaveVase: Bool?, isHaveVaseText: String?, productDeliveryCity: ProductDeliveryCity?, productGroupID: Int?, variantCode: String?, information: String?) {
        self.id = id
        self.code = code
        self.name = name
        self.image = image
        self.link = link
        self.deliveryBadgeType = deliveryBadgeType
        self.deliveryBadgeText = deliveryBadgeText
        self.deliveryChargeText = deliveryChargeText
        self.price = price
        self.marketplaceBranch = marketplaceBranch
        self.isMarketplace = isMarketplace
        self.largeImage = largeImage
        self.isDiscountAvailable = isDiscountAvailable
        self.isOriginal = isOriginal
        self.installment = installment
        self.installmentText = installmentText
        self.smallImage = smallImage
        self.xlargeImage = xlargeImage
        self.mediumImage = mediumImage
        self.mostSellestProduct = mostSellestProduct
        self.isHaveVase = isHaveVase
        self.isHaveVaseText = isHaveVaseText
        self.productDeliveryCity = productDeliveryCity
        self.productGroupID = productGroupID
        self.variantCode = variantCode
        self.information = information
    }
}

enum DeliveryBadgeText: String, Codable {
    case bazıBölgelereAynıGün = "Bazı Bölgelere Aynı Gün"
    case herGünAynıGünTeslimat = "Her Gün Aynı Gün Teslimat"
}

class Price: Codable {
    let current, old: Double?
    let tax: JSONNull?
    let total: Double?
    let currency: Currency?
    let currencyCode: CurrencyCode?
    let oldTotal: Double?
    
    init(current: Double?, old: Double?, tax: JSONNull?, total: Double?, currency: Currency?, currencyCode: CurrencyCode?, oldTotal: Double?) {
        self.current = current
        self.old = old
        self.tax = tax
        self.total = total
        self.currency = currency
        self.currencyCode = currencyCode
        self.oldTotal = oldTotal
    }
}

enum Currency: String, Codable {
    case tl = "TL"
}

enum CurrencyCode: String, Codable {
    case currencyCodeTRY = "TRY"
}

class ProductDeliveryCity: Codable {
    let deliveryCityImage: String?
    let isSendToSingleCity: Bool?
    
    init(deliveryCityImage: String?, isSendToSingleCity: Bool?) {
        self.deliveryCityImage = deliveryCityImage
        self.isSendToSingleCity = isSendToSingleCity
    }
}

// MARK: Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
