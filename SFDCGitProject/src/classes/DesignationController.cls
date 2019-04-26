public class DesignationController {

    //private variable
    private String DesignationList123;
    
    //public accessor
    public String GetPositionsList12()
    {
        return DesignationList123;
    }
    
    //function called by view
    public void GetCandidatePositions() {
    
        // Instantiate a new http object
        Http h = new Http();

        // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:Pluralsight_Demo/positions');
        //req.setEndpoint('http://positionsapp-seroter.uswest.appfog.ctl.io/positions');
        req.setMethod('GET');

        // Send the request, and return a response
        HttpResponse res = h.send(req);
        String responseJson = res.getBody();
        
        //create map to hold results
        Map<String, Object> m = (Map<String, Object>) JSON.deserializeUntyped(responseJson);
        
        //extract the positions in the result set
        List<Object> positions = (List<Object>) m.get('positions');
        String positionString = '';
        
        //loop through all the positions
        for (Object s : positions) {
            
            positionString += '<span class=\'card\'>' + string.valueof(s) + '</span>';
        }

        //set string to positions variable
        DesignationList123 = positionString;

    }

}