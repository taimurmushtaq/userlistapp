//
//  CGSizeExt.swift
//  Monty
//
//  Created by Taimur on 02/02/2017.
//  Copyright © 2017 SevenTechnology. All rights reserved.
//

import Foundation
import UIKit

extension CGSize {
    func resizeToWidth(_ w: CGFloat) -> CGSize {
        let scaleFactor = w / width
        
        let newWidth = width * scaleFactor
        let newHeight = height * scaleFactor
        
        return CGSize(width: newWidth, height: newHeight)
    }
    func resizeToHeight(_ h: CGFloat) -> CGSize {
        let scaleFactor = h / height
        
        let newWidth = width * scaleFactor
        let newHeight = height * scaleFactor
        
        return CGSize(width: newWidth, height: newHeight)
    }
}
