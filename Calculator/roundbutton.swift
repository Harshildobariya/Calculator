//
//  roundbutton.swift
//  mycal
//
//  Created by Harshil sureshbhai dobariya on 27/01/18.
//  Copyright © 2018 Harshil sureshbhai dobariya. All rights reserved.
//

import UIKit
@IBDesignable
class roundbutton: UIButton {
    @IBInspectable var roundbutton:Bool = false{
        didSet{
            if roundbutton{
                layer.cornerRadius=frame.height/2
            }
        }
    }
    override func prepareForInterfaceBuilder() {
        if roundbutton{
            layer.cornerRadius=frame.height/2
        }
    }
}
