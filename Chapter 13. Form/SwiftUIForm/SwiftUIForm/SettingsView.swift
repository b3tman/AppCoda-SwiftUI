//
//  SettingsView.swift
//  SwiftUIForm
//
//  Created by Maxim Brishten on 16.05.23.
//

import SwiftUI

struct SettingsView: View {
    private var displayOrders = ["Alphabetical", "Show Favorite First", "Show Check-in First"]
    @Environment(\.dismiss) var dismiss
    
    @State private var showAlert = false
    @State private var selectedOrder = 0
    @State private var showCheckInOnly = false
    @State private var maxPriceLevel = 5
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("SORT PREFERENCE")) {
                    Picker(selection: $selectedOrder) {
                        ForEach(0..<displayOrders.count, id: \.self) {
                            Text(self.displayOrders[$0])
                        }
                    } label: {
                        Text("Display Order")
                    }
                    .pickerStyle(.navigationLink)
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

        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
