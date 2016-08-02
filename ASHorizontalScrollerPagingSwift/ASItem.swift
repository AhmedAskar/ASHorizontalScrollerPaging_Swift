//
//  ASItem.swift
//  ASHorizontalScrollerPagingSwift
//
//  Created by Ahmed Askar on 6/2/16.
//  Copyright © 2016 Askar. All rights reserved.
//

import Foundation
import UIKit

class ASItem: NSObject {
    
    var image: UIImage!
    var value: String!
    let ImagesCount = 3
    
    class var sharedInstance: ASItem {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: ASItem? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = ASItem()
        }
        return Static.instance!
    }
    
    func items() -> [AnyObject] {
        var resultArray: [AnyObject] = [AnyObject]()
        for i in 0..<ImagesCount {
            let imageName: String = "Intro_Screen_\(i + 1)"
            let image: UIImage = UIImage(named: imageName)!
            let tourObject: ASItem = ASItem()
            tourObject.image = image
            
            resultArray.append(tourObject)
        }
        return resultArray
    }
    
    func colors() -> [AnyObject] {
        return [UIColor.redColor(),UIColor.blueColor(),UIColor.yellowColor(),UIColor.grayColor()]
    }
}
