//
//  ASContentView.swift
//  ASHorizontalScrollerPagingSwift
//
//  Created by Ahmed Askar on 6/2/16.
//  Copyright © 2016 Askar. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    var x: CGFloat {return self.frame.origin.x }
    var y: CGFloat { return self.frame.origin.y }
    var width: CGFloat { return self.frame.size.width}
    var height: CGFloat { return self.frame.size.height}
}

class ASContentView: UIView {
    
    init(frame: CGRect, item: ASItem) {
        super.init(frame: frame)
            let titleLabel: UILabel = UILabel(frame: CGRectMake(0, self.frame.size.height * 0.05, self.frame.size.width * 0.8, 60))
            titleLabel.center = CGPointMake(self.center.x, self.frame.size.height * 0.1)
            titleLabel.text = item.value
            titleLabel.font = UIFont.systemFontOfSize(40.0)
            titleLabel.textAlignment = .Center
            self.addSubview(titleLabel)
            let imageview: UIImageView = UIImageView(frame: CGRectMake(self.width * 0.1, self.height * 0.1, self.frame.size.width * 0.8, self.width))
            imageview.contentMode = .ScaleAspectFit
            imageview.image = item.image
            self.addSubview(imageview)
    }
    
    init(frame: CGRect, withColor color: UIColor, andIndex index: Int) {
        super.init(frame: frame)
            self.backgroundColor = color
            let titleLabel: UILabel = UILabel()
            titleLabel.frame = frame
            titleLabel.center = self.center
            titleLabel.textAlignment = .Center
            titleLabel.textColor = UIColor.whiteColor()
            titleLabel.font = UIFont.boldSystemFontOfSize(85.0)
            titleLabel.text = "\(index)"
            self.addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
