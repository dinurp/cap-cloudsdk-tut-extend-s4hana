https://developers.sap.com/mission.cap-s4hana-cloud-extension.html

1. Set Up a Basic Mock S/4HANA Service
2. Install an OData V2 Adapter
3. Create a Basic CAP-Based Service
4. Enhance CAP-Based Service to Refer to Remote Addresses
   Step 5: Not needed any more, entity extensions are loaded automatically in service definition when running the service
   Step 6: The change in step 5 is needed to avoid errors when refering to the extended fields
           Semicolon (;) needed at the end of select extending orders with new association
