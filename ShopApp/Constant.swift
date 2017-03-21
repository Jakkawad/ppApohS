//
//  Constant.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 10/28/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import Foundation

// String TableViewCell, CollectionViewCell
let tableCell0 = "tableCell0"
let tableCell1 = "tableCell1"
let tableCell2 = "tableCell2"
let tableCell3 = "tableCell3"
let tableCell4 = "tableCell4"
let tableCell5 = "tableCell5"

// API URL
let ALL2SALE_API = "http://http://a2b.mul.pw/api/v2/"
let ALL2SALE_API_PRODUCT = "http://a2b.mul.pw/api/v2/product/"
let ALL2SALE_API_PRODUCT_ID = "http://a2b.mul.pw/api/v2/product/id/"
let ALL2SALE_API_USER = "http://a2b.mul.pw/api/v2/user_acc/"
let ALL2SALE_API_CATEGORY = "http://a2b.mul.pw/api/v2/categorys/"
let ALL2SALE_API_ORDER_DETAIL = "http://a2b.mul.pw/api/v2/order_detail"
let ALL2SALAE_API_ORDER_PRODUCT = "http://a2b.mul.pw/api/v2/orduer_product"

let ALL2SALE_API_IMAGE_PATH = "http://a2b.mul.pw/static/img/"

// Function -> Alamofire
typealias DownloadComplete = () -> ()

// String Fields
let PRODUCT = "product"

// Segue

// API_ProductFields -> Product model 
let API_ProductFields_Id = "id"
let API_ProductFields_Category_Id = "categoryid"
let API_ProductFields_ImageShow_Cover =  "imageshow_cover"
let API_ProductFields_Image_Id = "imageid"
let API_ProductFields_Name = "name_product"
let API_ProductFields_Nat_Price = "nat_price"
let API_ProductFields_Snat_price = "snat_price"
let API_ProductFields_Details = "details"
let API_ProductFields_Detail_Web = "detail_web"
let API_ProductFields_Option_Id = "optionsid"
let API_ProductFields_OptionValue = "optionvalue"
let API_ProductFields_CashBack_Percent = "cashback_percent"
let API_ProductFields_Aff_Percent = "aff_percent"
let API_ProductFields_Show_Hidden = "show_hidden"
let API_ProductFields_Quality = "qty"
let API_ProductFields_Sku_Id = "sku_id"
let API_ProductFields_Status = "status"

// API_CategoryFields -> Category model
let API_CategoryFields_Id = "id"
let API_CategoryFields_Name = "name"
let API_CategoryFields_Name_En = "name_en"
let API_CategoryFields_Parent_Id = "parentid"
let API_CategoryFields_Show_Hidden = "show_hidden"
let API_CategoryFields_Image = "image"
let API_CategoryFields_Image_En = "image_en"


// API_OrderDetailFields -> OrderDetail model

// API_OrderProductFields -> OrderProduct model

// Eenum
//enum ProductFields: String {
//    case id = "id"
//    case name = "name_product"
//}

