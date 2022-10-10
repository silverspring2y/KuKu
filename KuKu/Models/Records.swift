//
//  Records.swift
//  KuKu
//
//  Created by Shinichiro Tanaka on 2022/09/19.
//

import Foundation
import UIKit

struct Records: Codable, Hashable {
    let numAsked: Int
    let numWrong: Int
    let wrongRate: Float
    
    init(nA: Int, nW: Int){
        self.numAsked = nA
        self.numWrong = nW
        self.wrongRate = Float(nW)/Float(nA)
    }
    
}
