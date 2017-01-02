/* Class Name   : PMBA_BarCodeScan_Handler_Controller
 * Description  : Controller for PMBA_BarCodeScan_Handler page
 *
 * Created By   : Avijeet Singh
 * Created On   : 13/10/2015

 * Modification Log: 
 * --------------------------------------------------------------------------------------------------------------------------------------
 * Developer                Date                   Modification ID      Description
 * ---------------------------------------------------------------------------------------------------------------------------------------
 * 
*/
public with sharing class PMBA_BarCodeScan_Handler_Controller{
    
    /* Method Name : redirectToPMBAAppPage
    *  Description : Read the pic2shop parameter and redirect to PMBA_AllApplicationsPage with the same parameter
    *  Parameters  : 
    *  Return type : PageReference
    */
    public PageReference redirectToPMBAAppPage() {
        //save to usage details object
        PMBA_VeevaWebServiceUtility.saveUsageObjDetails(PMBA_StaticConstants.PMBA_BARCODE_SCANNING);
        if (ApexPages.currentPage().getParameters().get(System.Label.PMBA_Scan_Parameter)!=null)    {
            PageReference pf = Page.PMBA_AllApplicationsPage;
            pf.getParameters().put('scannedcode',ApexPages.currentPage().getParameters().get(System.Label.PMBA_Scan_Parameter));
            pf.setRedirect(true);
            return pf;
        }
        else    {
            return null;
        }
    }

}