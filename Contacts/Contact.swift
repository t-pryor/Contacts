//
//  Contact.swift
//  Contacts
//
//  Created by Tim Pryor on 2016-01-11.
//  Copyright © 2016 Tim Pryor. All rights reserved.
//

import Foundation

// inheriting from NSObject allows the class to be exposed to the ObjC portion of the application
// subclassing from an ObjC class is necessary to call Swift code from ObjC
// if project written solely in Swift->make Contact a struct
//  but Swift's structs not visible to ObjC



class Contact: NSObject {
    let name: String
    init(contactName: String) {
        name = contactName
    }
}