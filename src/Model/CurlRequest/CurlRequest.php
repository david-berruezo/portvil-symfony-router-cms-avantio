<?php
namespace App\Model\CurlRequest;

class CurlRequest {
    
    var $curl='';
    var $curl_cookie_jar;

    # inicializamos a null
    function __construct() {
        $this->curl = NULL;
    }

    # llmaamos a curl
    function get($url,$method='GET',$postdata=false,$headers=array()){

        # inicializamos curl
        if(!$this->curl) {
			$this->curl = curl_init();
			curl_setopt($this->curl, CURLOPT_USERAGENT,'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/31.0.1650.63 Chrome/31.0.1650.63 Safari/537.36');
			curl_setopt($this->curl, CURLOPT_COOKIESESSION, false);
			curl_setopt($this->curl, CURLOPT_RETURNTRANSFER, true);
			curl_setopt($this->curl, CURLOPT_SSL_VERIFYPEER, false);
			curl_setopt($this->curl, CURLOPT_SSL_VERIFYHOST, false);
			curl_setopt($this->curl, CURLOPT_FOLLOWLOCATION, true);
			curl_setopt($this->curl, CURLOPT_MAXREDIRS, 10);
		}

        # cogemos la url
		curl_setopt($this->curl, CURLOPT_URL, $url);

        # añadimos fields en el formulario
		if($postdata !== false)
            curl_setopt($this->curl, CURLOPT_POSTFIELDS, $postdata);
		else
            curl_setopt($this->curl, CURLOPT_POSTFIELDS, '');

        # añadimos headers si tienen headers
		curl_setopt($this->curl, CURLOPT_HTTPHEADER, $headers);

        # agegamos el metodo que queremos
		switch(strtoupper($method))
		{
			case 'GET':
				curl_setopt($this->curl, CURLOPT_POST, false);
				curl_setopt($this->curl, CURLOPT_PUT, false);
				curl_setopt($this->curl, CURLOPT_HTTPGET, true);
				if(defined('CURLOPT_GET'))
					curl_setopt($this->curl, CURLOPT_GET, true);
				if(!empty($this->customrequest))
					curl_setopt($this->curl, CURLOPT_CUSTOMREQUEST, "GET");
			break;

            case 'POST':
				curl_setopt($this->curl, CURLOPT_HTTPGET, false);
				if(defined('CURLOPT_GET'))
					curl_setopt($this->curl, CURLOPT_GET, false);
				curl_setopt($this->curl, CURLOPT_PUT, false);
				curl_setopt($this->curl, CURLOPT_POST, true);
				if(!empty($this->customrequest))
					curl_setopt($this->curl, CURLOPT_CUSTOMREQUEST, "POST");
			break;

            case 'PUT-OVERRIDE':
				curl_setopt($this->curl, CURLOPT_HTTPGET, false);
				if(defined('CURLOPT_GET'))
					curl_setopt($this->curl, CURLOPT_GET, false);
				curl_setopt($this->curl, CURLOPT_PUT, false);
				curl_setopt($this->curl, CURLOPT_POST, true);
				curl_setopt($this->curl, CURLOPT_CUSTOMREQUEST, 'PUT');
				$this->customrequest=true;
			break;

            case 'PUT':
				curl_setopt($this->curl, CURLOPT_HTTPGET, false);
				if(defined('CURLOPT_GET'))
					curl_setopt($this->curl, CURLOPT_GET, false);
				curl_setopt($this->curl, CURLOPT_POST, false);
				curl_setopt($this->curl, CURLOPT_PUT, true);
				if(!empty($this->customrequest))
					curl_setopt($this->curl, CURLOPT_CUSTOMREQUEST, "PUT");
				break;
			default:
				curl_setopt($this->curl, CURLOPT_CUSTOMREQUEST, $method);
				$this->customrequest = true;
				break;
		}

        # ejecutamos curl
        $contents = curl_exec($this->curl);

        switch (curl_getinfo($this->curl)) {
          case "401":
            $contents = "No results.";
          break;
          default:
          break;
        } // end switch

        return $contents;
	}
}
?>