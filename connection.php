<?php

    $database= new mysqli("localhost","root","","egarage");
    if ($database->connect_error){
        die("Connection failed:  ".$database->connect_error);
    }

?>
