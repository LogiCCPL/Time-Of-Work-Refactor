//
//  DoubleToTime.swift
//  Time Of Work (iOS)
//
//  Created by Robert Adamczyk on 10.03.21.
//

extension Int {
    func toTimeString() -> String{
        let positive = abs(self)
        let h = positive / 3600
        let m = positive % 3600 / 60
        let hour = "\(h)h "
        let mins = "\(m)m"
        return self < 0 ? "-" + hour + mins : hour + mins
    }
}
