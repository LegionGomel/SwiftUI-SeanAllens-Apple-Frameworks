//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by Yuri Ershov on 19.11.21.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    var framework: Framework
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                XDismissButton(isShowingDetailView: $isShowingDetailView)
            }
            
            
            Spacer()
            
            FrameworkTitleView(framework: framework)
            
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button {
                isShowingSafariView = true
            } label: {
                AFButton(title: "Learn More")
            }
        }
        .sheet(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: framework.urlString)!)
        })
    }


}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // .constant() - create a binding with immutable value
        FrameworkDetailView(framework: MockData.sampleFramework, isShowingDetailView: .constant(true))
            .preferredColorScheme(.dark)
            
            
    }
}
