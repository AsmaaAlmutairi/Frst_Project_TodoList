//
//  Math.swift
//  Frst_Project_TodoList
//
//  Created by ا on 04/05/1443 AH.
//  Copyright © 1443 sky. All rights reserved.
//

import Foundation
import UIKit

class DivBy0Error : Error {
    
}
class Math {
    func divide(num1: Int, num2: Int) throws -> Int {
            if num2 == 0 {
                let error = DivBy0Error()
                throw error
            }
            return num1 / num2
    }
}
