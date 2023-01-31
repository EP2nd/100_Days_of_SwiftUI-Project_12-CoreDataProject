//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Edwin Przeźwiecki Jr. on 31/01/2023.
//

import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
    
    @FetchRequest var fetchRequest: FetchedResults<T>
    
    /// Challenge 1:
    var predicate: String
    
    /// This is the content closure; it'll be called once for each item in the list:
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest, id: \.self) { singer in
            self.content(singer)
        }
    }
    
    /// Challenge 1:
    init(predicate: String, filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K \(predicate) %@", filterKey, filterValue))
        self.predicate = predicate
        self.content = content
    }
}
