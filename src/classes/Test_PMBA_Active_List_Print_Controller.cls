/* Class Name   : Test_PMBA_Active_List_Print_Controller
 * Description  : test class for PMBA_Active_List_Print_Controller
 *
 * Created By   : Arpitha Sudhakar
 * Created On   : 10/13/2015

 * Modification Log: 
 * --------------------------------------------------------------------------------------------------------------------------------------
 * Developer                Date                   Modification ID      Description
 * ---------------------------------------------------------------------------------------------------------------------------------------
 * 
*/
@isTest
public class Test_PMBA_Active_List_Print_Controller{

    public class MockHttpResponseGenerator implements HttpCalloutMock    {
        public HTTPResponse respond(HTTPRequest req)    {   
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            if (req.getEndpoint().contains('/api/auth'))    {
                res.setBody('{"responseStatus":"SUCCESS","sessionId":"2441209F3FBF72087B2CD53049E6846A794F13C63BE9397A75095AA7AA9380183AA8F538BE4D94A9CA4773DE8BBF594A498D60D1CC27D81C6139E736DE09469C","userId":371401,"vaultIds":[{"id":5505,"name":"PromoMats Sandbox New","url":"https://lillysbx-promomats2.veevavault.com/api"}],"vaultId":"5505"}');
            } 
            if (req.getEndpoint().contains('FROM+ALLVERSIONS+documents')){
                res.setBody('{"responseStatus":"SUCCESS","responseDetails":{"limit":1000,"offset":0,"size":5,"total":5}, "data":[{"id":215,"status__v":"Approved for Distribution","type__v":"Promotional Piece","document_number__v":"PP-DB-US-0002","document_product__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"Diabetes Branded Portfolio"}]},"document_country__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"United States"}]},"audience__vs":["HCP","Consumer","Payer"],"approved_user_group__c":["Direct to HCP","DTC","Account Manager","Direct to Payer","Sales Representatives"],"trackable_item__c":true,"approximate_retail_value__c":0.00,"cost_per_unit__c":0.00,"legacy_identifier__c":"DB96292","country__v":["unitedStates"],"expiration_date__vs":"2015-11-26","retirement_date__c":null}, {"id":216,"name__v":"DB Insulin Lapel Pin #1_31878","status__v":"Approved for Distribution","type__v":"Promotional Piece","document_product__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"Diabetes Branded Portfolio"}]},"document_country__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"United States"}]},"audience__vs":["HCP","Consumer","Payer"],"approved_user_group__c":["Account Manager","Contracted Sales Force","Sales Representatives"],"trackable_item__c":false,"approximate_retail_value__c":0.00,"cost_per_unit__c":0.00,"legacy_identifier__c":null,"country__v":["unitedStates"],"expiration_date__vs":"2015-12-31","retirement_date__c":"2016-01-31"}, {"id":217,"name__v":"DB Name Badge Template","type__v":"Promotional Piece","document_number__v":"PP-DB-US-0004","document_product__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"Diabetes Branded Portfolio"}]},"document_country__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"United States"}]},"audience__vs":["HCP","Payer"],"approved_user_group__c":["Account Manager","Internal User","Sales Representatives"],"trackable_item__c":false,"approximate_retail_value__c":0.00,"cost_per_unit__c":1.00,"legacy_identifier__c":"DB94349","country__v":["unitedStates"],"expiration_date__vs":"2015-10-31","retirement_date__c":"2015-12-24"}, {"id":218,"name__v":"DB Portfolio Sampling Tear Sheet","status__v":"Approved for Distribution","type__v":"Promotional Piece","document_number__v":"PP-DB-US-0005","document_product__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1}},"document_country__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"United States"}]},"audience__vs":["HCP","Consumer","Payer"],"approved_user_group__c":["Account Manager","Contracted Sales Force","Sales Representatives"],"trackable_item__c":false,"approximate_retail_value__c":0.00,"cost_per_unit__c":0.00,"legacy_identifier__c":null,"country__v":["unitedStates"],"expiration_date__vs":"2016-01-26","retirement_date__c":"2015-10-29"}, {"id":289,"name__v":"Sample_Test_Document-19","status__v":"Approved for Distribution","type__v":"Promotional Piece","document_number__v":"PP-DB-US-0015","document_product__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"Diabetes Branded Portfolio"}]},"document_country__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"United States"}]},"audience__vs":null,"trackable_item__c":true,"approximate_retail_value__c":1.00,"cost_per_unit__c":1.00,"legacy_identifier__c":null,"country__v":["unitedStates"],"expiration_date__vs":"2015-12-31","retirement_date__c":"2015-12-31"}, {"id":290,"name__v":"Sample_Test_Document-19","status__v":"Approved for Distribution","type__v":"Promotional Piece","document_number__v":"PP-DB-US-0015","document_product__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"Diabetes Branded Portfolio"}]},"document_country__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"United States"}]},"audience__vs":null,"approved_user_group__c":["Account Manager","Sales Representatives"],"approximate_retail_value__c":1.00,"cost_per_unit__c":1.00,"legacy_identifier__c":null,"country__v":["unitedStates"],"expiration_date__vs":"2015-12-31","retirement_date__c":"2015-12-31"}, {"id":291,"name__v":"Sample_Test_Document-19","status__v":"Approved for Distribution","type__v":"Promotional Piece","document_number__v":"PP-DB-US-0015","document_product__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"Diabetes Branded Portfolio"}]},"document_country__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"United States"}]},"audience__vs":null,"approved_user_group__c":["Account Manager","Sales Representatives"],"trackable_item__c":true,"cost_per_unit__c":1.00,"legacy_identifier__c":null,"country__v":["unitedStates"],"expiration_date__vs":"2015-12-31","retirement_date__c":"2015-12-31"}, {"id":292,"name__v":"Sample_Test_Document-19","status__v":"Approved for Distribution","type__v":"Promotional Piece","document_number__v":"PP-DB-US-0015","document_product__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"Diabetes Branded Portfolio"}]},"document_country__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"United States"}]},"audience__vs":null,"approved_user_group__c":["Account Manager","Sales Representatives"],"trackable_item__c":true,"approximate_retail_value__c":1.00,"legacy_identifier__c":null,"country__v":["unitedStates"],"expiration_date__vs":"2015-12-31","retirement_date__c":"2015-12-31"}]}');
            }
            if (req.getEndpoint().contains('query?q=SELECT+id,name__v+FROM+product__v'))    {            
                res.setBody('{"responseStatus":"SUCCESS","responseDetails":{"limit":1000,"offset":0,"size":67,"total":67},"data":[{"id":"00P000000000306","name__v":"Prozac"},{"id":"00P000000000908","name__v":"Humalog Mix 50/50"},{"id":"00P000000000307","name__v":"Tradjenta"},{"id":"00P000000000925","name__v":"Patient Reimbursement Center"},{"id":"00P000000000308","name__v":"Vancocin"},{"id":"00P000000000910","name__v":"Humatrope"},{"id":"00P000000000104","name__v":"Forsteo"},{"id":"00P000000000928","name__v":"Zyprexa Relprevv"},{"id":"00P000000000401","name__v":"ReoPro"},{"id":"00P000000000929","name__v":"MHS Hospital"},{"id":"00P000000000913","name__v":"Innovative Customer Experience"},{"id":"00P000000000B01","name__v":"Reference Document"},{"id":"00P000000000108","name__v":"Gemzar"},{"id":"00P000000000801","name__v":"Trulicity"},{"id":"00P000000000915","name__v":"Jardiance"},{"id":"00P000000000901","name__v":"Effient"},{"id":"00P000000000110","name__v":"Humalog"},{"id":"00P000000000902","name__v":"Axiron"},{"id":"00P000000000917","name__v":"Lilly Alzheimers Disease"},{"id":"00P000000000D02","name__v":"Insulin Glargine BS Lilly"},{"id":"00P000000000918","name__v":"Lilly Autoimmune"},{"id":"00P000000000E01","name__v":"Lilly Brand"},{"id":"00P000000000919","name__v":"Lilly Diabetes Strategy"},{"id":"00P000000000301","name__v":"Byetta"},{"id":"00P000000000905","name__v":"Health Education"},{"id":"00P000000000302","name__v":"Ceclor Liquid"},{"id":"00P000000000906","name__v":"Humalog U100"},{"id":"00P000000000922","name__v":"Portrazza"},{"id":"00P000000000907","name__v":"Humalog U200"},{"id":"00P000000000304","name__v":"Evista"},{"id":"00P000000000305","name__v":"Humulin"},{"id":"00P000000000101","name__v":"Strattera"},{"id":"00P000000000924","name__v":"Patient Assistance"},{"id":"00P000000000909","name__v":"Humalog Mix 75/25"},{"id":"00P000000000926","name__v":"Solanezumab"},{"id":"00P000000000309","name__v":"Zydis"},{"id":"00P000000000927","name__v":"Symbyax"},{"id":"00P000000000310","name__v":"Zyprexa"},{"id":"00P000000000911","name__v":"Humulin R U100"},{"id":"00P000000000105","name__v":"Forteo"},{"id":"00P000000000912","name__v":"Humulin R U500"},{"id":"00P000000000930","name__v":"MHS IHS AM"},{"id":"00P000000000601","name__v":"Glucagon"},{"id":"00P000000000A01","name__v":"BIV"},{"id":"00P000000000701","name__v":"Amyvid"},{"id":"00P000000000914","name__v":"Ixekizumab"},{"id":"00P000000000C01","name__v":"Lilly Cardiovascular"},{"id":"00P000000000109","name__v":"Lilly Diabetes"},{"id":"00P000000000C02","name__v":"Lilly Immunology"},{"id":"00P000000000C03","name__v":"Erbitux"},{"id":"00P000000000916","name__v":"Jentadueto"},{"id":"00P000000000D01","name__v":"Trazenta"},{"id":"00P000000000903","name__v":"BIL"},{"id":"00P000000000201","name__v":"Cyramza"},{"id":"00P000000000904","name__v":"Diabetes Branded Portfolio"},{"id":"00P000000000F01","name__v":"Lilly Brand Historic"},{"id":"00P000000000920","name__v":"Lilly USA"},{"id":"00P000000000921","name__v":"MHS"},{"id":"00P000000000303","name__v":"Ceclor Solid"},{"id":"00P000000000923","name__v":"Oncology Unbranded"},{"id":"00P000000000103","name__v":"Adcirca"},{"id":"00P000000000501","name__v":"Basaglar"},{"id":"00P000000000107","name__v":"Alimta"},{"id":"00P000000000106","name__v":"Lilly Oncology"},{"id":"00P000000000111","name__v":"Cymbalta"},{"id":"00P000000000H01","name__v":"CamTest"},{"id":"00P000000000102","name__v":"Cialis"}]}');
            }
            if (req.getEndpoint().contains('/api/v12.0/objects/picklists/approved_user_group__c'))    {            
                res.setBody('{"responseStatus":"SUCCESS","responseMessage":"Success","picklistValues":[{"name":"account_manager__c","label":"Account Manager"},{"name":"alliance_sales_force__c","label":"Alliance Sales Force"},{"name":"contracted_sales_force__c","label":"Contracted Sales Force"},{"name":"contracted_speakers__c","label":"Contracted Speakers"},{"name":"direct_to_hcp1__c","label":"Direct to HCP"},{"name":"direct_to_payer1__c","label":"Direct to Payer"},{"name":"dtc__c","label":"DTC"},{"name":"internal_user__c","label":"Internal User"},{"name":"tlac_lilly_answers_center__c","label":"Lilly Answers Center"},{"name":"lilly_nurse_educator__c","label":"Lilly Nurse Educator"},{"name":"medical_liason__c","label":"Medical Liaison"},{"name":"oncology_physicians_network_team__c","label":"Oncology Physicians Network Team"},{"name":"patient_access_specialist__c","label":"Patient Access Specialist"},{"name":"sales_representatives__c","label":"Sales Representatives"}]}');
            }                       
            res.setStatusCode(200);
            system.debug('----response in test--'+res.getbody());
            return res;
        }
    }          
       
