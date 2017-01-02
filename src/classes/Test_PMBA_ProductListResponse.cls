@IsTest
public class Test_PMBA_ProductListResponse {
    
    // This test method should give 100% coverage
    static testMethod void testParse() {
        String json = '{\"responseStatus\":\"SUCCESS\",'+
        '\"responseDetails\":{\"limit\":1000,\"offset\":0,\"size\":67,\"total\":67},'+
        '\"data\":['+
        '   {\"id\":\"00P000000000306\",\"name\":\"Prozac\"},'+
        '   {\"id\":\"00P000000000908\",\"name\":\"Humalog Mix 50/50\"},'+
        '   {\"id\":\"00P000000000307\",\"name\":\"Tradjenta\"},'+
        '   {\"id\":\"00P000000000925\",\"name\":\"Patient Reimbursement Center\"},'+
        '   {\"id\":\"00P000000000308\",\"name\":\"Vancocin\"},'+
        '   {\"id\":\"00P000000000910\",\"name\":\"Humatrope\"},'+
        '   {\"id\":\"00P000000000104\",\"name\":\"Forsteo\"},'+
        '   {\"id\":\"00P000000000928\",\"name\":\"Zyprexa Relprevv\"},'+
        '   {\"id\":\"00P000000000401\",\"name\":\"ReoPro\"},'+
        '   {\"id\":\"00P000000000929\",\"name\":\"MHS Hospital\"},'+
        '   {\"id\":\"00P000000000913\",\"name\":\"Innovative Customer Experience\"},'+
        '   {\"id\":\"00P000000000B01\",\"name\":\"Reference Document\"},'+
        '   {\"id\":\"00P000000000108\",\"name\":\"Gemzar\"},'+
        '   {\"id\":\"00P000000000801\",\"name\":\"Trulicity\"},'+
        '   {\"id\":\"00P000000000915\",\"name\":\"Jardiance\"},'+
        '   {\"id\":\"00P000000000901\",\"name\":\"Effient\"},'+
        '   {\"id\":\"00P000000000110\",\"name\":\"Humalog\"},'+
        '   {\"id\":\"00P000000000902\",\"name\":\"Axiron\"},'+
        '   {\"id\":\"00P000000000917\",\"name\":\"Lilly Alzheimers Disease\"},'+
        '   {\"id\":\"00P000000000D02\",\"name\":\"Insulin Glargine BS Lilly\"},'+
        '   {\"id\":\"00P000000000918\",\"name\":\"Lilly Autoimmune\"},'+
        '   {\"id\":\"00P000000000E01\",\"name\":\"Lilly Brand\"},'+
        '   {\"id\":\"00P000000000919\",\"name\":\"Lilly Diabetes Strategy\"},'+
        '   {\"id\":\"00P000000000301\",\"name\":\"Byetta\"},'+
        '   {\"id\":\"00P000000000905\",\"name\":\"Health Education\"},'+
        '   {\"id\":\"00P000000000302\",\"name\":\"Ceclor Liquid\"},'+
        '   {\"id\":\"00P000000000906\",\"name\":\"Humalog U100\"},'+
        '   {\"id\":\"00P000000000922\",\"name\":\"Portrazza\"},'+
        '   {\"id\":\"00P000000000907\",\"name\":\"Humalog U200\"},'+
        '   {\"id\":\"00P000000000304\",\"name\":\"Evista\"},'+
        '   {\"id\":\"00P000000000305\",\"name\":\"Humulin\"},'+
        '   {\"id\":\"00P000000000101\",\"name\":\"Strattera\"},'+
        '   {\"id\":\"00P000000000924\",\"name\":\"Patient Assistance\"},'+
        '   {\"id\":\"00P000000000909\",\"name\":\"Humalog Mix 75/25\"},'+
        '   {\"id\":\"00P000000000926\",\"name\":\"Solanezumab\"},'+
        '   {\"id\":\"00P000000000309\",\"name\":\"Zydis\"},'+
        '   {\"id\":\"00P000000000927\",\"name\":\"Symbyax\"},'+
        '   {\"id\":\"00P000000000310\",\"name\":\"Zyprexa\"},'+
        '   {\"id\":\"00P000000000911\",\"name\":\"Humulin R U100\"},'+
        '   {\"id\":\"00P000000000105\",\"name\":\"Forteo\"},'+
        '   {\"id\":\"00P000000000912\",\"name\":\"Humulin R U500\"},'+
        '   {\"id\":\"00P000000000930\",\"name\":\"MHS IHS AM\"},'+
        '   {\"id\":\"00P000000000601\",\"name\":\"Glucagon\"},'+
        '   {\"id\":\"00P000000000A01\",\"name\":\"BIV\"},'+
        '   {\"id\":\"00P000000000701\",\"name\":\"Amyvid\"},'+
        '   {\"id\":\"00P000000000914\",\"name\":\"Ixekizumab\"},'+
        '   {\"id\":\"00P000000000C01\",\"name\":\"Lilly Cardiovascular\"},'+
        '   {\"id\":\"00P000000000109\",\"name\":\"Lilly Diabetes\"},'+
        '   {\"id\":\"00P000000000C02\",\"name\":\"Lilly Immunology\"},'+
        '   {\"id\":\"00P000000000C03\",\"name\":\"Erbitux\"},'+
        '   {\"id\":\"00P000000000916\",\"name\":\"Jentadueto\"},'+
        '   {\"id\":\"00P000000000D01\",\"name\":\"Trazenta\"},'+
        '   {\"id\":\"00P000000000903\",\"name\":\"BIL\"},'+
        '   {\"id\":\"00P000000000201\",\"name\":\"Cyramza\"},'+
        '   {\"id\":\"00P000000000904\",\"name\":\"Diabetes Branded Portfolio\"},'+
        '   {\"id\":\"00P000000000F01\",\"name\":\"Lilly Brand Historic\"},'+
        '   {\"id\":\"00P000000000920\",\"name\":\"Lilly USA\"},'+
        '   {\"id\":\"00P000000000921\",\"name\":\"MHS\"},'+
        '   {\"id\":\"00P000000000303\",\"name\":\"Ceclor Solid\"},'+
        '   {\"id\":\"00P000000000923\",\"name\":\"Oncology Unbranded\"},'+
        '   {\"id\":\"00P000000000103\",\"name\":\"Adcirca\"},'+
        '   {\"id\":\"00P000000000501\",\"name\":\"Basaglar\"},'+
        '   {\"id\":\"00P000000000107\",\"name\":\"Alimta\"},'+
        '   {\"id\":\"00P000000000106\",\"name\":\"Lilly Oncology\"},'+
        '   {\"id\":\"00P000000000111\",\"name\":\"Cymbalta\"},'+
        '   {\"id\":\"00P000000000H01\",\"name\":\"CamTest\"},'+
        '   {\"id\":\"00P000000000102\",\"name\":\"Cialis\"}'+
        ']'+
        '}';
        PMBA_ProductListResponse r = PMBA_ProductListResponse.parse(json);
        System.assert(r != null);

        json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
        PMBA_ProductListResponse objRoot = new PMBA_ProductListResponse (System.JSON.createParser(json));
        System.assert(objRoot != null);
        System.assert(objRoot.responseStatus == null);
        System.assert(objRoot.responseDetails == null);
        System.assert(objRoot.data == null);

        json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
        PMBA_ProductListResponse.ResponseDetails objResponseDetails = new PMBA_ProductListResponse.ResponseDetails(System.JSON.createParser(json));
        System.assert(objResponseDetails != null);
        System.assert(objResponseDetails.limit_Z == null);
        System.assert(objResponseDetails.offset == null);
        System.assert(objResponseDetails.size == null);
        System.assert(objResponseDetails.total == null);

        json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
        PMBA_ProductListResponse.Data objData = new PMBA_ProductListResponse.Data(System.JSON.createParser(json));
        System.assert(objData != null);
        System.assert(objData.id == null);
        System.assert(objData.name == null);
    }
}