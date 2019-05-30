# Flutter Clean Architecture (Model -View - Bloc)
This Repository contains a Detailed Sample app that Implements clean Architecture in flutter using
RxDart,DIO,Bloc Framework  

#### The app has following packages:

 - **bloc:** its include all bloc classes which intract between Model and View Communication  
 - **model:** its include given sub modules  
   - > **remote :** its include Network Call classes like APIConstants,ApiServices using **DIO HTTP Library**    
   - > **repo :** its include all repository classes which handle the data requests coming from **blocs**      
   - > **beans :** its include all data classes,models and  db entities used in application
 - **utils:** Utilities Classes 
 - **view:** View Classes Like All MatrialApp,Scafolds,Widgets etc  
 
 ## Clean Architecture (Model-View-Bloc Reperesentation) Flow of sample app 

- **View** 
  - >  Request data from bloc's
  - >  Observe bloc BehaviorSubject(it's Observable) for response    


- **Bloc**  
  - > Having all BehaviorSubject(Observeable's) of DataModels   
  - > Call getDataReqeust from Repository 
  - > Send requested param and BehaviorSubject to Repository  

- **Repository** 
  - > Get RequestData & BehaviorSubject as Param from Bloc 
  - > Decide to fetch data from DB/Network 
  - > Fetch data and post it on BehaviorSubject get from Bloc
     

#### Libraries Used
 -  **RxDart:** used for Reacive Programming in Dart 
 -  **Dio:**  used for Http Client  and handle Network calls  
 -  **Bloc:**  it's Framework  used for stream data to view 
