<?php

                if (isset($_GET[$succursale->table."-all"])) {
                    $output=$succursale->All();

                
                }
                if (isset($_GET[$succursale->table."-new"])) {
                    $output=$succursale->new($_POST);
                }
                if (isset($_GET[$succursale->table."-byId"])) {
                    $output=$succursale->byId($_GET[$succursale->table."-byId"]);
                }
                if (isset($_GET[$succursale->table."-update"])) {
                    $output=$succursale->update($_GET[$succursale->table."-update"],$_POST);
                }
                if (isset($_GET[$succursale->table."-delete"])) {
                    $output=$succursale->delete($_POST);
                }
                if (isset($_GET[$succursale->table."-search"])) {
                    $output=$succursale->search($_POST);
                }
                if (isset($_GET[$succursale->table."-by"])) {
                    $output=$succursale->by($_POST);
                    $i=0;
                    foreach ($output["data"] as $value) {
                        $output["data"][$i]["user"]=$user->by(["id_succursale"=>$value["id"]])["data"];    
                        $output["data"][$i]["stock"]=$stock_succursale->by(["id_succursale"=>$value["id"]])["data"];
                        $output["data"][$i]["facture"]=$facture->by(["id_succursale"=>$value["id"]])["data"];
                        $output["data"][$i]["commande"]=$commande->by(["id_succursale"=>$value["id"]])["data"];  
                        $i2=0;
                        foreach ($output["data"][$i]["commande"] as $value) {
                            $output["data"][$i]["commande"][$i2]["mse"]=$stock_entreprise->by(["id"=>$value["marchandise"]])["data"][0];  
                            $i2++;
                        }
                        $i3=0;
                        foreach ($output["data"][$i]["stock"] as $value) {
                            $output["data"][$i]["stock"][$i3]["mse"]=$stock_entreprise->by(["id"=>$value["id_mse"]])["data"][0];  
                            $i3++;
                        }
                        $i3=0;
                        foreach ($output["data"][$i]["facture"] as $value) {
                            $output["data"][$i]["facture"][$i3]["mse"]=$mouvements->by(["facture"=>$value["id"]])["data"];  
                            $i2=0;
                            foreach ($output["data"][$i]["facture"][$i3]["mse"] as $value2) {
                                // print_r($value2);
                                $output["data"][$i]["facture"][$i3]["mse"][$i2]["mse"]=$stock_entreprise->by(["id"=>$stock_succursale->by(["id"=>$value2["id_marchandise"]])["data"][0]["id_mse"]])["data"][0];
                                $i2++;
                            }
                            // $output["data"][$i]["facture"][$i3]["mse"]["mse"]=$stock_entreprise->by(["id"=>$output["data"][$i]["facture"][$i3]["mse"]["id_marchandise"]])["data"][0];  
                            $i3++;
                        }
                        $i++;
                    }
                    
                }
            