//
//  HeroStats.swift
//  CollectionView JSON
//
//  Created by Prateek Roy on 07/02/18.
//  Copyright © 2018 Prateek Roy. All rights reserved.
//

import Foundation

struct HeroStats : Decodable {
    let localized_name : String
    let primary_attr : String
    let attack_type : String
    let legs : Int
    let img : String
    
}
