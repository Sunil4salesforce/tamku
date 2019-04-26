public class CurrencyController {

    //private variable
    private Map<String, Object> rates;
    
    //private variable
    private String base;
    
    //private variable
    private String conversionDate;
    
    //public accessor
    
    public Map<String, Object> GetCurrencyRates()
    {
        return rates;
           
    }
    
     //public accessor
    public String GetCurrencyBase()
    {
        return base;
    }
    
     //public accessor
    public String GetCurrencyConversionDate()
    {
        return conversionDate;
    }
    
    //function called by view
    public void decodeCurrenciesAndBase() {
    
        // Instantiate a new http object
        Http h = new Http();

        // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:CurrencyList/latest');
        //req.setEndpoint('http://positionsapp-seroter.uswest.appfog.ctl.io/positions');
        req.setMethod('GET');

        // Send the request, and return a response
        HttpResponse res = h.send(req);
        String responseJson = res.getBody();
        
        //create map to hold results
        Map<String, Object> m = (Map<String, Object>) JSON.deserializeUntyped(responseJson);
        
        //extract the rates in the result set
       // List<Object> rates = (List<Object>) m.get('rates');
       rates = (Map<String, Object>)m.get('rates');
       base = (String)m.get('base');
       conversionDate = (String)m.get('date');
     
    }

}