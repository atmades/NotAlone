//
//  DateViewModel.swift
//  NotAlone v2
//
//  Created by Максим on 04.06.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import Foundation

struct DateTimeOfEvent {
    var date: String?
    var startTime: String?
    var endTime: String?
}

protocol DateEventViewModel: AnyObject {
    // MARK: - Properties
    var dateTime: DateTimeOfEvent? { get }
    
    // MARK: - Functions
    func didDateChanged(date: Date)
    func didTimeStartChanged(time: String, index: Int)
    func didTimeEndChanged(time: String, index: Int)
}

class DateEventViewModelImpl: DateEventViewModel {
    var dateTime: DateTimeOfEvent?
    
    func didDateChanged(date: Date) {
        print("didDateChanged")
        dateTime?.date = formatterDate(date: date)
    }
    
    func didTimeStartChanged(time: String, index: Int) {
        print("didTimeStartChanged")
    }
    
    func didTimeEndChanged(time: String, index: Int) {
        print("didTimeEndChanged")
    }
    
    private func formatterDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        let text = formatter.string(from: date)
        return text
    }
}
