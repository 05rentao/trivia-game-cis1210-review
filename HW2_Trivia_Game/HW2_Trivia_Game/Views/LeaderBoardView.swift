//
//  LeaderBoardView.swift
//  HW2_Trivia_Game
//
//  Created by user268994 on 3/10/25.
//
import SwiftUI

struct LeaderBoardView : View {
    @Environment(QuizViewModel.self) var viewModel
    
    var body : some View {
        Text("Leader Board")
            .font(.title3)
            .fontWeight(.bold)
            .padding([.bottom, .trailing], 5)
        if (viewModel.leaderBoard.count > 0) {
            Text("#1: \(viewModel.highest()) points")
            if (viewModel.leaderBoard.count > 1 ) {
                Text("#2: \(viewModel.secondHighest()) points")
                
            }
        } else {
            Text("No Attempts Available")
        }

    }
}

#Preview {
    @Previewable @State var quizViewModel = QuizViewModel()
    LeaderBoardView()
        .environment(quizViewModel)
}
