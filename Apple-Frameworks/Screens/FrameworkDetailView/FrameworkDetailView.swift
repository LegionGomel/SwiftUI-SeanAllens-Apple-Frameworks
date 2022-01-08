//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by Yuri Ershov on 19.11.21.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    @ObservedObject var viewModel: FrameworkDetailViewModel
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                XDismissButton(isShowingDetailView: $viewModel.isShowingDetailView.wrappedValue)
            }
            
            
            Spacer()
            
            FrameworkTitleView(framework: viewModel.framework)
            
            Text(viewModel.framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button {
                viewModel.isShowingSafariView = true
            } label: {
                AFButton(title: "Learn More")
            }
        }
        .sheet(isPresented: $viewModel.isShowingSafariView, content: {
            SafariView(url: URL(string: viewModel.framework.urlString)!)
        })
    }


}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // .constant() - create a binding with immutable value
        FrameworkDetailView(viewModel: FrameworkDetailViewModel(framework: MockData.sampleFramework, isShowingDetailView: .constant(false)))
            .preferredColorScheme(.dark)
            
            
    }
}
