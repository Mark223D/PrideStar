//
//  PillLabel.swift
//  PrideStar
//
//  Created by Mark Debbane on 1/8/20.
//  Copyright © 2020 Mark Debbane. All rights reserved.
//

import UIKit
@IBDesignable class PillLabel: UILabel {
    
    @IBInspectable var verticalPad: CGFloat = 0
    @IBInspectable var horizontalPad: CGFloat = 0
    
    
    func setup() {
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
        textAlignment = .center
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    override var intrinsicContentSize: CGSize {
        let superSize = super.intrinsicContentSize
        let newWidth = superSize.width + superSize.height
        let newHeight = superSize.height
        let newSize = CGSize(width: newWidth, height: newHeight)
        return newSize
    }
}
