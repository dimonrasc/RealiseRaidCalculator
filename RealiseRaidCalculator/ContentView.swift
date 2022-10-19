//
//  ContentView.swift
//  RealiseRaidCalculator
//
//  Created by huf on 18.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedRaids: String = ""
    @State private var raidLevels: [String] = [
        "RAID 0",
        "RAID 1",
        "RAID 5",
        "RAID 6",
        "RAID 10",
        "RAID 50",
        "RAID 60"
    ]
    
    @State private var selectedSizeValue: String = ""
    private let sizeValue: [String] = [
    "GB",
    "TB"
    ]
    
    @State private var sizeDisk: String = ""
    @State private var diskCount: String = ""
    @State private var parytyRaid: String = ""
    
    @State private var isParityRaidHiden = false
    
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
                TextField("Size", text: $sizeDisk)
                    .keyboardType(.decimalPad)
                Picker("Size Value", selection: $selectedSizeValue){
                    ForEach(sizeValue, id: \.self){ value in
                        Text(value)
                    }
                }
            }
            HStack{
                Text("Number of disks:")
                TextField("Disks", text: $diskCount)
                    .keyboardType(.decimalPad)
            }
            if isParityRaidHiden{
                HStack{
                    Text("Parity RAIDs count:")
                    TextField("Count", text: $parytyRaid)
                        .keyboardType(.decimalPad)
                }
            }
            Group{
                HStack{
                    Text("Raw storage:")
                    Spacer()
                }
                HStack{
                    Text("Usable Storage:")
                    Spacer()
                }
                HStack{
                    Text("Speed gain:")
                    Spacer()
                }
                HStack{
                    Text("Speed gain:")
                    Spacer()
                }
                HStack{
                    Text("Fault tolerance:")
                    Spacer()
                }
            }
            Button("CALCULATE") {
                
            }
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
