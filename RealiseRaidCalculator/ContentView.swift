//
//  ContentView.swift
//  RealiseRaidCalculator
//
//  Created by huf on 18.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedRaids: String = "RAID 0"
    @State private var raidLevels: [String] = [
        "RAID 0",
        "RAID 1",
        "RAID 5",
        "RAID 6",
        "RAID 10",
        "RAID 50",
        "RAID 60"
    ]
    
    @State private var selectedSizeValue: String = "TB"
    private let sizeValue: [String] = [
    "GB",
    "TB"
    ]
    
    @State private var sizeDisk: Int = 0
    @State private var diskCount: Int = 0
    @State private var parytyRaid: Int = 0
    
    @State private var isParityRaidHiden = false
    
    @State private var resultRaaidCalculator: String = ""
    @State private var raidCalculate = RaidCalculate(raidValue: "RAID 5", sizeValue: 1, qtyValue: 4, qtyMainValue: 1, sizeType: "TB")
    
    let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter
        }()
    
    var body: some View {
        VStack {
            Text("RAID Calculator")
            HStack{
                Text("RAID levels:")
                Spacer()
                Picker("RAID levels",
                       selection: $selectedRaids) {
                    ForEach(raidLevels, id: \.self) { raid in
                        Text(raid)
                    }
                }
                       .onChange(of: selectedRaids, perform: { levels in
                           if levels == "RAID 50"  || levels == "RAID 60"{
                               isParityRaidHiden = true
                           }
                           else if levels != "RAID 50"  || levels != "RAID 60"{
                               isParityRaidHiden = false
                           }
                       })
            }
            HStack{
                Text("Single disk size:")
                //min: 1, max: 20000
                TextField("Size", value: $sizeDisk, formatter: NumberFormatter())
                    .keyboardType(.decimalPad)
                    .onReceive(NotificationCenter.default.publisher(for: UITextField.textDidBeginEditingNotification)) { obj in
                                    if let textField = obj.object as? UITextField {
                                        textField.selectedTextRange = textField.textRange(from: textField.beginningOfDocument, to: textField.endOfDocument)
                                    }
                                }
                Picker("Size Value", selection: $selectedSizeValue){
                    ForEach(sizeValue, id: \.self){ value in
                        Text(value)
                    }
                }
            }
            HStack{
                Text("Number of disks:")
                TextField("Disks", value: $diskCount, formatter: NumberFormatter())
                    .keyboardType(.decimalPad)
                    .onReceive(NotificationCenter.default.publisher(for: UITextField.textDidBeginEditingNotification)) { obj in
                                    if let textField = obj.object as? UITextField {
                                        textField.selectedTextRange = textField.textRange(from: textField.beginningOfDocument, to: textField.endOfDocument)
                                    }
                                }
            }
            if isParityRaidHiden{
                HStack{
                    Text("Parity RAIDs count:")
                    TextField("Count", value: $parytyRaid, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                        .onReceive(NotificationCenter.default.publisher(for: UITextField.textDidBeginEditingNotification)) { obj in
                                        if let textField = obj.object as? UITextField {
                                            textField.selectedTextRange = textField.textRange(from: textField.beginningOfDocument, to: textField.endOfDocument)
                                        }
                                    }
                }
            }
            Spacer()
            HStack{
                Text(resultRaaidCalculator)
                Spacer()
            }
            
            Spacer()
            Button("CALCULATE") {
                resultRaaidCalculator = RaidCalculate(raidValue: selectedRaids, sizeValue: sizeDisk, qtyValue: diskCount, qtyMainValue: parytyRaid, sizeType: selectedSizeValue)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
