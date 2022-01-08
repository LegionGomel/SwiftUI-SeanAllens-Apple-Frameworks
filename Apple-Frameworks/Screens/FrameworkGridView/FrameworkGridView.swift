//
//  ContentView.swift
//  Apple-Frameworks
//
//  Created by Yuri Ershov on 19.11.21.
//

import SwiftUI

struct FrameworkGridView: View {
    
    // If object is initializing here - @StateObject. If it injected from prev - @ObservedObject
    @StateObject var viewModel = FrameworkGridViewModel()
    

    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid (columns: viewModel.columns) {
                    // id: \.self - take object (framework), hash it and give own identifier
                    // id: \.id - points to id property of current object
                    ForEach(MockData.frameworks) { framework in
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
                                viewModel.selectedFramework = framework
                            }
                        
                    }
                }
            }
            /* We add navigationTitle to our first element in NavigationView,
             so we can see it's name. Whatever element it lill be, we add title not to navigationView,
             but to a first view inside of it.*/
            .navigationTitle("🍎 Frameworks")
            
            /* From here we add a view as a sheet (FrameworkDetailView)
              to current FrameworkGridView, and when onGesture function will act, it tells that framework is selected, and we
             need to show FrameworkDetailView with it's details (and
             it presents modally)
             $viewModel.isShowingDetailView - passing our value to @Binding value inside of
             FrameworkDetailView*/
            .sheet(isPresented: $viewModel.isShowingDetailView) {
                FrameworkDetailView(viewModel: FrameworkDetailViewModel(framework: viewModel.selectedFramework!, isShowingDetailView: $viewModel.isShowingDetailView))
            }
        }
    }
}

struct FrameworkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
            .preferredColorScheme(.dark)
    }
}


