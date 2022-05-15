import SwiftUI

struct AddDataView: View {
    @EnvironmentObject var firestoreManager: FireStoreManager
    @State private var title: String = ""
    @State private var nickname: String = ""

    var body: some View {
        VStack {
            TextField("Enter title", text: $title)
                .textFieldStyle(.roundedBorder)
            TextField("Enter nickname", text: $nickname)
                .textFieldStyle(.roundedBorder)
            Button("Add Data") {
                Task {
                    await firestoreManager.addData(data: Freeboard(title: self.title, nickname: self.nickname))
                }
            }
        }
    }

    struct AddDataView_Previews: PreviewProvider {
        static var previews: some View {
            AddDataView()
        }
    }
}
