//
//  JSONParser.swift
//  shopperCart
//
//  Created by Subash on 20/12/19.
//  Copyright © 2019 Subash. All rights reserved.
//

import Foundation
class JSONParser {
    public static func parse<T: Decodable>(_ data: Data, as type: T.Type = T.self) -> T {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse data:\n\(error)")
        }
    }
}
