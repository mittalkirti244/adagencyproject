using adagency from '../db/schema';
using {AdDetailService as ad} from './adDetail-service';
using {country as count} from './external/country';
using {UserProfile as u} from './adagency-userprofile';

service AdAgencyServices {
    @Capabilities : {
        Insertable : true,
        Deletable  : true,
    }
    entity preferences        as projection on adagency.Preferences

    @Capabilities : {
        Insertable : true,
        Deletable  : true,
    }
    entity contentDetails     as projection on adagency.ContentDetails

    @Capabilities : {
        Insertable : true,
        Deletable  : true,
    }
    // entity PaymentPlanDetails as projection on adagency.PaymentPlan {
    //     * , preferences.preferenceType as pType, preferences.preferenceCost as pCost, content.ID as Cid, content.contentType as cType, content.contentSizeLimit as cSize
    // }

    entity PaymentPlanDetails as
        select from adagency.PaymentPlan {
            *,
            preferences.preferenceCost + content.contentCost as totalCost : Decimal(9, 2)
        };

    // extend PaymentPlanDetails {
    //     add : Association to one ad.AdDetails;
    // }

    entity Country            as projection on count.A_Country {
        key Country
    };

    entity CountryText        as projection on count.A_CountryText {
        key Country, CountryName, Language
    };

    @readonly
    entity UserProf           as projection on u.User;

    @readonly
    entity AdDetails          as projection on ad.AdDetails;

// extend PaymentPlanDetails  with{
//     Association : Association to AdDetails;
// }


//function getPreferenceId(preferenceType1: String) returns String;

}


// extend service AdAgencyServices with {
//     //entity Add as projection on ad.AdDetails;
    
// }
