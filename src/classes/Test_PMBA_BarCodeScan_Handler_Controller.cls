/* Class Name   : Test_PMBA_BarCodeScan_Handler_Controller
 * Description  : Test class for PMBA_BarCodeScan_Handler_Controller
 *
 * Created By   : Madhuri Nittala
 * Created On   : 19/10/2015

 * Modification Log: 
 * --------------------------------------------------------------------------------------------------------------------------------------
 * Developer                Date                   Modification ID      Description
 * ---------------------------------------------------------------------------------------------------------------------------------------
 * 
*/
@isTest
public class Test_PMBA_BarCodeScan_Handler_Controller {     
    
    static testmethod void testRedirectToPMBAAppPagePositiveSalesRep() {
        System.runAs(PMBA_DataFactory.createUser('PMBA_Sales_Rep'))    {
            PMBA_DataFactory.createVeevaVaultCredentials();
            Test.startTest();
            PageReference pageRef = Page.PMBA_BarCodeScan_Handler;
            System.Test.setCurrentPage(pageRef);
            ApexPages.currentPage().getParameters().put(System.Label.PMBA_Scan_Parameter,'test');
            PMBA_BarCodeScan_Handler_Controller barcodescan= new PMBA_BarCodeScan_Handler_Controller();
            PageReference pageRef1 = Page.PMBA_AllApplicationsPage;
            pageRef1.getParameters().put('scannedcode','test');
            System.assertEquals(barcodescan.redirectToPMBAAppPage().getUrl(),pageRef1.getUrl());
            Test.stopTest();
        }
    }
    
    static testmethod void testRedirectToPMBAAppPagePositiveSystemOwner() {
        System.runAs(PMBA_DataFactory.createUser('PMBA_System_Owner'))    {
            PMBA_DataFactory.createVeevaVaultCredentials();
            Test.startTest();
            PageReference pageRef = Page.PMBA_BarCodeScan_Handler;
            System.Test.setCurrentPage(pageRef);
            ApexPages.currentPage().getParameters().put(System.Label.PMBA_Scan_Parameter,'test');
            PMBA_BarCodeScan_Handler_Controller barcodescan= new PMBA_BarCodeScan_Handler_Controller();
            PageReference pageRef1 = Page.PMBA_AllApplicationsPage;
            pageRef1.getParameters().put('scannedcode','test');
            System.assertEquals(barcodescan.redirectToPMBAAppPage().getUrl(),pageRef1.getUrl());
            Test.stopTest();
        }
    }
    
    static testmethod void testRedirectToPMBAAppPageNegativeSalesRep() {
        System.runAs(PMBA_DataFactory.createUser('PMBA_Sales_Rep'))    {
            PMBA_DataFactory.createVeevaVaultCredentials();
            Test.startTest();
            PageReference pageRef = Page.PMBA_BarCodeScan_Handler;
            System.Test.setCurrentPage(pageRef);
            PMBA_BarCodeScan_Handler_Controller barcodescan= new PMBA_BarCodeScan_Handler_Controller();
            System.assertEquals(barcodescan.redirectToPMBAAppPage(),null);
            Test.stopTest();
        }
    }
    
    static testmethod void testRedirectToPMBAAppPageNegativeSystemOwner() {
        System.runAs(PMBA_DataFactory.createUser('PMBA_System_Owner'))    {
            PMBA_DataFactory.createVeevaVaultCredentials();
            Test.startTest();
            PageReference pageRef = Page.PMBA_BarCodeScan_Handler;
            System.Test.setCurrentPage(pageRef);
            PMBA_BarCodeScan_Handler_Controller barcodescan= new PMBA_BarCodeScan_Handler_Controller();
            System.assertEquals(barcodescan.redirectToPMBAAppPage(),null);
            Test.stopTest();
        }
    }
 }