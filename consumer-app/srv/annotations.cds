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

annotate CatalogService.Books with {
	title @title:'Title'
}


annotate CatalogService.Books with @(

	UI: {
		SelectionFields: [ title ],
		LineItem: [
			{ Value: stock, Label: 'Stock' },
			{ Value: title, Label: 'Book Title' },
			{ Value: author.name, Label: 'Author' }
		],
		HeaderInfo: {
			TypeName: 'Book',
			TypeNamePlural: 'Books',
			Description: { Value: title }
		}      
	}

);

annotate CatalogService.Authors with {
	name @title:'Name'
}


annotate CatalogService.Authors with @(

	UI: {
		SelectionFields: [ name ],
		LineItem: [
			{ Value: ID, Label: 'ID' },
			{ Value: name, Label: 'Name' }
		],
		HeaderInfo: {
			TypeName: 'Author',
			TypeNamePlural: 'Authors',
			Description: { Value: name }
		}      
	}

);
