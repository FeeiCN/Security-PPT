Flysystem  OSS  
----  
       PHP  

   Composer     PHP       

  

1  

  
  

2  

  


  

3  

  
  

Composer    

  
  
  
composer  require  monster/flysystem-aliyun-oss          
  
                      

PHP    

public function boot()   {  
Storage::extend('aliyunoss', function($app, $config) {  
   $OSSClient = new \ALIOSS(   $config['accessKey'],    $config['accessSecret'],    $config['endPoint']   );     
$adapter = new AliyunOSSAdapter($OSSClient, 'files-
bucket');      return new Filesystem($adapter);  
});   }  

Laravel  Codeigniter  Silex Composer   
  

  

1.     2.     3.  bug  

