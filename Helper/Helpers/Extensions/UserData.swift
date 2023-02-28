//
//  UserData.swift
//  Helper
//
//  Created by Владислав Куликов on 26.02.2023.
//

import UIKit

struct UserData {
    var entered: Bool
    var login: String
    var password: String
    var email: String
}

var test:[UserData] = [UserData(entered: false, login: "Vladislav", password: "admin1", email: "vlad@gmail.com") ]

var arrayIdComponents = [MotherbroadCell.identifier, CpuCell.identifier, GpuCell.identifier, RamCell.identifier, PowerCell.identifier, SsdCell.identifier, CoolerCpuCell.identifier, CaseCell.identifier, CaseCoolerCell.identifier]



