//
//  FilterView.swift
//  Mandam
//
//  Created by 홍세은 on 2022/01/17.
//

import SwiftUI

struct FilterView: View {
    @Binding var isShowFilter: Bool
    @ObservedObject var selectFilters: SelectedFilters
    
    let columns = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            VStack{
                Group {
                    Divider()
                        .padding(.vertical)
                    VStack(alignment: .leading) {
                        Text("나이")
                            .font(.system(size: 17, weight: .heavy))
                            .padding(.leading, 30)
                        
                        LazyVGrid(columns: columns, spacing: 15) {
                            ForEach(AgeCategory.allCases, id: \.self) { age in
                                Button {
                                    selectFilters.age = age
                                } label: {
                                    if selectFilters.age == age {
                                        RoundedRectangle(cornerRadius: 6)
                                            .fill(.black)
                                            .overlay(
                                                Text(age.rawValue)
                                                    .foregroundColor(.white)
                                            )
                                            .frame(height: 40)
                                    }
                                    else {
                                        RoundedRectangle(cornerRadius: 6)
                                            .stroke(Color.black, lineWidth: 2)
                                            .overlay(
                                                Text(age.rawValue)
                                                    .foregroundColor(.black)
                                            )
                                            .frame(height: 40)
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                    
                    Divider()
                        .padding(.vertical)
                    
                    VStack(alignment: .leading){
                        Text("관계")
                            .font(.system(size: 17, weight: .heavy))
                            .padding(.leading, 30)
                        
                        LazyVGrid(columns: columns, spacing: 15) {
                            ForEach(RelationshipCategory.allCases, id: \.self) { relationship in
                                Button {
                                    selectFilters.relationship = relationship
                                } label: {
                                    if selectFilters.relationship == relationship {
                                        RoundedRectangle(cornerRadius: 6)
                                            .fill(.black)
                                            .overlay(
                                                Text(relationship.rawValue)
                                                    .foregroundColor(.white)
                                            )
                                            .frame(height: 40)
                                    }
                                    else {
                                        RoundedRectangle(cornerRadius: 6)
                                            .stroke(Color.black, lineWidth: 2)
                                            .overlay(
                                                Text(relationship.rawValue)
                                                    .foregroundColor(.black)
                                            )
                                            .frame(height: 40)
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                    
                    Divider()
                        .padding(.vertical)
                    
                    Spacer()
                    
                    Button {
                        isShowFilter = false
                    } label: {
                        Text("적용하기")
                            .font(.system(size: 20))
                            .padding(.horizontal, 40)
                            .padding(.vertical, 5)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.bottom)
                    
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
        FilterView(isShowFilter: .constant(true), selectFilters: SelectedFilters())
    }
}
