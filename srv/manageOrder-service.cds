using adagency as ad from '../db/manageOrder';
using {country as cntry  } from './external/country';
using {AdAgencyServices as ads}from './adagency-service';

service ManageOrdersService {

@Capabilities : { Insertable: true, Deletable:true }
    entity ManageOrder as projection on ad.ManageOrder;

@readonly
entity planDetails as projection on ads.PaymentPlanDetails;

@readonly
   entity StatusCode as projection on ad.MyOrderStatus;
   

@readonly
   entity Country as projection on cntry.A_Country{
       key Country,CountryCurrency,CountryThreeDigitISOCode,CountryThreeLetterISOCode,IndexBasedCurrency
   };

@readonly   
   entity CountryText as projection on cntry.A_CountryText{
       key Country,CountryName,Language
   };
}