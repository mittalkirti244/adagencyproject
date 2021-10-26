//const cds = require('@sap/cds');

module.exports = cds.service.impl(async function() {
	const { CountryText,Country} = this.entities;
	const service = await cds.connect.to('country');
	this.on('READ', CountryText, request => {
		return service.tx(request).run(request.query);
    });
    this.on('READ', Country, request => {
		return service.tx(request).run(request.query);
	});
});