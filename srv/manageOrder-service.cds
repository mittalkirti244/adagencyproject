using adagency as ad from '../db/manageOrder';
using from '../db/data-model';
using {country as cntry} from './external/country';
using {AdAgencyServices as ads} from './adagency-service';
using {adagency as cad} from '../db/schema';

service ManageOrdersService {

    @Capabilities : {
        Insertable : true,
        Deletable  : true
    }
    entity ManageOrder as projection on ad.ManageOrder;
    // {
    //     *,pay.content.contentCost as contentCost, pay.preferences.preferenceCost
    // }; 
    // extend ManageOrder with {
    //     PaymentPlanDetails : Association to ads.PaymentPlanDetails;
    // }

    // extend entity ManageOrder as
    //     select from ads.PaymentPlanDetails as projection {
    //         *,
    //         ad.preferences.preferenceCost + ad.content.contentCost as totalAmount : Decimal(9, 2)
    //     };


    @readonly
    entity planDetails as projection on ads.PaymentPlanDetails;

    entity userDetails as projection on ad.User;
    

    @readonly
    entity StatusCode  as projection on ad.MyOrderStatus;


    @readonly
    entity Country     as projection on cntry.A_Country {
        key Country, CountryCurrency, CountryThreeDigitISOCode, CountryThreeLetterISOCode, IndexBasedCurrency
    };

    @readonly
    entity CountryText as projection on cntry.A_CountryText {
        key Country, CountryName, Language
    };
}
