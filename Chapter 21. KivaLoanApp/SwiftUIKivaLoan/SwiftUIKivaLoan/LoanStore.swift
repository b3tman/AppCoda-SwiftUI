//
//  LoanStore.swift
//  SwiftUIKivaLoan
//
//  Created by Maxim Brishten on 30.05.23.
//

import Foundation

final class LoanStore: Decodable, ObservableObject {
    private static var kivaLoanURL = "https://api.kivaws.org/v1/loans/newest.json"
    private let decoder = JSONDecoder()
    
    @Published var loans: [Loan] = []
    private var cachedLoans: [Loan] = []
    
    enum CodingKeys: CodingKey {
        case loans
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        loans = try values.decode([Loan].self, forKey: .loans)
    }
    
    init() {
        
    }
    
    func fetchLatestLoans() {
        guard let loanUrl = URL(string: Self.kivaLoanURL) else {
            return
        }

        let request = URLRequest(url: loanUrl)
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in

            if let error = error {
                print(error)
                return
            }

            // Parse JSON data
            if let data = data {
                self.parseJsonData(data: data)
            }
        })

        task.resume()
    }

    func parseJsonData(data: Data) {
        do {
            let loanStore = try decoder.decode(LoanStore.self, from: data)
            DispatchQueue.main.async {
                self.loans = loanStore.loans.sorted(by: { $0.amount > $1.amount })
                self.cachedLoans = self.loans
            }
        } catch {
            print(error)
        }
    }
    
    func filterLoans(maxAmount: Int) {
        self.loans = self.cachedLoans.filter { $0.amount < maxAmount }
    }
}
