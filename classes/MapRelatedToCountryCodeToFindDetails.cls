/**
*
*  Purpose          :	Class to fill map with static Key-Value Pair and match specific pair with
						name starting with same letter and getting cities with name length equal to more than a specific number.
*
*  Created Date     :  	09/12/2022
*
*  Created By       :  	Palash Singh
*
*  Revision Logs    :  	V_1.0 - Created
*
**/
public with sharing class MapRelatedToCountryCodeToFindDetails {
    public MapRelatedToCountryCodeToFindDetails() {
        
    //Initialising Map of CountryCode with respective details:
        Map<String, Map<String, Map<String, List<String>>>>  mapOfCountryCodeWithCountryStateandDistrictDetails 
            = new Map<String, Map<String, Map<String, List<String>>>>();
        
    //Putting Details in map for India, its states and respective districts:
        Map<String, List<String>> indiaStateMap = new Map<String, List<String>>
        {'Rajasthan' => new List<String>{'Jaipur','Kota','Jodhpur'},
            'Punjab' => new List<String>{'Amritsar','Jalandhar','Patiala'},
                'Maharashtra' => new List<String>{'Mumbai','Pune','Nashik'}
        };
            Map<String, Map<String, List<String>>> indiaMap = new Map<String, Map<String, List<String>>>
        {'India' => indiaStateMap};
            mapOfCountryCodeWithCountryStateandDistrictDetails.put('IND',indiaMap);
        
        
    //Putting Details in map for United Kingdom, its states and respective districts: 
        Map<String, List<String>> UKStateMap = new Map<String, List<String>>
        {'England' => new List<String>{'London','Tottneham','Manchester'},
            'Wales' => new List<String>{'Cardiff','Swansea','Newport'},
                'Scotland' => new List<String>{'Edinburgh','Glasgow','Aberdeen'}
        };
            Map<String, Map<String, List<String>>> ukMap = new Map<String, Map<String, List<String>>>
        {'United Kingdom' => UKStateMap};
            
            mapOfCountryCodeWithCountryStateandDistrictDetails.put('UK',ukMap);                         
        
        
    //Putting Details in map for Spain, its states and respective districts:   
        Map<String, List<String>> spainStateMap = new Map<String, List<String>>
        {'Sevilla' => new List<String>{'Carmona','Sepora','Sosuna'},
            'Las Palmas' => new List<String>{'Arucas','Las Palmas','Telde'},
                'Catalonia' => new List<String>{'Badalona','Barcelona','Reus'}
        };
            Map<String, Map<String, List<String>>> spainMap = new Map<String, Map<String, List<String>>>
        {'Spain' => spainStateMap};
            
            mapOfCountryCodeWithCountryStateandDistrictDetails.put('SPN',spainMap);
        
        
    //Final Map after all the details of different countries:  
        System.debug(mapOfCountryCodeWithCountryStateandDistrictDetails);
        Integer I = 7;
        
    //Loop to find details matching a specific letter:
        for(String countryCode : mapOfCountryCodeWithCountryStateandDistrictDetails.keySet()){
            if(countryCode.startsWith('S')){
                for(String country : mapOfCountryCodeWithCountryStateandDistrictDetails.get(countrycode).keySet()){
                    if(country.startsWith('S')){
                        for(String state : mapOfCountryCodeWithCountryStateandDistrictDetails.get(countrycode).get(country).keySet()){
                            if(state.startsWith('S')){
                                for(String dist : mapOfCountryCodeWithCountryStateandDistrictDetails.get(countrycode).get(country).get(state)){
                                    if(dist.startsWith('S')){
                                        System.debug('Country Code : '+countryCode+'\nCountry : '+country+'\nState : '+state+'\nDistrict :'+dist);                                       
                                    }                                                                      
                                }
                            }
                        }                     
                    }
                } 
            }
        }
        
        
     //Initialisation of a list to store City Names
     		List<String> cityNameWithSpecificLengthList = new List<String>();
        
        
     //Loop to find City Name with Specific or more length   
        for(String countryCodelength : mapOfCountryCodeWithCountryStateandDistrictDetails.keySet()){
            for(String countrylength : mapOfCountryCodeWithCountryStateandDistrictDetails.get(countrycodelength).keySet()){
                for(String statelength : mapOfCountryCodeWithCountryStateandDistrictDetails.get(countrycodelength).get(countrylength).keySet()){
                    for(String distlength : mapOfCountryCodeWithCountryStateandDistrictDetails.get(countrycodelength).get(countrylength).get(statelength)){                         
                        if(distlength.length()>=I){
                            cityNameWithSpecificLengthList.add(distlength);
                        }  
                    }    
                }  
            } 
        }
        System.debug(cityNameWithSpecificLengthList);
    }
}