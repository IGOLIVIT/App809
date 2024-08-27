//
//  AdventuresViewModel.swift
//  App809
//
//  Created by IGOR on 15/08/2024.
//

import SwiftUI
import CoreData

final class AdventuresViewModel: ObservableObject {
    
    @Published var photos: [String] = ["c1", "c2", "c3", "c4", "c5", "c6"]
    @Published var currAdPhoto = ""
    @Published var currAdPhoto2 = ""
    @Published var currAdPhoto3 = ""
    @Published var currHisPhoto = ""

    @Published var isAdd: Bool = false
    @Published var isAddHis: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    
    @Published var adName: String = ""
    @Published var adLocation: String = ""
    @Published var adDate: String = ""
    @Published var adDescr: String = ""
    @Published var adPhoto1: String = ""
    @Published var adPhoto2: String = ""
    @Published var adPhoto3: String = ""

    
    @Published var adventures: [AdModel] = []
    @Published var selectedAdventure: AdModel?
    
    func addAdventure() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "AdModel", into: context) as! AdModel

        loan.adName = adName
        loan.adLocation = adLocation
        loan.adDate = adDate
        loan.adDescr = adDescr
        loan.adPhoto1 = adPhoto1
        loan.adPhoto2 = adPhoto2
        loan.adPhoto3 = adPhoto3

        CoreDataStack.shared.saveContext()
    }

    func fetchAdventures() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<AdModel>(entityName: "AdModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.adventures = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.adventures = []
        }
    }
    
    @Published var hisPhoto: String = ""
    @Published var hisName: String = ""
    @Published var hisDescr: String = ""
    @Published var hisAdv: String = ""

    @Published var histories: [HisModel] = []
    @Published var selectedHistory: HisModel?
    
    func addHistory() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "HisModel", into: context) as! HisModel

        loan.hisPhoto = hisPhoto
        loan.hisName = hisName
        loan.hisDescr = hisDescr
        loan.hisAdv = hisAdv

        CoreDataStack.shared.saveContext()
    }

    func fetchHistorys() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<HisModel>(entityName: "HisModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.histories = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.histories = []
        }
    }
}
