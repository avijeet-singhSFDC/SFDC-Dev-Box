/* Class Name   : PMBA_Active_List_Print_Controller 
 * Description  : This is the controller for the PMBA_Active_List_Page
 *
 * Created By   : Avijeet Singh
 * Created On   : 13/10/2015

 * Modification Log: 
 * --------------------------------------------------------------------------------------------------------------------------------------
 * Developer                Date                   Modification ID      Description
 * ---------------------------------------------------------------------------------------------------------------------------------------
 * 
*/
public with sharing class PMBA_Active_List_Print_Controller {
    
    public String exceptionMessage {get;set;}    
    public List<SelectOption> userGroupList {get;set;}
    public List<SelectOption> productList {get;set;}
    public String selectedUserGroup {get;set;}
    
    /* Method Name : initialisePrintActiveListPage
    *  Description : Method used to search documents
    *  Parameters  : 
    *  Return type : void
    */
    public void initialisePrintActiveListPage() {
        if (ApexPages.currentPage().getParameters().get('selectedProduct')!=null)    {
            selectedProductList = String.escapeSingleQuotes(ApexPages.currentPage().getParameters().get('selectedProduct')).replace(' ','+');
        }
        else    {
            selectedProductList = PMBA_StaticConstants.PMBA_NONE_SELECTOPTION;
        }
        if (ApexPages.currentPage().getParameters().get('selectedUserGroup')!=null)    {
            selectedUserGroup = String.escapeSingleQuotes(ApexPages.currentPage().getParameters().get('selectedUserGroup'));
        }
        else    {
            selectedUserGroup = PMBA_StaticConstants.PMBA_NONE_SELECTOPTION;
        } 
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
                system.debug('------'+activeProducts);
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
            PMBA_ErrorHandler.createApplicationException('PMBA_Active_List_Print_Controller', 'initialisePrintActiveListPage',
            e.getStackTraceString(), e.getTypeName());
        }
        catch  (PMBA_VeevaWebServiceUtility.VeevaConnectionException e)  {
            exceptionMessage = e.getMessage();
            activeproducts = new List<ActiveProduct>();
            PMBA_ErrorHandler.createApplicationException('PMBA_Active_List_Print_Controller', 'initialisePrintActiveListPage',
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

    
    /* Method Name : PMBA_Active_List_Controller 
    *  Description : Default Constructor
    *  Parameters  : 
    *  Return type : 
    */
    public PMBA_Active_List_Print_Controller ()    {
        activeproducts = new List<ActiveProduct>();  
        
        if(selectedUserGroup==null)    {
            selectedUserGroup=PMBA_StaticConstants.PMBA_Default_User_Group;           
        }
        system.debug('-----on constructor load'+activeProducts!=null);
    }
    
}