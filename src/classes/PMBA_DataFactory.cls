/* Class Name   : PMBA_DataFactory
 * Description  : Utility and Test data class for Promotional Barcode Project
 *
 * Created By   : Avijeet Singh
 * Created On   : 19/10/2015

 * Modification Log: 
 * --------------------------------------------------------------------------------------------------------------------------------------
 * Developer                Date                   Modification ID      Description
 * ---------------------------------------------------------------------------------------------------------------------------------------
 * 
*/
@isTest
public class PMBA_DataFactory{
    /* Method Name : createUser
    *  Description : Method used to create user as per permission set
    *  Parameters  : String PermissionSetLabel
    *  Return type : String
    */
    public static User createUser(String PermissionSetLabel){
        
        Profile profile = [select id from profile where name='GSO Basic User_Platform'];
        User runAsUser = new User(alias = 'Adminpmb', email='appAdmin_pmba@testorg.com',
                                  emailencodingkey='UTF-8', lastname='Testing', languagelocalekey='en_US',
                                  localesidkey='en_US', profileid = profile.Id,  country='United States', CommunityNickname = 'u1',
                                  timezonesidkey='America/Los_Angeles', username='appAdmin_pmba@gso_org.com');
        
        insert runAsUser;        
        PermissionSet permissionSet = [SELECT ID,Label from PermissionSet WHERE Name=:PermissionSetLabel];
        PermissionSetAssignment permissionSetAssignment = New PermissionSetAssignment();
        permissionSetAssignment.AssigneeId=runAsUser.ID;
        permissionSetAssignment.PermissionSetId=permissionSet .ID;
        insert permissionSetAssignment; 
        system.assertNotEquals(runasUser,null);     
        return runAsUser;       
    }
    
    /* Method Name : createVeevaVaultCredentials
    *  Description : Method used to create veeva vault creds
    *  Parameters  : 
    *  Return type : 
    */
    public static void createVeevaVaultCredentials(){
        PMBA_Veeva_Vault_Credentials__c veevaCreds = new PMBA_Veeva_Vault_Credentials__c();
        veevaCreds.Name = System.Label.PMBA_Veeva_Vault_Credential_Name;
        veevaCreds.Veeva_Vault_Domain_URL__c = 'http://testveeva.test.com';
        veevaCreds.Veeva_Vault_Username__c= 'testUsername';
        veevaCreds.Veeva_Vault_Password__c= 'testPassword';
        insert veevaCreds;            
    }
    
    /* Method Name : createhelpPDF
    *  Description : Method used to create help pdf document
    *  Parameters  : 
    *  Return type : 
    */
    public static void createHelpPDF(){        
        Document document = new Document();
        document.DeveloperName = System.Label.PMBA_Application_Help_PDF;   
        document.Name = System.Label.PMBA_Application_Help_PDF;
        document.body = Blob.valueOf('str');
        document.FolderId = UserInfo.getUserId();    
        insert document;
    }
    /* Method Name : createPromotionalMaterials
    *  Description : Method used to create Promotional Materials
    *  Parameters  : 
    *  Return type : 
    */
    public static List<PMBA_Promotional_Materials__c > createPromotionalMaterials(){ 
        List<PMBA_Promotional_Materials__c > lst = new list<PMBA_Promotional_Materials__c>();
        for(integer i=0;i<67;i++)
        {
            lst.add(new PMBA_Promotional_Materials__c(name='dummy'+i));
        }
        insert lst;
        return lst;
        return null;
    }
}