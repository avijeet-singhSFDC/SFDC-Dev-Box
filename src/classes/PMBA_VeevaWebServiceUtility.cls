/* Class Name   : PMBA_VeevaWebServiceUtility 
* Description  : WebService class to make HTTP callout and parse the response obtained
*                This is a utility class that will be used for all callouts to Veeva
* Created By   : Arpitha Sudhakar
* Created On   : 05/10/2015

* Modification Log:
* --------------------------------------------------------------------------------------------------------------------------------------
* Developer                Date                   Modification ID      Description
* ---------------------------------------------------------------------------------------------------------------------------------------
* 
*/
public class PMBA_VeevaWebServiceUtility {
    
    public class VeevaConnectionException extends Exception{}
    public class VeevaAuthenticationException extends Exception{}

    
    public static Map<String,String> userGroupPicklistMap = new Map<String,String>();

    /* Method Name : getSessionIdUsingExplicitAuth
    *  Description : Generic method get session id for authorization using explicit auth
    *  Parameters  : 
    *  Return type : String
    */
    public Static String getSessionIdUsingExplicitAuth() {
        //variables        
        String vaultDomainUrl;
        String endPoint;        
        Http httpContext      = new Http();
        HTTPResponse res      = null;
        HttpRequest req       = new HttpRequest();
        try {
            vaultDomainUrl = PMBA_StaticConstants.PMBA_VAULT_DOMAIN_URL;
            endPoint = vaultDomainUrl + PMBA_StaticConstants.PMBA_VAULT_EXPLICIT_AUTH;  
            
            req.setEndpoint(endpoint);
            req.setMethod(PMBA_StaticConstants.PMBA_HTTP_POST);
            res = httpContext.send(req);
            System.debug('=============Body '+res.getBody());
        } 
        catch (System.CalloutException calloutException) {
            PMBA_ErrorHandler.createIntegrationException(PMBA_StaticConstants.PMBA_CONSTANT_SOURCE_SYSTEM , null,
            PMBA_StaticConstants.PMBA_CONSTANT_INBOUND_INTEGRATION_TYPE , req.getBody(), null ,
            calloutException.getStackTraceString(), null);
            throw new VeevaConnectionException(PMBA_StaticConstants.PMBA_VEEVA_RESPONSE_FAILURE_TRY_AGAIN);
        }
        PMBA_GenericWebserviceResponseWrapper.PMBA_SessionResponse sessionResponse = (PMBA_GenericWebserviceResponseWrapper.PMBA_SessionResponse)parseResponse(res.getBody(),'PMBA_GenericWebserviceResponseWrapper.PMBA_SessionResponse');
        System.debug('=============sessionResponse.responseStatus '+sessionResponse.responseStatus);
        if(sessionResponse.responseStatus == PMBA_StaticConstants.PMBA_VAULT_FAILURE_RESPONSE){
            throw new VeevaAuthenticationException(PMBA_StaticConstants.PMBA_VEEVA_RESPONSE_FAILURE_AUTH);
        }       
        return sessionResponse.sessionId;
    }

    
    /* Method Name : fetchDocumentsWithCriteria
    *  Description : Method to fetch all documents from veeva based on criteria
    *  Parameters  : String
    *  Return type : PMBA_DocumentQueryResponse 
    */
    public static PMBA_DocumentQueryResponse fetchDocumentsWithCriteria(String sessionId, String documentIdOrLegacyId, String productId, String approvedUserGroup) {
        //variables
        String endPoint;
        Http httpContext                                 = new Http();
        HTTPResponse res                                 = null;
        PMBA_DocumentQueryResponse documentQueryResponse = new PMBA_DocumentQueryResponse();
        HttpRequest req                                  = new HttpRequest();   
        String currentDate = Datetime.now().format('YYYY-MM-dd');
        
        endPoint = PMBA_StaticConstants.PMBA_VAULT_DOMAIN_URL + PMBA_StaticConstants.PMBA_VAULT_API_VERSION_12 + 
        PMBA_StaticConstants.PMBA_VAULT_QUERY_ALL_DOCS;       
        
        
        if(documentIdOrLegacyId != null){
            //calling the method to format documentId
            String formatteDocId = formatDocumentId(documentIdOrLegacyId);
            system.debug('***reformatted'+formatteDocId+'**');
            endPoint = endPoint + '+WHERE+document_number__v+CONTAINS'+ formatteDocId.touppercase() +'+OR+legacy_identifier__c+CONTAINS' + formatteDocId.touppercase() + '+';
            
        }else{
            //endPoint = endPoint + '+WHERE+type__v=\''+PMBA_StaticConstants.PMBA_Veeva_Type_Promotional_Piece+'\''+'+AND+approved_for_distribution_date__vs!=null'+'+AND+country__v+CONTAINS(\''+ PMBA_StaticConstants.PMBA_Veeva_Country_United_States + '\',\'' + PMBA_StaticConstants.PMBA_Veeva_Country_Puerto_Rico + '\')';
            endPoint = endPoint + '+WHERE+type__v+CONTAINS(\''+ PMBA_StaticConstants.PMBA_Veeva_Type_Promotional_Piece + '\',\'' + PMBA_StaticConstants.PMBA_Veeva_Type_Piece + '\')+AND+approved_for_distribution_date__vs!=null'+'+AND+country__v+CONTAINS(\''+ PMBA_StaticConstants.PMBA_Veeva_Country_United_States + '\',\'' + PMBA_StaticConstants.PMBA_Veeva_Country_Puerto_Rico + '\')';
            endPoint = endPoint + '+AND+(expiration_date__vs>=\''+currentDate+'\'OR+expiration_date__vs=null)+AND+(retirement_date__c>=\''+currentDate+'\'OR+retirement_date__c=null)+AND+status__v+CONTAINS(\''+ PMBA_StaticConstants.PMBA_Veeva_Approved_for_Distribution + '\',\'' + PMBA_StaticConstants.PMBA_Veeva_Approved_for_Production + '\',\'' + PMBA_StaticConstants.PMBA_Veeva_In_Periodic_Review + '\',\'' + PMBA_StaticConstants.PMBA_Veeva_In_Proof_Review + '\',\'' + PMBA_StaticConstants.PMBA_Veeva_Proof_Attached + '\')';
        }
        
        if(productId != null){
            /* Changing as per US-43001*/
            //endPoint = endPoint + '+AND+name__v+IN+(SELECT+name__v+FROM+document_product__vr+WHERE+id=\''+ productId +'\')+';
            endPoint = endPoint + '+AND+name__v+IN+(SELECT+name__v+FROM+document_product__vr+WHERE+name__v=\''+ productId +'\')';
        }
        if(approvedUserGroup != null){
            endPoint = endPoint + '+AND+approved_user_group__c+CONTAINS(\''+ approvedUserGroup + '\')';
        }      
        System.debug('=============endPoint '+endPoint);
        if(sessionId != null){
            req.setHeader(PMBA_StaticConstants.PMBA_VAULT_AUTHORIZATION ,sessionId);
            req.setHeader(PMBA_StaticConstants.PMBA_VAULT_ACCEPT , PMBA_StaticConstants.PMBA_VAULT_APPLICATION_JSON_RESPONSE); 
            req.setEndpoint(endpoint);
            req.setMethod(PMBA_StaticConstants.PMBA_HTTP_POST );
            req.setTimeout(120000);
            res = httpContext.send(req);
            System.debug('=============responseBody '+res);
            System.debug('=============Body '+res.getBody());
            documentQueryResponse  = PMBA_DocumentQueryResponse.parse(res.getBody());
            system.debug('==object=='+documentQueryResponse);
        }
        return documentQueryResponse;
    }  
    
