//
//  ViewModel.swift
//  HW2_Trivia_Game
//
//  Created by user268994 on 3/10/25.
//
import Foundation
import SwiftUI

@Observable
class QuizViewModel {
    // MARK: - Properties
    var questions: [Question] = [] // Array to store questions
    var currQ: Question
    var points: Int = 0 // The user's score
    var leaderBoard = Set<String>() // The user's highscore
    var ansSubmitted: Bool = false // Flag to determine if the quiz has finished
    var gameEnd: Bool = false

    // MARK: - Initialization
    init() {
        let initQuestions = [
            Question(id: 0,
                     text: "BFS: In which order does BFS explore",
                     answers: ["Explores immediate neighbors first before exploring neighbors of neighbors",
                               "Explores neighbors of neighbors first before exploring possible immediate neighbors",
                               "Explores nodes from lowest to highest", "Explore in increasing order nodes' width"],
                     correct: "Explores immediate neighbors first before exploring neighbors of neighbors",
                     imageName: "bfs"),
            Question(id: 1,
                     text: "DFS: Which of the following is not a valid application of DFS?",
                     answers: ["Finding connected components in an undirected graph",
                               "Detecting cycles in a directed graph",
                               "Finding the shortest path in an unweighted graph",
                               "Solving mazes"],
                     correct: "Finding the shortest path in an unweighted graph",
                     imageName: "dfs"),
            Question(id: 2,
                     text: "Topological Sort: Which type of graph does topological sorting apply to?",
                     answers: ["Directed Acyclic Graph (DAG)", "Undirected Graph", "Weighted Graph", "Complete Graph"],
                     correct: "Directed Acyclic Graph (DAG)",
                     imageName: "topo"),
            Question(id: 3,
                     text: "Strongly Connected Components: Which of the following best describes a Strongly Connected Component (SCC) in a directed graph?",
                     answers: ["A subgraph where every vertex is reachable from every other vertex within the subgraph",
                               "A subgraph where all vertices have the same in-degree and out-degree",
                               "component where each vertex has at least one incoming and one outgoing edge",
                               "A subgraph where there exists a path between any two nodes in the entire graph"],
                     correct: "A subgraph where every vertex is reachable from every other vertex within the subgraph",
                     imageName: "SCC"),
            Question(id: 4,
                     text: "DAGs: Which property is always true for a Directed Acyclic Graph (DAG)?",
                     answers: ["It contains at least one cycle",
                               "It has at most one sink node",
                               "It has a valid topological ordering",
                               "It must be connected"],
                     correct: "It has a valid topological ordering",
                     imageName: "DAG")
        ]
        self.questions = initQuestions
        self.currQ = initQuestions[0] // Now it's safe to use `self`
    }

      // MARK: - Methods
      /// Processes the selected answer, updates the score and advances to the next question.
    func submitAnswer(_ answer: String) {
        if answer == currQ.correct {
            points += 1
        }
        ansSubmitted = true
    }
    
    func finishRound() {
        if (currQ.id + 1 == questions.count) {
            addScore()
            gameEnd = true
        } else {
            currQ = questions[currQ.id + 1]
        }
        ansSubmitted = false
    }
    
    func addScore() {
        if !leaderBoard.contains(String(points)) {
            leaderBoard.insert(String(points))
        }
    }

    /// Resets the quiz to its initial state for a new game.
    func resetQuiz() {
        // Functionality to be implemented: reset current question index, score, and quiz finished status; reload questions.
        points = 0
        currQ = questions[0]
        ansSubmitted = false
        gameEnd = false
      }
    
    /// Determining the color of each answer optio
    func buttonColors(_ answer: String) -> Color {
        if answer == currQ.correct {
            return .green
        } else {
            return .red
        }
    }
    
    func highest() -> String {
        var currMax = "0"
        for score in leaderBoard {
            if (score > currMax) {
                currMax = score
            }
        }
        return currMax
    }
    
    func secondHighest() -> String {
        let max = highest()
        var currMax = "0"
        for score in leaderBoard {
            if (score != max && score > currMax) {
                currMax = score
            }
        }
        return currMax
    }
}
