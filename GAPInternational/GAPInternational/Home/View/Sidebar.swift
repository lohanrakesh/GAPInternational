//
//  Sidebar.swift
//  GAPInternational
//
//  Created by rakeshlohan on 05/10/23.
//

import SwiftUI

struct Sidebar: View {
    
    @ObservedObject var viewModel: HomeViewModel
    @Binding var isSidebarVisible: Bool
    
    var sideBarWidth = UIScreen.main.bounds.size.width * 0.25
    var bgColor: Color = Color(.init(red: 52 / 255, green: 70 / 255, blue: 182 / 255, alpha: 1))
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(.black.opacity(0.1))
            .opacity(isSidebarVisible ? 1 : 0)
            .animation(.easeInOut.delay(0.2), value: isSidebarVisible)
            .onTapGesture {
                isSidebarVisible.toggle()
            }
            content
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    var content: some View {
        HStack(alignment: .top) {
            ZStack(alignment: .top) {
                VStack(alignment: .leading) {
                    ScrollView {
                        VStack{}
                            .frame(height: 64.0)
                            .background(Colors.sidebarTransparentColor)
                        ForEach(viewModel.chapters, id: \.id) { chapter in
                            // List(viewModel.chapters, id: \.id) { chapter in
                            Button {
                                viewModel.setOpenedChapter(chapter: chapter)
                                isSidebarVisible.toggle()
                            } label: {
                                VStack {
                                    HStack {
                                        Text(chapter.name)
                                            .font(.headline)
                                        Spacer()
                                        Image(systemName: "greaterthan")
                                            .frame(width: 14.0, height: 14.0)
                                    }
                                    .padding(.horizontal, 16.0)
                                    Divider()
                                }
                                .frame(height: 80.0)
                                .foregroundColor(.white)
                            }
                        }
                    }
                }
                .background(Colors.appThemeColor)
            }
            .frame(width: sideBarWidth)
            .offset(x: isSidebarVisible ? 0 : -sideBarWidth)
            .animation(.default, value: isSidebarVisible)
            
            Spacer()
        }
    }
}

