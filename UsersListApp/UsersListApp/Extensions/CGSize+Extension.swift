//
//  CGSizeExt.swift
//  Monty
//
//  Created by Taimur Mushtaq on 31/01/2023.
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
