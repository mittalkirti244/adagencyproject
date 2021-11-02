namespace adagency;

using {
    cuid,
    managed
} from '@sap/cds/common';

using from './schema';
using from './data-model';
using from './userSchema';

entity ManageOrder : cuid {
    key ID          : UUID @odata.Type : 'Edm.String';
        //  planID      : String;
        //description : LargeString;
        address     : LargeString;
        country     : String;
        totalAmount : Integer;
        status      : OrderStatus;
        user1        : Association to adagency.User;
        ad1         : Association to adagency.AdDetails;
        pay         : Association to adagency.PaymentPlan;
}

type OrderStatus : String enum {
    Confirmed;
    Pending;
}

entity MyOrderStatus {
    key code : String;
}
