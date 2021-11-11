using {adagency as ad} from '../db/manageOrder';
using from '../db/schema';
using {country as cntry} from './external/country';
using {AdAgencyServices as ads} from './adagency-service';
using {AdDetailService as ad1} from './adDetail-service';

service ManageOrdersService {

    @Capabilities : {
        Insertable : true,
        Deletable  : true
    }
    entity ManageOrder    as projection on ad.ManageOrder;

    @readonly
    entity PlanDetails    as projection on ads.PaymentPlanDetails{
        *, preferences.preferenceCost + content.contentCost as totalAmount : Integer
    };

    @readonly
    entity ContentDetails as projection on ads.contentDetails;

    // @readonly
    // entity PreferencesDetails as projection on ads.preferences;

    @readonly
    entity UserDetails    as projection on ad.User;

    @readonly
    entity AdDetails      as projection on ad1.AdDetails;

    @readonly
    entity StatusCode     as projection on ad.MyOrderStatus;

    @readonly
    entity Country        as projection on cntry.A_Country {
        key Country, CountryCurrency, CountryThreeDigitISOCode, CountryThreeLetterISOCode, IndexBasedCurrency
    };

    @readonly
    entity CountryText    as projection on cntry.A_CountryText {
        key Country, CountryName, Language
    };
}