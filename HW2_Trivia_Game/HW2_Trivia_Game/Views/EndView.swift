//
//  EndView.swift
//  HW2_Trivia_Game
//
//  Created by user268994 on 3/10/25.
//
import SwiftUI

struct EndView: View {
    @Environment(QuizViewModel.self) var viewModel
    @Binding var navigationPath: NavigationPath

    var body: some View {
        VStack {
            Spacer()
            Text("Score")
                .font(.title)
            Text("\(viewModel.points)")
                .font(.system(size: 100, weight: .heavy, design: .rounded))
            Button("Restart") {
                viewModel.resetQuiz()
                navigationPath = NavigationPath()
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
            LeaderBoardView()
            Spacer()
        }
    }
}

#Preview {
    @Previewable @State var quizViewModel = QuizViewModel()
    @Previewable @State var navigationPath = NavigationPath()
    
    EndView(navigationPath: $navigationPath)
        .environment(quizViewModel)
}
