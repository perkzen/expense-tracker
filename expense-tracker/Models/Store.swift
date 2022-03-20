//
//  Store.swift
//  expense-tracker
//
//  Created by Domen Perko on 04/03/2022.
//

import Foundation

class Store: ObservableObject {
    @Published var items:[ExpenseItem] = []
    @Published var balance:Int = 0
    @Published var income:Int = 0
    @Published var expenses:Int = 0
    
    init() {
        fetchItems()
    }
    
    func addItem (amount:Int, text:String) {

        guard let url = URL(string: "http://localhost:3000/expenses") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        let body: [String: AnyHashable] = [
            "amount": amount,
            "text": text,
            "userId":2
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        let task = URLSession.shared.dataTask(with: request) { data,
            _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let res = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                if let expenseItem = res as? ExpenseItem {
                    self.items.append(ExpenseItem(id: expenseItem.id, text: expenseItem.text, amount: expenseItem.amount))
                }
                self.fetchItems()
            }catch{
                print(error)
            }
        }
        task.resume()
        
    }
    
    func deleteItem (indexSet: IndexSet) {
        let index = indexSet[indexSet.startIndex]
        guard let url = URL(string: "http://localhost:3000/expenses/\(items[index].id)") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        URLSession.shared.dataTask(with: request) {
            data, _, error in
            if error != nil {
                print("error",error?.localizedDescription ?? "")
                return
            } else {
                self.fetchItems()
            }
        }.resume()
        
        
        items.remove(atOffsets: indexSet)
        
        
    }
    
    func fetchItems() {
        guard let url = URL(string: "http://localhost:3000/expenses/user/2") else {return}
        let task = URLSession.shared.dataTask(with: url) { [weak self]data,
            _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let response = try JSONDecoder().decode([ExpenseItem].self, from: data)
                DispatchQueue.main.async {
                    self?.items = response
                }
            }catch{
                print(error)
            }
            
        }
        task.resume()
    }

}
