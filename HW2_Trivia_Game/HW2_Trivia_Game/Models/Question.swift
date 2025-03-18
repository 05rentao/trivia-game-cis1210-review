//
//  Question.swift
//  HW2_Trivia_Game
//
//  Created by user268994 on 3/10/25.
//
import UIKit

struct Question: Hashable {
    let id: Int
    let text: String
    let answers: [String]
    let correct: String
    let imageName: String
    
    func isCorrect(_ answer : String) -> Bool {
        return answer == correct
    }
    
    var image: UIImage? {
            return UIImage(named: imageName)
        }
}



