//
//  QuestionView.swift
//  HW2_Trivia_Game
//
//  Created by user268994 on 3/10/25.
//
import SwiftUI

struct QuestionView : View {
    @Environment(QuizViewModel.self) var viewModel
    @Binding var navigationPath: NavigationPath
    
    var body : some View {
        if (viewModel.gameEnd) {
            EndView(navigationPath: $navigationPath)
        } else {
            VStack {
                HStack{
                    Spacer()
                    Text("Q \(viewModel.currQ.id)")
                        .fontWeight(.bold)
                    Spacer()
                    Text("Score: \(String(viewModel.points))")
                    Spacer()
                    Button("Restart") {
                        viewModel.resetQuiz()
                    }
                    .buttonStyle(.bordered)
                    Spacer()
                }
                .padding(.bottom, 100)
                Image(viewModel.currQ.imageName)
                    .resizable()
                          .aspectRatio(contentMode: .fit)
                          .frame(width: 300, height: 200)
                Text(viewModel.currQ.text)
                    .frame(maxWidth: 300, alignment: .center)
                    .padding(.bottom, 20)
                if !viewModel.ansSubmitted {
                    ForEach(viewModel.currQ.answers, id: \.self) { answer in
                        Button (answer) {
                            viewModel.submitAnswer(answer)
                        }
                        .buttonStyle(.borderedProminent)
                        .frame(width: 350, alignment: .center)
                    }
                } else {
                    ForEach(viewModel.currQ.answers, id: \.self) { answer in
                        Button (answer) {
                            viewModel.submitAnswer(answer)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(viewModel.buttonColors(answer))
                        .frame(width: 350, alignment: .center)
                    }
                    Button("Next Question") {
                        viewModel.finishRound()
                    }
                    .buttonStyle(.borderedProminent)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .navigationBarTitleDisplayMode(.inline)
        }
        
        
    }
       
}

#Preview {
    @Previewable @State var quizViewModel = QuizViewModel()
    @Previewable @State var navigationPath = NavigationPath()
    
    QuestionView(navigationPath: $navigationPath)
        .environment(quizViewModel)
}

