//
//  DiamondShapeButton.swift
//  UsersListApp
//
//  Created by Taimur Mushtaq on 31/01/2023.
//

import UIKit

@IBDesignable
class DiamondShapeButton: UIButton {
    //MARK: - IBInspectable
    @IBInspectable weak var fillColor: UIColor? = UIColor.systemOrange {
        didSet {
            configureView()
        }
    }
    @IBInspectable weak var strokeColor: UIColor? = UIColor.systemYellow {
        didSet {
            configureView()
        }
    }
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureView()
    }
    
    //MARK: - Configuration
    func configureView(){
        self.layer.sublayers?.removeAll()
        
        self.backgroundColor = UIColor.clear

        let aPath = getBezierPaths()
        let newLayer = getLayer()
        
        newLayer.path = aPath.cgPath
        self.layer.addSublayer(newLayer)
    }
    
    func getBezierPaths() -> UIBezierPath {
        let aPath = UIBezierPath()

        aPath.move(to: CGPoint(x: bounds.size.width/2, y: 0.0))

        aPath.addLine(to: CGPoint(x: bounds.size.width, y: bounds.size.height/2))
        aPath.addLine(to: CGPoint(x: bounds.size.width/2, y: bounds.size.height))
        aPath.addLine(to: CGPoint(x: 0, y: bounds.size.height/2))
        aPath.addLine(to: CGPoint(x: bounds.size.width/2, y: 0.0))

        aPath.close()
        
        return aPath
    }
    
    func getLayer() -> CAShapeLayer {
        let layer = CAShapeLayer()
        
        if let fillColor = fillColor {
            layer.fillColor = fillColor.cgColor
        }
        
        if let strokeColor = strokeColor {
            layer.strokeColor = strokeColor.cgColor
        }
        
        return  layer
    }
}
