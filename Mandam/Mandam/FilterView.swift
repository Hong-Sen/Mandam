//
//  FilterView.swift
//  Mandam
//
//  Created by 홍세은 on 2022/01/17.
//

import SwiftUI

struct FilterView: View {
    @Binding var isShowFilter: Bool
    var body: some View {
        NavigationView {
            VStack{
                Divider()
                Text("관계")
                    .position(x: 50, y: 20)
                HStack{
                    
                }
            }
            .navigationTitle("필터")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isShowFilter = false
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            }
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(isShowFilter: .constant(true))
    }
}
