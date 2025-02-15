//
//  ContentView.swift
//  daVinci
//
//  Created by Jesús De la Cruz on 14/02/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Da Vinci")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .shadow(radius: 2)
                    .padding(.top, 20)
                
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .padding(.vertical, 10)
        
                NavigationLink(destination: SorprendemeView()) {
                    Text("¡Sorpréndeme!")
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Spacer().frame(height: 30)
                
                Text("Selecciona tu desafío:")
                NavigationLink(destination: EnConstruccionView(message: "Una por Una")) {
                    Text("Una por Una")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
//                NavigationLink(destination: PreguntaIndividualView()) {
//                    Text("Una por Una")
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(8)
//                }
                NavigationLink(destination: EnConstruccionView(message: "Grupo de Preguntas")) {
                    Text("Grupo de Preguntas")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                NavigationLink(destination: EnConstruccionView(message: "Exámenes de Admisión")) {
                    Text("Exámenes de Admisión")
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct PreguntaIndividualView: View {
    var body: some View {
        Text("Pregunta Individual")
    }
}



// #Preview {
//     HomeView()
// }
