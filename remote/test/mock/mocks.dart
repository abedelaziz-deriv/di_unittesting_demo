import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:remote/remote.dart';
import 'package:remote/src/api/endpoint_provider.dart';

Response<dynamic> get mockResponse => Response(
    requestOptions: RequestOptions(path: mostPopularEmailed), data: '''{
   "status":"OK",
   "copyright":"Copyright (c) 2023 The New York Times Company.  All Rights Reserved.",
   "num_results":20,
   "results":[
      {
         "uri":"nyt://article/2b62ec40-06d5-571d-8265-6855f7442a62",
         "url":"https://www.nytimes.com/2023/05/31/opinion/mississippi-education-poverty.html",
         "id":100000008898176,
         "asset_id":100000008898176,
         "source":"New York Times",
         "published_date":"2023-05-31",
         "updated":"2023-06-01 09:55:31",
         "section":"Opinion",
         "subsection":"",
         "nytdsection":"opinion",
         "adx_keywords":"Reading and Writing Skills (Education);Illiteracy;Education (K-12);Education (Pre-School);Tests and Examinations;Graduation Rates;Teachers and School Employees;Discrimination;Poverty;Black People;Philanthropy;Barksdale, James L;Mississippi",
         "column":null,
         "byline":"By Nicholas Kristof",
         "type":"Article",
         "title":"Mississippi Is Offering Lessons for America on Education",
         "abstract":"The state shows that poverty is no excuse for failing to teach kids to read.",
         "des_facet":[
            "Reading and Writing Skills (Education)",
            "Illiteracy",
            "Education (K-12)",
            "Education (Pre-School)",
            "Tests and Examinations",
            "Graduation Rates",
            "Teachers and School Employees",
            "Discrimination",
            "Poverty",
            "Black People",
            "Philanthropy"
         ],
         "org_facet":[
            
         ],
         "per_facet":[
            "Barksdale, James L"
         ],
         "geo_facet":[
            "Mississippi"
         ],
         "media":[
            {
               "type":"image",
               "subtype":"photo",
               "caption":"A kindergarten student at Van Wilder Elementary participates in a writing exercise.",
               "copyright":"Photographs by Trent Bozeman for The New York Times",
               "approved_for_syndication":1,
               "media-metadata":[
                  {
                     "url":"https://static01.nyt.com/images/2023/06/02/multimedia/00kristof-mississippi-10-gvfc/00kristof-mississippi-10-gvfc-thumbStandard.jpg",
                     "format":"Standard Thumbnail",
                     "height":75,
                     "width":75
                  },
                  {
                     "url":"https://static01.nyt.com/images/2023/06/02/multimedia/00kristof-mississippi-10-gvfc/00kristof-mississippi-10-gvfc-mediumThreeByTwo210-v2.jpg",
                     "format":"mediumThreeByTwo210",
                     "height":140,
                     "width":210
                  },
                  {
                     "url":"https://static01.nyt.com/images/2023/06/02/multimedia/00kristof-mississippi-10-gvfc/00kristof-mississippi-10-gvfc-mediumThreeByTwo440-v2.jpg",
                     "format":"mediumThreeByTwo440",
                     "height":293,
                     "width":440
                  }
               ]
            }
         ],
         "eta_id":0
      }
   ]
}
  ''');

ArticlesResponseModel get mockMappedResponse =>
    ArticlesResponseModel.fromJson(jsonDecode(mockResponse.toString()));
