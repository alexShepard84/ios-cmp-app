//
//  SourcePointMetaAppUITests.swift
//  SourcePointMetaAppUITests
//
//  Created by Vilas on 28/07/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import Unified_MetaApp

class SourcePointMetaAppUITests: QuickSpec {
    var app: MetaApp!
    var propertyData = PropertyData()

    override func spec() {
        beforeSuite {
            self.continueAfterFailure = false
            self.app = MetaApp()
            Nimble.AsyncDefaults.timeout = .seconds(20)
            Nimble.AsyncDefaults.pollInterval = .milliseconds(500)
        }

        afterSuite {
            Nimble.AsyncDefaults.timeout = .seconds(1)
            Nimble.AsyncDefaults.pollInterval = .milliseconds(100)
        }

        beforeEach {
            self.app.relaunch(clean: true)
        }

        /**
         @Description - User submit valid property details and tap on Save then expected consent message should display when user tap on  Accept All button then ccpa consent message should display when user tap on accpet all button then consent data should display on info screen when user navigate back and tap on the Property again then user should not see message again when user delete cookies for the property then user should see consent message again.
         */
        it("Show purpose consents after reset cookies") {
            self.app.addPropertyWithCampaignDetails(targetingKey: self.propertyData.targetingKeyShowOnce, targetingValue: self.propertyData.targetingValueShowOnce)
            self.app.savePropertyButton.tap()
            expect(self.app.consentMessage).to(showUp())
            self.app.acceptAllButton.tap()
            expect(self.app.ccpaConsentMessage).to(showUp())
            self.app.ccpaAcceptAllButton.tap()
            expect(self.app.propertyDebugInfo).to(showUp())
            self.app.backButton.tap()
            expect(self.app.propertyList).to(showUp())
            self.app.propertyItem.tap()
            expect(self.app.propertyDebugInfo).to(showUp())
            self.app.backButton.tap()
            expect(self.app.propertyList).to(showUp())
            if self.app.propertyItem.exists {
                self.app.propertyItem.swipeLeft()
                self.app.resetPropertyButton.tap()
                if self.app.alertOKButton.exists {
                    self.app.alertOKButton.tap()
                }
            }
            expect(self.app.consentMessage).to(showUp())
        }

        /**
         @Description - User submit valid property details and tap on Save then expected messages should load When user select Reject All then consent information should get stored when user swipe on property and choose to delete user should able to delete the property screen
         */
        it("Delete Property from property list") {
            self.app.addPropertyWithCampaignDetails(targetingKey: self.propertyData.targetingKey, targetingValue: self.propertyData.targetingEnglishValue)
            self.app.savePropertyButton.tap()
            expect(self.app.consentMessage).to(showUp())
            self.app.rejectAllButton.tap()
            expect(self.app.ccpaConsentMessage).to(showUp())
            self.app.ccpaAcceptAllButton.tap()
            expect(self.app.propertyDebugInfo).to(showUp())
            self.app.backButton.tap()
            expect(self.app.propertyList).to(showUp())
            self.app.deleteProperty()
            expect(self.app.propertyItem).notTo(showUp())
        }

        /**
         @Description - User submit valid property details and tap on Save then expected messages should load when user select Accept All then consent information should get stored when user swipe on property and edit the key/parameter details then user should see respective message
         */
        it("Edit Property from property list") {
            self.app.addPropertyWithCampaignDetails(targetingKey: self.propertyData.targetingKey, targetingValue: self.propertyData.targetingEnglishValue)
            self.app.savePropertyButton.tap()
            expect(self.app.consentMessage).to(showUp())
            self.app.acceptAllButton.tap()
            expect(self.app.ccpaConsentMessage).to(showUp())
            self.app.ccpaAcceptAllButton.tap()
            expect(self.app.propertyDebugInfo).to(showUp())
            self.app.backButton.tap()
            expect(self.app.propertyList).to(showUp())
            if self.app.propertyItem.exists {
                self.app.propertyItem.swipeLeft()
                self.app.editPropertyButton.tap()
                expect(self.app.editProperty).to(showUp())
                self.app.authIdTextFieldOutlet.tap()
                self.app.authIdTextFieldOutlet.typeText(self.app.dateFormatterForAuthID())
                self.app.addGDPRPropertyDetails(targetingKey: self.propertyData.targetingKey, targetingValue: self.propertyData.targetingFrenchValue)
                expect(self.app.consentMessage).to(showUp())
            }
        }

        /**
         @Description - User submit valid property details tap on Save then expected messages should load When user dismiss the message then user should see info screen with ConsentUUID details
         */
        it("Check ConsentUUID on Message Dismiss") {
            self.app.addPropertyWithCampaignDetails(targetingKey: self.propertyData.targetingKey, targetingValue: self.propertyData.targetingEnglishValue)
            self.app.savePropertyButton.tap()
            expect(self.app.consentMessage).to(showUp())
            self.app.dismissMessageButton.tap()
            expect(self.app.ccpaConsentMessage).to(showUp())
            self.app.dismissMessageButton.tap()
            expect(self.app.ccpaConsentMessage).notTo(showUp())
        }

        it("Check feature tab as default PM tab") {
            self.app.addPropertyWithCampaignDetailsAndFeaturesTab(targetingKey: self.propertyData.targetingKey, targetingValue: self.propertyData.targetingEnglishValue)
            self.app.savePropertyButton.tap()
            expect(self.app.consentMessage).to(showUp())
            self.app.acceptAllButton.tap()
            expect(self.app.ccpaConsentMessage).to(showUp())
            self.app.ccpaAcceptAllButton.tap()
            expect(self.app.propertyDebugInfo).to(showUp())
            self.app.menuButton.tap()
            self.app.loadGDPRPM.tap()
            expect(self.app.featuresTab).to(showUp())
        }

        /**
         @Description - User submit valid property details and tap on Save then expected consent messages should display when user select Accept all then user will navigate to Site Info screen showing ConsentUUID, EUConsent and all Vendors & Purpose Consents when user navigate back & tap on the site name and select MANAGE PREFERENCES button from consent message view then user will see all vendors & purposes as selected")
         */
        it("Accept all from German Message") {
            self.app.addPropertyWithCampaignDetails(targetingKey: self.propertyData.messageLanguageTargetingKey, targetingValue: self.propertyData.messageLanguageTargetingValue)
            self.app.savePropertyButton.tap()
            expect(self.app.consentMessageInGerman).to(showUp())
            self.app.acceptAllButtonInGerman.tap()
            expect(self.app.ccpaConsentMessage).to(showUp())
            self.app.ccpaAcceptAllButton.tap()
            expect(self.app.propertyDebugInfo).to(showUp())
            self.app.backButton.tap()
            expect(self.app.propertyList).to(showUp())
            self.app.propertyItem.tap()
            expect(self.app.consentMessageInGerman).to(showUp())
            self.app.showOptionsButtonInGerman.doubleTap()
            expect(self.app.privacyManager).to(showUp())
        }
    }
}

extension XCUIElement {
    func forceTapElement() {
        if self.isHittable {
            self.tap()
        }
        else {
            let coordinate: XCUICoordinate = self.coordinate(withNormalizedOffset: CGVector(dx:0.0, dy:0.0))
            coordinate.tap()
        }
    }
}
