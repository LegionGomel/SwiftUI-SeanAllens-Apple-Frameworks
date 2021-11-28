//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by Yuri Ershov on 19.11.21.
//

import SwiftUI


// ObservableObject allows object to publish information
final class FrameworkGridViewModel: ObservableObject {
    var selectedFramework: Framework? {
        // Any time when framework changes - then change published value
        didSet {
            isShowingDetailView = true
        }
    }
    // When this is change - class will publish this and listeners will updates
    @Published var isShowingDetailView = false
    
    // Creating flexible column for lazy Vgrid
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
}
