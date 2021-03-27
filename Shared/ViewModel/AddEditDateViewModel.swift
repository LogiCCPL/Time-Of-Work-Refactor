//
//  AddDateViewModel.swift
//  Time Of Work (iOS)
//
//  Created by Robert Adamczyk on 05.03.21.
//

import Foundation
import SwiftUI
import CoreData

class AddEditDateViewModel: ObservableObject {
    @Published var new = New()
    @Published var showComponent: ShowComponents?
    
    func changeShowComponent(newValue: ShowComponents?) {
        withAnimation{
            showComponent = showComponent == newValue ? nil : newValue // if old value is new value remove picker from screen
        }
    }

    func addDate(context: NSManagedObjectContext) {
        let newData = Dates(context: context)
        newData.date = new.date
        newData.timeIn = new.timeIn
        
        if new.night {
            if let timeOut = new.timeOut.plusOneDay() {
                newData.timeOut = timeOut
            }else {
                print("add date error")
                return
            }
        }else {
            newData.timeOut = new.timeOut
        }
        newData.night = new.night
        newData.secPause = new.secPause
        newData.secWork = Int(newData.timeOut.timeIntervalSince(newData.timeIn)) - new.secPause

        newData.holiday = false
        newData.publicHoliday = false
        newData.sickness = false
        
        do {
            try context.save()
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func editDate(date: FetchedResults<Dates>.Element, context: NSManagedObjectContext) {
        date.date = new.date
        date.timeIn = new.timeIn
        
        if new.night == date.night { // if not changed
            date.timeOut = new.timeOut
        }else { // if user changed work at night
            if let timeOut = Calendar.current.date(byAdding: .day, value: new.night ? 1 : -1, to: new.timeOut) {
                date.timeOut = timeOut
            }
        }
        date.night = new.night
        date.secPause = new.secPause
        date.secWork = Int(date.timeOut.timeIntervalSince(date.timeIn)) - new.secPause
        do {
            try context.save()
        }
        catch {
            print(error.localizedDescription)
        }
    }
}
