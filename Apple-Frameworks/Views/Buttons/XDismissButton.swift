//
//  XDismissButton.swift
//  Apple-Frameworks
//
//  Created by Yuri Ershov on 20.11.21.
//

import SwiftUI

struct XDismissButton: View {
    
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
        Button {
            isShowingDetailView = false
        } label: {
            Image(systemName: "xmark")
                .foregroundColor(.primary)
                .imageScale(.large)
                .frame(width: 44, height: 44)
        }
        .padding()
    }
}

struct XDismissButton_Previews: PreviewProvider {
    static var previews: some View {
        XDismissButton(isShowingDetailView: .constant(true))
    }
}
