//
//  ProfileScreen.swift
//  LittleLemon
//
//  Created by Mehmet Tarhan on 25.09.2025.
//

import SwiftUI

struct ProfileScreen: View {
    @ObservedObject var viewModel: ProfileViewModel

    var body: some View {
        VStack {
            firstNameView
            lastNameView
            emailview

            Spacer()
        }
        .padding()
        .navigationTitle("Profile")
        .toolbar {
            ToolbarItem(placement: .principal) {
                Image("Logo")
            }
        }
    }

    private var firstNameView: some View {
        HStack {
            TextField("First name", text: $viewModel.firstName)
                .disabled(!viewModel.editingFirstName)

            if viewModel.editingFirstName {
                Button {
                    viewModel.finishEditing()
                    viewModel.editingFirstName.toggle()
                } label: {
                    Text("Save")
                }
                .buttonStyle(.borderedProminent)
            } else {
                Button {
                    viewModel.editingFirstName.toggle()
                } label: {
                    Image(systemName: "pencil.circle")
                }
            }
        }
        .frame(height: 32)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(viewModel.editingFirstName ? Color.primaryYellow : Color.secondaryDark)
        )
    }

    private var lastNameView: some View {
        HStack {
            TextField("Last name", text: $viewModel.lastName)
                .disabled(!viewModel.editingLastName)

            if viewModel.editingLastName {
                Button {
                    viewModel.finishEditing()
                    viewModel.editingLastName.toggle()
                } label: {
                    Text("Save")
                }
                .buttonStyle(.borderedProminent)
            } else {
                Button {
                    viewModel.editingLastName.toggle()
                } label: {
                    Image(systemName: "pencil.circle")
                }
            }
        }
        .frame(height: 32)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(viewModel.editingLastName ? Color.primaryYellow : Color.secondaryDark)
        )
    }

    private var emailview: some View {
        HStack {
            TextField("Email", text: $viewModel.email)
                .disabled(!viewModel.editingEmail)
                .keyboardType(.emailAddress)

            if viewModel.editingEmail {
                Button {
                    viewModel.finishEditing()
                    viewModel.editingEmail.toggle()
                } label: {
                    Text("Save")
                }
                .buttonStyle(.borderedProminent)
            } else {
                Button {
                    viewModel.editingEmail.toggle()
                } label: {
                    Image(systemName: "pencil.circle")
                }
            }
        }
        .frame(height: 32)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(viewModel.editingEmail ? Color.primaryYellow : Color.secondaryDark)
        )
    }
}

#Preview {
    ProfileScreen(viewModel: ProfileViewModel())
}
