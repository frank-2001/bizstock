<?php

                if (isset($_GET[$commande->table."-all"])) {
                    $output=$commande->All();
                }
                if (isset($_GET[$commande->table."-new"])) {
                    $output=$commande->new($_POST);
                }
                if (isset($_GET[$commande->table."-byId"])) {
                    $output=$commande->byId($_GET[$commande->table."-byId"]);
                }
                if (isset($_GET[$commande->table."-update"])) {
                    // Get command
                    $cmd=$commande->byId($_GET[$commande->table."-update"])["data"][0];
                    // Get mse
                    $mse=$stock_entreprise->by(["id"=>$cmd["marchandise"]])["data"][0];
                    // update stock ese
                    $stock_entreprise->update(["id"=>$cmd["marchandise"]],["stock"=>$mse["stock"]-$cmd["quantite"]]);
                    // new product in stock suc
                    $prod=$stock_succursale->by(["id_mse"=>$mse["id"],"id_succursale"=>$cmd["id_succursale"]])["data"];
                    // print_r($prod);
                    if (count($prod)>0) {
                        $stock_succursale->update(["id"=>$prod[0]["id"]],["quantite"=>$cmd["quantite"]+$prod[0]["quantite"]]);
                    }else{
                        $stock_succursale->new(["id_mse"=>$mse["id"],"quantite"=>$cmd["quantite"],"id_succursale"=>$cmd["id_succursale"]]);
                    }
                    // update command state
                    $output=$commande->update(["id"=>$_GET[$commande->table."-update"]],$_POST);
                }
                if (isset($_GET[$commande->table."-delete"])) {
                    $output=$commande->delete($_POST);
                }
                if (isset($_GET[$commande->table."-search"])) {
                    $output=$commande->search($_POST);
                }
                if (isset($_GET[$commande->table."-by"])) {
                    $output=$commande->by($_POST);
                    $i=0;
                    foreach ($output["data"] as $value) {
                        $output["data"][$i]["marchandise"]=$stock_entreprise->by(["id"=>$value["marchandise"]])["data"];  
                        $i++;
                    }
                }
            