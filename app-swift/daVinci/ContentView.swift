//
//  ContentView.swift
//  daVinci
//
//  Created by Jesús De la Cruz on 14/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: GrupoDePreguntasView()) {
                    Text("Grupo de Preguntas")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                NavigationLink(destination: ExamenesPasadosView()) {
                    Text("Exámenes Pasados")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .navigationTitle("Problemas de Admisión en la palma de tu mano")
        }
        // VStack {
        //     Image(systemName: "globe")
        //         .imageScale(.large)
        //         .foregroundStyle(.tint)
        //     Text("Hello, world!")
        // }
        // .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// #Preview {
//     ContentView()
// }
