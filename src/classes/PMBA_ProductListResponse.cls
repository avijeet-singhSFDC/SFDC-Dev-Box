/* Class Name   : PMBA_ProductListResponse 
 * Description  : This class is needed to parse the productlist which is recieved from Veeva
 *
 * Created By   : Avijeet Singh
 * Created On   : 13/10/2015

 * Modification Log: 
 * --------------------------------------------------------------------------------------------------------------------------------------
 * Developer                Date                   Modification ID      Description
 * ---------------------------------------------------------------------------------------------------------------------------------------
 * 
*/
public without sharing class PMBA_ProductListResponse {
    /* Method Name : consumeObject
    *  Description : Method to invoke to consume the parser object
    *  Parameters  : JSONParser 
    *  Return type : void 
    */
    public static void consumeObject(JSONParser parser) {
        Integer depth = 0;
        do {
            JSONToken curr = parser.getCurrentToken();
            if (curr == JSONToken.START_OBJECT || 
                curr == JSONToken.START_ARRAY) {
                depth++;
            } else if (curr == JSONToken.END_OBJECT ||
                curr == JSONToken.END_ARRAY) {
                depth--;
            }
        } while (depth > 0 && parser.nextToken() != null);
    }

    public String responseStatus {get;set;} 
    public ResponseDetails responseDetails {get;set;} 
    public List<Data> data {get;set;} 
    
    /* Method Name : PMBA_ProductListResponse 
    *  Description : Deafault Constructor
    *  Parameters  : 
    *  Return type :
    */
    public PMBA_ProductListResponse ()    {
    }
    
    public PMBA_ProductListResponse (JSONParser parser) {
        while (parser.nextToken() != JSONToken.END_OBJECT) {
            if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                String text = parser.getText();
                if (parser.nextToken() != JSONToken.VALUE_NULL) {
                    if (text == 'responseStatus') {
                        responseStatus = parser.getText();
                    } else if (text == 'responseDetails') {
                        responseDetails = new ResponseDetails(parser);
                    } else if (text == 'data') {
                        data = new List<Data>();
                        while (parser.nextToken() != JSONToken.END_ARRAY) {
                            data.add(new Data(parser));
                        }
                    } else {
                        System.debug(LoggingLevel.WARN, 'Root consuming unrecognized property: '+text);
                        consumeObject(parser);
                    }
                }
            }
        }
    }
    
    public class ResponseDetails {
        public Integer limit_Z {get;set;} // in json: limit
        public Integer offset {get;set;} 
        public Integer size {get;set;} 
        public Integer total {get;set;} 
        
        /* Method Name : ResponseDetails
        *  Description : Parameterized Constructor
        *  Parameters  : JSONParser 
        *  Return type :
        */
        public ResponseDetails(JSONParser parser) {
            while (parser.nextToken() != JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != JSONToken.VALUE_NULL) {
                        if (text == 'limit') {
                            limit_Z = parser.getIntegerValue();
                        } else if (text == 'offset') {
                            offset = parser.getIntegerValue();
                        } else if (text == 'size') {
                            size = parser.getIntegerValue();
                        } else if (text == 'total') {
                            total = parser.getIntegerValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'ResponseDetails consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Data {
        public String id {get;set;} 
        public String name {get;set;} 
        
        /* Method Name : Data
        *  Description : Parameterized Constructor
        *  Parameters  : JSONParser 
        *  Return type :
        */
        public Data(JSONParser parser) {
            while (parser.nextToken() != JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != JSONToken.VALUE_NULL) {
                        if (text == 'id') {
                            id = parser.getText();
                        } else if (text == 'name') {
                            name = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Data consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    /* Method Name : PMBA_ProductListResponse 
    *  Description : Method which would parse the json and respond back with the object
    *  Parameters  : String json
    *  Return type : PMBA_ProductListResponse 
    */
    public static PMBA_ProductListResponse parse(String json) {
        json = json.replace('__v','');
        return new PMBA_ProductListResponse(System.JSON.createParser(json));
    }
}