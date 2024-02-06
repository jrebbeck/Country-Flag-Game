//
//  QuestionView.swift
//  Country Flag Game
//
//  Created by Justin Rebbeck on 1/23/24.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var quizManager: QuizManager
    var body: some View {
        if quizManager.playingGame {
            VStack(spacing: 20, content: {
                HStack(content: {
                    Text("Country Flag Quiz")
                        .foregroundColor(.yellow)
                        .fontWeight(.heavy)
                    Spacer()
                    Text("\(quizManager.index) out of \(quizManager.questions.count)")
                        .foregroundColor(.yellow)
                })
                ProgressBar(progress: quizManager.progress) //chekc progress bar
                VStack(spacing: 10, content: {
                    Text("Which country's flag is this?")
                    Image(quizManager.country)
                        .resizable()
                        .frame(width: 300, height: 200)
                    ForEach(quizManager.answerChoices) { answer in
                        AnswerRow(answer: answer)
                            .environmentObject(quizManager)
                    }
                })
                Button {
                    quizManager.goToNextQuestion()
                } label: {
                    CustomButton(text: "Next", background:
                                    quizManager.answerSelected ? .yellow : .gray)
                }
                .disabled(!quizManager.answerSelected)
                Spacer()
            })
            .padding()
            .background(.cyan)
        }
        else {
            VStack(spacing: 20, content: {
                Text("Country Flag Game")
                    .font(.title)
                Text("Congratulations! You have completed the game.")
                Text("You scored \(quizManager.score) out of \(quizManager.questions.count)")
                Button {
                    quizManager.reset()
                } label: {
                    CustomButton(text: "Play Again")
                }
            })
            .foregroundColor(.yellow)
            .padding()
            .frame(maxWidth: .infinity)
            .background(.cyan)
        }
    }
}