    /* Method Name : formatDocumentId
    *  Description : Method used to format document Id
    *  Parameters  : String
    *  Return type : String
    */
    public static String formatDocumentId(String documentId) {
        //variables
        
        documentId = documentId.trim();
        system.debug('###');
        String formatteDocId;
        List<String> tempDocIdsList = new List<String>();
        try{
            System.debug('documentId '+documentId);
            if(documentId != null){
                //if entered id has dashes
                if(documentId.contains(PMBA_StaticConstants.PMBA_Veeva_Document_Dash) || !Test.isRunningTest())
                tempDocIdsList.add(documentId);                   
                system.debug('documentId.length()'+documentId.length());  
                /* changed as per US-39207 */
                if(!documentId.contains(PMBA_StaticConstants.PMBA_Veeva_Document_Dash) && documentId.length() >= PMBA_StaticConstants.PMBA_String_Position_At_Six)
                {
                    String secondValue,thirdValue,fourthValue;
                    String firstValue    = documentId.substring(PMBA_StaticConstants.PMBA_String_Position_At_Zero, PMBA_StaticConstants.PMBA_String_Position_At_Two);
                    system.debug('documentId.length()'+documentId.length());                    
                    if(documentId.length() ==11){   
                        //Format XX-XXX-XX-XXXX
                        system.debug('documentId.length()?PMBA_StaticConstants.PMBA_String_Position_At_Ten'+documentId.length());
                        secondValue   = documentId.substring(PMBA_StaticConstants.PMBA_String_Position_At_Two,PMBA_StaticConstants.PMBA_String_Position_At_Five);
                        thirdValue    = documentId.substring(PMBA_StaticConstants.PMBA_String_Position_At_Five,PMBA_StaticConstants.PMBA_String_Position_At_Seven);
                        fourthValue   = documentId.substring(PMBA_StaticConstants.PMBA_String_Position_At_Seven, documentid.length());
                        tempDocIdsList.add(firstValue +PMBA_StaticConstants.PMBA_Veeva_Document_Dash + secondValue + PMBA_StaticConstants.PMBA_Veeva_Document_Dash+thirdValue + PMBA_StaticConstants.PMBA_Veeva_Document_Dash + fourthValue);
                    }                    
                    
                    else if(documentId.length() == 14){   
                        //Format XX-XXXX-XXXX-XXXX
                        secondValue   = documentId.substring(PMBA_StaticConstants.PMBA_String_Position_At_Two,PMBA_StaticConstants.PMBA_String_Position_At_Six);
                        thirdValue    = documentId.substring(PMBA_StaticConstants.PMBA_String_Position_At_Six,10);
                        fourthValue   = documentId.substring(10, documentid.length());
                        tempDocIdsList.add(firstValue +PMBA_StaticConstants.PMBA_Veeva_Document_Dash + secondValue + PMBA_StaticConstants.PMBA_Veeva_Document_Dash+thirdValue + PMBA_StaticConstants.PMBA_Veeva_Document_Dash + fourthValue);
                    }
                    
                    else  if(documentId.length() == 10){   
                        //Format XX-XX-XX-XXXX
                        secondValue   = documentId.substring(PMBA_StaticConstants.PMBA_String_Position_At_Two, PMBA_StaticConstants.PMBA_String_Position_At_Four);
                        thirdValue    = documentId.substring(PMBA_StaticConstants.PMBA_String_Position_At_Four, PMBA_StaticConstants.PMBA_String_Position_At_Six);
                        fourthValue   = documentId.substring(PMBA_StaticConstants.PMBA_String_Position_At_Six, documentid.length()); 
                        tempDocIdsList.add(firstValue +PMBA_StaticConstants.PMBA_Veeva_Document_Dash + secondValue + PMBA_StaticConstants.PMBA_Veeva_Document_Dash+thirdValue + PMBA_StaticConstants.PMBA_Veeva_Document_Dash + fourthValue);                 
                    }
                    else if(documentId.length() == 12){
                        //Format XXXXXXXXXXXX
                        tempDocIdsList.add(documentId);
                        //Format XX-XX-XXXX-XXXX
                        secondValue   = documentId.substring(2, 4);
                        thirdValue    = documentId.substring(4, 8);
                        fourthValue   = documentId.substring(8, documentid.length());                        
                        tempDocIdsList.add(firstValue +PMBA_StaticConstants.PMBA_Veeva_Document_Dash + secondValue + PMBA_StaticConstants.PMBA_Veeva_Document_Dash+thirdValue + PMBA_StaticConstants.PMBA_Veeva_Document_Dash + fourthValue);

                    }
                    else if(documentId.length() == 13){
                        //Format XX-XXX-XXXX-XXXX - 13 char removed

                        secondValue   = documentId.substring(2,5);
                        thirdValue    = documentId.substring(5,9);
                        fourthValue   = documentId.substring(9, documentid.length());
                        tempDocIdsList.add(firstValue +PMBA_StaticConstants.PMBA_Veeva_Document_Dash + secondValue + PMBA_StaticConstants.PMBA_Veeva_Document_Dash+thirdValue + PMBA_StaticConstants.PMBA_Veeva_Document_Dash + fourthValue);
                        //Format XX-XXXX-XXXX-XXX - 13 char
                        secondValue   = documentId.substring(2,6);
                        thirdValue    = documentId.substring(6, 10);                        
                        fourthValue    = documentId.substring(10, documentid.length());                        
                        tempDocIdsList.add(firstValue +PMBA_StaticConstants.PMBA_Veeva_Document_Dash + secondValue + PMBA_StaticConstants.PMBA_Veeva_Document_Dash+thirdValue + PMBA_StaticConstants.PMBA_Veeva_Document_Dash + fourthValue);
                    }
                    //formatteDocId = firstValue +PMBA_StaticConstants.PMBA_Veeva_Document_Dash + secondValue + PMBA_StaticConstants.PMBA_Veeva_Document_Dash+thirdValue + PMBA_StaticConstants.PMBA_Veeva_Document_Dash + fourthValue;
                    else if(documentId.length() == 6){   
                        //Format XX-XXXX                        
                        //system.debug('documentId.length()?PMBA_StaticConstants.PMBA_String_Position_At_Ten'+documentId.length());
                        secondValue   = documentId.substring(PMBA_StaticConstants.PMBA_String_Position_At_Two,PMBA_StaticConstants.PMBA_String_Position_At_Six);
                        tempDocIdsList.add(firstValue +PMBA_StaticConstants.PMBA_Veeva_Document_Dash + secondValue);
                    }     
                    else if(documentId.length() == 7){   
                        //Format XX-XXXXX                        system.debug('documentId.length()?PMBA_StaticConstants.PMBA_String_Position_At_Ten'+documentId.length());
                        secondValue   = documentId.substring(PMBA_StaticConstants.PMBA_String_Position_At_Two,PMBA_StaticConstants.PMBA_String_Position_At_Seven);
                        tempDocIdsList.add(firstValue +PMBA_StaticConstants.PMBA_Veeva_Document_Dash + secondValue);
                    }   
                    else if(documentId.length() == 8){   
                        //Format XX-XXXXXX                        system.debug('documentId.length()?PMBA_StaticConstants.PMBA_String_Position_At_Ten'+documentId.length());
                        secondValue   = documentId.substring(PMBA_StaticConstants.PMBA_String_Position_At_Two,PMBA_StaticConstants.PMBA_String_Position_At_Eight);
                        tempDocIdsList.add(firstValue +PMBA_StaticConstants.PMBA_Veeva_Document_Dash + secondValue);
                    }                                                   
                }           
            }
        }
        catch (Exception ex) {
            PMBA_ErrorHandler.createApplicationException('PMBA_VeevaWebServiceUtility', 'formatDocumentId',ex.getStackTraceString(), ex.getTypeName());
        }  
       // system.debug('***formated id'+formatteDocId+'***');
        
            formatteDocId = '(';
            for(string s:tempDocIdsList){
                formatteDocId += '\''+s+'\',';
            }
            formatteDocId = formatteDocId.substring(0,formatteDocId.length()-1);
            formatteDocId += ')';
        
        return formatteDocId;
        
    }
    
    
    /* Method Name : getAllProductsFromVeeva
    *  Description : method to get all Products from veeva
    *  Parameters  : String
    *  Return type : List<SelectOption>
    */
    /*public static List<SelectOption> getAllProductsFromVeeva(String sessionId) { 
        
        List<SelectOption> selectOptions             = new List<SelectOption>();
        String endPoint; 
        HttpRequest req                              = new HttpRequest();
        Http httpContext                             = new Http();
        HTTPResponse res                             = null;
        PMBA_ProductListResponse productListResponse = new PMBA_ProductListResponse(); 
        if(sessionId != null){
            endPoint = PMBA_StaticConstants.PMBA_VAULT_DOMAIN_URL + PMBA_StaticConstants.PMBA_VAULT_API_VERSION_12 + 
                PMBA_StaticConstants.PMBA_VAULT_QUERY_ALL_PRODUCTS; 
            selectOptions.add(new SelectOption(PMBA_StaticConstants.PMBA_NONE_SELECTOPTION ,PMBA_StaticConstants.PMBA_NONE_SELECTOPTION)); 
            req.setHeader(PMBA_StaticConstants.PMBA_VAULT_AUTHORIZATION ,sessionId);
            req.setHeader(PMBA_StaticConstants.PMBA_VAULT_ACCEPT , PMBA_StaticConstants.PMBA_VAULT_APPLICATION_JSON_RESPONSE); 
            req.setEndpoint(endpoint);
            req.setMethod(PMBA_StaticConstants.PMBA_HTTP_POST);
            res = httpContext.send(req);
            System.debug('=============Body '+res.getBody());            
            productListResponse = PMBA_ProductListResponse.parse(res.getBody());
            system.debug('----'+productListResponse);
            for (PMBA_ProductListResponse.data data : productListResponse.data)    {
                selectOptions.add(new SelectOption(data.Id,data.name));
            }
        }            
        return selectOptions;
    }*/

