//
//  NotesViewModel.swift
//  App809
//
//  Created by IGOR on 15/08/2024.
//

import SwiftUI
import CoreData

final class NotesViewModel: ObservableObject {
    
    @AppStorage("views") var views: Int = 0
    @Published var addView = ""

    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false
    
    @Published var savedCart: [String] = []

    @Published var emojies: [String] = ["ru", "up"]
    @Published var currentEmo = ""

    @Published var notName = ""
    @Published var notDate: String = ""
    @Published var notDescr = ""
    @Published var notEmo = ""
    
    @Published var notes: [NotesModel] = []
    @Published var selectedNote: NotesModel?

    func addNote() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "NotesModel", into: context) as! NotesModel

        loan.notName = notName
        loan.notDate = notDate
        loan.notDescr = notDescr
        loan.notEmo = notEmo

        CoreDataStack.shared.saveContext()
    }

    func fetchNotes() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NotesModel>(entityName: "NotesModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.notes = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.notes = []
        }
    }
}
