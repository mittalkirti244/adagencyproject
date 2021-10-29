// using adagency from '../db/schema';

// service PaymentPlanServices
//  {
//     @Capabilities: {Insertable:true,Deletable:true,}
//       @odata.draft.enabled : true
//     entity PaymentPlanDetails as Projection on adagency.PaymentPlan
//     {
//      *,content.content_Id as Cid, preferences.preferenceType as preferenceType, preferences.preferenceCost as preferenceCost,content.contentType as contentType,content.contentSize as contentSize,content.contentCost as contentCost
//     }
//  }