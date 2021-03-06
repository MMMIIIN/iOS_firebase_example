import SwiftUI
import Firebase

@main
struct firebase_exampleApp: App {
    @StateObject var firestoreManager = FireStoreManager()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(firestoreManager)
        }
    }
}
