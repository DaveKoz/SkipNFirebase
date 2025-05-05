#if !SKIP_BRIDGE
import Foundation

#if SKIP
import SkipFirebaseFirestore
#else
import FirebaseFirestore
#endif

public actor FireplaceModel {
    /// The shared model singleton
       public static let shared = FireplaceModel()
    
//        public init() {
//            // Initialize Firebase-related resources here if needed
//        }
    
    public func fetchAnimalNames() -> [String] {
        return ["Dog", "Cat", "Elephant", "Lion", "Tiger", "Bear", "Giraffe", "Zebra", "Kangaroo", "Panda"]
    }
    
}
    
#endif
