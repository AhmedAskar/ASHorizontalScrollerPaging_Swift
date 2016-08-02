//
//  ASViewController.swift
//  ASHorizontalScrollerPagingSwift
//
//  Created by Ahmed Askar on 6/2/16.
//  Copyright © 2016 Askar. All rights reserved.
//

import UIKit

let VIEWS_OFFSET:CGFloat! = 0.0
let VIEW_PADDING_DEFAULT:CGFloat! = 0

class ASViewController: UIViewController,ASHorizontalScrollerDataSource,ASHorizontalScrollerDelegate {

    var items : Array<AnyObject> = [];
    var colors : Array<AnyObject> = [];
    var scroller: ASHorizontalScroller!
    var viewHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "ASHorizontalScrollerPaging"
        self.colors = ASItem.sharedInstance.colors()
        self.items = ASItem.sharedInstance.items()
        
        //set ScrollView Height
        self.viewHeight = self.view.height * 0.6
        self.scroller = ASHorizontalScroller(frame: CGRectMake(VIEWS_OFFSET, VIEW_PADDING_DEFAULT, self.view.width, viewHeight))
        self.scroller.dataSource = self
        self.scroller.delegate = self
        self.scroller.scrollWidth = self.view.frame.size.width
        self.scroller.scrollHeight = viewHeight
        self.view!.addSubview(scroller)
    }
    
    // MARK: - ASHorizontalScrollerDelegate    
    func horizontalScroller(scroller: ASHorizontalScroller, tapViewAtIndex index: Int) {
        print("index \(index)")
    }

    // MARK: - ASHorizontalScrollerDataSource
    func numberOfViewsForHorizontalScroller(scroller: ASHorizontalScroller) -> Int {
        return self.items.count;
    }
    
    func horizontalScroller(scroller: ASHorizontalScroller, viewAtIndex index: Int) -> UIView? {
        
        let item: ASItem = self.items[index] as! ASItem
        return ASContentView(frame: scroller.frame, item: item)
//        let color: UIColor = self.colors[index] as! UIColor
//        return ASContentView(frame: scroller.frame, withColor: color, andIndex: index)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

