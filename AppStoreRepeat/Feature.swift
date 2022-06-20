//
//  Feature.swift
//  AppStoreRepeat
//
//  Created by JUNO on 2022/06/20.
//

import Foundation

struct Feature: Decodable {
    let type: String
    let appName: String
    let description: String
    let imageURL: String
}
