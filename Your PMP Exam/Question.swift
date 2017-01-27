//
//  Question.swift
//  Your PMP Exam
//
//  Created by Austin Cundiff on 1/21/17.
//  Copyright © 2017 Austin Cundiff. All rights reserved.
//

import Foundation

class Question
{
    var userChoice = 0
    var created = ""
    var updated: String = ""
    var document = ""
    var correctChoice = 0
    var userGotCorrect = false
    var isCreated = true
    var wrongAnswers = [String]()
    func getUpdated() -> String
    {
        
        if(updated.contains("1"))
        {
            return "1";
        }
        else
        {
            var commmaLocation = 0;
            for i in 0..<updated.characters.count
            {
                if(updated[i] == ",")
                {
                    commmaLocation = i;
                    return updated[0..<commmaLocation];
                }
            }
            return updated;
        }

    }
    func getCreated() -> String
    {
        
        if(created.contains("1"))
        {
            return "1";
        }
        else
        {
            var commmaLocation = 0;
            for i in 0..<created.characters.count
            {
                if(created[i] == ",")
                {
                    commmaLocation = i;
                    return created[0..<commmaLocation];
                }
            }
            return created;
        }
        
    }

    }
extension String {
    
    var length: Int {
        return self.characters.count
    }
    
    subscript (i: Int) -> String {
        return self[Range(i ..< i + 1)]
    }
    
    func substring(from: Int) -> String {
        return self[Range(min(from, length) ..< length)]
    }
    
    func substring(to: Int) -> String {
        return self[Range(0 ..< max(0, to))]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return self[Range(start ..< end)]
}
}
