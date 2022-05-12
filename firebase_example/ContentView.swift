//
//  ContentView.swift
//  firebase_example
//
//  Created by Mingwan Choi on 2022/05/11.
//

import SwiftUI
import FirebaseFirestore

struct ContentView: View {
    @EnvironmentObject var firestoreManager: FireStoreManager
     
    var body: some View {
        VStack {
            Text("My Title: \(firestoreManager.freeboardTitle)")
            Text("My Nickname: \(firestoreManager.freeboardNickName)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
