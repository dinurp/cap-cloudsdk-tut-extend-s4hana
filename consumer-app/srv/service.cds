using my.bookshop as my from '../db/extended';
using API_BUSINESS_PARTNER as BUPA_API from './external/csn/API_BUSINESS_PARTNER';

service CatalogService {
    entity Books as projection on my.Books;
    entity Authors as projection on my.Authors;
    entity Orders as select from my.Orders mixin {
        address: Association to Addresses
            on address.businessPartner = businessPartner
            and address.addressId = addressID
    } into {
        *,
        address
    };
    @cds.persistence.skip
    entity Addresses as projection on BUPA_API.A_BusinessPartnerAddressType {
        key BusinessPartner as businessPartner,
        key AddressID as addressId,
        Country as country,
        CityName as cityName,
        StreetName as streetName
    };
}



