//
//  CoverImageVieww.swift
//  Africa
//
//  Created by Ferox on 2/5/22.
//

import SwiftUI

struct CoverImageVieww: View {
    //MARK: - Properties
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    //MARK: - Body
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }//: ForEach
        }//: TabView
        .tabViewStyle(PageTabViewStyle())
    }
}

struct CoverImageVieww_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageVieww()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
