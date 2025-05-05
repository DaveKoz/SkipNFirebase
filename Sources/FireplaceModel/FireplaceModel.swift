#if !SKIP_BRIDGE

#if SKIP
import SkipFirebaseFirestore
#else
import FirebaseFirestore
#endif

public actor FireplaceModel {
    /// The shared model singleton
       public static let shared = FireplaceModel()
    
    private let firestore: Firestore
    
    private init() {
        self.firestore = Firestore.firestore()
    }
    
    public func fetchAnimalNames() -> [String] {
        return ["Dog", "Cat", "Elephant", "Lion", "Tiger", "Bear", "Giraffe", "Zebra", "Kangaroo", "Panda"]
    }
    
}

#endif
