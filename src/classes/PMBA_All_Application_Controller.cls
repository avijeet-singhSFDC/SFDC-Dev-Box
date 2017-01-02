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
public with sharing class PMBA_All_Application_Controller {
    public String exceptionMessage {get;set;}    
    public String documentInput {get;set;}
    public String documentName {get;set;}
    public String documentExpires {get;set;}
    public String documentStatus {get;set;}
    public String documentStatus2 {get;set;}
    public String retirementDateSubText {get;set;}
    public String documentStatusBackGroundColor {get;set;}
    public String scannedBarCode {get;set;}
    public Document helpDocument {get;set;}
    public String helpDocumentUrl {get;set;}
    public static String[] temp_date_split;
    public static integer i;
    
    public Boolean isPMBAUsageDetailsTabLinkVisible {get;set;}
    
    /* Method Name : PMBA_All_Application_Controller
    *  Description : Constructor
    *  Parameters  : 
    *  Return type : void
    */
    public PMBA_All_Application_Controller() {
        isPMBAUsageDetailsTabLinkVisible = false;
        
        List<PermissionSetAssignment> permissionSetAssignments = [SELECT PermissionSet.Name FROM PermissionSetAssignment WHERE AssigneeId = :UserInfo.getUserId()];
        if (permissionSetAssignments !=null)    {
            for (PermissionSetAssignment ps : permissionSetAssignments)    {
                if (ps.PermissionSet.Name == 'PMBA_System_Owner')    {
                    isPMBAUsageDetailsTabLinkVisible = true;
                }
            }
        }
    
        try    {
            helpdocument = [SELECT Id FROM Document WHERE DeveloperName =: System.Label.PMBA_Application_Help_PDF];
            if(helpdocument!=null)    {
                helpdocumentUrl = System.URL.getSalesforceBaseUrl().toExternalForm()+'/servlet/servlet.FileDownload?file='+helpdocument.Id;
                //helpdocumentUrl = 'http://lillynetcollaboration.global.lilly.com/sites/iLibrary/PublishedContent/Help%20Deck%20Status%20App_v1.pdf';
            }
        }
        catch(Exception ex)    {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Error: Help Document Not Found'));
        }
        exceptionMessage = '';
        scannedBarCode = ApexPages.currentPage().getParameters().get('scannedcode');
        try{            
            if (scannedBarCode != null)    {
                documentInput = String.escapeSingleQuotes(scannedBarCode);
                searchDocuments();
            }
        }        
        catch(Exception ex)    {
            PMBA_ErrorHandler.createApplicationException('PMBA_All_Application_Controller', 'classConstructor',
            ex.getStackTraceString(), ex.getTypeName());
        }
    }
    
     /* Method Name : searchDocuments
    *  Description : Method used to search documents
    *  Parameters  : 
    *  Return type : void
    */
    public PageReference activeList() {
        PageReference pr = new PageReference('/apex/PMBA_Active_List_Page');
        pr.setRedirect(true);
        return pr;
    }
    
    /* Method Name : searchDocuments
    *  Description : Method used to search documents
    *  Parameters  : 
    *  Return type : void
    */
    public void searchDocuments() {
        documentStatusBackGroundColor = '';
        retirementDateSubText = '';
        documentStatus = '';
        documentStatus2 = '';
        documentName = '';
        documentExpires = '';
        try {            
            PMBA_DocumentQueryResponse pmba_DocumentQueryResponse = PMBA_VeevaWebServiceUtility.fetchDocumentsWithCriteria(PMBA_VeevaWebServiceUtility.getSessionIdUsingExplicitAuth(),String.escapeSingleQuotes(documentInput),null,null);
            if (pmba_DocumentQueryResponse.responseStatus == PMBA_StaticConstants.PMBA_VAULT_SUCCESS_RESPONSE)    {
                if (pmba_DocumentQueryResponse.data.size() == PMBA_StaticConstants.PMBA_INTEGER_VALUE_ZERO)    {
                    documentStatusBackGroundColor = PMBA_StaticConstants.PMBA_Red_Color;
                    documentStatus = PMBA_StaticConstants.PMBA_Item_Not_Found;
                    documentStatus2 = PMBA_StaticConstants.PMBA_Please_Check_ReEnter_DocID_ReScan_BarCode;
                }
                system.debug('pmba_DocumentQueryResponse.data.size()---'+pmba_DocumentQueryResponse.data.size());
                if (pmba_DocumentQueryResponse.data.size() == PMBA_StaticConstants.PMBA_INTEGER_VALUE_ONE)    {
                    //GREEN : Approved for Distribution date not empty; not expired/retired; expiry date > today + 15days
                    if(pmba_DocumentQueryResponse.data[0].approved_for_distribution_date != null && pmba_DocumentQueryResponse.data[0].status != PMBA_StaticConstants.PMBA_Document_Retired && pmba_DocumentQueryResponse.data[0].status != PMBA_StaticConstants.PMBA_Document_Expired && Date.valueOf(pmba_DocumentQueryResponse.data[0].expiration_date) > Date.today() + 15){
                        documentStatusBackGroundColor = PMBA_StaticConstants.PMBA_Green_Color;
                        documentStatus = PMBA_StaticConstants.PMBA_Document_Approved_For_Distribution;
                        documentName = pmba_DocumentQueryResponse.data[0].name;
                    }
                    //YELLOW : Approved for Distribution date not empty; not expired/retired; expiry date >= today & <= today + 15 days
                    else if(pmba_DocumentQueryResponse.data[0].approved_for_distribution_date != null && pmba_DocumentQueryResponse.data[0].status != PMBA_StaticConstants.PMBA_Document_Retired && pmba_DocumentQueryResponse.data[0].status != PMBA_StaticConstants.PMBA_Document_Expired && Date.valueOf(pmba_DocumentQueryResponse.data[0].expiration_date) >= Date.today() && Date.valueOf(pmba_DocumentQueryResponse.data[0].expiration_date) <= Date.today() + 15){
                        documentStatusBackGroundColor = PMBA_StaticConstants.PMBA_Yellow_Color;
                        documentStatus = PMBA_StaticConstants.PMBA_Document_Approved_For_Distribution;
                        documentName = pmba_DocumentQueryResponse.data[0].name;
                        
                        //Added below code to display expiry date in 'DD-MM-YYYY' format
                        temp_date_split = pmba_DocumentQueryResponse.data[0].expiration_date.split('-');                        
                        documentExpires = 'Expires: ' + temp_date_split.get(1) + '-' + temp_date_split.get(2) + '-' + temp_date_split.get(0);
                    }
                    //RED : Approved for Distribution date not empty; expired/retired
                    else if(pmba_DocumentQueryResponse.data[0].approved_for_distribution_date != null && (pmba_DocumentQueryResponse.data[0].status == PMBA_StaticConstants.PMBA_Document_Retired || pmba_DocumentQueryResponse.data[0].status == PMBA_StaticConstants.PMBA_Document_Expired)){
                        documentStatusBackGroundColor = PMBA_StaticConstants.PMBA_Red_Color;
                        documentStatus = PMBA_StaticConstants.PMBA_Document_Not_Approved_For_Distribution;
                        documentName = pmba_DocumentQueryResponse.data[0].name;
                    }
                    //RED : Approved for Distribution date empty; 
                    else if(pmba_DocumentQueryResponse.data[0].approved_for_distribution_date == null || pmba_DocumentQueryResponse.data[0].approved_for_distribution_date == ''){
                        documentStatusBackGroundColor = PMBA_StaticConstants.PMBA_Red_Color;
                        documentStatus = PMBA_StaticConstants.PMBA_Item_Not_Found;
                        documentStatus2 = PMBA_StaticConstants.PMBA_Please_Check_ReEnter_DocID_ReScan_BarCode;
                    }   
                }
            }
            //RED : If veeva vault response is a failure, i.e. PMBA_VEEVA_RESPONSE_FAILURE
            else{
                documentStatusBackGroundColor = PMBA_StaticConstants.PMBA_Red_Color;
                documentStatus = PMBA_StaticConstants.PMBA_Item_Not_Found;
                documentStatus2 = PMBA_StaticConstants.PMBA_Please_Check_ReEnter_DocID_ReScan_BarCode;
            }
            //save to usage details object
            if (scannedBarCode == null || scannedBarCode == '')    {
                PMBA_VeevaWebServiceUtility.saveUsageObjDetails(PMBA_StaticConstants.PMBA_TYPE_IN_DOCID_SEARCH);
            }
        }        
        catch   (PMBA_VeevaWebServiceUtility.VeevaAuthenticationException e)    {
            exceptionMessage = e.getMessage();
        }
        catch   (PMBA_VeevaWebServiceUtility.VeevaConnectionException e)    {
            exceptionMessage = e.getMessage();
        }
    }

}