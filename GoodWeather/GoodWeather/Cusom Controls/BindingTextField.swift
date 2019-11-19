//
//  BindingTextField.swift
//  GoodWeather
//
//  Created by Lucas Inocencio on 19/11/19.
//  Copyright © 2019 Lucas Inocencio. All rights reserved.
//

import Foundation
import UIKit

class BindingTextField: UITextField {
    var textChangeClousure: (String) -> () = { _ in }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func bind(callback: @escaping (String) -> ()) {
        self.textChangeClousure = callback
    }
    
    private func commonInit() {
        addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
    }
    
    @objc func textFieldChange(_ textField: UITextField) {
        if let text = textField.text {
            self.textChangeClousure(text)
        }
    }
}
