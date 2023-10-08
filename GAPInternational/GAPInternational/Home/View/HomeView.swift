//
//  HomeView.swift
//  GAPInternational
//
//  Created by rakeshlohan on 18/08/23.
//

import SwiftUI
import AVKit

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel = HomeViewModel()
    @State private var isSideBarOpened: Bool = false
    
    var body: some View {
        ZStack {
            ZStack {
                Colors.backgroundColor.ignoresSafeArea()
                
                GeometryReader { reader in
                    VStack(alignment: .leading) {
                        Text(viewModel.openedChapter?.name ?? "Chapter Video")
                            .padding(.top, reader.size.height/7)
                            .frame(alignment: .center)
                        
                        VideoPlayer(player: viewModel.player)
                            .frame(width: reader.size.width - 32, height: 400.0)
                        
                        Text("A discription on the chapter")
                            .padding(.top, 24)
                        
                    }
                    .frame(width: reader.size.width, alignment: .top)
                }.onAppear {
                    viewModel.onAppear()
                }
            }
            .toolbarBackground(Color.white, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Button {
                        isSideBarOpened.toggle()
                    } label: {
                        Label("Toggle SideBar",
                              systemImage: "lessthan")
                        .foregroundColor(Colors.grayColor)
                    }
                }
                
                ToolbarItem(placement: .principal){
                    HStack {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                            .resizable()
                            .frame(width: 32.0, height: 42.0)
                            .foregroundColor(Colors.navBarColor)
                        
                        VStack(alignment: .leading) {
                            Text("Gap International")
                                .font(.system(size: 24.0, weight: .bold))
                                .foregroundColor(Colors.navBarColor)
                            
                            Text("Partners In Exceptional Growth")
                                .foregroundColor(Colors.navBarColor)
                        }
                    }
                    
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        isSideBarOpened.toggle()
                    } label: {
                        Text("Journal")
                            .foregroundColor(Colors.grayColor)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            Sidebar(viewModel: viewModel, isSidebarVisible: $isSideBarOpened)
        }
    }
}

