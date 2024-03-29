/*
 * This is an example script file that can be used as a template for further configurations in the other branches.
 * Note how the External ID is populated to ensure we can easily upsert these exercises and thus they should be as unique across other exercises.
 * Currently the Playground Engine does NOT create these IDs. This is done by the Ebike Trail setup engine.
 * TODO: PR and DP to coordinate changes to playground. 
*/

Map<String, copado__Org__c> orgCredentials = new Map<String, copado__Org__c>();
for(copado__Org__c o : [select Id, Name, copado__Environment__c from copado__Org__c where copado__Org_Type__c='Sandbox']){
	orgCredentials.put(o.Name, o);
}

List<copado__User_Story__c> stories = new List<copado__User_Story__c>();

copado__User_Story__c u1 = new copado__User_Story__c(Module_External_Id__c='Ebike-Module2-US1');
u1.copado__User_Story_Title__c = 'Module 2: Object Model for Bike app';
u1.copado__Project__r = new copado__Project__c(Module_External_Id__c='EBike-Project');
u1.copado__Status__c = 'Approved';
u1.copado__Functional_Specifications__c = 'Create a data model that supports the creation of Orders and its associated items for products.';
u1.copado__Technical_Specifications__c = 'The object model will consist of an Order, Order Item, Product_Family__c and Product__c objects. We will also commit the Admin profile with this User Story to ensure that admins have permissions when we deploy this to other orgs.';
u1.copado__Org_Credential__c = orgCredentials.get('Dev1').Id;
u1.copado__Environment__c = orgCredentials.get('Dev1').copado__Environment__c;
stories.add(u1);

copado__User_Story__c u2 = new copado__User_Story__c(Module_External_Id__c='Ebike-Module2-US2');
u2.copado__User_Story_Title__c = 'Module 2: EBike application and tabs';
u2.copado__Project__r = new copado__Project__c(Module_External_Id__c='EBike-Project');
u2.copado__Status__c = 'Approved';
u1.copado__Functional_Specifications__c = 'Provide an easy way for users to access and navigate the e-bike application.';
u2.copado__Technical_Specifications__c = 'We will commit all the Custom Tabs and EBikes Custom Application in this User Story. As our Custom Application has a logo, we will also commit the ContentAsset called, “logo”.';
u2.copado__Org_Credential__c = orgCredentials.get('Dev1').Id;
u2.copado__Environment__c = orgCredentials.get('Dev1').copado__Environment__c;
stories.add(u2);
upsert stories Module_External_Id__c;
