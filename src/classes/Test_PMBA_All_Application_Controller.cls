/* Class Name   : PMBA_All_Application_Controller
 * Description  : This is the controller for the PMBA_All_Application_Page
 *
 * Created By   : Avijeet Singh
 * Created On   : 13/10/2015

 * Modification Log: 
 * --------------------------------------------------------------------------------------------------------------------------------------
 * Developer                Date                   Modification ID      Description
 * ---------------------------------------------------------------------------------------------------------------------------------------
 * 
*/
@isTest
public class Test_PMBA_All_Application_Controller    {

    public class MockHttpResponseGenerator implements HttpCalloutMock    {
        public HTTPResponse respond(HTTPRequest req)    {   
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            Date dt = date.today();
            Date dt2 = date.today();
            String dateString;
            String dateString2;
            if (req.getEndpoint().contains('/api/auth'))    {
                res.setBody('{"responseStatus":"SUCCESS","sessionId":"2441209F3FBF72087B2CD53049E6846A794F13C63BE9397A75095AA7AA9380183AA8F538BE4D94A9CA4773DE8BBF594A498D60D1CC27D81C6139E736DE09469C","userId":371401,"vaultIds":[{"id":5505,"name":"PromoMats Sandbox New","url":"https://lillysbx-promomats2.veevavault.com/api"}],"vaultId":"5505"}');
            }  
            if (req.getEndpoint().contains('/query?q='))    {
                 System.debug('req'+req);
                 System.debug(req.getEndpoint().contains('document_number__v+CONTAINS(\'PP-DB-US-0002\')'));
                if (req.getEndpoint().contains('document_number__v+CONTAINS(\'PP-DB-US-0002\')'))    {
                    
                   dt = dt.addDays(30);
                   dateString = dt.year()+'-'+dt.month()+'-'+dt.day();
                   dt2 = dt2.addDays(-30);
                   dateString2 = dt.year()+'-'+dt.month()+'-'+dt.day();
                   res.setBody('{"responseStatus":"SUCCESS","responseDetails":{"limit":1000,"offset":0,"size":1,"total":1},"data":[{"id":214,"name__v":"BD Autoshield Needle HCP Form 2015","approved_for_distribution_date__vs":"'+dateString2 +'","status__v":"Approved for Distribution","type__v":"Promotional Piece","document_number__v":"PP-DB-US-0002","document_product__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"Diabetes Branded Portfolio"}]},"document_country__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"United States"}]},"audience__vs":["HCP"],"approved_user_group__c":["Sales Representatives"],"trackable_item__c":false,"approximate_retail_value__c":0.00,"cost_per_unit__c":0.00,"legacy_identifier__c":null,"country__v":["unitedStates"],"expiration_date__vs":"'+dateString +'","retirement_date__c":"'+dateString+'"}]}');
                }
            }   
            if (req.getEndpoint().contains('/query?q='))    {
                if (req.getEndpoint().contains('document_number__v+CONTAINS(\'PP-DB-US-0004\')'))    {
                    dt = dt.addDays(5);
                    dateString = dt.year()+'-'+dt.month()+'-'+dt.day();
                    dt2 = dt2.addDays(-30);
                    dateString2 = dt.year()+'-'+dt.month()+'-'+dt.day();
                    res.setBody('{"responseStatus":"SUCCESS","responseDetails":{"limit":1000,"offset":0,"size":1,"total":1},"data":[{"id":214,"name__v":"BD Autoshield Needle HCP Form 2015","approved_for_distribution_date__vs":"'+dateString2 +'","status__v":"Approved for Distribution","type__v":"Promotional Piece","document_number__v":"PP-DB-US-0004","document_product__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"Diabetes Branded Portfolio"}]},"document_country__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"United States"}]},"audience__vs":["HCP"],"approved_user_group__c":["Sales Representatives"],"trackable_item__c":false,"approximate_retail_value__c":0.00,"cost_per_unit__c":0.00,"legacy_identifier__c":null,"country__v":["unitedStates"],"expiration_date__vs":"'+dateString +'","retirement_date__c":"'+dateString+'"}]}');
                }
            }   
            if (req.getEndpoint().contains('/query?q='))    {
                if (req.getEndpoint().contains('document_number__v+CONTAINS(\'PP-DB-US-0005\')'))     {
                    dateString = dt.year()+'-'+dt.month()+'-'+dt.day();
                    dt2 = dt2.addDays(-30);
                    dateString2 = dt.year()+'-'+dt.month()+'-'+dt.day();
                    res.setBody('{"responseStatus":"SUCCESS","responseDetails":{"limit":1000,"offset":0,"size":1,"total":1},"data":[{"id":214,"name__v":"BD Autoshield Needle HCP Form 2015","status__v":"Approved for Distribution","approved_for_distribution_date__vs":"'+dateString2 +'","type__v":"Promotional Piece","document_number__v":"PP-DB-US-0005","document_product__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"Diabetes Branded Portfolio"}]},"document_country__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"United States"}]},"audience__vs":["HCP"],"approved_user_group__c":["Sales Representatives"],"trackable_item__c":false,"approximate_retail_value__c":0.00,"cost_per_unit__c":0.00,"legacy_identifier__c":null,"country__v":["unitedStates"],"expiration_date__vs":"'+dateString +'","retirement_date__c":"'+dateString+'"}]}');
                }
            }    
            if (req.getEndpoint().contains('/query?q='))    {
                if (req.getEndpoint().contains('document_number__v+CONTAINS(\'PP-DB-US-0007\')'))     {
                    dt = dt.addDays(-3);
                    dateString = dt.year()+'-'+dt.month()+'-'+dt.day();
                    dt2 = dt2.addDays(-30);
                    dateString2 = dt.year()+'-'+dt.month()+'-'+dt.day();
                    res.setBody('{"responseStatus":"SUCCESS","responseDetails":{"limit":1000,"offset":0,"size":1,"total":1},"data":[{"id":214,"name__v":"BD Autoshield Needle HCP Form 2015","status__v":"Expired","approved_for_distribution_date__vs":"'+dateString2 +'","type__v":"Promotional Piece","document_number__v":"PP-DB-US-0007","document_product__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"Diabetes Branded Portfolio"}]},"document_country__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"United States"}]},"audience__vs":["HCP"],"approved_user_group__c":["Sales Representatives"],"trackable_item__c":false,"approximate_retail_value__c":0.00,"cost_per_unit__c":0.00,"legacy_identifier__c":null,"country__v":["unitedStates"],"retirement_date__c":"'+dateString+'"}]}');
                }
            }  
            if (req.getEndpoint().contains('/query?q='))    {
                if (req.getEndpoint().contains('document_number__v+CONTAINS(\'PP-DB-US-0006\')'))     {
                    dt = dt.addDays(-3);
                    dateString = dt.year()+'-'+dt.month()+'-'+dt.day();
                    dateString2 = null;
                    res.setBody('{"responseStatus":"SUCCESS","responseDetails":{"limit":1000,"offset":0,"size":1,"total":1},"data":[{"id":214,"name__v":"BD Autoshield Needle HCP Form 2015","status__v":"Expired","approved_for_distribution_date__vs":"'+dateString2 +'","type__v":"Promotional Piece","document_number__v":"PP-DB-US-0006","document_product__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"Diabetes Branded Portfolio"}]},"document_country__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"United States"}]},"audience__vs":["HCP"],"approved_user_group__c":["Sales Representatives"],"trackable_item__c":false,"approximate_retail_value__c":0.00,"cost_per_unit__c":0.00,"legacy_identifier__c":null,"country__v":["unitedStates"],"retirement_date__c":"'+dateString+'"}]}');
                }
            }  
            if (req.getEndpoint().contains('/query?q='))    {
                if (req.getEndpoint().contains('document_number__v+CONTAINS(\'PP-DB-US-0008\')'))     {
                    dateString = dt.year()+'-'+dt.month()+'-'+dt.day();
                    dt2 = dt2.addDays(-30);
                    dateString2 = null;
                    res.setBody('{"responseStatus":"FAILURE","responseDetails":{"limit":1000,"offset":0,"size":1,"total":1},"data":[{"id":214,"name__v":"BD Autoshield Needle HCP Form 2015","approved_for_distribution_date__vs":"'+dateString2 +'","type__v":"Promotional Piece","document_number__v":"PP-DB-US-0008","document_product__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"Diabetes Branded Portfolio"}]},"document_country__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"United States"}]},"audience__vs":["HCP"],"approved_user_group__c":["Sales Representatives"],"trackable_item__c":false,"approximate_retail_value__c":0.00,"cost_per_unit__c":0.00,"legacy_identifier__c":null,"country__v":["unitedStates"],"retirement_date__c":"'+dateString+'"}]}');
                }
            }  
            if (req.getEndpoint().contains('/query?q='))    {
                if (req.getEndpoint().contains('document_number__v+CONTAINS(\'PP-DB-US-0009\')'))     {
                    dateString = dt.year()+'-'+dt.month()+'-'+dt.day();
                    res.setBody('{"responseStatus":"FAILURE","responseDetails":{"limit":1000,"offset":0,"size":0,"total":0},"data":[{"id":214,"name__v":"BD Autoshield Needle HCP Form 2015","approved_for_distribution_date__vs":"'+dateString2 +'","type__v":"Promotional Piece","document_number__v":"PP-DB-US-0009","document_product__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"Diabetes Branded Portfolio"}]},"document_country__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"United States"}]},"audience__vs":["HCP"],"approved_user_group__c":["Sales Representatives"],"trackable_item__c":false,"approximate_retail_value__c":0.00,"cost_per_unit__c":0.00,"legacy_identifier__c":null,"country__v":["unitedStates"],"retirement_date__c":"'+dateString+'"}]}');
                }
            }   
            if (req.getEndpoint().contains('/query?q='))    {
                if (req.getEndpoint().contains('document_number__v+CONTAINS(\'PP-JAR-US-0009\')'))    {
                    dateString = dt.year()+'-'+dt.month()+'-'+dt.day();
                    res.setBody('{"responseStatus":"FAILURE","responseDetails":{"limit":1000,"offset":0,"size":0,"total":0},"data":[{"id":214,"name__v":"BD Autoshield Needle HCP Form 2015","approved_for_distribution_date__vs":"'+dateString2 +'","type__v":"Promotional Piece","document_number__v":"PP-JAR-US-0009","document_product__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"Diabetes Branded Portfolio"}]},"document_country__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"United States"}]},"audience__vs":["HCP"],"approved_user_group__c":["Sales Representatives"],"trackable_item__c":false,"approximate_retail_value__c":0.00,"cost_per_unit__c":0.00,"legacy_identifier__c":null,"country__v":["unitedStates"],"retirement_date__c":"'+dateString+'"}]}');
                }
            }
            if (req.getEndpoint().contains('/query?q='))    {
                if (req.getEndpoint().contains('document_number__v+CONTAINS(\'PPDBUSAD0008\',\'PP-DB-USAD-0008\')'))    {
                    dateString = dt.year()+'-'+dt.month()+'-'+dt.day();
                    res.setBody('{"responseStatus":"FAILURE","responseDetails":{"limit":1000,"offset":0,"size":1,"total":1},"data":[{"id":214,"name__v":"BD Autoshield Needle HCP Form 2015","approved_for_distribution_date__vs":"'+dateString2 +'","type__v":"Promotional Piece","document_number__v":"PP-DB-USAD-0008","document_product__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"Diabetes Branded Portfolio"}]},"document_country__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"United States"}]},"audience__vs":["HCP"],"approved_user_group__c":["Sales Representatives"],"trackable_item__c":false,"approximate_retail_value__c":0.00,"cost_per_unit__c":0.00,"legacy_identifier__c":null,"country__v":["unitedStates"],"retirement_date__c":"'+dateString+'"}]}');
                    //res.setBody('{"responseStatus":"SUCCESS","responseDetails":{"limit":1000,"offset":0,"size":0,"total":0},"data":[]}');
                }
            }
            if (req.getEndpoint().contains('/query?q='))    {
                if (req.getEndpoint().contains('document_number__v+CONTAINS(\'PPDBUSAD0008\',\'PP-DB-USAD-0008\')'))    {
                    dateString = dt.year()+'-'+dt.month()+'-'+dt.day();
                    res.setBody('{"responseStatus":"FAILURE","responseDetails":{"limit":1000,"offset":0,"size":1,"total":1},"data":[{"id":214,"name__v":"BD Autoshield Needle HCP Form 2015","approved_for_distribution_date__vs":"'+dateString2 +'","type__v":"Promotional Piece","document_number__v":"PPDBUSAD0008","document_product__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"Diabetes Branded Portfolio"}]},"document_country__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"United States"}]},"audience__vs":["HCP"],"approved_user_group__c":["Sales Representatives"],"trackable_item__c":false,"approximate_retail_value__c":0.00,"cost_per_unit__c":0.00,"legacy_identifier__c":null,"country__v":["unitedStates"],"retirement_date__c":"'+dateString+'"}]}');
                    //res.setBody('{"responseStatus":"SUCCESS","responseDetails":{"limit":1000,"offset":0,"size":0,"total":0},"data":[]}');
                }
            }
            if (req.getEndpoint().contains('/query?q='))    {
                if (req.getEndpoint().contains('document_number__v+CONTAINS(\'AA-123-HUYT-OI98\')'))    {
                    dateString = dt.year()+'-'+dt.month()+'-'+dt.day();
                    res.setBody('{"responseStatus":"FAILURE","responseDetails":{"limit":1000,"offset":0,"size":1,"total":1},"data":[{"id":214,"name__v":"BD Autoshield Needle HCP Form 2015","approved_for_distribution_date__vs":"'+dateString2 +'","type__v":"Promotional Piece","document_number__v":"AA-123-HUYT-OI98","document_product__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"Diabetes Branded Portfolio"}]},"document_country__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"United States"}]},"audience__vs":["HCP"],"approved_user_group__c":["Sales Representatives"],"trackable_item__c":false,"approximate_retail_value__c":0.00,"cost_per_unit__c":0.00,"legacy_identifier__c":null,"country__v":["unitedStates"],"retirement_date__c":"'+dateString+'"}]}');
                    //res.setBody('{"responseStatus":"SUCCESS","responseDetails":{"limit":1000,"offset":0,"size":0,"total":0},"data":[]}');
                }
            }
            if (req.getEndpoint().contains('/query?q='))    {
                if (req.getEndpoint().contains('document_number__v+CONTAINS(\'MK-ABC-1234-ABCD\',\'MK-ABC1-234A-BCD\')'))    {
                    dateString = dt.year()+'-'+dt.month()+'-'+dt.day();
                    res.setBody('{"responseStatus":"FAILURE","responseDetails":{"limit":1000,"offset":0,"size":1,"total":1},"data":[{"id":214,"name__v":"BD Autoshield Needle HCP Form 2015","approved_for_distribution_date__vs":"'+dateString2 +'","type__v":"Promotional Piece","document_number__v":"MK-ABC1-234A-BCD","document_product__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"Diabetes Branded Portfolio"}]},"document_country__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"United States"}]},"audience__vs":["HCP"],"approved_user_group__c":["Sales Representatives"],"trackable_item__c":false,"approximate_retail_value__c":0.00,"cost_per_unit__c":0.00,"legacy_identifier__c":null,"country__v":["unitedStates"],"retirement_date__c":"'+dateString+'"}]}');
                    //res.setBody('{"responseStatus":"SUCCESS","responseDetails":{"limit":1000,"offset":0,"size":0,"total":0},"data":[]}');
                }
            }            
            
            if (req.getEndpoint().contains('/query?q='))    {
                if (req.getEndpoint().contains('document_number__v+CONTAINS(\'PC-BDFR-0080-PROF\')'))    {
                    dateString = dt.year()+'-'+dt.month()+'-'+dt.day();
                    res.setBody('{"responseStatus":"FAILURE","responseDetails":{"limit":1000,"offset":0,"size":1,"total":1},"data":[{"id":214,"name__v":"BD Autoshield Needle HCP Form 2015","approved_for_distribution_date__vs":"'+dateString2 +'","type__v":"Promotional Piece","document_number__v":"PC-BDFR-0080-PROF","document_product__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"Diabetes Branded Portfolio"}]},"document_country__vr":{"responseDetails":{"limit":250,"offset":0,"size":1,"total":1},"data":[{"name__v":"United States"}]},"audience__vs":["HCP"],"approved_user_group__c":["Sales Representatives"],"trackable_item__c":false,"approximate_retail_value__c":0.00,"cost_per_unit__c":0.00,"legacy_identifier__c":null,"country__v":["unitedStates"],"retirement_date__c":"'+dateString+'"}]}');
                    //res.setBody('{"responseStatus":"SUCCESS","responseDetails":{"limit":1000,"offset":0,"size":0,"total":0},"data":[]}');
                }
            }


            
            


             
            
            res.setStatusCode(200);
            system.debug('----response in test--'+res.getbody());
            return res;
        }
    }

