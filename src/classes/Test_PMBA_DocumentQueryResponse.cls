@IsTest
public class Test_PMBA_DocumentQueryResponse {
    
    // This test method should give 100% coverage
    static testMethod void testParse() {
        String json = '{\"responseStatus\":\"SUCCESS\",'+
        '\"responseDetails\":'+
        '   {\"limitrecords\":1000,\"offset\":0,\"size\":25,\"total\":25},'+
        '   \"data\":'+
        '       ['+
        '           {\"id\":3,\"name\":\"DUMMY-DOC-3\",\"status\":\"Approved for Distribution\",\"type\":\"Promotional Piece\",\"document_number\":\"PP-TD-US-0001\",'+
        '               \"document_product\":'+
        '               {\"responseDetails\":{\"limitrecords\":250,\"offset\":0,\"size\":1,\"total\":1},\"data\":[{\"name\":\"Cialis\"}]},'+
        '               \"document_country\":'+
        '               {\"responseDetails\":{\"limitrecords\":250,\"offset\":0,\"size\":1,\"total\":1},\"data\":[{\"name\":\"United States\"}]},'+
        '               \"audience\":[\"Nurse\"],'+
        '               \"approved_user_group\":[\"Lilly Answers Center\"],'+
        '               \"trackable_item\":false,'+
        '               \"approximate_retail_value\":10.00,'+
        '               \"cost_per_unit\":100.00,'+
        '               \"legacy_identifier\":null,'+
        '               \"country\":[\"unitedStates\"],'+
        '               \"expiration_date\":\"2016-06-22\",'+
        '               \"retirement_date\":\"2016-06-22\"'+
        '           }'+
        '       ]'+
        '}';
        PMBA_DocumentQueryResponse r = PMBA_DocumentQueryResponse.parse(json);
        System.assert(r != null);

        json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
        PMBA_DocumentQueryResponse.Data_Z objData_Z = new PMBA_DocumentQueryResponse.Data_Z(System.JSON.createParser(json));
        System.assert(objData_Z != null);
        System.assert(objData_Z.id == null);
        System.assert(objData_Z.name == null);
        System.assert(objData_Z.status == null);
        System.assert(objData_Z.type_Z == null);
        System.assert(objData_Z.document_number == null);
        System.assert(objData_Z.document_product == null);
        System.assert(objData_Z.document_country == null);
        System.assert(objData_Z.audience == null);
        System.assert(objData_Z.approved_user_group == null);
        System.assert(objData_Z.trackable_item == null);
        System.assert(objData_Z.approximate_retail_value == null);
        System.assert(objData_Z.cost_per_unit == null);
        System.assert(objData_Z.legacy_identifier == null);
        System.assert(objData_Z.country == null);
        System.assert(objData_Z.expiration_date == null);
        System.assert(objData_Z.retirement_date == null);

        json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
        PMBA_DocumentQueryResponse objRoot = new PMBA_DocumentQueryResponse(System.JSON.createParser(json));
        System.assert(objRoot != null);
        System.assert(objRoot.responseStatus == null);
        System.assert(objRoot.responseDetails == null);
        System.assert(objRoot.data == null);

        json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
        PMBA_DocumentQueryResponse.ResponseDetails objResponseDetails = new PMBA_DocumentQueryResponse.ResponseDetails(System.JSON.createParser(json));
        System.assert(objResponseDetails != null);
        System.assert(objResponseDetails.limitrecords == null);
        System.assert(objResponseDetails.offset == null);
        System.assert(objResponseDetails.size == null);
        System.assert(objResponseDetails.total == null);

        json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
        PMBA_DocumentQueryResponse.Data objData = new PMBA_DocumentQueryResponse.Data(System.JSON.createParser(json));
        System.assert(objData != null);
        System.assert(objData.name == null);

        json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
        PMBA_DocumentQueryResponse.Document_product objDocument_product = new PMBA_DocumentQueryResponse.Document_product(System.JSON.createParser(json));
        System.assert(objDocument_product != null);
        System.assert(objDocument_product.responseDetails == null);
        System.assert(objDocument_product.data == null);
    }
}