//
//  LoginScreen.swift
//  LittleLemon
//
//  Created by Mehmet Tarhan on 25.09.2025.
//

import SwiftUI

fileprivate let title = "Little Lemon"
fileprivate let restaurantName = "Chicago"
fileprivate let restaurantDesription = "We are family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist."

struct LoginScreen: View {
    @ObservedObject var viewModel: LoginViewModel

    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                ScrollView {
                    infoView
                        .frame(height: proxy.size.height / 2)
                    credentialsView
                    buttonView
                }

                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Image("Logo")
                    }
                }
            }
        }
    }

    var logoView: some View {
        Image("Logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 44)
    }

    var infoView: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundStyle(Color.primaryYellow)
                .font(.largeTitle.bold())
                .padding(.top, 20)
                .padding(.leading, 20)

            HStack {
                VStack(alignment: .leading) {
                    Text(restaurantName)
                        .foregroundStyle(Color.primaryWhite)
                        .font(.title.bold())
                    Text(restaurantDesription)
                        .foregroundStyle(Color.primaryWhite)
                }

                Image("Hero image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            
            .padding()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color.primaryDark)
    }

    var credentialsView: some View {
        VStack {
            TextField("First name", text: $viewModel.firstName, onCommit: {
                viewModel.validateCredentials()
            })
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.secondaryDark)
            )

            TextField("Last name", text: $viewModel.lastName, onCommit: {
                viewModel.validateCredentials()
            })
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.secondaryDark)
            )

            TextField("Email name", text: $viewModel.email, onCommit: {
                viewModel.validateCredentials()
            })
            .keyboardType(.emailAddress)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.secondaryDark)
            )
        }
        .padding()
    }

    var buttonView: some View {
        Button {
            viewModel.login()
        } label: {
            Text("Login")
                .padding(8)
                .foregroundStyle(Color.primaryWhite)
                .frame(minWidth: 0, maxWidth: .infinity)
        }

        .tint(Color.primaryDark)
        .buttonStyle(.borderedProminent)
        .padding()
        .padding(.horizontal, 32)
        .disabled(!viewModel.isLoginButtonEnabled)
    }
}

#Preview {
    LoginScreen(viewModel: LoginViewModel())
}
