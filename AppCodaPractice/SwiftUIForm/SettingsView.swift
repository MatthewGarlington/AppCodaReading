//
//  SettingsView.swift
//  AppCodaPractice
//
//  Created by Matthew Garlington on 4/25/21.
//

import SwiftUI

struct FormSettingView: View {
    private var displayOrders = [ "Alphabetical", "Show Favorite First", "Show Check-in First"]
    @State private var selectedOrder = 0
    @State private var showCheckInOnly = false
    @State private var maxPriceMaxLevel = 5

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("SORT PREFERENCE")) {
                    Picker(selection: $selectedOrder, label: Text("Display Order")) {
                        ForEach(0..<displayOrders.count, id: \.self) {
                            Text(self.displayOrders[$0])
                        }
                    }
                }

                Section(header: Text("FILTER PREFERENCE")) {
                    Toggle(isOn: $showCheckInOnly, label: {
                        Text("Show Check In Only")
                    })

                    Stepper(
                        onIncrement: {
                            self.maxPriceMaxLevel += 1
                            if self.maxPriceMaxLevel > 5 {
                                self.maxPriceMaxLevel = 5
                            }
                        },
                        onDecrement: {
                            self.maxPriceMaxLevel -= 1

                            if self.maxPriceMaxLevel < 1 {
                                self.maxPriceMaxLevel = 1
                            }

                        },
                        label: {
                            Text("Show \(String(repeating:"$", count: maxPriceMaxLevel)) or below")
                        })
                }
            }

            .navigationBarTitle("Settings")
        }
    }
}
struct FormSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        FormSettingView()
    }
}
