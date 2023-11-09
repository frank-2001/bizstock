<?php

                if (isset($_GET[$stock_succursale->table."-all"])) {
                    $output=$stock_succursale->All();
                }
                if (isset($_GET[$stock_succursale->table."-new"])) {
                    $output=$stock_succursale->new($_POST);
                }
                if (isset($_GET[$stock_succursale->table."-byId"])) {
                    $output=$stock_succursale->byId($_GET[$stock_succursale->table."-byId"]);
                }
                if (isset($_GET[$stock_succursale->table."-update"])) {
                    $output=$stock_succursale->update($_GET,$_POST);
                }
                if (isset($_GET[$stock_succursale->table."-delete"])) {
                    $output=$stock_succursale->delete($_POST);
                }
                if (isset($_GET[$stock_succursale->table."-search"])) {
                    $output=$stock_succursale->search($_POST);
                }
                if (isset($_GET[$stock_succursale->table."-by"])) {
                    $output=$stock_succursale->by($_POST);
                    $i=0;
                    foreach ($output["data"] as $value) {
                        $output["data"][$i]["marchandise"]=$stock_entreprie->by(["id"=>$value["id_mse"]])["data"];  
                        $i++;
                    }
                }
            