const { BusinessPartnerAddress } = require('@sap/cloud-sdk-vdm-business-partner-service')
const { FilterList } = require('@sap/cloud-sdk-core')
const destination = {
    url: 'http://localhost:3000/v2'
}

const createFilter = xs => {
	const andFilters = xs.map(x => new FilterList([
		BusinessPartnerAddress.BUSINESS_PARTNER.equals(x.businessPartner),
		BusinessPartnerAddress.ADDRESS_ID.equals(x.addressID)
	]))
	return new FilterList(undefined, andFilters).flatten()
}

function SELECT (columns) {
    return { from(a){
        const b = {}
        for (let p in a) if (p in columns) b[p] = a[p]
        return b
    }}
}

module.exports = srv => {

	srv.before('READ', 'Orders', async (req) => {

		const { SELECT } = req.query
		SELECT.columns = SELECT.columns.filter(c => !(c.expand && c.ref[0] === 'address'))

	})

	srv.after('READ', 'Orders', async (results, req) => {

		const { Addresses } = srv.entities

		const $expand = req._.odataReq.getQueryOptions() && req._.odataReq.getQueryOptions().$expand || ''
		const result = results[0] || {}

		const entityRE = new RegExp(/([a-z]+)(?=(\(|$))/g)

		if ($expand && $expand.match(entityRE).includes('address') && 'businessPartner' in result && 'addressID' in result) {

			const addresses = await BusinessPartnerAddress
				.requestBuilder()
				.getAll()
				.filter(createFilter(results))
				.execute(destination)

			results.forEach(order => order.address = SELECT (Addresses.elements) .from (addresses.find(
				address => order.businessPartner === address.businessPartner && order.addressID === address.addressId
			)))

		}

	})
}