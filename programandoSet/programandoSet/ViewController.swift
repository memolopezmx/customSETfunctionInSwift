//
//  ViewController.swift
//  programandoSet
//
//  Created by Memo Lopez on 4/28/23.
//

import UIKit

/*
 You are helping out with your school's "Queen of School"contest. You have the list of votes, where votes[i]
 is the name of the girl i(th) person voted for. Your task is to find out who the winner is. If there are several girls who got the maximal number of votes, choose the winner by sorting the list of potential winners alphabetically and then choosing the last one.
 
 Example
 
 For votes = ["Laura", "Emily", "Louise", "Natasha", "Emily", "Lilly", "Louise", "Laura", "Mary", "Mary"]
 the output should be
 soulution(votes) = "Mary".
 Emily, Louise, Laura and Mary have 2 votes each, which is the maximal number of votes, but Mary is the last one in the sorted list.
 */

class ViewController: UIViewController {

    let votes = ["Laura", "Emily", "Louise", "Natasha", "Emily", "Lilly", "Louise", "Laura", "Mary", "Mary"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let winner = solutio(votes: votes)
        print(winner)
    }

    func solution(votes: [String]) -> String {
        //let girls = Set(votes)
        let girls = customSet(from: votes)
        var queens = [Queen]()
        var noMaxVotes = 0
        for girl in girls {
            
            let totalVotes = votes.filter {
                $0 == girl
            }.count
            if totalVotes > noMaxVotes {
                noMaxVotes = totalVotes
            }
            let queen = Queen(girlName: girl, votes: totalVotes)
            queens.append(queen)
        }
        
        let queensSorted = queens.filter {
            $0.votes == noMaxVotes
        }.sorted {
            $0.girlName < $1.girlName
        }
        
        return queensSorted.last!.girlName
    }

    func customSet<T: Hashable>(from array: [T]) -> [T] {
        var result = [T]()
        var dict = [T: Bool]()
        
        for element in array {
            if dict[element] == nil {
                dict[element] = true
                result.append(element)
            }
        }
        
        return result
    }
}

