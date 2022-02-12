//
//  SelectedFilters+Enum.swift
//  Mandam
//
//  Created by 홍세은 on 2022/02/12.
//

import Foundation

 class SelectedFilters: ObservableObject{
     @Published var age: AgeCategory = .all
     @Published var relationship: RelationshipCategory = .all
 }

 enum AgeCategory:String, CaseIterable {
     case all = "모두"
     case teenager = "10대"
     case Earlytwenties = "20대 초반"
     case Midtwenties = "20대 후반"
     case thirties = "30대"
     case fourties = "40대"
 }

 enum RelationshipCategory:String, CaseIterable {
     case all = "모두"
     case friend = "친구"
     case blindDate = "소개팅"
     case seniorsNJuniors = "선후배"
     case colleague = "동료"
     case priesthood = "사제지간"
 }
