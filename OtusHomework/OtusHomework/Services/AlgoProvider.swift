//
//  AlgoProvider.swift
//  TaskAboutLifecycle
//
//  Created by Exey Panteleev on 11/06/2019.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

struct Algo {
    var name: String
}

struct AlgoProvider {
    
    var all: [String] {
        return [
            // Searching
            "Linear Search",
            "Binary Search",
            "Count Occurrences",
            "Select Minimum / Maximum",
            "k-th Largest Element",
            "Selection Sampling",
            "Union-Find",
            // String Search
            "Brute-Force String Search",
            "Boyer-Moore",
            "Knuth-Morris-Pratt",
            "Rabin-Karp",
            "Longest Common Subsequence",
            "Z-Algorithm",
            // Sorting
            "Insertion Sort",
            "Selection Sort",
            "Shell Sort",
            "Quicksort",
            "Merge Sort",
            "Heap Sort",
            "Introsort",
            "Counting Sort",
            "Radix Sort",
            "Topological Sort",
            "Bubble Sort",
            "Slow Sort",
            // Compression
            "Run-Length Encoding (RLE)",
            "Huffman Coding",
            // Miscellaneous
            "Shuffle",
            "Comb Sort",
            "Convex Hull",
            "Miller-Rabin Primality Test",
            "MinimumCoinChange",
            "Genetic",
            "Myers Difference Algorithm",
            // Mathematics
            "Greatest Common Divisor (GCD)",
            "Permutations and Combinations",
            "Shunting Yard Algorithm",
            "Karatsuba Multiplication",
            "Haversine Distance",
            "Strassen's Multiplication Matrix",
            // Machine learning
            "k-Means Clustering",
            "Linear Regression",
            "Naive Bayes Classifier",
            "Simulated annealing",
        ]
    }
    
    var allSuffixes: [SuffixArraySequence] {
        return self.all.map({ SuffixArraySequence(string: $0) })
    }
    
    var searchStrings: [(suffix: String, algoName: String)] {
        var result = [(suffix: String, algoName: String)]()
        for algo in all {
            let sequence = SuffixArraySequence(string: algo)
            var iterator = sequence.makeIterator()
            while let suffix = iterator.next() {
                result.append((suffix: String(suffix), algo))
            }
        }
        return result.sorted(by: { $0.suffix < $1.suffix })
    }
    
    var sortings: [Algo] {
        return [
            Algo(name: "Insertion Sort"),
            Algo(name: "Selection Sort"),
            Algo(name: "Shell Sort"),
            Algo(name: "Quicksort"),
            Algo(name: "Merge Sort"),
            Algo(name: "Heap Sort"),
            Algo(name: "Introsort"),
            Algo(name: "Counting Sort"),
            Algo(name: "Radix Sort"),
            Algo(name: "Topological Sort"),
            Algo(name: "Bubble Sort"),
            Algo(name: "Slow Sort")
        ]
    }
    
}
