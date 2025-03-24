//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Griffin Heinberg on 3/23/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answers: String
    
    init(q : String, a : String) {
        text = q
        answers = a
    }
}
