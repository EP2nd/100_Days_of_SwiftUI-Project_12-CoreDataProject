//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Edwin Przeźwiecki Jr. on 31/01/2023.
//

import CoreData
import SwiftUI

/// Challenge 2:
enum PredicateKey {
    case equals, isMoreThan, isLessThan, includes, beginsWith
}

struct FilteredList<T: NSManagedObject, Content: View>: View {
    
    @FetchRequest var fetchRequest: FetchedResults<T>
    
    /// Challenge 1:
//    var predicateString: String
    
    /// This is the content closure; it'll be called once for each item in the list:
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest, id: \.self) { singer in
            self.content(singer)
        }
    }
    
    /// Challenge 2:
    static func predicateKey(_ predicate: PredicateKey) -> String {
        switch predicate {
        case .equals:
            return "=="
        case .isMoreThan:
            return ">"
        case .isLessThan:
            return "<"
        case .includes:
            return "IN"
        default:
            return "BEGINSWITH"
        }
    }
    
    /// Challenge 1 and 2:
    init(/* predicateString: String, */ filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K \(FilteredList<T, Content>.predicateKey(.beginsWith)) %@" /* <- \(predicateString) */, filterKey, filterValue))
//        self.predicateString = predicateString
        self.content = content
    }
}