    static testmethod void testApplicationPageLoadSalesRep() {
         System.runAs(PMBA_DataFactory.createUser('PMBA_Sales_Rep'))    {
            PMBA_DataFactory.createVeevaVaultCredentials();
            PMBA_DataFactory.createHelpPDF();
            Test.startTest();
            PageReference pageRef = Page.PMBA_AllApplicationsPage;
            System.Test.setCurrentPage(pageRef);
            ApexPages.currentPage().getParameters().put('scannedcode','test');
            PMBA_All_Application_Controller controller = new PMBA_All_Application_Controller();
            System.assertEquals([SELECT count() FROM GLBL_Error_Log__c],1);
            Test.stopTest();
        }
     }
     
     static testmethod void testApplicationPageLoadSalesRep_1() {
         System.runAs(PMBA_DataFactory.createUser('PMBA_Sales_Rep'))    {
            PMBA_DataFactory.createVeevaVaultCredentials();
            PMBA_DataFactory.createHelpPDF();
            Test.startTest();
            PageReference pageRef = Page.PMBA_AllApplicationsPage;
            System.Test.setCurrentPage(pageRef);
            PMBA_All_Application_Controller controller = new PMBA_All_Application_Controller();
            system.assertEquals(controller.isPMBAUsageDetailsTabLinkVisible,false);
            Test.stopTest();
        }
     }
     
