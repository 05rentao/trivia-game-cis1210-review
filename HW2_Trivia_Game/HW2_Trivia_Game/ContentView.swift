//
//  ContentView.swift
//  HW2_Trivia_Game
//
//  Created by user268994 on 3/10/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(QuizViewModel.self) var quizViewModel 
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack {
                Spacer()
                Image("rajiv")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("CIS 1210 Review")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("How well do you remember BFS, DFS, Topoligial Sort, Strongly Connected Components, and DAGs?")
                    .frame(maxWidth: 300, alignment: .center)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                VStack {
                    NavigationLink(destination:  {
                        QuestionView(navigationPath: $navigationPath)
                    }) {
                        Label("Begin", systemImage: "play")
                    }
                    .buttonStyle(.bordered)
                    NavigationLink(destination:  {
                        GuideView()
                    }) {
                        Label("Guide", systemImage: "book")
                    }
                    .buttonStyle(.bordered)
                
                }
                .padding()
                Spacer()
                LeaderBoardView()
            }
            .padding()
            
        }
    }
}

#Preview {
    @Previewable @State var quizViewModel = QuizViewModel()
    
    ContentView()
        .environment(quizViewModel)
}
