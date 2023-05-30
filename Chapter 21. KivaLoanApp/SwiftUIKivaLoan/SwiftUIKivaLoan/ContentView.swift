//
//  ContentView.swift
//  SwiftUIKivaLoan
//
//  Created by Maxim Brishten on 30.05.23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var loanStore = LoanStore()
    
    @State private var filterEnabled = false
    @State private var maximumLoanAmount = 10000.0
    
    var body: some View {
        NavigationStack {
            VStack {
                if filterEnabled {
                    LoanFilterView(amount: self.$maximumLoanAmount)
                        .transition(.opacity)
                        .onChange(of: self.maximumLoanAmount) { newValue in
                            self.loanStore.filterLoans(maxAmount: Int(newValue))
                        }
                }
                List(loanStore.loans) { loan in
                    LoanCellView(loan: loan)
                        .padding(.vertical, 5)
                }
            }
            .navigationTitle("Kiva Loan")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        withAnimation(.linear) {
                            self.filterEnabled.toggle()
                            self.loanStore.filterLoans(maxAmount: Int(self.maximumLoanAmount))
                        }
                    } label: {
                        Text("Filter")
                            .font(.subheadline)
                            .foregroundColor(.primary)
                    }
                }
            }
        }
        .task {
            loanStore.fetchLatestLoans()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
