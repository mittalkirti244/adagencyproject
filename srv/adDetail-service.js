const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {
    const { CountryText, Country } = this.entities;

    const service = await cds.connect.to('country');

    this.on('READ', CountryText, request => {
        return service.tx(request).run(request.query);
    });

    this.on('READ', Country, request => {
        return service.tx(request).run(request.query);
    });

    this.before('NEW', 'AdDetails', genid)

    // srv.on('READ','AdDetails', ()=> SELECT.from(AdDetails));
});

/** Generate primary keys for target entity in request */
async function genid(req) {
    const { ID } = await cds.tx(req).run(SELECT.one.from(req.target).columns('max(ID) as ID'))
    req.data.ID = ID  
    req.data.ID++  
}

