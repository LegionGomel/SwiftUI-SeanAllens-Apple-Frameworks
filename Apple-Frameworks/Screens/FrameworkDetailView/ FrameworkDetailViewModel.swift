//
//   FrameworkDetailViewModel.swift
//  Apple-Frameworks
//
//  Created by Yuri Ershov on 8.01.22.
//

import SwiftUI

final class FrameworkDetailViewModel: ObservableObject {
    
    let framework: Framework
   var isShowingDetailView: Binding<Bool>
    // this needed only for safariViewController old-style way
    @Published var isShowingSafariView = false
    
    init(framework: Framework, isShowingDetailView: Binding<Bool>) {
        self.framework = framework
        self.isShowingDetailView = isShowingDetailView
    }
}
