#import "../template/template.typ": *

#show: checklist.with(
  organization-name: "SIMMERS",
  cover-page-image: "../examples/Britten-Norman_BN-2A-26_Islander,_Winair_-_Windward_Islands_Airways_JP5823246.jpg",
  title: "BN Islander Checklist",
  disclaimer: "This checklist is for hobby purposes only and should not be used in real life. \nThe name \"SIMMERS\" is a made up name and does not represent any real organization.",
  distribution-statement: "For SIMMERS use only",
  rev: "Rev 1",
  doc: "BN Islander",
  // style: 1,
)

#topic("Normal Operations")[
  #section("Power Up")[
    #step("Walkaround", "Performed")
    #step("Battery Master", "On")
    #step("Beacon", "On")
    #step("NAV Lights", "On")
    #step("Throttle", "Closed")
    #step("Prop", "Full Forward")
    #step("Mixture", "Full Forward")
    #step("External Supply", "On")
    #step("Fuel Selectors", "On")
    #step("Fuel Pumps", "On")
    #step("Throttle", "10%")
    #step("STBD MAGS", "No. 1")
    #step("Starter", "STBD")
    #step("STBD MAGS", "No. 2")
    #step("Throttle", "1.000 RPM")
    #step("PORT MAGS", "No. 1")
    #step("Starter", "PORT")
    #step("PORT MAGS", "No. 2")
    #step("Throttle", "1.000 RPM")
    #step("Starter", "Caged")
    #step("Fuel Pumps", "Off")
    #step("External Supply", "Off")
    #step("Generators", "On")
    #step("Avionics Master", "On")
    #step("Altimeter", "Set")
    #step("Transponder", "Set")
    #step("Landing Lights", "On")
  ]

  #colbreak()
  #section("Taxi")[
    #step("Parking Brake", "Release")
  ]

  #section("Pre Takeoff")[
    #step("Flaps", "Set")
    #step("Trim", "T/O (0)")
    #step("Heating", "As Required")
  ]

  #section("Takeoff")[
    #step("Throttle", "Full")
    #step("Prop", "Full Forward")
    #step("Mixture", "Full Forward")
  ]

  #section("After Takeoff")[
    #step("Flaps", "Up")
    #step("Landing Lights", "Off")
    #step("Heating", "As Required")
  ]

  #section("Cruise")[
    #step("Prop", "83%")
    #step("Mixture", "70%")
    #step("Throttle", "RPM in Green")
  ]

  #colbreak()
  #section("Shutdown")[
    #step("Parking Brake", "Set")
    #step("Avionics Master", "Off")
    #step("External Lights", "Beacon & NAV")
    #step("Heating", "Off")
    #step("Right Engine Mixture", "Off")
    #step("Left Engine Mixture", "Off")
    #step("Prop", "Off")
    #step("Throttle", "Off")
    #step("MAGS", "Off")
    #step("Fuel Selectors", "Off")
    #step("Beacon & NAV", "Off")
    #step("Generators", "Off")
    #step("Battery", "Off")
  ]
]