    /*  Method Name : getApprovedUserGroupsFromVeeva
    *   Description : Method to fetch approved user group from veeva
    *   Parameters  : String
    *   Return type : List<SelectOption>
    */
    public static List<SelectOption> getApprovedUserGroupsFromVeeva(String sessionId) {
        //variables
        List<SelectOption> selectOptions = new List<SelectOption>();     
        String endPoint;     
        HttpRequest req                  = new HttpRequest();        
        Http httpContext                 = new Http();
        HTTPResponse res                 = null;
        PMBA_GenericWebserviceResponseWrapper.PMBA_ApprovedUserGroupDescribe approvedUserGroupDescribe= new PMBA_GenericWebserviceResponseWrapper.PMBA_ApprovedUserGroupDescribe();        
        if(sessionId != null){
            endPoint = PMBA_StaticConstants.PMBA_VAULT_DOMAIN_URL + PMBA_StaticConstants.PMBA_VAULT_API_VERSION_12 + 
            PMBA_StaticConstants.PMBA_VAULT_QUERY_ALL_APPROVED_USER_GROUPS;
            selectOptions.add(new SelectOption(PMBA_StaticConstants.PMBA_NONE_SELECTOPTION,PMBA_StaticConstants.PMBA_NONE_SELECTOPTION));
            req.setHeader(PMBA_StaticConstants.PMBA_VAULT_AUTHORIZATION ,sessionId);
            req.setHeader(PMBA_StaticConstants.PMBA_VAULT_ACCEPT , PMBA_StaticConstants.PMBA_VAULT_APPLICATION_JSON_RESPONSE); 
            req.setEndpoint(endpoint);
            req.setMethod(PMBA_StaticConstants.PMBA_HTTP_GET);
            res = httpContext.send(req);
            System.debug('=============responseBody '+res);
            System.debug('=============Body '+res.getBody());
            approvedUserGroupDescribe= (PMBA_GenericWebserviceResponseWrapper.PMBA_ApprovedUserGroupDescribe)parseResponse(res.getBody(),'PMBA_GenericWebserviceResponseWrapper.PMBA_ApprovedUserGroupDescribe');
            system.debug('==object=='+approvedUserGroupDescribe);
            for (PMBA_GenericWebserviceResponseWrapper.PicklistValue pickListValue : approvedUserGroupDescribe.picklistValues)    {
                selectOptions.add(new SelectOption(pickListValue.name,picklistValue.label));                    
                userGroupPicklistMap.put(pickListValue.name,pickListValue.label.replace(' ','+'));
            }
        }            
        return selectOptions;
    }

