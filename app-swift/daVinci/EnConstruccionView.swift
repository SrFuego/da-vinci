//
//  EnConstruccionView.swift
//  daVinci
//
//  Created by Jesús De la Cruz on 14/02/25.
//

import SwiftUI

struct EnConstruccionView: View {
    let message: String

    var body: some View {
        VStack {
            Text("\(message) en construcción")
                .font(.title)
                .padding()
            Text("Esta funcionalidad estará disponible pronto.")
                .foregroundColor(.secondary)
        }
        .navigationTitle(message)
    }
}
