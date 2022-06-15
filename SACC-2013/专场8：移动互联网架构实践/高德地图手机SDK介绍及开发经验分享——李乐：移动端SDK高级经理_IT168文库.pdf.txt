SDK 
2013.9

SDK 













 

& 

 






  



 

SDK
3D

API/SDK

REST JavaScript API API

Android SDK

iOS WindowsPhone Windows 8

SDK SDK

SDK

 

 
 
 
 

 
 
 
 

 
 
 
 

 
 
 





 

POI  

  

  

5





CPS



/ 





 UGC





CP

 

 

   





 


 


/ 


A



<?xml version="1.0" encoding="utf-8"?> <com.amap.api.maps.MapView
xmlns:android="http://schemas.android.com/apk/res/android" android:id="@+id/map" android:layout_width="match_parent" android:layout_height="match_parent" />


@Override protected void onCreate(Bundle savedInstanceState) {
super.onCreate(savedInstanceState); setContentView(R.layout.basicmap_activity); mapView = (MapView) findViewById(R.id.map); mapView.onCreate(savedInstanceState); }


public class LocationDemoActivity extends Activity implements LocationSource, AMapLocationListener{ private void init() { if (aMap == null) { aMap = mapView.getMap(); mAMapLocationManager = LocationManagerProxy .getInstance(LocationDemoActivity.this); aMap.setLocationSource(this); aMap.setMyLocationEnabled(true); } }
@Override public void onLocationChanged(AMapLocation aLocation) {
}


A



B


 
C



DriveRouteQuery query = new DriveRouteQuery(fromAndTo, RouteSearch.DrivingDefault, "010", 0);
routeSearch.calculateBusRouteAsyn(query);
public void onDriveRouteSearched(BusRouteResult result, int rCode) {
}


A



B


 

C


 

D


POI
public class PoiSearchActivity extends Activity implements OnPoiSearchListener{
PoiSearch.Query query = new PoiSearch.Query(keyWord, "", cityCode);
query.setLimitDiscount(false); query.setLimitGroupbuy(true); PoiSearch poiSearch = new PoiSearch(this,query); poiSearch.setOnPoiSearchListener(this); poiSearch.searchPoiAsyn();


A



B


 

C


 

D


 
E



poiSearch.searchPOIDetailAsyn(poiId);
public void onPoiItemDetailSearched(PoiItemDetail result, int rCode) { if(result.getGroupbuys()!=null&&result .getGroupbuys().size()>0){ StringBuffer sb = new StringBuffer(detailMarker .getSnippet()+""+result.getGroupbuys() .get(0).getDetail()
}







---XML
<root> <people> <firstName>Brett</firstName> <lastName>McLaughlin</lastName> <email>aaaa</email> </people> <people> <firstName>Jason</firstName> <lastName>Hunter</lastName> <email>bbbb</email> </people>
</root>


---JSON
{ "people": [{ "firstName": "Brett", "lastName":"McLaughlin", "email": "aaaa" }, { "firstName": "Jason", "lastName":"Hunter", "email": "bbbb"}] }


 ·  ·  · 



Protocol Buffers
 
http://code.google.com/p/protobuf/


xmlJSON protobuf
·  · xml1/10 ~ 1/3 · 20 ~ 100 ·  · 


ProtocolBuf
message People { required string firstName = 1; required string lastName = 2; optional string email = 3
}



people.proto

 protoc --cpp_out=src people.proto

 people.pb.cc people.pb.h



Java:

protoc ­java_out=src people.proto

Python: protoc ­python_out=src people.proto

C#Objective-c




·  ·  · 
 · Rpc

  

Thanks!