     static testmethod void testApplicationPageLoadSalesRep_1_1() {
         System.runAs(PMBA_DataFactory.createUser('PMBA_System_Owner'))    {
            PMBA_DataFactory.createVeevaVaultCredentials();
            PMBA_DataFactory.createHelpPDF();
            Test.startTest();
            PageReference pageRef = Page.PMBA_AllApplicationsPage;
            System.Test.setCurrentPage(pageRef);
            PMBA_All_Application_Controller controller = new PMBA_All_Application_Controller();
            system.assertEquals(controller.isPMBAUsageDetailsTabLinkVisible,true);
            Test.stopTest();
        }
     }
     
   /*  static testmethod void testApplicationPageLoadSalesRep_2() {
            List<sObject> veevaCreds = Test.loadData(PMBA_Veeva_Vault_Credentials__c.sObjectType, 'PMBA_Veeva_Vault_Test_Credentials');
            Test.startTest();
            Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
            PageReference pageRef = Page.PMBA_AllApplicationsPage;
            System.Test.setCurrentPage(pageRef);
            ApexPages.currentPage().getParameters().put('scannedcode','PP-DB-US-0001');
            PMBA_All_Application_Controller controller = new PMBA_All_Application_Controller();
            system.assertEquals(controller.documentStatusBackGroundColor,PMBA_StaticConstants.PMBA_Green_Color);
            Test.stopTest();

     } */
     
