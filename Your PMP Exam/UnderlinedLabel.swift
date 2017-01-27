//
//  UnderlinedLabel.swift
//  Your PMP Exam
//
//  Created by Austin Cundiff on 1/22/17.
//  Copyright © 2017 Austin Cundiff. All rights reserved.
//

import Foundation
import UIKit

class UnderlinedLabel: UILabel {
    
    override var text: String? {
        didSet {
            guard let text = text else { return }
            let textRange = NSMakeRange(0, text.characters.count)
            let attributedText = NSMutableAttributedString(string: text)
            attributedText.addAttribute(NSUnderlineStyleAttributeName , value: NSUnderlineStyle.styleSingle.rawValue, range: textRange)
            // Add other attributes if needed
            self.attributedText = attributedText
        }
    }
}
