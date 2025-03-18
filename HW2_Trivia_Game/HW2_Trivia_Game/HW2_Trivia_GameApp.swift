//
//  HW2_Trivia_GameApp.swift
//  HW2_Trivia_Game
//
//  Created by user268994 on 3/10/25.
//

import SwiftUI

@main
struct HW2_Trivia_GameApp: App {
    @State var quizViewModel = QuizViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(quizViewModel)
        }
    }
}
