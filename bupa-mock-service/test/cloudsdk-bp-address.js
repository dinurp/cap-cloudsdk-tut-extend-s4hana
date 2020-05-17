#node cloudsdk-bp-address.js
#[ 'Walldorf', 'Palo Alto', 'Hallbergmoos', 'Potsdam' ]

const BusinessPartnerAddress = require('@sap/cloud-sdk-vdm-business-partner-service').BusinessPartnerAddress

BusinessPartnerAddress
        .requestBuilder()
        .getAll()
        .select(
                BusinessPartnerAddress.BUSINESS_PARTNER,
                BusinessPartnerAddress.ADDRESS_ID,
                BusinessPartnerAddress.CITY_NAME,
        )
        .execute({url:'http://localhost:3000/v2'})
        .then(xs => xs.map(x => x.cityName))
        .then(console.log)