     static testmethod void testActiveListSalesRep() {     
         System.runAs(PMBA_DataFactory.createUser('PMBA_Sales_Rep'))    {
            PMBA_DataFactory.createVeevaVaultCredentials();
            PMBA_DataFactory.createHelpPDF();
            Test.startTest();
            //Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
            PageReference pageRef = Page.PMBA_Active_List_Page;
            System.Test.setCurrentPage(pageRef);
            PMBA_Active_List_Print_Controller controller = new PMBA_Active_List_Print_Controller();
            //controller.initialisePage();
            system.assertEquals(controller.userGroupList,null);
            system.assertEquals(controller.productList,null);
            Test.stopTest();
        }      
     }
     
     static testmethod void testActiveListSalesRep1() {     
         List<sObject> veevaCreds = Test.loadData(PMBA_Veeva_Vault_Credentials__c.sObjectType, 'PMBA_Veeva_Vault_Test_Credentials');
         Test.startTest();
         Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
         PageReference pageRef = Page.PMBA_Active_List_Print;
         System.Test.setCurrentPage(pageRef); 
         ApexPages.currentPage().getParameters().put('selectedProduct','00P000000000904');
         ApexPages.currentPage().getParameters().put('selectedUserGroup','account_manager__c');
         PMBA_Active_List_Print_Controller controller = new PMBA_Active_List_Print_Controller();
         controller.initialisePrintActiveListPage();
         system.assertEquals(controller.activeproducts.size(),8);
         Test.stopTest();
     }
     
