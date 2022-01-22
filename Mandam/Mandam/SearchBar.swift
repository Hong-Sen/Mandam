//
//  SearchBar.swift
//  Mandam
//
//  Created by 홍세은 on 2022/01/17.
//

import SwiftUI

struct SearchBar: View {
    @Binding var isShowing: Bool
    @Binding var text: String
    @State private var isEditing = false;
    
    var body: some View {
        Group {
            HStack{
                if isShowing{
                    TextField("질문 검색", text: $text)
                        .padding(7)
                        .padding(.horizontal, 25)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    
                        .overlay(HStack{
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 8)
                            
                            if isEditing{
                                Button{
                                    text = ""
                                } label: {
                                    Image(systemName: "multiply.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 10)
                                }
                            }
                        })
                        .padding(.horizontal, 20)
                        .onTapGesture {
                            isEditing = true
                        }
                }
                else {
                    EmptyView()
                }
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(isShowing: .constant(true), text: .constant("mbti"))
    }
}
