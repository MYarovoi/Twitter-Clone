//
//  Tweet.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 09.12.2024.
//

import Foundation
import Firebase

struct Tweet: Identifiable, Codable {
    let id: String
    let caption: String
    let fullname: String
    let likes: Int
    let timeStamp: Timestamp
    let uid: String
    let username: String
    //    let profileImageUrl: String
    
    var timestampString: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: timeStamp.dateValue(), to:  Date()) ?? ""
    }
    
    var detailedTimestampString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a • MMM dd yyyy"
        return formatter.string(from: timeStamp.dateValue())
    }
}
