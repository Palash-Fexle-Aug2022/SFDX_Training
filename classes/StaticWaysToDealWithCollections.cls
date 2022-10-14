/**
*
*  Purpose          :	Class to fill map with static Key-Value Pair.
*
*  Created Date     :  	09/02/2022
*
*  Created By       :  	Palash Singh
*
*  Revision Logs    :  	V_1.0 - Created
*
**/
public without sharing class StaticWaysToDealWithCollections {
    public static Map<String, Map<String, List<String>>> StaticWaysToDealWithCollections() {
        Map<String, Map<String, List<String>>> mapOfCountriesWithStatesandCitiesDetails = new map<String, map<String, List<String>>>
            {'India' => new map<String, List<String>>
               {'Rajasthan' => new List<String>{'Jaipur','Kota','Jodhpur'},
               'Uttar Pradesh' => new List<String>{'Lucknow','Kanpur','Agra'},
                'Gujarat' => new List<String>{'Ahmedabad','Surat','Vadodra'}
               },
               'United States' => new map<String, List<String>>
               {'California' => new List<String>{'Los Angeles','San Francisco','San Diego'},
                'Texas' => new List<String>{'Austin','Houston','Dallas'},
                'Illinois' => new List<String>{'Chichago','Sprinfield','Rockford'}
               },
               'United Kingdom' => new map<String, List<String>>
               {'England' => new List<String>{'London','Tottneham','Manchester'},
                'Wales' => new List<String>{'Cardiff','Swansea','Newport'},
                'Scotland' => new List<String>{'Edinburgh','Glasgow','Aberdeen'}
               }
        };
            //System.debug(mapOfCountriesWithStatesandCitiesDetails.get('India').get('Gujarat'));
            //System.debug(mapOfCountriesWithStatesandCitiesDetails.get('United States').get('Illinois'));
            //System.debug(mapOfCountriesWithStatesandCitiesDetails.get('United Kingdom').get('Wales'));
           return mapOfCountriesWithStatesandCitiesDetails;
    }
}