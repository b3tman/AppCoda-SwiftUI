//
//  SettingsView.swift
//  SwiftUIDataSharing
//
//  Created by Maxim Brishten on 16.05.23.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var settingsStore: SettingStore
    
    @State private var showAlert = false
    @State private var selectedOrder = OrderType.alphabetical
    @State private var showCheckInOnly = false
    @State private var maxPriceLevel = 5
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("SORT PREFERENCE")) {
                    Picker(selection: $selectedOrder) {
                        ForEach(OrderType.allCases) { order in
                            Text(order.description)
                        }
                    } label: {
                        Text("Display Order")
                    }
                    .pickerStyle(.menu)
                }
                
                Section(header: Text("FILTER PREFERENCE")) {
                    Toggle(isOn: $showCheckInOnly) {
                        Text("Show Chek-In Only")
                    }
                    Stepper(onIncrement: {
                        self.maxPriceLevel += 1
                        
                        if self.maxPriceLevel > 5 {
                            self.maxPriceLevel = 5
                        }
                    }, onDecrement: {
                        self.maxPriceLevel -= 1
                        
                        if self.maxPriceLevel < 1 {
                            self.maxPriceLevel = 1
                        }
                    }) {
                        Text("Show \(String(repeating: "$", count: maxPriceLevel)) or below")
                    }
                }
            }
            .navigationBarTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.settingsStore.displayOrder = self.selectedOrder
                        self.settingsStore.showCheckInOnly = self.showCheckInOnly
                        self.settingsStore.maxPriceLevel = self.maxPriceLevel
                        dismiss()
                    }, label: {
                        Text("Save").foregroundColor(Color.black)
                    })
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        showAlert = true
                    }, label: {
                        Text("Cancel").foregroundColor(Color.black)
                    })
                }
            }
            .alert("Reminder", isPresented: $showAlert) {
                Button("Yes") {
                    dismiss()
                }
                Button(role: .cancel, action: {}) {
                    Text("No")
                }
            } message: {
                Text("Are you shore?")
            }
            .onAppear {
                self.selectedOrder = self.settingsStore.displayOrder
                self.showCheckInOnly = self.settingsStore.showCheckInOnly
                self.maxPriceLevel = self.settingsStore.maxPriceLevel
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environmentObject(SettingStore())
    }
}
