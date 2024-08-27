//
//  PlacesViewModel.swift
//  App809
//
//  Created by IGOR on 15/08/2024.
//

import SwiftUI
import CoreData

final class PlacesViewModel: ObservableObject {
    
    @Published var photos: [String] = ["c1", "c2", "c3", "c4", "c5", "c6"]
    @Published var currPhoto = ""
    @Published var currPhoto2 = ""
    @Published var currPhoto3 = ""
    
    @Published var types: [String] = ["All", "Nature", "Cities"]
    @Published var currType = "All"

    @Published var isAdd: Bool = false
    @Published var isAddHis: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    
    @Published var plName: String = ""
    @Published var plLoc: String = ""
    @Published var plDescr: String = ""
    @Published var plPhoto1: String = ""
    @Published var plPhoto2: String = ""
    @Published var plPhoto3: String = ""
    @Published var plType: String = ""

    @Published var places: [PlacesModel] = []
    @Published var selectedPlace: PlacesModel?
    
    func addPlace() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "PlacesModel", into: context) as! PlacesModel

        loan.plName = plName
        loan.plLoc = plLoc
        loan.plDescr = plDescr
        loan.plPhoto1 = plPhoto1
        loan.plPhoto2 = plPhoto2
        loan.plPhoto3 = plPhoto3
        loan.plType = plType

        CoreDataStack.shared.saveContext()
    }

    func fetchPlace() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PlacesModel>(entityName: "PlacesModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.places = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.places = []
        }
    }

}
