annotate CatalogService.Orders with {
	addressID @title:'Address ID'
}

annotate CatalogService.Orders with @(

	UI: {
		SelectionFields: [ addressID ],
		LineItem: [
			{ Value: quantity, Label: 'Order Quantity' },
			{ Value: book.title, Label: 'Book Title' },
			{ Value: businessPartner, Label: 'BP Nr' },
			{ Value: addressID, Label: 'Address ID' },
			{ Value: address.cityName, Label: 'City' }            
		],
		HeaderInfo: {
			TypeName: 'Order',
			TypeNamePlural: 'Orders',
			Description: { Value: book.title }
		}      
	}

);