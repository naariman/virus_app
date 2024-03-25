//
//  MatrixManger.swift
//  VK_test_assignment
//
//  Created by Nariman on 25.03.2024.
//

import Foundation

struct MatrixManager {
    static func createMatrix(for number: Int) -> [Int] {
        let range = [18, 32, 50, 72, 98, 128, 162, 200, 242, 288, 338, 392, 450, 512, 578, 648, 722, 800, 882, 968, 1058, 1152, 1250]

        guard range.contains(number) else {return [6, 3]}
            let col = sqrt(Double(number / 2))
            let row = number / Int(col)
            return [Int(col), row]
    }
}
