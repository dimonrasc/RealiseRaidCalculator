//
//  RaidCalculator.swift
//  RealiseRaidCalculator
//
//  Created by huf on 20.10.2022.
//

import Foundation

    func RaidCalculate(raidValue: String, sizeValue: Int, qtyValue: Int, qtyMainValue: Int, sizeType: String) -> String {
        
        var x = 0
        var xRaw = 0
        var sizeValGB = 0
        var sizeValTB = 0
        var sizeValRawGB = 0
        var sizeValRawTB = 0
        var usableGB = 0
        var usableTB = 0
        
        if (raidValue == "RAID 0"){
            if (qtyValue > 1){
                x = sizeValue * qtyValue
                if (sizeType == "TB"){
                    sizeValTB = x
                    sizeValGB = x * 1000
                }
                else{
                    sizeValGB = x
                    sizeValTB = x / 1000
                }
                usableGB = Int(((floor(Double(sizeValGB) * 0.9313 * 100)) / 100))
                usableTB = Int(((floor((Double(sizeValGB) * 0.9095) / 10)) / 100))
                
                return "\(raidValue)\nRaw storage: \(sizeValTB)TB/ \(sizeValGB)GB\nUsable storage: \(usableTB)TB/ \(usableGB)GB\nSpeed gain: \(qtyValue)x read and write speed again\nFault tolerance: None"
            }
            else{
                return "Minimum of 2 disks are required"
            }
        }

        else if (raidValue == "RAID 1"){
            if ((qtyValue > 1) && (qtyValue % 2 == 0)){
                x = sizeValue * qtyValue
                if (sizeType == "TB"){
                    sizeValTB = x
                    sizeValGB = x * 1000
                }
                else{
                    sizeValGB = x
                    sizeValTB = x / 1000
                }
                usableGB = Int(((floor(Double((sizeValGB / 2)) * 0.9313 * 100)) / 100))
                usableTB = Int(((floor(Double((sizeValGB / 2)) * 0.9095 * 10)) / 100))
                
                return "\(raidValue)\nRaw storage: \(sizeValTB)TB/ \(sizeValGB)GB\nUsable storage: \(usableTB / 100),\(usableTB % 100)TB/ \(usableGB)GB\nSpeed gain: \(qtyValue)x read speed\nFault tolerance: 3 drive failure"
            }
            else{
                return "Minimum of 2 disks are required and the quantity of disks must be even"
            }
        }

        else if (raidValue == "RAID 5"){
            if (qtyValue > 2){
                x = sizeValue * (qtyValue - 1)
                xRaw = sizeValue * qtyValue
                if (sizeType == "TB"){
                    sizeValTB = x
                    sizeValGB = x * 1000
                    sizeValRawTB = xRaw
                    sizeValRawGB = xRaw * 1000
                }
                else{
                    sizeValGB = x
                    sizeValTB = x / 1000
                    sizeValRawGB = xRaw
                    sizeValRawTB = xRaw / 1000
                }
                usableGB = Int(((floor(Double(sizeValGB) * 0.9313 * 100)) / 100))
                usableTB = Int(((floor((Double(sizeValGB) * 0.9095) / 10)) / 100))
                
                return "\(raidValue)\nRaw storage: \(sizeValRawTB)TB/ \(sizeValRawGB)GB\nUsable storage: \(usableTB)TB/ \(usableGB)GB\nSpeed gain: \(qtyValue - 1)x read speed\nFault tolerance: One drive failure"
            }
            else{
                return "Minimum of 3 disks are required"
            }
        }

        else if (raidValue == "RAID 10"){
            if ((qtyValue > 3) && (qtyValue % 2 == 0)){
                x = sizeValue * qtyValue
                if (sizeType == "TB"){
                    sizeValTB = x
                    sizeValGB = x * 1000
                }
                else{
                    sizeValGB = x
                    sizeValTB = x / 1000
                }
                usableGB = Int(((floor(Double((sizeValGB / 2)) * 0.9313 * 100)) / 100))
                usableTB = Int(((floor((Double((sizeValGB / 2)) * 0.9095) / 10)) / 100))
                
                return "\(raidValue)\nRaw storage: \(sizeValTB)TB/ \(sizeValGB)GB\nUsable storage: \(usableTB)TB/ \(usableGB)GB\nSpeed gain: \(qtyValue)x read and \(qtyValue / 2) speed gain\nFault tolerance: At least drive failure"
            }
            else{
                return "Minimum of 4 disks are required and the quantity of disks must be even"
            }
        }

        else if (raidValue == "RAID 50"){
            if(qtyValue >= qtyMainValue * 3){
                if ((qtyValue > 5) && (qtyValue % 2 == 0) && (qtyValue % qtyMainValue == 0)){
                    x = sizeValue * (qtyValue - 2)
                    xRaw = sizeValue * qtyValue
                    if (sizeType == "TB"){
                        sizeValTB = x
                        sizeValGB = x * 1000
                        sizeValRawTB = xRaw
                        sizeValRawGB = xRaw * 1000
                    }
                    else{
                        sizeValGB = x
                        sizeValTB = x / 1000
                        sizeValRawGB = xRaw
                        sizeValRawTB = xRaw / 1000
                    }
                    usableGB = Int(((floor(Double(sizeValGB) * 0.9313 * 100)) / 100))
                    usableTB = Int(((floor((Double(sizeValGB) * 0.9095) / 10)) / 100))
                    
                    return "\(raidValue)\nRaw storage: \(sizeValRawTB)TB/ \(sizeValRawGB)GB\nUsable storage: \(usableTB)TB/ \(usableGB)GB\nSpeed gain: \(qtyValue - qtyMainValue)x read speed\nFault tolerance: At least drive failure. One disk from each RAID5 set can fail without data loss"
                }
                else{
                    return "Minimum of 6 disks are required and the quantity of disks must be even. The total number of disks should be divived equally between the RAID5 sets"
                }
            }
            else{
                return "Minimum of 6 disks are required and the quantity of disks must be even. The total number of disks should be divived equally between the RAID5 sets"
            }
            return "Minimum of 6 disks are required and the quantity of disks must be even. The total number of disks should be divived equally between the RAID5 sets"
        }

        else if (raidValue == "RAID 6"){
                if (qtyValue > 3){
                    x = sizeValue * (qtyValue - 2)
                    xRaw = sizeValue * qtyValue
                    if (sizeType == "TB"){
                        sizeValTB = x
                        sizeValGB = x * 1000
                        sizeValRawTB = xRaw
                        sizeValRawGB = xRaw * 1000
                    }
                    else{
                        sizeValGB = x
                        sizeValTB = x / 1000
                        sizeValRawGB = xRaw
                        sizeValRawTB = xRaw / 1000
                    }
                    usableGB = Int(((floor(Double(sizeValGB) * 0.9313 * 100)) / 100))
                    usableTB = Int(((floor((Double(sizeValGB) * 0.9095) / 10)) / 100))
                    
                    return "\(raidValue)\nRaw storage: \(sizeValRawTB)TB/ \(sizeValRawGB)GB\nUsable storage: \(usableTB)TB/ \(usableGB)GB\nSpeed gain: \(qtyValue - 2)x read speed\nFault tolerance: Two drive failures"
                }
            
            else{
                return "Minimum of 4 disks are required"
            }
        }

        else if (raidValue == "RAID 60"){
            if(qtyValue >= qtyMainValue * 4){
                if ((qtyValue > 7) && (qtyValue % 2 == 0) && (qtyValue % qtyMainValue == 0)){
                    x = sizeValue * (qtyValue - 4)
                    xRaw = sizeValue * qtyValue
                    if (sizeType == "TB"){
                        sizeValTB = x
                        sizeValGB = x * 1000
                        sizeValRawTB = xRaw
                        sizeValRawGB = xRaw * 1000
                    }
                    else{
                        sizeValGB = x
                        sizeValTB = x / 1000
                        sizeValRawGB = xRaw
                        sizeValRawTB = xRaw / 1000
                    }
                    usableGB = Int(((floor(Double(sizeValGB) * 0.9313 * 100)) / 100))
                    usableTB = Int(((floor((Double(sizeValGB) * 0.9095) / 10)) / 100))
                    
                    return "\(raidValue)\nRaw storage: \(sizeValRawTB)TB/ \(sizeValRawGB)GB\nUsable storage: \(usableTB)TB/ \(usableGB)GB\nSpeed gain: \(qtyValue - (qtyMainValue * 2))x read speed\nFault tolerance: At least two drive failure. Two disk from each RAID6 set can fail without data loss"
                }
                else{
                    return "Minimum of 8 disks are required and the quantity of disks must be even. The total number of disks should be divived equally between the RAID6 sets"
                }
            }
            else{
                return "Minimum of 8 disks are required and the quantity of disks must be even. The total number of disks should be divived equally between the RAID6 sets"
            }
            return "Minimum of 8 disks are required and the quantity of disks must be even. The total number of disks should be divived equally between the RAID6 sets"
        }
        return "Error: You must selected"
    }