    /* static testmethod void testApplicationPageLoadSalesRep_3() {
            List<sObject> veevaCreds = Test.loadData(PMBA_Veeva_Vault_Credentials__c.sObjectType, 'PMBA_Veeva_Vault_Test_Credentials');
            Test.startTest();
            Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
            PageReference pageRef = Page.PMBA_AllApplicationsPage;
            System.Test.setCurrentPage(pageRef);
            PMBA_All_Application_Controller controller = new PMBA_All_Application_Controller();
            controller.documentInput = 'PPDBUS0001';
            controller.searchDocuments();
            system.assertEquals(controller.documentStatusBackGroundColor,PMBA_StaticConstants.PMBA_Red_Color);
            Test.stopTest();

     } */
     
    public static boolean throwCalloutException = false;
     
    public class MockHttpExceptionResponseGenerator implements HttpCalloutMock{
        public HTTPResponse respond(HTTPRequest req)    {  
            if (!throwCalloutException)    { 
                HttpResponse res = new HttpResponse();
                res.setHeader('Content-Type', 'application/json');
                system.debug('res'+res);
                System.debug('req'+req);
                if (req.getEndpoint().contains('/api/auth')){
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
     static testmethod void testApplicationPageLoadSalesRep_4() {
            throwCalloutException = true;
            List<sObject> veevaCreds = Test.loadData(PMBA_Veeva_Vault_Credentials__c.sObjectType, 'PMBA_Veeva_Vault_Test_Credentials');
            Test.startTest();
            Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
            PageReference pageRef = Page.PMBA_AllApplicationsPage;
            System.Test.setCurrentPage(pageRef);
            PMBA_All_Application_Controller controller = new PMBA_All_Application_Controller();
            controller.documentInput = 'PP-DB-US-0002';
            controller.searchDocuments();
            system.assertEquals(controller.documentStatusBackGroundColor,PMBA_StaticConstants.PMBA_Green_Color);            
            Test.stopTest();

     }
     
   /*  static testmethod void testApplicationPageLoadSalesRep_5() {
            List<sObject> veevaCreds = Test.loadData(PMBA_Veeva_Vault_Credentials__c.sObjectType, 'PMBA_Veeva_Vault_Test_Credentials');
            Test.startTest();
            Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
            PageReference pageRef = Page.PMBA_AllApplicationsPage;
            System.Test.setCurrentPage(pageRef);
            PMBA_All_Application_Controller controller = new PMBA_All_Application_Controller();
            controller.documentInput = 'PP-DB-US-0003';
            controller.searchDocuments();
            system.assertEquals(controller.documentStatusBackGroundColor,PMBA_StaticConstants.PMBA_Red_Color);
            Test.stopTest();

     } */
     
     static testmethod void testApplicationPageLoadSalesRep_6() {
            List<sObject> veevaCreds = Test.loadData(PMBA_Veeva_Vault_Credentials__c.sObjectType, 'PMBA_Veeva_Vault_Test_Credentials');
            Test.startTest();
            Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
            PageReference pageRef = Page.PMBA_AllApplicationsPage;
            System.Test.setCurrentPage(pageRef);
            PMBA_All_Application_Controller controller = new PMBA_All_Application_Controller();
            controller.documentInput = 'PP-DB-US-0004';
            controller.searchDocuments();
            system.assertEquals(controller.documentStatusBackGroundColor,PMBA_StaticConstants.PMBA_Yellow_Color);
            Test.stopTest();

     }
     
     static testmethod void testApplicationPageLoadSalesRep_7() {
            List<sObject> veevaCreds = Test.loadData(PMBA_Veeva_Vault_Credentials__c.sObjectType, 'PMBA_Veeva_Vault_Test_Credentials');
            Test.startTest();
            Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
            PageReference pageRef = Page.PMBA_AllApplicationsPage;
            System.Test.setCurrentPage(pageRef);
            PMBA_All_Application_Controller controller = new PMBA_All_Application_Controller();
            controller.documentInput = 'PP-DB-US-0005';
            controller.searchDocuments();
            system.assertEquals(controller.documentStatusBackGroundColor,PMBA_StaticConstants.PMBA_Yellow_Color);
            Test.stopTest();

     }
     
    /* static testmethod void testApplicationPageLoadSalesRep_8() {
            List<sObject> veevaCreds = Test.loadData(PMBA_Veeva_Vault_Credentials__c.sObjectType, 'PMBA_Veeva_Vault_Test_Credentials');
            Test.startTest();
            Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
            PageReference pageRef = Page.PMBA_AllApplicationsPage;
            System.Test.setCurrentPage(pageRef);
            PMBA_All_Application_Controller controller = new PMBA_All_Application_Controller();
            controller.documentInput = 'PP-DB-US-0006';
            controller.searchDocuments();
            system.assertEquals(controller.documentStatusBackGroundColor,PMBA_StaticConstants.PMBA_Yellow_Color);
            Test.stopTest();

     }*/
          static testmethod void testApplicationPageLoadSalesRep_14_3() {
            List<sObject> veevaCreds = Test.loadData(PMBA_Veeva_Vault_Credentials__c.sObjectType, 'PMBA_Veeva_Vault_Test_Credentials');
            Test.startTest();
            Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
            PageReference pageRef = Page.PMBA_AllApplicationsPage;
            System.Test.setCurrentPage(pageRef);
            PMBA_All_Application_Controller controller = new PMBA_All_Application_Controller();
            controller.documentInput = 'PCBDFR0080PROF';
            controller.searchDocuments();
            system.assertEquals(controller.documentStatusBackGroundColor,PMBA_StaticConstants.PMBA_Red_Color);
            Test.stopTest();

     }

     // static testmethod void testApplicationPageLoadSalesRep_14_1() {
     //       //throwCalloutException = true;
     //       List<sObject> veevaCreds = Test.loadData(PMBA_Veeva_Vault_Credentials__c.sObjectType, 'PMBA_Veeva_Vault_Test_Credentials');
     //       Test.startTest();
            
     //       Test.setMock(HttpCalloutMock.class, new MockHttpExceptionResponseGenerator());
     //       PageReference pageRef = Page.PMBA_AllApplicationsPage;
     //       System.Test.setCurrentPage(pageRef);
     //       PMBA_All_Application_Controller controller = new PMBA_All_Application_Controller();
     //       controller.documentInput = 'PC-BDFR-0080-PROF';
            
     //       controller.searchDocuments();
     //       system.assertEquals(controller.exceptionMessage,PMBA_StaticConstants.PMBA_VEEVA_RESPONSE_FAILURE_TRY_AGAIN);           
     //       Test.stopTest();
     //}
     // static testmethod void testApplicationPageLoadSalesRep_14_2() {
     //       //throwCalloutException = true;
     //       List<sObject> veevaCreds = Test.loadData(PMBA_Veeva_Vault_Credentials__c.sObjectType, 'PMBA_Veeva_Vault_Test_Credentials');
     //       Test.startTest();
            
     //       Test.setMock(HttpCalloutMock.class, new MockHttpExceptionResponseGenerator());
     //       PageReference pageRef = Page.PMBA_AllApplicationsPage;
     //       System.Test.setCurrentPage(pageRef);
     //       PMBA_All_Application_Controller controller = new PMBA_All_Application_Controller();
     //       controller.documentInput = 'PCBDFR0080PROF';
            
     //       controller.searchDocuments();
     //       system.assertEquals(controller.exceptionMessage,PMBA_StaticConstants.PMBA_VEEVA_RESPONSE_FAILURE_TRY_AGAIN);           
     //       Test.stopTest();
     //}
     
     static testmethod void testApplicationPageLoadSalesRep_9() {
            List<sObject> veevaCreds = Test.loadData(PMBA_Veeva_Vault_Credentials__c.sObjectType, 'PMBA_Veeva_Vault_Test_Credentials');
            Test.startTest();
            Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
            PageReference pageRef = Page.PMBA_AllApplicationsPage;
            System.Test.setCurrentPage(pageRef);
            PMBA_All_Application_Controller controller = new PMBA_All_Application_Controller();
            controller.documentInput = 'PP-DB-US-0007';
            controller.searchDocuments();
            system.assertEquals(controller.documentStatusBackGroundColor,PMBA_StaticConstants.PMBA_Red_Color);
            Test.stopTest();

     }
     
     static testmethod void testApplicationPageLoadSalesRep_8() {
            List<sObject> veevaCreds = Test.loadData(PMBA_Veeva_Vault_Credentials__c.sObjectType, 'PMBA_Veeva_Vault_Test_Credentials');
            Test.startTest();
            Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
            PageReference pageRef = Page.PMBA_AllApplicationsPage;
            System.Test.setCurrentPage(pageRef);
            PMBA_All_Application_Controller controller = new PMBA_All_Application_Controller();
            controller.documentInput = 'PP-DB-US-0006';
            controller.searchDocuments();
            system.assertEquals(controller.documentStatusBackGroundColor,PMBA_StaticConstants.PMBA_Red_Color);
            Test.stopTest();

     }
     
     static testmethod void testApplicationPageLoadSalesRep_10() {
            List<sObject> veevaCreds = Test.loadData(PMBA_Veeva_Vault_Credentials__c.sObjectType, 'PMBA_Veeva_Vault_Test_Credentials');
            Test.startTest();
            Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
            PageReference pageRef = Page.PMBA_AllApplicationsPage;
            System.Test.setCurrentPage(pageRef);
            PMBA_All_Application_Controller controller = new PMBA_All_Application_Controller();
            controller.documentInput = 'PP-DB-US-0008';
            controller.searchDocuments();
            system.assertEquals(controller.documentStatusBackGroundColor,PMBA_StaticConstants.PMBA_Red_Color);
            Test.stopTest();

     }
     
     static testmethod void testApplicationPageLoadSalesRep_10_1() {
            List<sObject> veevaCreds = Test.loadData(PMBA_Veeva_Vault_Credentials__c.sObjectType, 'PMBA_Veeva_Vault_Test_Credentials');
            Test.startTest();
            Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
            PageReference pageRef = Page.PMBA_AllApplicationsPage;
            System.Test.setCurrentPage(pageRef);
            PMBA_All_Application_Controller controller = new PMBA_All_Application_Controller();
            controller.documentInput = 'PPDBUS0009';
            controller.searchDocuments();
            system.assertEquals(controller.documentStatusBackGroundColor,PMBA_StaticConstants.PMBA_Red_Color);
            Test.stopTest();

     }
     static testmethod void testApplicationPageLoadSalesRep_10_2() {
            List<sObject> veevaCreds = Test.loadData(PMBA_Veeva_Vault_Credentials__c.sObjectType, 'PMBA_Veeva_Vault_Test_Credentials');
            Test.startTest();
            Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
            PageReference pageRef = Page.PMBA_AllApplicationsPage;
            System.Test.setCurrentPage(pageRef);
            PMBA_All_Application_Controller controller = new PMBA_All_Application_Controller();
            controller.documentInput = 'PPJARUS0009';
            controller.searchDocuments();
            system.assertEquals(controller.documentStatusBackGroundColor,PMBA_StaticConstants.PMBA_Red_Color);
            Test.stopTest();

     }
     static testmethod void testApplicationPageLoadSalesRep_10_3() {
            List<sObject> veevaCreds = Test.loadData(PMBA_Veeva_Vault_Credentials__c.sObjectType, 'PMBA_Veeva_Vault_Test_Credentials');
            Test.startTest();
            Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
            PageReference pageRef = Page.PMBA_AllApplicationsPage;
            System.Test.setCurrentPage(pageRef);
            PMBA_All_Application_Controller controller = new PMBA_All_Application_Controller();
            controller.documentInput = 'PPDBUS0008';
            controller.searchDocuments();
            system.assertEquals(controller.documentStatusBackGroundColor,PMBA_StaticConstants.PMBA_Red_Color);
            Test.stopTest();
     }
     

     
     static testmethod void testApplicationPageLoadSalesRep_11() {
            List<sObject> veevaCreds = Test.loadData(PMBA_Veeva_Vault_Credentials__c.sObjectType, 'PMBA_Veeva_Vault_Test_Credentials');
            Test.startTest();
            Test.setMock(HttpCalloutMock.class, new MockHttpExceptionResponseGenerator());
            PageReference pageRef = Page.PMBA_AllApplicationsPage;
            System.Test.setCurrentPage(pageRef);
            PMBA_All_Application_Controller controller = new PMBA_All_Application_Controller();
            controller.documentInput = 'PPDBUS0008P';
            controller.searchDocuments();
            //system.assertEquals(controller.documentStatusBackGroundColor,PMBA_StaticConstants.PMBA_Red_Color);
            system.assertEquals(controller.exceptionMessage,PMBA_StaticConstants.PMBA_VEEVA_RESPONSE_FAILURE_AUTH);
            Test.stopTest();
     }
     
     static testmethod void testApplicationPageLoadSalesRep_12() {
            //throwCalloutException = true;
            List<sObject> veevaCreds = Test.loadData(PMBA_Veeva_Vault_Credentials__c.sObjectType, 'PMBA_Veeva_Vault_Test_Credentials');
            Test.startTest();
            
            Test.setMock(HttpCalloutMock.class, new MockHttpExceptionResponseGenerator());
            PageReference pageRef = Page.PMBA_AllApplicationsPage;
            System.Test.setCurrentPage(pageRef);
            PMBA_All_Application_Controller controller = new PMBA_All_Application_Controller();
            controller.documentInput = 'PP-DB-USAD-0008';
            
            controller.searchDocuments();
            //system.assertEquals(controller.documentStatusBackGroundColor,PMBA_StaticConstants.PMBA_Red_Color);
            system.assertEquals(controller.exceptionMessage,PMBA_StaticConstants.PMBA_VEEVA_RESPONSE_FAILURE_AUTH);
            
            Test.stopTest();

     } 

       static testmethod void testApplicationPageLoadSalesRep_12_2() {
            List<sObject> veevaCreds = Test.loadData(PMBA_Veeva_Vault_Credentials__c.sObjectType, 'PMBA_Veeva_Vault_Test_Credentials');
            Test.startTest();
            Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
            PageReference pageRef = Page.PMBA_AllApplicationsPage;
            System.Test.setCurrentPage(pageRef);
            PMBA_All_Application_Controller controller = new PMBA_All_Application_Controller();
            controller.documentInput = 'PPDBUSAD0008';
            controller.searchDocuments();
            system.assertEquals(controller.documentStatusBackGroundColor,PMBA_StaticConstants.PMBA_Red_Color);
            Test.stopTest();

     }
    static testmethod void testApplicationPageLoadSalesRep_13_1() {
            throwCalloutException = true;
            List<sObject> veevaCreds = Test.loadData(PMBA_Veeva_Vault_Credentials__c.sObjectType, 'PMBA_Veeva_Vault_Test_Credentials');
            Test.startTest();
            Test.setMock(HttpCalloutMock.class, new MockHttpExceptionResponseGenerator());
            PageReference pageRef = Page.PMBA_AllApplicationsPage;
            System.Test.setCurrentPage(pageRef);
            PMBA_All_Application_Controller controller = new PMBA_All_Application_Controller();
            controller.documentInput = 'AA-123-HUYT-OI98';         
            controller.searchDocuments();
            system.assertEquals(controller.exceptionMessage,PMBA_StaticConstants.PMBA_VEEVA_RESPONSE_FAILURE_TRY_AGAIN);
            Test.stopTest();
     }
     static testmethod void testApplicationPageLoadSalesRep_13_2() {
            throwCalloutException = true;
            List<sObject> veevaCreds = Test.loadData(PMBA_Veeva_Vault_Credentials__c.sObjectType, 'PMBA_Veeva_Vault_Test_Credentials');
            Test.startTest();
            Test.setMock(HttpCalloutMock.class, new MockHttpExceptionResponseGenerator());
            PageReference pageRef = Page.PMBA_AllApplicationsPage;
            System.Test.setCurrentPage(pageRef);
            PMBA_All_Application_Controller controller = new PMBA_All_Application_Controller();
            controller.documentInput = 'AA123HUYTOI98';
            
            controller.searchDocuments();
            system.assertEquals(controller.exceptionMessage,PMBA_StaticConstants.PMBA_VEEVA_RESPONSE_FAILURE_TRY_AGAIN);
            
            Test.stopTest();

     }
     //static testmethod void testApplicationPageLoadSalesRep_13_3() {
     //       throwCalloutException = true;
     //       List<sObject> veevaCreds = Test.loadData(PMBA_Veeva_Vault_Credentials__c.sObjectType, 'PMBA_Veeva_Vault_Test_Credentials');
     //       Test.startTest();
            
     //       Test.setMock(HttpCalloutMock.class, new MockHttpExceptionResponseGenerator());
     //       PageReference pageRef = Page.PMBA_AllApplicationsPage;
     //       System.Test.setCurrentPage(pageRef);
     //       PMBA_All_Application_Controller controller = new PMBA_All_Application_Controller();
     //       controller.documentInput = 'MKABC1234ABCD';
            
     //       controller.searchDocuments();
     //       system.assertEquals(controller.exceptionMessage,PMBA_StaticConstants.PMBA_VEEVA_RESPONSE_FAILURE_TRY_AGAIN);
            
     //       Test.stopTest();

     //}

     //static testmethod void testApplicationPageLoadSalesRep_13_4() {
     //       throwCalloutException = true;
     //       List<sObject> veevaCreds = Test.loadData(PMBA_Veeva_Vault_Credentials__c.sObjectType, 'PMBA_Veeva_Vault_Test_Credentials');
     //       Test.startTest();
     //       Test.setMock(HttpCalloutMock.class, new MockHttpExceptionResponseGenerator());
     //       PageReference pageRef = Page.PMBA_AllApplicationsPage;
     //       System.Test.setCurrentPage(pageRef);
     //       PMBA_All_Application_Controller controller = new PMBA_All_Application_Controller();
     //       controller.documentInput = 'MKABC1234ABCD';         
     //       controller.searchDocuments();
     //       system.assertEquals(controller.exceptionMessage,PMBA_StaticConstants.PMBA_VEEVA_RESPONSE_FAILURE_TRY_AGAIN);
     //       Test.stopTest();
     //}
     static testmethod void testApplicationPageLoadSalesRep_13_5() {
            List<sObject> veevaCreds = Test.loadData(PMBA_Veeva_Vault_Credentials__c.sObjectType, 'PMBA_Veeva_Vault_Test_Credentials');
            Test.startTest();
            Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
            PageReference pageRef = Page.PMBA_AllApplicationsPage;
            System.Test.setCurrentPage(pageRef);
            PMBA_All_Application_Controller controller = new PMBA_All_Application_Controller();
            controller.documentInput = 'MKABC1234ABCD';
            controller.searchDocuments();
            system.assertEquals(controller.documentStatusBackGroundColor,PMBA_StaticConstants.PMBA_Red_Color);
            Test.stopTest();

     } 
}