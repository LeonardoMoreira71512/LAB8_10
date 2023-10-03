<?php

$hostname = "localhost";
$db_name = "db_a12345";
$db_user = "a12345";
$db_passwd = "PASS";

// mostra uma mensagem de erro vinda do mysql
function showerror($db)
{
    // allow cross-origin requests (CORS)
	header('Access-Control-Allow-Origin: *');
	header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
	header("Access-Control-Allow-Headers: Authorization, Origin, User-Token, X-Requested-With, Content-Type");
	die('{"Error_' . mysqli_errno($db) . '" : "' . mysqli_error($db) . '"}');
}


// faz uma conexão a uma base de dados
function dbconnect($hostname, $db_name,$db_user,$db_passwd)
{
  $db = @ mysqli_connect($hostname, $db_user, $db_passwd, $db_name);
  if(!$db) {
    // allow cross-origin requests (CORS)
	header('Access-Control-Allow-Origin: *');
	header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
	header("Access-Control-Allow-Headers: Authorization, Origin, User-Token, X-Requested-With, Content-Type");	
    die('{"Connection_failed" : "' . mysqli_connect_error() . '"}');
  }

 return $db;
}
?>
