const cds = require('@sap/cds');
module.exports = cds.service.impl(async function () {
    const { Country, CountryText } = this.entities;
    const service = await cds.connect.to('country');
    this.on('READ', Country, request => {
        return service.tx(request).run(request.query);
    });
    this.on('READ', CountryText, request => {
        return service.tx(request).run(request.query);
    });
    
    // const {ContentDetails, Preferences,PaymentPlan} = this.entities;
    // this.before('NEW', 'Content', genOrder)
});

// async function genOrder(req) {
//     const { prefCost} = await cds.tx(req).run(SELECT.one.from(req.target).columns('preferenceCost'))
//     const { contentCost} = await cds.tx(req).run(SELECT.one.from(req.target).columns('contentCost'))
//     req.data.totalAmount =  prefCost + contentCost
// }