     static testmethod void testActiveListSalesRep2() {     
         List<sObject> veevaCreds = Test.loadData(PMBA_Veeva_Vault_Credentials__c.sObjectType, 'PMBA_Veeva_Vault_Test_Credentials');
         Test.startTest();
         Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
         PageReference pageRef = Page.PMBA_Active_List_Print;
         System.Test.setCurrentPage(pageRef); 
         PMBA_Active_List_Print_Controller controller = new PMBA_Active_List_Print_Controller();
         controller.initialisePrintActiveListPage();
         system.assertEquals(controller.activeproducts.size(),0);
         Test.stopTest();
     }
     
     public static boolean throwCalloutException = false;
     
     public class MockHttpExceptionResponseGenerator implements HttpCalloutMock    {
        public HTTPResponse respond(HTTPRequest req)    {  
            if (!throwCalloutException)    { 
                HttpResponse res = new HttpResponse();
                res.setHeader('Content-Type', 'application/json');
                if (req.getEndpoint().contains('/api/auth'))    {
                    res.setBody('{"responseStatus":"FAILURE","responseMessage":"Authentication failed for user [syeleswarapu@lillysbx.com.abc].","errors":[{"type":"INACTIVE_USER","message":"User is inactive."}],"errorType":"AUTHENTICATION_FAILED"}');
                }                      
                res.setStatusCode(200);
                system.debug('----response in test--'+res.getbody());
                return res;
            }
            else    {
                throw new System.calloutException();
            }
        }
     }
     
