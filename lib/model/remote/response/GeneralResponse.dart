/* Created by Sahil Bharti on 13/4/19.
 *
*/
 class GeneralResponse{

   bool Success;
   int Status;
   String Message;
   GeneralResponse.fromJson(Map<String, dynamic> json)
       : Success = json["Success"],
         Status = json["Status"],
         Message = json["Message"];
 }