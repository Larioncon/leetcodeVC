//
//  ViewController.swift
//  leetcodeVC
//
//  Created by Chmil Oleksandr on 12.12.2024.
//

import UIKit

class ViewController: UIViewController {
    private let titleName = UILabel()
    private let resultLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLabels()
        setupConstraints()
        displayMergeResult()
        
    }
    
    private func setupView() {
        view.backgroundColor = .systemCyan
        view.addSubview(titleName)
        view.addSubview(resultLabel)
    }
    private func setupLabels() {
            titleName.translatesAutoresizingMaskIntoConstraints = false
            titleName.text = "Result of leetcode task:"
            titleName.font = UIFont.systemFont(ofSize: 30)
            titleName.textAlignment = .center

            resultLabel.translatesAutoresizingMaskIntoConstraints = false
            resultLabel.font = UIFont.systemFont(ofSize: 20)
            resultLabel.textAlignment = .center
            resultLabel.numberOfLines = 0
        }
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            //titleName:
            titleName.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            titleName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //resultLabel:
            resultLabel.topAnchor.constraint(equalTo: titleName.bottomAnchor, constant: 20),
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        ])
    }
    
    private func displayMergeResult() {
            let solution = Solution()

            let word1 = "abcd"
            let word2 = "pq"
            let mergedResult = solution.mergeAlternately(word1, word2)

            resultLabel.text = "Merged Result: \(mergedResult)"
        }

}

class Solution {
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        var result: String = ""
        let w1Array = Array(word1)
        let w2Array = Array(word2)
        let w1ACount = w1Array.count
        let w2ACount = w2Array.count
        let minCount = min(w1ACount, w2ACount)

        for i in 0..<minCount {
            result.append(w1Array[i])
            result.append(w2Array[i])
        }

        if w1ACount > minCount {
            result.append(contentsOf: w1Array[minCount...])
        }

        if w2ACount > minCount {
            result.append(contentsOf: w2Array[minCount...])
        }

        return result
    }
}