    /* Method Name : parseResponse
    *  Description : Generic method to parse the HTTPREsponse obtained in the performHTTPCallout method
    *                and return list of objects
    *  Parameters  : jsonString, Object Name
    *  Return type : Object
    */
    public static Object parseResponse(String jsonString, String objectName) {
        Object parsedObject = null;
        try {
            if(jsonString != null){
                parsedObject = JSON.deserialize(jsonString, Type.forname(ObjectName));
            }            
        } 
        catch (System.JSONException jsonException) {
            PMBA_ErrorHandler.createApplicationException('PMBA_VeevaWebServiceUtility', 'parseResponse',
            jsonException.getStackTraceString(), jsonException.getTypeName());
        }
        return parsedObject;
    }   
    
    /**
    * Method name  : saveUsageObjDetails
    * Description  : Save the Usage object details. 
    * CRUD / FLS is being bypassed as we want to log the usage details,but no permission set has been given create rights.
    * PMBA System Owner has the access to read the same and report on it.
    * Return Type  : None
    * Parameter    : String
    **/
    public static void saveUsageObjDetails(String productFeature){
        if(productFeature != null){
            User usr = [select name, alias FROM User WHERE id =: UserInfo.getUserId()];
            PMBA_Usage_Details__c usageObj   = new PMBA_Usage_Details__c();
            usageObj.PMBA_Date_and_Time__c   = System.now();
            usageObj.PMBA_Product_Feature__c = productFeature;
            usageObj.PMBA_User_Id__c         = usr.alias;
            try{
                insert usageObj;
            }
            catch (Exception e){
                PMBA_ErrorHandler.createApplicationException('PMBA_VeevaWebServiceUtility', 'saveUsageObjDetails',
                e.getStackTraceString(), e.getTypeName());
            }
        }          
    }
    /**
    * Method name  : fetchPromotionalMaterials
    * Description  : method to fetch the active promotional materials
    * Return Type  : List<SelectOption>
    * Parameter    : none
    **/
    public static list<SelectOption> fetchPromotionalMaterials()
    { 
        List<SelectOption> MaterialOptions = new list<SelectOption>();
        MaterialOptions.add(new SelectOption('--None--','--None--'));
        for(PMBA_Promotional_Materials__c PM : [Select id,name from PMBA_Promotional_Materials__c where isDeleted = false order by name asc limit: Limits.getLimitQueryRows()])
        {
            MaterialOptions.add(new SelectOption(PM.name.replace(' ','+'),PM.name));
        }
        return MaterialOptions;
    }    
    
}