import SwiftUI

struct ContentView: View {
    @EnvironmentObject var firestoreManager: FireStoreManager

    var body: some View {
        NavigationView {
            VStack {
                Text("My Title: \(firestoreManager.freeboardTitle)")
                Text("My Nickname: \(firestoreManager.freeboardNickName)")
                NavigationLink(destination: AddDataView(), label: { Text("AddDataView") })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
