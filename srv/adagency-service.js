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
   // this.on('NEW', 'PaymentPlan', genOrder)

});


// async function genOrder(req) {
//     const { prefCost} = await cds.tx(req).run(SELECT.one.from(req.Preferences).columns('preferenceCost'))
//     const { contentCost} = await cds.tx(req).run(SELECT.one.from(req.ContentDetails).columns('contentCost'))
//     req.data.totalCost =  prefCost + contentCost
// }

// module.exports = srv => {
//     srv.on("getadID", async req => {
//         const {userID} = req.data;
//         const db = srv.transaction(req);
//         let {AdDetails} = srv.entities();
//         const result = await db.read(AdDetails).where({userID: userID});
//         return result.map((AdDetails) => AdDetails.ID);
//     })

// module.exports = srv => {
//     srv.on("getPreferenceId", async req => {
//         const {preferenceType1} = req.data;
//         const db = srv.transaction(req);
//         let {Preferences} = srv.entities();
//         const result = await db.read(Preferences).where({preferenceType:preferenceType1});
//         return result.map((Preferences) => Preferences.ID);
//     })

//     srv.on("createBook", async req =>{
//         const {bookTitle, bookStock, authorId} = req.data;
//         const db = srv.transaction(req);
//         let {Books} =srv.entities();
//         await srv.create(Books).entries({title: bookTitle, stock: bookStock, author_ID: authorId});
//         const result = await db.read(Books).where({title: bookTitle});
//         return result.map((Books) => Books.ID);
// })