import Foundation

// build error: /Users/davidkozikowski/Library/Developer/Xcode/DerivedData/SkipNFirebaseUI-fqywiwltfqtbqofdddvvbhobxrrw/Build/Intermediates.noindex/BuildToolPluginIntermediates/skipnfirebase.output/SkipNFirebaseUI/skipstone/SkipNFirebaseUI/src/main/swift/Sources/FirebaseModel/FirebaseModel.swift:5:8 no such module 'FirebaseFirestore'

//#if SKIP
//import SkipFirebaseFirestore
//#else
//import FirebaseFirestore
//#endif

public actor FirebaseModel {
    /// The shared model singleton
       public static let shared = FirebaseModel()
    
//        public init() {
//            // Initialize Firebase-related resources here if needed
//        }
    
    public func fetchAnimalNames() -> [String] {
        return ["Dog", "Cat", "Elephant", "Lion", "Tiger", "Bear", "Giraffe", "Zebra", "Kangaroo", "Panda"]
    }
    
}
    
   
