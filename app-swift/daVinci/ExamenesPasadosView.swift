import SwiftUI

struct ExamenesPasadosView: View {
    var body: some View {
        VStack {
            Text("Próximamente")
                .font(.title)
            Text("Esta funcionalidad estará disponible pronto")
                .foregroundColor(.secondary)
        }
        .navigationTitle("Exámenes Pasados")
    }
}
