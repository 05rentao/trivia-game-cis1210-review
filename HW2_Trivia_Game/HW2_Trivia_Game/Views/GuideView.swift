//
//  GuideView.swift
//  HW2_Trivia_Game
//
//  Created by user268994 on 3/10/25.
//

import SwiftUI

struct GuideView : View {
    var body : some View {
        VStack {
            Text("Guide")
                .font(.title)
                .fontWeight(.bold)
            List {
                Text("First, study up on your CIS 1210 materials!")
                Text("Press 'begin' in the home screen to start!")
                Text("Press on which ever answer you think is correct!")
                Text("At anytime, you can click the 'restart' button to restart!")
                Text("After you've finished all the questions, you can try again by clicking 'restart'")
                Text("See the top scores thus far in the leader board on the finish screen!")
            }
        }
        .navigationTitle("Guide")
    }
        
}

#Preview {
    GuideView()
}

