/* Class Name   : PMBA_GenericWebserviceResponseWrapper
 * Description  : Generic object equivalent of JSON Response received from external Systems.
 *
 * Created By   : Arpitha Sudhakar
 * Created On   : 28/09/2015

 * Modification Log: 
 * --------------------------------------------------------------------------------------------------------------------------------------
 * Developer                Date                   Modification ID      Description
 * ---------------------------------------------------------------------------------------------------------------------------------------
 * 
*/
public without sharing class PMBA_GenericWebserviceResponseWrapper {

    public class PMBA_SessionResponse{
        public String responseStatus {get;set;}
        public String sessionId {get;set;}
        public Decimal userId {get;set;}
        public List<VaultId> vaultIds {get;set;}
        public String vaultId {get;set;}
    }

    public class VaultId{
        public Decimal id {get;set;}
        public String name {get;set;}
        public String url {get;set;}
    }
    
    
    //Approved User Group Response Wrapper
    public class PMBA_ApprovedUserGroupDescribe{
        public String responseStatus {get;set;}
        public String responseMessage {get;set;}
        public List<PicklistValue> picklistValues {get;set;}
    }

    public class PicklistValue{
        public String name {get;set;}
        public String label {get;set;}
    }
    
}