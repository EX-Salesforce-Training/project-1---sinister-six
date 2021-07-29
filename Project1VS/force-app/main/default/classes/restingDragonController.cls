/////////////////////////////////////////
//
// Dungeons and Dragons REST API controller
// 
// Purpose: Connecting the the dnd5eapi.co API, and making data available for visualforce pages
// 
// Initial designer: Richard 'Jerry' Laughter
// Creation Date: 7/29/2021
// Latest Edit: 7/29/2021
//
/////////////////////////////////////////

public class restingDragonController {
    
    public List<charClass> finClassList {get;set;}
    
    public restingDragonController(){
        finClassList = makeCallout();
    }
    
    public static List<charClass> makeCallout(){
        String apiAddress = 'https://www.dnd5eapi.co/api/';
            
		String subLevel = 'classes/';
        
        Http http = new Http();
        httpRequest request = new HttpRequest();
        request.setEndpoint(apiAddress + subLevel);
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('Accept', 'application/json');
        HttpResponse response = http.send(request);
        
        if (response.getStatusCode() == 200){

            // creations an string, object map from JSON string
            Map<String, Object> respMap = (Map<String, Object>)
                JSON.deserializeUntyped(response.getBody());

            // casts object into list of objects
            List<Object> classList = (List<Object>)
                respMap.get('results');

            // 

            List<charClass> finClassList = new List<charClass>();
            
            for(Object o: classList){
                charClass curClass = new charClass(o);
                finClassList.add( curClass );
            }
            return finClassList;
        }
        return null;
            
    }	

    public class charClass{
        public String name {get;set;}
        public String URL {get; set;}
        
        public charClass(Object rawData){
            Map<String, Object> finClassList = (Map<String, Object>)rawData;

            name = String.valueOf(finClassList.get('name'));
            URL = String.valueOf(finClassList.get('url'));
        }

    }
    
}