     static testmethod void testActiveListSalesRep3() {     
         List<sObject> veevaCreds = Test.loadData(PMBA_Veeva_Vault_Credentials__c.sObjectType, 'PMBA_Veeva_Vault_Test_Credentials');
         Test.startTest();
         Test.setMock(HttpCalloutMock.class, new MockHttpExceptionResponseGenerator());
         PageReference pageRef = Page.PMBA_Active_List_Print;
         System.Test.setCurrentPage(pageRef); 
         ApexPages.currentPage().getParameters().put('selectedProduct','00P000000000904');
         ApexPages.currentPage().getParameters().put('selectedUserGroup','account_manager__c');
         PMBA_Active_List_Print_Controller controller = new PMBA_Active_List_Print_Controller ();
         controller.initialisePrintActiveListPage();
         system.assertEquals(controller.exceptionMessage,PMBA_StaticConstants.PMBA_VEEVA_RESPONSE_FAILURE_AUTH);
         Test.stopTest();
     }    
     
     static testmethod void testActiveListSalesRep4() {     
         throwCalloutException = true;
         List<sObject> veevaCreds = Test.loadData(PMBA_Veeva_Vault_Credentials__c.sObjectType, 'PMBA_Veeva_Vault_Test_Credentials');
         Test.startTest();
         Test.setMock(HttpCalloutMock.class, new MockHttpExceptionResponseGenerator());
         PageReference pageRef = Page.PMBA_Active_List_Print;
         System.Test.setCurrentPage(pageRef); 
         ApexPages.currentPage().getParameters().put('selectedProduct','00P000000000904');
         ApexPages.currentPage().getParameters().put('selectedUserGroup','account_manager__c');
         PMBA_Active_List_Print_Controller controller = new PMBA_Active_List_Print_Controller ();
         controller.initialisePrintActiveListPage();
         system.assertEquals(controller.exceptionMessage,PMBA_StaticConstants.PMBA_VEEVA_RESPONSE_FAILURE_TRY_AGAIN);
         Test.stopTest();
     } 
}