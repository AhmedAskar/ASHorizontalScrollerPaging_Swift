//
//  ASHorizontalScroller.swift
//  ASHorizontalScrollerPagingSwift
//
//  Created by Ahmed Askar on 6/2/16.
//  Copyright © 2016 Askar. All rights reserved.
//

import Foundation
import UIKit


protocol ASHorizontalScrollerDataSource {

    // ask the delegate how many views he wants to present inside the horizontal scroller
    func numberOfViewsForHorizontalScroller(scroller: ASHorizontalScroller) -> Int

    // ask the delegate to return the view that should appear at <index>
    func horizontalScroller(scroller: ASHorizontalScroller, viewAtIndex index: Int) -> UIView?
}

protocol ASHorizontalScrollerDelegate {
   
    // inform the delegate what the view at <index> has been tapped
    func horizontalScroller(scroller: ASHorizontalScroller, tapViewAtIndex index: Int)
  
    // ask the delegate for the index of the initial view to display. this method is optional
    // and defaults to 0 if it's not implemented by the delegate
    // func horizontalScrollerDidScrollView(fractional: CGFloat)
}


class ASHorizontalScroller: UIView,UIScrollViewDelegate
{
    var scrollWidth: CGFloat!
    var scrollHeight: CGFloat!
    var dataSource: ASHorizontalScrollerDataSource!
    var delegate: ASHorizontalScrollerDelegate!
    var scroller: UIScrollView!
    
    let VIEWS_OFFSET:CGFloat! = 0.0
    let VIEW_PADDING_DEFAULT:CGFloat! = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
   
            // Initialization code
            scroller = UIScrollView(frame: frame)
            scroller.showsHorizontalScrollIndicator = false
            scroller.delegate = self
            scroller.pagingEnabled = true
            self.addSubview(scroller)
            let tapGuesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.scrollerIsTapped))
            scroller.addGestureRecognizer(tapGuesture)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func scrollerIsTapped(gesture: UITapGestureRecognizer) {
        let location: CGPoint = gesture.locationInView(gesture.view!)
        // Enumerate only all subviews we added
   
        
        for index in 0..<self.dataSource.numberOfViewsForHorizontalScroller(self) {
            let view: UIView = scroller.subviews[index]
            if CGRectContainsPoint(view.frame, location) {
                self.delegate.horizontalScroller(self, tapViewAtIndex: index)
            }
        }
    }
    
    func reload() {
        if dataSource == nil {
            return
        }

        for (_, value) in scroller.subviews.enumerate() {
                value.removeFromSuperview()
        }
    
        //the starting point of the views inside the scroller
        var startValue: CGFloat = VIEWS_OFFSET
        for i in 0..<self.dataSource.numberOfViewsForHorizontalScroller(self) {
            // 4 - add a view at the right position
            startValue += VIEW_PADDING_DEFAULT
            let view: UIView = dataSource.horizontalScroller(self, viewAtIndex: i)!
            view.frame = CGRectMake(startValue, VIEW_PADDING_DEFAULT, scrollWidth, self.scrollHeight)
            scroller.addSubview(view)
            startValue += scrollWidth + VIEW_PADDING_DEFAULT
        }
        
        scroller.contentSize = CGSizeMake(startValue + VIEWS_OFFSET, self.frame.size.height)
    }

    override func didMoveToSuperview() {
        self.reload()
    }
    
    /*func scrollViewDidScroll(aScrollView: UIScrollView) {
        let pageWidth: CGFloat = scroller.bounds.size.width
        let fractionalPage: CGFloat = scroller.contentOffset.x / pageWidth
        self.delegate.horizontalScrollerDidScrollView(fractionalPage)
    }*/
}

