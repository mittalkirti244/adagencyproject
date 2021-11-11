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
        userID      : String;
        adID        : String;
        planID      : String;
        //description : LargeString;
        address     : LargeString;
        country     : String;
        totalAmount : Integer;
        status      : Association to MyOrderStatus @title : 'Order Status';
}

// type OrderStatus : String enum {
//     Confirmed;
//     Pending;
// }

entity MyOrderStatus {
    key code : String;
}