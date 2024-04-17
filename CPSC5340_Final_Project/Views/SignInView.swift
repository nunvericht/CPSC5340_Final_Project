//
//  SignInView.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/2/24.
//

import SwiftUI


struct SignInView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        ZStack {
            Color.black
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.blue, .green, .orange, .red],  startPoint: .topLeading, endPoint: .bottomTrailing))
            LoginFormView()
        }
        .ignoresSafeArea()
        .alert(item: $authViewModel.alertType){ alertType in
            switch alertType {
            case .error:
                return Alert(
                    title: Text("Error"),
                    message: Text(authViewModel.error?.errorDescription ?? "An unknown error occurred"),
                    dismissButton: .default(Text("OK"))
                )
            case .passwordReset:
                return Alert(
                    title: Text("Reset Password"),
                    message: Text("Are you sure you want to reset your password?"),
                    primaryButton: .default(Text("Confirm"), action: {
                        authViewModel.resetPassword()
                    }),
                    secondaryButton: .cancel(Text("Cancel"))
                )
            }
        }
    }
}


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .environmentObject(AuthViewModel())
    }
}
