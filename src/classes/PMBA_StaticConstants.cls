/* Class Name   : PMBA_StaticConstants 
 * Description  : Static Constants 
 *
 * Created By   : Arpitha Sudhakar
 * Created On   : 28/09/2015

 * Modification Log:
 * --------------------------------------------------------------------------------------------------------------------------------------
 * Developer                Date                   Modification ID      Description
 * ---------------------------------------------------------------------------------------------------------------------------------------
 * 
*/
public without sharing class PMBA_StaticConstants {
    
    public static PMBA_Veeva_Vault_Credentials__c veevaVaultCredentials;
    static{
        /*if (Test.isRunningTest())    {
            veevaVaultCredentials = [SELECT Veeva_Vault_Domain_URL__c, Veeva_Vault_Username__c,Veeva_Vault_Password__c FROM PMBA_Veeva_Vault_Credentials__c LIMIT 1];
        }
        else{
            veevaVaultCredentials = PMBA_Veeva_Vault_Credentials__c.getValues(System.Label.PMBA_Veeva_Vault_Credential_Name);
        }*/
        veevaVaultCredentials = Test.isRunningTest() ? [SELECT Veeva_Vault_Domain_URL__c, Veeva_Vault_Username__c,Veeva_Vault_Password__c FROM PMBA_Veeva_Vault_Credentials__c LIMIT 1] : PMBA_Veeva_Vault_Credentials__c.getValues(System.Label.PMBA_Veeva_Vault_Credential_Name);     
    }
    
    public static final String PMBA_VAULT_DOMAIN_URL = veevaVaultCredentials.Veeva_Vault_Domain_URL__c;
    public static final String PMBA_VAULT_EXPLICIT_AUTH = '/api/auth?username='+veevaVaultCredentials.Veeva_Vault_Username__c+'&password='+veevaVaultCredentials.Veeva_Vault_Password__c;
    public static final String PMBA_VAULT_API_VERSION_12 = '/api/v12.0';    
    public static final String PMBA_VAULT_AUTHORIZATION = 'Authorization';
    public static final String PMBA_VAULT_ACCEPT = 'Accept';
    public static final String PMBA_VAULT_APPLICATION_JSON_RESPONSE = 'application/json';
    public static final String PMBA_HTTP_POST = 'POST';
    public static final String PMBA_HTTP_GET = 'GET';
    public static final String PMBA_NONE_SELECTOPTION = '--None--';
    public static final String PMBA_VAULT_X_AUTH_HOST = 'X-Auth-Host';
    public static final String PMBA_VAULT_X_AUTH_PROVIDER = 'X-Auth-Provider';
    public static final String PMBA_SFDC = 'sfdc';
    
    public static final String PMBA_VAULT_QUERY_ALL_DOCS                 = '/query?q=SELECT+LATESTVERSION+id,name__v,status__v,type__v,document_number__v,(SELECT+name__v+FROM+document_product__vr),(SELECT+name__v+FROM+document_country__vr),audience__vs,approved_user_group__c,trackable_item__c,approximate_retail_value__c,cost_per_unit__c,legacy_identifier__c,country__v,expiration_date__vs,approved_for_distribution_date__vs,retirement_date__c+FROM+ALLVERSIONS+documents';
    public static final String PMBA_VAULT_QUERY_DOCS_WITH_DOCID          = '/query?q=SELECT+LATESTVERSION+id,name__v,status__v,type__v,document_number__v,(SELECT+name__v+FROM+document_product__vr),(SELECT+name__v+FROM+document_country__vr),audience__vs,approved_user_group__c,trackable_item__c,approximate_retail_value__c,cost_per_unit__c,legacy_identifier__c,country__v,expiration_date__vs,approved_for_distribution_date__vs,retirement_date__c+FROM+ALLVERSIONS+documents+WHERE+document_number__v=';
    public static final String PMBA_VAULT_QUERY_ALL_PRODUCTS   = '/query?q=SELECT+id,name__v+FROM+product__v';
    public static final String PMBA_VAULT_QUERY_ALL_APPROVED_USER_GROUPS = '/objects/picklists/approved_user_group__c';
    public static final String PMBA_VAULT_SUCCESS_RESPONSE = 'SUCCESS';
    public static final String PMBA_VAULT_FAILURE_RESPONSE = 'FAILURE';

    /* Constants for Exception Handling */
    public static final String PMBA_CONSTANT_SOURCE_SYSTEM = 'PMBA-SALESFORCE';
    public static final String PMBA_CONSTANT_INBOUND_INTEGRATION_TYPE = 'INBOUND';
    public static final String PMBA_CONSTANT_OUTBOUND_INTEGRATION_TYPE = 'OUTBOUND';
   
    /* Constants for quering veeva vault documents */
    public static final String PMBA_Veeva_Document_Dash = '-';
    public static final Integer PMBA_Position_At_Nine = 9;
    public static final Integer PMBA_String_Position_At_Zero = 0;
    public static final Integer PMBA_String_Position_At_Two = 2;
    public static final Integer PMBA_String_Position_At_Four = 4;
    public static final Integer PMBA_String_Position_At_Five = 5; 
    public static final Integer PMBA_String_Position_At_Seven = 7;
    public static final Integer PMBA_String_Position_At_Eight = 8;
    public static final Integer PMBA_String_Position_At_Six = 6;
    public static final Integer PMBA_String_Position_At_Ten = 10;
    public static final Integer PMBA_String_Position_At_Twelve = 12;
    public static final String PMBA_Veeva_Approved_for_Distribution = 'Approved+for+Distribution';
    public static final String PMBA_Veeva_Approved_for_Production = 'Approved+for+Production';
    public static final String PMBA_Veeva_In_Periodic_Review = 'In+Periodic+Review';
    public static final String PMBA_Veeva_In_Proof_Review = 'In+Proof+Review';       
    public static final String PMBA_Veeva_Proof_Attached = 'Proof+Attached';
    public static final String PMBA_Veeva_Country_United_States = 'unitedStates';
    public static final String PMBA_Veeva_Country_Puerto_Rico = Label.PMBA_Puerto_Rico;
    public static final String PMBA_Veeva_Type_Promotional_Piece = 'Promotional+Piece';
    public static final String PMBA_Veeva_Type_Piece = 'Piece';
    //public static final Date PMBA_Veeva_Approved_For_Distribution_date_not_null = NULL;
    public static final String PMBA_Veeva_Approved_For_Distribution_date_not_null = '';
    
    /*constants for document status*/
    public static final String PMBA_Document_Not_Promotional_Error_Message = 'The Identifier you have typed does not match a promotional material.  Please try again.';
    public static final String PMBA_Item_Not_Found = 'ITEM NOT FOUND';
    public static final String PMBA_Please_Check_ReEnter_DocID_ReScan_BarCode = 'Please check/re enter Doc ID or re scan Bar code';
    public static final String PMBA_Document_Approved_For_Distribution = 'Approved for Distribution';  
    public static final String PMBA_Document_Not_Approved_For_Distribution = 'NOT Approved for Distribution'; 
    public static final String PMBA_Document_In_Periodic_Review = 'In Periodic Review';    
    public static final String PMBA_Document_In_Proof_Review = 'In Proof Review';
    public static final String PMBA_Document_Approved_For_Production = 'Approved For Production';       
    public static final String PMBA_Document_Proof_Attached = 'Proof Attached';
    public static final String PMBA_Document_Retired = 'Retired';
    public static final String PMBA_Document_Expired = 'Expired';
    public static final String PMBA_Document_Is_Inactive = ' is \'Inactive\'';
    public static final String PMBA_Approved_For_Distribution_Date_Text = 'Approved for Distribution Date : ';
    public static final String PMBA_Document_Retirement_Text = 'Retirement Date : ';
    public static final String PMBA_Document_Expiration_Text = 'Expiration Date : ';
    public static final String PMBA_Is_Text= ' is \'';
    public static final String PMBA_Apostrophes= '\'';
    public static final String PMBA_Default_User_Group ='sales_representatives__c';
    public static final String PMBA_VEEVA_RESPONSE_FAILURE = 'FAILURE';
    public static final String PMBA_VEEVA_RESPONSE_FAILURE_TRY_AGAIN = 'Please try again in a few minutes when the network is up.';
    public static final String PMBA_VEEVA_RESPONSE_FAILURE_AUTH = 'Please try again. Username or password is incorrect.';
    public static final Integer PMBA_EXPIRATION_FIFTEEN_DAYS = 15;
    public static final Integer PMBA_INTEGER_VALUE_ZERO = 0;
    public static final Integer PMBA_INTEGER_VALUE_ONE = 1;
    public static final String PMBA_BARCODE_SCANNING ='Barcode Scanning';
    public static final String PMBA_ACTIVE_LIST ='Active List';
    public static final String PMBA_TYPE_IN_DOCID_SEARCH ='Document Number/Legacy Identifier Search';
    
    /*color code for documents*/
    public static final String PMBA_Red_Color = 'red';
    public static final String PMBA_Green_Color = 'lightgreen';
    public static final String PMBA_Yellow_Color = 'yellow';
    public static final String PMBA_White_Color = 'white';
    
}