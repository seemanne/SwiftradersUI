//
//  Network.swift
//  SwiftradersUI
//
//  Created by Emanuel Seemann on 29.06.23.
//

import Foundation
import SwiftUI

class Network:ObservableObject {
    @Published var agent : Agent = Agent()
    @Published var contractList : ContractList = ContractList()
    var bearer = "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZGVudGlmaWVyIjoiQ0xPV05FTkpPWUVSIiwidmVyc2lvbiI6InYyIiwicmVzZXRfZGF0ZSI6IjIwMjMtMDYtMjQiLCJpYXQiOjE2ODc4OTU1NjYsInN1YiI6ImFnZW50LXRva2VuIn0.WzCEwlhsbhIKzJ2N2Qmb-KLvroSbr_qp-qY9kqSAfntyuTsjVne-IEsHXuMTCeRxzo6MWJ7FW4P5k10XUQ83WC9f2XDozKsAyAUf90gqaALaQuHgnlwnPj8CUefEeIRf1U6RC7zSKiiS-2vg5DtfUThAyQmFP9qwHdaK1UohmeRBDv9mVJmqypAwpV_HwIVi1ZLW_SFED8r1FbE1Cc4jS8H5zYm4umIsVr942yg4tG0TbIIbzUfw84MWz6S6UQOePrynim3Wf4tvmhTXddSQchA80jnYrD91IGQsDH8Qr1agovgmj2cHSozUkMHiI0sEa2Pe2CeGVzv8v-09asGd1A"
    
    init() {}
    
    func getAgents() {
        guard let url = URL(string: "https://api.spacetraders.io/v2/my/agent") else { fatalError("Missing URL") }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "get"
        urlRequest.addValue(bearer, forHTTPHeaderField: "Authorization")
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        print(String(data: data, encoding: String.Encoding.utf8) as Any)
                        let decodedAgent = try JSONDecoder().decode(Agent.self, from: data)
                        self.agent = decodedAgent
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        
        dataTask.resume()
    }
    func listContracts() {
        guard let url = URL(string: "https://api.spacetraders.io/v2/my/contracts") else { fatalError("Missing URL") }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "get"
        urlRequest.addValue(bearer, forHTTPHeaderField: "Authorization")
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        print(String(data: data, encoding: String.Encoding.utf8) as Any)
                        let decodedContractList = try JSONDecoder().decode(ContractList.self, from: data)
                        self.contractList = decodedContractList
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        
        dataTask.resume()
    }
    
    func acceptContract(contractId : String) {
        guard let url = URL(string: "https://api.spacetraders.io/v2/my/contracts/\(contractId)/accept") else { fatalError("Missing URL") }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "post"
        urlRequest.addValue(bearer, forHTTPHeaderField: "Authorization")
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
        }
        
        dataTask.resume()

    }
    
    func deliverCargoContract(contractId: String) {
        guard let url = URL(string: "https://api.spacetraders.io/v2/my/contracts/\(contractId)/deliver") else { fatalError("Missing URL") }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "post"
        urlRequest.addValue(bearer, forHTTPHeaderField: "Authorization")
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
        }
        
        dataTask.resume()
    }
    
    func fulfillContract(contractId: String) {
        guard let url = URL(string: "https://api.spacetraders.io/v2/my/contracts/\(contractId)/fulfill") else { fatalError("Missing URL") }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "post"
        urlRequest.addValue(bearer, forHTTPHeaderField: "Authorization")
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
        }
        
        dataTask.resume()
    }
}
