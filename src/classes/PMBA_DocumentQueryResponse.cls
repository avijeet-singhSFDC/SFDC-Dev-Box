/* Class Name   : PMBA_DocumentQueryResponse 
 * Description  : This class is needed to parse the documentlist which is recieved from Veeva
 *
 * Created By   : Avijeet Singh
 * Created On   : 13/10/2015

 * Modification Log: 
 * --------------------------------------------------------------------------------------------------------------------------------------
 * Developer                Date                   Modification ID      Description
 * ---------------------------------------------------------------------------------------------------------------------------------------
 * 
*/
public without sharing class PMBA_DocumentQueryResponse {
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

    public class Data_Z {
        public Integer id {get;set;} 
        public String name {get;set;} 
        public String status {get;set;} 
        public String type_Z {get;set;} // in json: type
        public String document_number {get;set;} 
        public Document_product document_product {get;set;} 
        public Document_country document_country {get;set;} 
        public List<String> audience {get;set;} 
        public List<String> approved_user_group {get;set;} 
        public Boolean trackable_item {get;set;} 
        public Double approximate_retail_value {get;set;} 
        public Double cost_per_unit {get;set;} 
        public String legacy_identifier {get;set;} 
        public List<String> country {get;set;}
        public String approved_for_distribution_date {get;set;}
        public String expiration_date {get;set;} 
        public String retirement_date {get;set;} 
        
        /* Method Name : Data_Z
        *  Description : Parameterized Constructor
        *  Parameters  : JSONParser 
        *  Return type :
        */
        public Data_Z(JSONParser parser) {
            while (parser.nextToken() != JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != JSONToken.VALUE_NULL) {
                        if (text == 'id') {
                            id = parser.getIntegerValue();
                        } else if (text == 'name') {
                            name = parser.getText();
                        } else if (text == 'status') {
                            status = parser.getText();
                        } else if (text == 'type') {
                            type_Z = parser.getText();
                        } else if (text == 'document_number') {
                            document_number = parser.getText();
                        } else if (text == 'document_product') {
                            document_product = new Document_product(parser);
                        } else if (text == 'document_country') {
                            document_country = new Document_country(parser);
                        } else if (text == 'audience') {
                            audience = new List<String>();
                            while (parser.nextToken() != JSONToken.END_ARRAY) {
                                audience.add(parser.getText());
                            }
                        } else if (text == 'approved_user_group') {
                            approved_user_group = new List<String>();
                            while (parser.nextToken() != JSONToken.END_ARRAY) {
                                approved_user_group.add(parser.getText());
                            }
                        } else if (text == 'trackable_item') {
                            trackable_item = parser.getBooleanValue();
                        } else if (text == 'approximate_retail_value') {
                            approximate_retail_value = parser.getDoubleValue();
                        } else if (text == 'cost_per_unit') {
                            cost_per_unit = parser.getDoubleValue();
                        } else if (text == 'legacy_identifier') {
                            legacy_identifier = parser.getText();
                        } else if (text == 'country') {
                            country = new List<String>();
                            while (parser.nextToken() != JSONToken.END_ARRAY) {
                                country.add(parser.getText());
                            }
                        } else if (text == 'approved_for_distribution_date') {
                            approved_for_distribution_date = parser.getText();                        
                        } else if (text == 'expiration_date') {
                            expiration_date = parser.getText();
                        } else if (text == 'retirement_date') {
                            retirement_date = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Data_Z consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public String responseStatus {get;set;} 
    public ResponseDetails responseDetails {get;set;} 
    public List<Data_Z> data {get;set;} 
    
    /* Method Name : PMBA_DocumentQueryResponse
    *  Description : Default Constructor
    *  Parameters  :
    *  Return type :
    */
    public PMBA_DocumentQueryResponse()    {
    }
    
    
    /* Method Name : PMBA_DocumentQueryResponse
    *  Description : Parameterized Constructor
    *  Parameters  : JSONParser 
    *  Return type :
    */
    public PMBA_DocumentQueryResponse(JSONParser parser) {
        while (parser.nextToken() != JSONToken.END_OBJECT) {
            if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                String text = parser.getText();
                if (parser.nextToken() != JSONToken.VALUE_NULL) {
                    if (text == 'responseStatus') {
                        responseStatus = parser.getText();
                    } else if (text == 'responseDetails') {
                        responseDetails = new ResponseDetails(parser);
                    } else if (text == 'data') {
                        data = new List<Data_Z>();
                        while (parser.nextToken() != JSONToken.END_ARRAY) {
                            data.add(new Data_Z(parser));
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
        public Integer limitrecords {get;set;} 
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
                        if (text == 'limitrecords') {
                            limitrecords = parser.getIntegerValue();
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
                        if (text == 'name') {
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
    
    public class Document_product {
        public ResponseDetails responseDetails {get;set;} 
        public List<Data> data {get;set;} 
        
        
        /* Method Name : Document_product
        *  Description : Parameterized Constructor
        *  Parameters  : JSONParser 
        *  Return type :
        */
        public Document_product(JSONParser parser) {
            while (parser.nextToken() != JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != JSONToken.VALUE_NULL) {
                        if (text == 'responseDetails') {
                            responseDetails = new ResponseDetails(parser);
                        } else if (text == 'data') {
                            data = new List<Data>();
                            while (parser.nextToken() != JSONToken.END_ARRAY) {
                                data.add(new Data(parser));
                            }
                        } else {
                            System.debug(LoggingLevel.WARN, 'Document_product consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Document_country {
        public ResponseDetails responseDetails {get;set;} 
        public List<Data> data {get;set;} 
        
        
        /* Method Name : Document_country
        *  Description : Parameterized Constructor
        *  Parameters  : JSONParser 
        *  Return type :
        */
        public Document_country(JSONParser parser) {
            while (parser.nextToken() != JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != JSONToken.VALUE_NULL) {
                        if (text == 'responseDetails') {
                            responseDetails = new ResponseDetails(parser);
                        } else if (text == 'data') {
                            data = new List<Data>();
                            while (parser.nextToken() != JSONToken.END_ARRAY) {
                                data.add(new Data(parser));
                            }
                        } else {
                            System.debug(LoggingLevel.WARN, 'Document_country consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    /* Method Name : PMBA_DocumentQueryResponse 
    *  Description : Method which would parse the json and respond back with the object
    *  Parameters  : String json
    *  Return type : PMBA_DocumentQueryResponse 
    */
    public static PMBA_DocumentQueryResponse parse(String json) {
        
        //trying to massage data to remove unwanted underscores
        json=json.replace('limit','limitrecords');
        json=json.replace('__vr','');
        json=json.replace('__vs','');
        json=json.replace('__v','');
        json=json.replace('__c','');

        return new PMBA_DocumentQueryResponse(System.JSON.createParser(json));
    }
}