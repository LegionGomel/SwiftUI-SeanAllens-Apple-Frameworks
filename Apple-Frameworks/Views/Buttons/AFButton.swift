//
//  AFButton.swift
//  Apple-Frameworks
//
//  Created by Yuri Ershov on 19.11.21.
//

import SwiftUI

struct AFButton: View {
   
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 280, height: 50)
            .background(.red)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct AFButton_Previews: PreviewProvider {
    static var previews: some View {
        AFButton(title: "Learn more")
    }
}
