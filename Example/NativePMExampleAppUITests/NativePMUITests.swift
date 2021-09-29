//
//  NativePMUITests.swift
//  NativePMExampleAppUITests
//
//  Created by Vilas on 27/09/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import NativePMExampleApp

class NativePMUITests: QuickSpec {

    var app: NativePMApp!

    override func spec() {
        beforeSuite {
            self.continueAfterFailure = false
            self.app = NativePMApp()
            Nimble.AsyncDefaults.timeout = .seconds(10)
            Nimble.AsyncDefaults.pollInterval = .milliseconds(500)
        }

        afterSuite {
            Nimble.AsyncDefaults.timeout = .seconds(1)
            Nimble.AsyncDefaults.pollInterval = .milliseconds(100)
        }

        beforeEach {
            self.app.relaunch(clean: true)
        }

        it("Accept all through CCPA & GDPR Privacy Manager") {
            expect(self.app.acceptButton).to(showUp())
            XCUIRemote.shared.press(.right)
            self.app.expectedMessageShowUP(element: self.app.doNotSellMyPersonalInformation)
            XCUIRemote.shared.press(.select)
            XCUIRemote.shared.press(.left)
            self.app.expectedMessageShowUP(element: self.app.acceptButton)
            XCUIRemote.shared.press(.select)
            expect(self.app.acceptButton).to(showUp())
            XCUIRemote.shared.press(.right)
            self.app.expectedMessageShowUP(element: self.app.storeAndaccessInformation)
            XCUIRemote.shared.press(.select)
            XCUIRemote.shared.press(.left)
            self.app.expectedMessageShowUP(element: self.app.acceptButton)
            XCUIRemote.shared.press(.select)
        }

        it("Reject all through CCPA & GDPR Privacy Manager") {
            self.app.expectedMessageShowUP(element: self.app.acceptButton)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.rejectAllButton)
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.acceptButton)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.rejectAllButton)
            XCUIRemote.shared.press(.select)
        }

        it("Save and Exit through CCPA & GDPR Privacy Manager") {
            self.app.expectedMessageShowUP(element: self.app.acceptButton)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.saveAndExitButton)
            XCUIRemote.shared.press(.select)
            expect(self.app.acceptButton).to(showUp())
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.saveAndExitButton)
            XCUIRemote.shared.press(.select)
        }

        it("Privacy policy of CCPA & GDPR Privacy Manager") {
            self.app.expectedMessageShowUP(element: self.app.acceptButton)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.privacyPolicyButton)
            XCUIRemote.shared.press(.select)
            expect(self.app.homeButton).to(showUp())
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.privacyPolicyButton)
            XCUIRemote.shared.press(.up)
            XCUIRemote.shared.press(.up)
            XCUIRemote.shared.press(.up)
            self.app.expectedMessageShowUP(element: self.app.saveAndExitButton)
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.acceptButton)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.privacyPolicyButton)
            XCUIRemote.shared.press(.select)
            expect(self.app.homeButton).to(showUp())
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.privacyPolicyButton)
            XCUIRemote.shared.press(.up)
            XCUIRemote.shared.press(.up)
            XCUIRemote.shared.press(.up)
            self.app.expectedMessageShowUP(element: self.app.saveAndExitButton)
            XCUIRemote.shared.press(.select)
        }

        it("Manage Preferences through CCPA & GDPR Privacy Manager with few purposes ON") {
            self.app.expectedMessageShowUP(element: self.app.acceptButton)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.ManagePreferencesButton)
            XCUIRemote.shared.press(.select)
            expect(self.app.homeButton).to(showUp())
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.acceptAllButton)
            XCUIRemote.shared.press(.right)
            self.app.expectedMessageShowUP(element: self.app.category)
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.backButton)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.onButton)
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.category)
            XCUIRemote.shared.press(.left)
            self.app.expectedMessageShowUP(element: self.app.acceptAllButton)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.saveAndExitInternalButton)
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.acceptButton)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.ManagePreferencesButton)
            XCUIRemote.shared.press(.select)
            expect(self.app.homeButton).to(showUp())
            XCUIRemote.shared.press(.down)
            expect(self.app.acceptAllButton).to(showUp())
            XCUIRemote.shared.press(.right)
            self.app.expectedMessageShowUP(element: self.app.storeAndaccessInformation)
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.backButton)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.onButton)
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.storeAndaccessInformation)
            XCUIRemote.shared.press(.left)
            self.app.expectedMessageShowUP(element: self.app.acceptAllButton)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.saveAndExitInternalButton)
            XCUIRemote.shared.press(.select)
        }

        it("Manage Preferences through CCPA & GDPR Privacy Manager with few purposes OFF") {
            self.app.expectedMessageShowUP(element: self.app.acceptButton)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.ManagePreferencesButton)
            XCUIRemote.shared.press(.select)
            expect(self.app.homeButton).to(showUp())
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.acceptAllButton)
            XCUIRemote.shared.press(.right)
            self.app.expectedMessageShowUP(element: self.app.category)
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.backButton)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.onButton)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.offButton)
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.category)
            XCUIRemote.shared.press(.left)
            self.app.expectedMessageShowUP(element: self.app.acceptAllButton)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.saveAndExitInternalButton)
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.acceptButton)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.ManagePreferencesButton)
            XCUIRemote.shared.press(.select)
            expect(self.app.homeButton).to(showUp())
            XCUIRemote.shared.press(.down)
            expect(self.app.acceptAllButton).to(showUp())
            XCUIRemote.shared.press(.right)
            self.app.expectedMessageShowUP(element: self.app.storeAndaccessInformation)
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.backButton)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.onButton)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.offButton)
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.storeAndaccessInformation)
            XCUIRemote.shared.press(.left)
            self.app.expectedMessageShowUP(element: self.app.acceptAllButton)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.saveAndExitInternalButton)
            XCUIRemote.shared.press(.select)
        }

        it("Our Partners through CCPA & GDPR Privacy Manager with few purposes On") {
            self.app.expectedMessageShowUP(element: self.app.acceptButton)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.ourPartnersButton)
            XCUIRemote.shared.press(.select)
            expect(self.app.homeButton).to(showUp())
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.acceptAllButton)
            XCUIRemote.shared.press(.right)
            self.app.expectedMessageShowUP(element: self.app.freewheel)
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.backButton)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.onButton)
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.freewheel)
            XCUIRemote.shared.press(.left)
            self.app.expectedMessageShowUP(element: self.app.acceptAllButton)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.saveAndExitInternalButton)
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.acceptButton)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.ourPartnersButton)
            XCUIRemote.shared.press(.select)
            expect(self.app.homeButton).to(showUp())
            XCUIRemote.shared.press(.down)
            expect(self.app.acceptAllButton).to(showUp())
            XCUIRemote.shared.press(.right)
            self.app.expectedMessageShowUP(element: self.app.justpremiumBV)
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.backButton)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.onButton)
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.justpremiumBV)
            XCUIRemote.shared.press(.left)
            self.app.expectedMessageShowUP(element: self.app.acceptAllButton)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.saveAndExitInternalButton)
            XCUIRemote.shared.press(.select)
        }

        it("Our Partners through CCPA & GDPR Privacy Manager with few purposes OFF") {
            self.app.expectedMessageShowUP(element: self.app.acceptButton)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.ourPartnersButton)
            XCUIRemote.shared.press(.select)
            expect(self.app.homeButton).to(showUp())
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.acceptAllButton)
            XCUIRemote.shared.press(.right)
            self.app.expectedMessageShowUP(element: self.app.freewheel)
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.backButton)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.onButton)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.offButton)
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.freewheel)
            XCUIRemote.shared.press(.left)
            self.app.expectedMessageShowUP(element: self.app.acceptAllButton)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.saveAndExitInternalButton)
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.acceptButton)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.ourPartnersButton)
            XCUIRemote.shared.press(.select)
            expect(self.app.homeButton).to(showUp())
            XCUIRemote.shared.press(.down)
            expect(self.app.acceptAllButton).to(showUp())
            XCUIRemote.shared.press(.right)
            self.app.expectedMessageShowUP(element: self.app.justpremiumBV)
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.backButton)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.onButton)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.offButton)
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.justpremiumBV)
            XCUIRemote.shared.press(.left)
            self.app.expectedMessageShowUP(element: self.app.acceptAllButton)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.saveAndExitInternalButton)
            XCUIRemote.shared.press(.select)
        }

        it("Manage Preferences through GDPR Privacy Manager with few Legitimate interest purposes ON") {
            self.app.expectedMessageShowUP(element: self.app.acceptButton)
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.acceptButton)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.ManagePreferencesButton)
            XCUIRemote.shared.press(.select)
            expect(self.app.homeButton).to(showUp())
            XCUIRemote.shared.press(.right)
            XCUIRemote.shared.press(.right)
            self.app.expectedMessageShowUP(element: self.app.legitimateInterestButton)
            XCUIRemote.shared.press(.down)
            expect(self.app.acceptAllButton).to(showUp())
            XCUIRemote.shared.press(.right)
            self.app.expectedMessageShowUP(element: self.app.storeAndaccessInformation)
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.backButton)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.onButton)
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.storeAndaccessInformation)
            XCUIRemote.shared.press(.left)
            self.app.expectedMessageShowUP(element: self.app.acceptAllButton)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.saveAndExitInternalButton)
            XCUIRemote.shared.press(.select)
        }

        it("Manage Preferences through GDPR Privacy Manager with few Legitimate interest purposes OFF") {
            self.app.expectedMessageShowUP(element: self.app.acceptButton)
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.acceptButton)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.ManagePreferencesButton)
            XCUIRemote.shared.press(.select)
            expect(self.app.homeButton).to(showUp())
            XCUIRemote.shared.press(.right)
            XCUIRemote.shared.press(.right)
            self.app.expectedMessageShowUP(element: self.app.legitimateInterestButton)
            XCUIRemote.shared.press(.down)
            expect(self.app.acceptAllButton).to(showUp())
            XCUIRemote.shared.press(.right)
            self.app.expectedMessageShowUP(element: self.app.storeAndaccessInformation)
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.backButton)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.onButton)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.offButton)
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.storeAndaccessInformation)
            XCUIRemote.shared.press(.left)
            self.app.expectedMessageShowUP(element: self.app.acceptAllButton)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.saveAndExitInternalButton)
            XCUIRemote.shared.press(.select)
        }

        it("Our Partners through GDPR Privacy Manager with few Legitimate interest purposes ON") {
            self.app.expectedMessageShowUP(element: self.app.acceptButton)
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.acceptButton)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.ourPartnersButton)
            XCUIRemote.shared.press(.select)
            expect(self.app.homeButton).to(showUp())
            XCUIRemote.shared.press(.right)
            XCUIRemote.shared.press(.right)
            self.app.expectedMessageShowUP(element: self.app.legitimateInterestButton)
            XCUIRemote.shared.press(.down)
            expect(self.app.acceptAllButton).to(showUp())
            XCUIRemote.shared.press(.right)
            self.app.expectedMessageShowUP(element: self.app.gameAccounts)
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.backButton)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.onButton)
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.gameAccounts)
            XCUIRemote.shared.press(.left)
            self.app.expectedMessageShowUP(element: self.app.acceptAllButton)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.saveAndExitInternalButton)
            XCUIRemote.shared.press(.select)
        }

        it("Our Partners through GDPR Privacy Manager with few Legitimate interest purposes Off") {
            self.app.expectedMessageShowUP(element: self.app.acceptButton)
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.acceptButton)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.ourPartnersButton)
            XCUIRemote.shared.press(.select)
            expect(self.app.homeButton).to(showUp())
            XCUIRemote.shared.press(.right)
            XCUIRemote.shared.press(.right)
            self.app.expectedMessageShowUP(element: self.app.legitimateInterestButton)
            XCUIRemote.shared.press(.down)
            expect(self.app.acceptAllButton).to(showUp())
            XCUIRemote.shared.press(.right)
            self.app.expectedMessageShowUP(element: self.app.gameAccounts)
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.backButton)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.onButton)
            XCUIRemote.shared.press(.down)
            expect(self.app.onButton).to(showUp())
            XCUIRemote.shared.press(.select)
            self.app.expectedMessageShowUP(element: self.app.gameAccounts)
            XCUIRemote.shared.press(.left)
            self.app.expectedMessageShowUP(element: self.app.acceptAllButton)
            XCUIRemote.shared.press(.down)
            self.app.expectedMessageShowUP(element: self.app.saveAndExitInternalButton)
            XCUIRemote.shared.press(.select)
        }
    }
}
