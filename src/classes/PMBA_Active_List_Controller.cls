/* Class Name   : PMBA_Active_List_Controller 
 * Description  : This is the controller for the PMBA_Active_List_Page
 *
 * Created By   : Avijeet Singh
 * Created On   : 13/10/2015

 * Modification Log: 
 * --------------------------------------------------------------------------------------------------------------------------------------
 * Developer                Date                   Modification ID      Description
 Ganesh Muralidharan        13-Sep-2016             1.0                 Changes for format of document no
 * ---------------------------------------------------------------------------------------------------------------------------------------
 * 
*/
public with sharing class PMBA_Active_List_Controller {
    
    public String exceptionMessage {get;set;}    
    public List<SelectOption> userGroupList {get;set;}
    public List<SelectOption> productList {get;set;}
    public String selectedUserGroup {get;set;}
    
    /* Method Name : initialisePage
    *  Description : Method used to initialize page with product list and approved user group
    *  Parameters  : 
    *  Return type :
    */
    public void initialisePage()    {
        try    {            
            userGroupList = PMBA_VeevaWebServiceUtility.getApprovedUserGroupsFromVeeva(PMBA_VeevaWebServiceUtility.getSessionIdUsingExplicitAuth());            
           /* changing as per US-43001*/
           //productList = PMBA_VeevaWebServiceUtility.getAllProductsFromVeeva(PMBA_VeevaWebServiceUtility.getSessionIdUsingExplicitAuth());
            productList = PMBA_VeevaWebServiceUtility.fetchPromotionalMaterials();
            if (!Test.isRunningTest())    {
                PMBA_VeevaWebServiceUtility.saveUsageObjDetails(PMBA_StaticConstants.PMBA_ACTIVE_LIST);
            }
            
        }
        catch  (PMBA_VeevaWebServiceUtility.VeevaAuthenticationException e)  {
            exceptionMessage = e.getMessage();
            activeproducts = new List<ActiveProduct>();
            PMBA_ErrorHandler.createApplicationException('PMBA_Active_List_Controller', 'initialisePage',
            e.getStackTraceString(), e.getTypeName());
        }
        catch  (PMBA_VeevaWebServiceUtility.VeevaConnectionException e)  {
            exceptionMessage = e.getMessage();
            activeproducts = new List<ActiveProduct>();
            PMBA_ErrorHandler.createApplicationException('PMBA_Active_List_Controller', 'initialisePage',
            e.getStackTraceString(), e.getTypeName());
        }
    }
    
    
    
   /* Method Name : searchDocuments
    *  Description : Method used to search documents
    *  Parameters  : 
    *  Return type : void
    */
    public void searchDocuments() {
        try {
            //blank call to populate approved usergroupMap
            PMBA_VeevaWebServiceUtility.getApprovedUserGroupsFromVeeva(PMBA_VeevaWebServiceUtility.getSessionIdUsingExplicitAuth());
            if (((selectedProductList != null)&&(selectedProductList != PMBA_StaticConstants.PMBA_NONE_SELECTOPTION))&&((selectedUserGroup != null)&&(selectedUserGroup != PMBA_StaticConstants.PMBA_NONE_SELECTOPTION)))    {
                activeproducts = new List<ActiveProduct>();
                documentQueryResponse = new PMBA_DocumentQueryResponse();  
                documentQueryResponse = PMBA_VeevaWebServiceUtility.fetchDocumentsWithCriteria(PMBA_VeevaWebServiceUtility.getSessionIdUsingExplicitAuth(),null,selectedProductList,PMBA_VeevaWebServiceUtility.userGroupPicklistMap.get(selectedUserGroup));
                for (PMBA_DocumentQueryResponse.Data_Z data : documentQueryResponse.data)    {
                    activeproducts.add(new ActiveProduct(data));
                }
                system.debug('--on search-----'+activeProducts);
                return;
            }            
            else{
                activeproducts = new List<ActiveProduct>();
                return;
            }
        }
        catch  (PMBA_VeevaWebServiceUtility.VeevaAuthenticationException e)  {
            exceptionMessage = e.getMessage();
            activeproducts = new List<ActiveProduct>();
            PMBA_ErrorHandler.createApplicationException('PMBA_Active_List_Controller', 'searchDocuments',
            e.getStackTraceString(), e.getTypeName());
        }
        catch  (PMBA_VeevaWebServiceUtility.VeevaConnectionException e)  {
            exceptionMessage = e.getMessage();
            activeproducts = new List<ActiveProduct>();
            PMBA_ErrorHandler.createApplicationException('PMBA_Active_List_Controller', 'searchDocuments',
            e.getStackTraceString(), e.getTypeName());
        }
    }
    
    public String selectedProductList { get; set; }
    public List<ActiveProduct> activeproducts {get;set;}
    public transient PMBA_DocumentQueryResponse documentQueryResponse ;
    
    public class ActiveProduct{
        public String documentName {get;set;}
        public String documentNumber {get;set;}
        public String documentStatus {get;set;}
        public String product {get;set;}
        public String audience {get;set;}
        public String approvedUserGroup {get;set;}
        public String trackableItem {get;set;}
        public String approximateRetailValue {get;set;}
        public String costPerUnit {get;set;}
        public String legacyIdentifier {get;set;}  
        
        
        /* Method Name : ActiveProduct
        *  Description : Parameterized Constructor
        *  Parameters  : PMBA_DocumentQueryResponse.Data_Z
        *  Return type : 
        */
        public ActiveProduct(PMBA_DocumentQueryResponse.Data_Z data)    {
            if (data.name != null)    {
                this.documentName = data.name;
            }
            else    {
                this.documentName = '';
            }
            
            if (data.document_number != null)    {
                this.documentNumber = data.document_number;
            }
            else    {
                this.documentNumber = '';
            }
            
            if (data.status != null)    {
                this.documentStatus = data.status;
            }
            else    {
                this.documentStatus = '';
            }
            
            
            if (data.document_product.data!=null)    {
                this.product = '';
                for (PMBA_DocumentQueryResponse.Data dataObject: data.document_product.data)    {
                    this.product += dataObject.Name + ' | ';
                }
                this.product = this.product.substringBeforeLast(' | ');
            }
            else    {
                this.product = '';
            }
            
            if (data.audience != null)    {
                this.audience = '';
                for (String str: data.audience)    {
                    this.audience += str + ' | ';
                }
                this.audience = this.audience.substringBeforeLast(' | ');
            }
            else    {
                this.audience = '';
            }
            
            if (data.approved_user_group != null)    {
                this.approvedUserGroup = '';
                for (String str: data.approved_user_group)    {
                    this.approvedUserGroup += str + ' | ';
                }
                this.approvedUserGroup = this.approvedUserGroup.substringBeforeLast(' | ');
            }
            else    {
                this.approvedUserGroup = '';
            }
            
            if (data.trackable_Item != null)    {
                if (data.trackable_Item)    {
                    this.trackableItem = 'Yes';
                }
                else{
                    this.trackableItem = 'No';
                }
            }
            else    {
                this.trackableItem = '';
            }
            
            if (data.approximate_retail_value != null)    {
                this.approximateRetailValue = String.valueOf(data.approximate_retail_value);
            }
            else    {
                this.approximateRetailValue = '';
            }
            
            if (data.cost_per_unit != null)    {
                this.costPerUnit = String.valueOf(data.cost_per_unit);
            }
            else    {
                this.costPerUnit = '';
            }
            
            if (data.legacy_identifier != null)    {
                this.legacyIdentifier = data.legacy_identifier;
            }
            else    {
                this.legacyIdentifier = '';
            }
        }
    }
    
    /* Method Name : backToHome 
    *  Description : method to redirect to home page
    *  Parameters  : 
    *  Return type : 
    */
    public PageReference backToHome(){
        PageReference pr = new PageReference('/apex/PMBA_AllApplicationsPage');
        pr.setRedirect(true);
        return pr;
    }

     /* Method Name : view
    *  Description : method to redirect to home page
    *  Parameters  : 
    *  Return type : 
    */
    public PageReference view(){
        PageReference pr = new PageReference('/apex/PMBA_Active_List_Print?selectedProduct={!JSENCODE(selectedProductList)}&selectedUserGroup={!JSENCODE(selectedUserGroup)}');
        pr.setRedirect(true);
        return null;
    }
    
    /* Method Name : generateAndEmailActiveListPDFDoc 
    *  Description : method to generate activelistpdfdoc
    *  Parameters  : 
    *  Return type : 
    */
    public void generateAndEmailActiveListPDFDoc()    {
        PageReference pdfPage = Page.PMBA_Active_List_Print;   
        pdfPage.getParameters().put('selectedProduct',selectedProductList);
        pdfPage.getParameters().put('selectedUserGroup',selectedUserGroup);
        Blob pdfBlob = Test.isRunningTest() ? Blob.valueOf('UNIT.TEST') : pdfPage.getContent();        
        
        String selectedProductListName = '';
        String selectedUserGroupName = '';
        for (SelectOption selectOption : userGroupList )    {
            if (selectOption.getvalue() == selectedUserGroup)    {
                selectedUserGroupName = selectOption.getLabel();
                break;
            }
        }
        
        for (SelectOption selectOption : productList )    {
            if (selectOption.getvalue() == selectedProductList)    {
                selectedProductListName = selectOption.getLabel();
                break;
            }
        }
        
        // Create the email attachment
        Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
        efa.setFileName('ActiveProductList ##'+selectedProductListName+'--'+selectedUserGroupName+' ## '+System.now()+'.pdf');
        efa.setBody(pdfBlob);
        
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        // Sets the paramaters of the email
        String subject = 'ActiveProductList ##'+selectedProductListName+'--'+selectedUserGroupName+' ## '+System.now();
        String htmlbody = 'Hi '+UserInfo.getName()+',<br/><br/>Please find attached the Active Product List Pdf<br/><br/>Thanks';
        email.setSubject(subject);
        email.setTargetObjectId(UserInfo.getUserId());
        email.setHtmlBody(htmlbody);
        email.saveAsActivity=false;
        email.setFileAttachments(new Messaging.EmailFileAttachment[] {efa});
        // Sends the email
        Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
    }
    
    /* Method Name : PMBA_Active_List_Controller 
    *  Description : Default Constructor
    *  Parameters  : 
    *  Return type : 
    */
    public PMBA_Active_List_Controller ()    {
        activeproducts = new List<ActiveProduct>();  
        selectedProductList = ApexPages.currentPage().getParameters().get('selectedProduct')!=null?ApexPages.currentPage().getParameters().get('selectedProduct').replace(' ','+'):null;
        System.debug('selectedProductList'+selectedProductList);
        selectedUserGroup = ApexPages.currentPage().getParameters().get('selectedUserGroup');
        System.debug('selectedUserGroup'+selectedUserGroup);
        if(selectedUserGroup==null){
            selectedUserGroup=PMBA_StaticConstants.PMBA_Default_User_Group;           
        }
        //system.debug('-----on constructor load'+activeProducts!=null);
        searchDocuments();
        system.debug('-----on constructor load'+activeProducts!=null);
    }
    
}