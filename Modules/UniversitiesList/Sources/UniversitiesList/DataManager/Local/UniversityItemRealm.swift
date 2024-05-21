//
//  File.swift
//  
//
//  Created by Khaled Kamal on 21/05/2024.
//

import Foundation
import RealmSwift
import DomainLayer

/// Realm object representing a university item.
@objc(UniversityListItem)
public class UniversityItemRealm: Object {
    /// Primary key for the object.
    @Persisted(primaryKey: true) var id: ObjectId
    /// The alpha two code of the country.
    @Persisted var alphaTwoCode: String
    /// The name of the university.
    @Persisted var name: String
    /// The country where the university is located.
    @Persisted var country: String
    /// The domains associated with the university.
    @Persisted var domains = List<String>()
    /// The web pages associated with the university.
    @Persisted var webPages = List<String>()
    /// The state or province where the university is located.
    @Persisted var stateProvince: String?
}

extension UniversityItemRealm {
    /// Convenience initializer to create a Realm university item from a DTO.
    /// - Parameter universityListItem: The DTO representing the university item.
    convenience init(universityItemModel: UniversityItemModel) {
        self.init()
        name = universityItemModel.name
        alphaTwoCode = universityItemModel.alphaTwoCode
        country = universityItemModel.country
        stateProvince = universityItemModel.stateProvince
        universityItemModel.domains.forEach {
            domains.append($0)
        }
        universityItemModel.webPages.forEach {
            webPages.append($0)
        }
    }
}
