/* Class Name   :  PMBA_ErrorHandler 
 * Description  :  Utility Class to log errors in the Error Object
 * Created By   :  Arpitha Sudhakar
 * Created On   :  29-09-2015

 * Modification Log:  
 * --------------------------------------------------------------------------------------------------------------------------------------
 * Developer                Date                   Modification ID      Description 
 * ---------------------------------------------------------------------------------------------------------------------------------------
 * 
*/
public class PMBA_ErrorHandler {  
    
    /**
    * Method name  : createIntegrationException
    * Description  : This method will log all the Integration exceptions encountered
    * Return Type  : None
    * Parameter    : sourceName, serviceName, inboundType, requestBody, responseBody, exeptionMessage, endpoint
    **/
    public static void createIntegrationException(String sourceName, String serviceName, String inboundType, String requestBody, String responseBody, String exeptionMessage, String endpoint) {
        GLBL_Error_Log__c log          = new GLBL_Error_Log__c();
        log.Error_Message__c           = exeptionMessage;
        log.Error_Datetime__c          = Date.today();
        log.Running_User__c            = UserInfo.getUserId();
        log.Stack_Trace__c             = exeptionMessage;    
        log.Additional_Information__c  = 'sourceName:'+sourceName+'serviceName:'+serviceName+'inboundType:'+inboundType+'requestBody:'+requestBody+'responseBody:'+responseBody+'endpoint:'+endpoint;
        insert log;
    }
    
    /**
    * Method name  : createApplicationException
    * Description  : This method will log all the general exceptions encountered
    * Return Type  : None
    * Parameter    : Exception, Name of the sObject, DML Type, Component of the error, Class or Trigger Name, severity
    **/
    public static void createApplicationException(String className, String methodName, String exceptionStackTrace, String exceptionType) {
        GLBL_Error_Log__c log         = new GLBL_Error_Log__c();
        log.Error_Message__c          = exceptionType;
        log.Error_Datetime__c         = Date.today();
        log.Running_User__c           = UserInfo.getUserId();
        log.Stack_Trace__c            = exceptionStackTrace;   
        log.Additional_Information__c = 'Class name: '+ className + 'Method name: ' + methodName;
        insert log; 
                
    }
}