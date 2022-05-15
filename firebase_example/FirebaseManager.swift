import Firebase
import FirebaseFirestoreSwift

class FireStoreManager: ObservableObject {
    @Published var freeboardTitle: String = ""
    @Published var freeboardNickName: String = ""

    func fetchData() {
        let db = Firestore.firestore()
        let docRef = db.collection("freeboard").document("NDV8FGEUcp7mt5R892bM")
        docRef.getDocument { (document, error) in
            guard error == nil else {
                print("error", error ?? "")
                return
            }

            if let document = document, document.exists {
                let data = document.data()
                if let data = data {
                    print("data", data)
                    self.freeboardTitle = data["title"] as? String ?? ""
                    self.freeboardNickName = data["nickname"] as? String ?? ""
                }
            }
        }
    }

    func addData(title: String, nickname: String) {
        let db = Firestore.firestore()
        let docRef = db.collection("freeboard")
        docRef.document().setData([
            "title": title,
            "nickname": nickname
            ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    func addData(data: Freeboard) async {
        let db = Firestore.firestore()
        let docRef = db.collection("freeboard")
        do {
            try docRef.document().setData(from: data)
        } catch let error {
            print(error)
        }
    }

    init() {
        fetchData()
    }
}
