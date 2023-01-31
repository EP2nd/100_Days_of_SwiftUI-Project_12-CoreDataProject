//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Edwin Przeźwiecki Jr. on 31/01/2023.
//

import CoreData
import SwiftUI

/// Challenge 2:
enum PredicateKey: String {
    case equals = "=="
    case isMoreThan = ">"
    case isLessThan = "<"
    case includes = "IN"
    case beginsWith = "BEGINSWITH"
    case contains = "CONTAINS[c]"
}

struct FilteredList<T: NSManagedObject, Content: View>: View {
    
    @FetchRequest var fetchRequest: FetchedResults<T>
    
    // MARK: The following parameter is not needed anymore with a default value in initializer:
    /// Challenge 1:
//    var predicateString: String
    
    /// This is the content closure; it'll be called once for each item in the list:
    let content: (T) -> Content
    
    // MARK: The following parameter is not needed anymore with a default value in initializer:
    /// Challenge 3:
//    var sortDescriptors = [SortDescriptor<T>]()
    
    var body: some View {
        List(fetchRequest, id: \.self) { singer in
            self.content(singer)
        }
    }
    
    // MARK: The following function is not needed anymore with values assigned to each case in the above enum:
    /// Challenge 2:
//    static func predicateKey(_ predicate: PredicateKey) -> String {
//        switch predicate {
//        case .equals:
//            return "=="
//        case .isMoreThan:
//            return ">"
//        case .isLessThan:
//            return "<"
//        case .includes:
//            return "IN"
//        case .beginsWith:
//            return "BEGINSWITH"
//        default:
//            return "CONTAINS[c]"
//        }
//    }
    
    /// Challenge 1, 2 and 3:
    init(/* predicateString: String = "CONTAINS[c]", */ predicateString: PredicateKey = .contains, filterKey: String, filterValue: String, sortDescriptors: [SortDescriptor<T>] = [], @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: /* [] */ sortDescriptors, predicate: NSPredicate(format: /* \(FilteredList<T, Content>.predicateKey(.beginsWith)) -> */ "%K \(predicateString.rawValue) %@" /* <- \(predicateString) */, filterKey, filterValue))
//        self.predicateString = predicateString
        self.content = content
    }
}
