namespace adagency;

using {cuid, managed} from '@sap/cds/common';

entity ManageOrder : cuid, managed {
    key ID          : UUID @odata.Type : 'Edm.String';
        planID      : String;
        //description : LargeString;
        address     : LargeString;
        country     : String;
        totalAmount : String;
        status      : OrderStatus;      
}

type OrderStatus : String enum{
    Confirmed;Pending;
}

entity MyOrderStatus{
    key code: String;
}
